`timescale 1ns/10ps
module IOTDF( 
    input          clk,
    input          rst,
    input          in_en,
    input  [7:0]   iot_in,
    input  [2:0]   fn_sel,
    output         busy,
    output         valid,
    output [127:0] iot_out
);
    localparam IDLE     = 3'd0;
    localparam LOAD_DES = 3'd1;
    localparam CALC_DES = 3'd2;
    localparam CALC_CRC = 3'd3;
    localparam CALC_GB  = 3'd4;
    localparam OUT      = 3'd5;
    localparam PREP_DES = 3'd6;
    localparam PREP     = 3'd7;

    reg [2:0]   state_r, state_w;
    reg [3:0]   count_r, count_w;
    reg busy_r, busy_w;
    reg valid_r, valid_w;
    reg [127:0] o_data_r, o_data_w;

    wire enable_busy;
    wire enable_valid;
    wire enable_odata_1, enable_odata_2, enable_odata_3;
    wire enable_count;

    assign busy    = busy_r;
    assign valid   = valid_r;
    assign iot_out = o_data_r;

    //----------------------------------------//
    wire DES_first, DES_last, DES_prep_key1, DES_shift, DES_enable, DES_fnsel;
    wire [127:0] DES_indata;
    wire [63:0]  DES_odata;

    wire GB_fnsel , GB_first, GB_prev, GB_enable;
    wire [7:0] GB_indata;
    wire [7:0] GB_odata;
    
    wire [2:0] CRC_in;
    wire [2:0] CRC_nxt;
    wire [7:0] CRC_indata;

    assign DES_fnsel     = fn_sel==3'b010;
    assign DES_first     = state_r==CALC_DES && (!count_r);
    assign DES_last      = state_r==CALC_DES && (&count_r);
    assign DES_prep_key1 = state_r == PREP_DES;
    assign DES_shift     = (state_r==PREP_DES ) 
                        || (state_r==CALC_DES && 
                        ( ((count_r==0 || count_r==7 || count_r==14) && (!DES_fnsel)) 
                        ||((count_r==0 || count_r==7 || count_r==14 || count_r==15) && ( DES_fnsel)) )
                        );
    assign DES_enable    = (state_r==PREP_DES || state_r==CALC_DES);
    assign DES_indata    = (fn_sel==3'b001 || fn_sel==3'b010) ? o_data_r : 0;
    
    assign GB_first      = (state_r==CALC_GB && count_r==0);
    assign GB_fnsel      = (fn_sel==3'b101) ? 1 : 0;
    assign GB_prev       = o_data_r[0];
    assign GB_enable     = state_r==CALC_GB;
    assign GB_indata     = (fn_sel==3'b100 || fn_sel==3'b101) ? iot_in : 0;

    assign CRC_in        = (state_r==CALC_CRC && count_r==0) ? 0 : o_data_r[2:0];
    assign CRC_indata    = (fn_sel==3'b011 && in_en) ? iot_in : 0;

    DES DES                     (.i_clk(clk) ,.i_rst(rst) ,.shift(DES_shift) ,.first(DES_first) ,.last(DES_last) ,.fnsel(DES_fnsel)
                                ,.enable(DES_enable) ,.prep_key1(DES_prep_key1) ,.i_data(DES_indata) ,.o_data(DES_odata));

    Gray_Binary_Conversion GB   (.i_clk(clk) ,.i_rst(rst) ,.fn_sel(GB_fnsel) ,.first(GB_first) 
                                ,.enable(GB_enable) ,.prev(GB_prev) ,.i_data(GB_indata) ,.o_data(GB_odata));

    CRC3_D8 CRC                 (.i_data(CRC_indata) ,.crc(CRC_in) ,.crc_nxt(CRC_nxt));
    //----------------------------------------//


    always@ (*) begin
        case(state_r)
            IDLE: state_w = PREP;
            PREP: begin
                case(fn_sel)
                    3'b001:  state_w = LOAD_DES;
                    3'b010:  state_w = LOAD_DES;
                    3'b011:  state_w = CALC_CRC; 
                    3'b100:  state_w = CALC_GB;
                    3'b101:  state_w = CALC_GB;
                    default: state_w = state_r;
                endcase
            end

            LOAD_DES: state_w = (&count_r) ? PREP_DES : LOAD_DES;
            PREP_DES: state_w = CALC_DES;
            CALC_DES: state_w = (&count_r) ? OUT : CALC_DES;
            CALC_CRC: state_w = (&count_r) ? OUT : CALC_CRC;
            CALC_GB:  state_w = (&count_r) ? OUT : CALC_GB;
            OUT:      state_w = IDLE;
            default:  state_w = state_r;
        endcase
    end

    assign enable_busy    = (state_r == LOAD_DES || state_r == CALC_GB || state_r ==CALC_CRC || state_r==IDLE);
    assign enable_valid   = (state_w == OUT || state_r==OUT);
    assign enable_count   = (state_r == LOAD_DES || state_r == CALC_GB || state_r == CALC_CRC || state_r == CALC_DES);
    assign enable_odata_1 = (enable_odata_3 && state_r!=CALC_DES && state_r!=CALC_CRC);
    assign enable_odata_2 = (enable_odata_3 && state_r!=CALC_CRC);
    assign enable_odata_3 = (state_r!=OUT && state_r!=IDLE && state_r!=PREP_DES && state_r!=PREP);

    always@ (*) begin
        if( (fn_sel==3'b001 || fn_sel==3'b010)) begin
            if(state_r==LOAD_DES) begin
                o_data_w = {o_data_r[119:0], iot_in};
            end
            else if(state_r==CALC_DES) begin
                o_data_w = {o_data_r[127:64], DES_odata};
            end
            else begin
                o_data_w = o_data_r;
            end
        end
        else if((fn_sel==3'b011) && state_r==CALC_CRC) begin
            o_data_w = {125'd0, CRC_nxt};
        end
        else if((fn_sel==3'b100 || fn_sel==3'b101) && state_r==CALC_GB) begin
            o_data_w = {o_data_r[119:0], GB_odata};  
        end
        else begin
            o_data_w = o_data_r;
        end
    end

    always@ (*) begin
        if(enable_count) begin
            count_w = count_r + 1;
        end
        else begin
            count_w = 0;
        end
    end

    always@ (*) begin
        if(state_w == OUT) begin
            valid_w = 1;
        end
        else begin 
            valid_w = 0;
        end
    end

    always@ (*) begin
        if(state_r == IDLE) begin
            busy_w = 0;
        end
        else if((state_r == LOAD_DES || state_r == CALC_GB || state_r ==CALC_CRC)) begin
            busy_w = (count_r==14 || count_r==15) ? 1 : 0;
        end
        else if(state_r == OUT) begin
            busy_w = 1;
        end
        else begin
            busy_w = busy_r;
        end
    end

    always@ (posedge clk or posedge rst) begin
        if(rst) begin
            state_r <= IDLE;
        end
        else begin
            state_r <= state_w;
        end
    end

    always@ (posedge clk or posedge rst) begin
        if(rst) begin
            count_r <= 0;
        end
        else if(enable_count) begin
            //clock gating
            count_r <= count_w;
        end
    end

    always@ (posedge clk or posedge rst) begin
        if(rst) begin
            busy_r <= 1;
        end
        else if(enable_busy) begin
            //clock gating
            busy_r <= busy_w;
        end
    end

    always@ (posedge clk or posedge rst) begin
        if(rst) begin
            valid_r <= 0;
        end
        else if(enable_valid) begin
            //clock gating
            valid_r <= valid_w;
        end
    end

    always@ (posedge clk or posedge rst) begin
        if(rst) begin
            o_data_r[127:64] <= 0;
        end
        else if(enable_odata_1) begin
            //clock gating
            o_data_r[127:64] <= o_data_w[127:64];
        end
    end

    always@ (posedge clk or posedge rst) begin
        if(rst) begin
            o_data_r[63:3] <= 0;
        end
        else if(enable_odata_2) begin
            //clock gating
            o_data_r[63:3] <= o_data_w[63:3];
        end
    end

    always@ (posedge clk or posedge rst) begin
        if(rst) begin
            o_data_r[2:0] <= 0;
        end
        else if(enable_odata_3) begin
            //clock gating
            o_data_r[2:0] <= o_data_w[2:0];
        end
    end

endmodule

module CRC3_D8(
    input      [7:0]   i_data,
    input      [2:0]   crc,
    output     [2:0]   crc_nxt
);  
    assign crc_nxt[0] = i_data[7] ^ i_data[4] ^ i_data[3] ^ i_data[2] ^ i_data[0] ^ crc[2];
    assign crc_nxt[1] = i_data[7] ^ i_data[5] ^ i_data[2] ^ i_data[1] ^ i_data[0] ^ crc[0] ^ crc[2];
    assign crc_nxt[2] = i_data[6] ^ i_data[3] ^ i_data[2] ^ i_data[1] ^ crc[1];
endmodule

module PC1(
    input  [63:0] in,
    output [55:0] out
);
    assign out[55] = in[7];
    assign out[54] = in[15];
    assign out[53] = in[23];
    assign out[52] = in[31];
    assign out[51] = in[39];
    assign out[50] = in[47];
    assign out[49] = in[55];
    assign out[48] = in[63];
    assign out[47] = in[6];
    assign out[46] = in[14];
    assign out[45] = in[22];
    assign out[44] = in[30];
    assign out[43] = in[38];
    assign out[42] = in[46];
    assign out[41] = in[54];
    assign out[40] = in[62];
    assign out[39] = in[5];
    assign out[38] = in[13];
    assign out[37] = in[21];
    assign out[36] = in[29];
    assign out[35] = in[37];
    assign out[34] = in[45];
    assign out[33] = in[53];
    assign out[32] = in[61];
    assign out[31] = in[4];
    assign out[30] = in[12];
    assign out[29] = in[20];
    assign out[28] = in[28];
    assign out[27] = in[1];
    assign out[26] = in[9];
    assign out[25] = in[17];
    assign out[24] = in[25];
    assign out[23] = in[33];
    assign out[22] = in[41];
    assign out[21] = in[49];
    assign out[20] = in[57];
    assign out[19] = in[2];
    assign out[18] = in[10];
    assign out[17] = in[18];
    assign out[16] = in[26];
    assign out[15] = in[34];
    assign out[14] = in[42];
    assign out[13] = in[50];
    assign out[12] = in[58];
    assign out[11] = in[3];
    assign out[10] = in[11];
    assign out[9]  = in[19];
    assign out[8]  = in[27];
    assign out[7]  = in[35];
    assign out[6]  = in[43];
    assign out[5]  = in[51];
    assign out[4]  = in[59];
    assign out[3]  = in[36];
    assign out[2]  = in[44];
    assign out[1]  = in[52];
    assign out[0]  = in[60];
endmodule

module PC2(
    input  [55:0] in,
    output [47:0] out
);
    assign out[47] = in[42];
    assign out[46] = in[39];
    assign out[45] = in[45];
    assign out[44] = in[32];
    assign out[43] = in[55];
    assign out[42] = in[51];
    assign out[41] = in[53];
    assign out[40] = in[28];
    assign out[39] = in[41];
    assign out[38] = in[50];
    assign out[37] = in[35];
    assign out[36] = in[46];
    assign out[35] = in[33];
    assign out[34] = in[37];
    assign out[33] = in[44];
    assign out[32] = in[52];
    assign out[31] = in[30];
    assign out[30] = in[48];
    assign out[29] = in[40];
    assign out[28] = in[49];
    assign out[27] = in[29];
    assign out[26] = in[36];
    assign out[25] = in[43];
    assign out[24] = in[54];
    assign out[23] = in[15];
    assign out[22] = in[4];
    assign out[21] = in[25];
    assign out[20] = in[19];
    assign out[19] = in[9];
    assign out[18] = in[1];
    assign out[17] = in[26];
    assign out[16] = in[16];
    assign out[15] = in[5];
    assign out[14] = in[11];
    assign out[13] = in[23];
    assign out[12] = in[8];
    assign out[11] = in[12];
    assign out[10] = in[7];
    assign out[9]  = in[17];
    assign out[8]  = in[0];
    assign out[7]  = in[22];
    assign out[6]  = in[3];
    assign out[5]  = in[10];
    assign out[4]  = in[14];
    assign out[3]  = in[6];
    assign out[2]  = in[20];
    assign out[1]  = in[27];
    assign out[0]  = in[24];
endmodule

module initial_permutation(
    input  [63:0] in,
    output [63:0] out
);
    assign out[63] = in[6];
    assign out[62] = in[14];
    assign out[61] = in[22];
    assign out[60] = in[30];
    assign out[59] = in[38];
    assign out[58] = in[46];
    assign out[57] = in[54];
    assign out[56] = in[62];
    assign out[55] = in[4];
    assign out[54] = in[12];
    assign out[53] = in[20];
    assign out[52] = in[28];
    assign out[51] = in[36];
    assign out[50] = in[44];
    assign out[49] = in[52];
    assign out[48] = in[60];
    assign out[47] = in[2];
    assign out[46] = in[10];
    assign out[45] = in[18];
    assign out[44] = in[26];
    assign out[43] = in[34];
    assign out[42] = in[42];
    assign out[41] = in[50];
    assign out[40] = in[58];
    assign out[39] = in[0];
    assign out[38] = in[8];
    assign out[37] = in[16];
    assign out[36] = in[24];
    assign out[35] = in[32];
    assign out[34] = in[40];
    assign out[33] = in[48];
    assign out[32] = in[56];
    assign out[31] = in[7];
    assign out[30] = in[15];
    assign out[29] = in[23];
    assign out[28] = in[31];
    assign out[27] = in[39];
    assign out[26] = in[47];
    assign out[25] = in[55];
    assign out[24] = in[63];
    assign out[23] = in[5];
    assign out[22] = in[13];
    assign out[21] = in[21];
    assign out[20] = in[29];
    assign out[19] = in[37];
    assign out[18] = in[45];
    assign out[17] = in[53];
    assign out[16] = in[61];
    assign out[15] = in[3];
    assign out[14] = in[11];
    assign out[13] = in[19];
    assign out[12] = in[27];
    assign out[11] = in[35];
    assign out[10] = in[43];
    assign out[9]  = in[51];
    assign out[8]  = in[59];
    assign out[7]  = in[1];
    assign out[6]  = in[9];
    assign out[5]  = in[17];
    assign out[4]  = in[25];
    assign out[3]  = in[33];
    assign out[2]  = in[41];
    assign out[1]  = in[49];
    assign out[0]  = in[57];
endmodule

module final_permutation(
    input  [63:0] in,
    output [63:0] out 
);
    assign out[63] = in[24];
    assign out[62] = in[56];
    assign out[61] = in[16];
    assign out[60] = in[48];
    assign out[59] = in[8];
    assign out[58] = in[40];
    assign out[57] = in[0];
    assign out[56] = in[32];
    assign out[55] = in[25];
    assign out[54] = in[57];
    assign out[53] = in[17];
    assign out[52] = in[49];
    assign out[51] = in[9];
    assign out[50] = in[41];
    assign out[49] = in[1];
    assign out[48] = in[33];
    assign out[47] = in[26];
    assign out[46] = in[58];
    assign out[45] = in[18];
    assign out[44] = in[50];
    assign out[43] = in[10];
    assign out[42] = in[42];
    assign out[41] = in[2];
    assign out[40] = in[34];
    assign out[39] = in[27];
    assign out[38] = in[59];
    assign out[37] = in[19];
    assign out[36] = in[51];
    assign out[35] = in[11];
    assign out[34] = in[43];
    assign out[33] = in[3];
    assign out[32] = in[35];
    assign out[31] = in[28];
    assign out[30] = in[60];
    assign out[29] = in[20];
    assign out[28] = in[52];
    assign out[27] = in[12];
    assign out[26] = in[44];
    assign out[25] = in[4];
    assign out[24] = in[36];
    assign out[23] = in[29];
    assign out[22] = in[61];
    assign out[21] = in[21];
    assign out[20] = in[53];
    assign out[19] = in[13];
    assign out[18] = in[45];
    assign out[17] = in[5];
    assign out[16] = in[37];
    assign out[15] = in[30];
    assign out[14] = in[62];
    assign out[13] = in[22];
    assign out[12] = in[54];
    assign out[11] = in[14];
    assign out[10] = in[46];
    assign out[9]  = in[6];
    assign out[8]  = in[38];
    assign out[7]  = in[31];
    assign out[6]  = in[63];
    assign out[5]  = in[23];
    assign out[4]  = in[55];
    assign out[3]  = in[15];
    assign out[2]  = in[47];
    assign out[1]  = in[7];
    assign out[0]  = in[39];
endmodule

module P_permutation(
    input  [31:0] in,
    output [31:0] out
);  
    assign out[0]  = in[7];
    assign out[1]  = in[28];
    assign out[2]  = in[21];
    assign out[3]  = in[10];
    assign out[4]  = in[26];
    assign out[5]  = in[2];
    assign out[6]  = in[19];
    assign out[7]  = in[13];
    assign out[8]  = in[23];
    assign out[9]  = in[29];
    assign out[10] = in[5];
    assign out[11] = in[0];
    assign out[12] = in[18];
    assign out[13] = in[8];
    assign out[14] = in[24];
    assign out[15] = in[30];
    assign out[16] = in[22];
    assign out[17] = in[1];
    assign out[18] = in[14];
    assign out[19] = in[27];
    assign out[20] = in[6];
    assign out[21] = in[9];
    assign out[22] = in[17];
    assign out[23] = in[31];
    assign out[24] = in[15];
    assign out[25] = in[4];
    assign out[26] = in[20];
    assign out[27] = in[3];
    assign out[28] = in[11];
    assign out[29] = in[12];
    assign out[30] = in[25];
    assign out[31] = in[16];
endmodule

module Expansion(
    input  [31:0] in,
    output [47:0] out
);
    assign out[0]  = in[31];
    assign out[1]  = in[0];
    assign out[2]  = in[1];
    assign out[3]  = in[2];
    assign out[4]  = in[3];
    assign out[5]  = in[4];
    assign out[6]  = in[3];
    assign out[7]  = in[4];
    assign out[8]  = in[5];
    assign out[9]  = in[6];
    assign out[10] = in[7];
    assign out[11] = in[8];
    assign out[12] = in[7];
    assign out[13] = in[8];
    assign out[14] = in[9];
    assign out[15] = in[10];
    assign out[16] = in[11];
    assign out[17] = in[12];
    assign out[18] = in[11];
    assign out[19] = in[12];
    assign out[20] = in[13];
    assign out[21] = in[14];
    assign out[22] = in[15];
    assign out[23] = in[16];
    assign out[24] = in[15];
    assign out[25] = in[16];
    assign out[26] = in[17];
    assign out[27] = in[18];
    assign out[28] = in[19];
    assign out[29] = in[20];
    assign out[30] = in[19];
    assign out[31] = in[20];
    assign out[32] = in[21];
    assign out[33] = in[22];
    assign out[34] = in[23];
    assign out[35] = in[24];
    assign out[36] = in[23];
    assign out[37] = in[24];
    assign out[38] = in[25];
    assign out[39] = in[26];
    assign out[40] = in[27];
    assign out[41] = in[28];
    assign out[42] = in[27];
    assign out[43] = in[28];
    assign out[44] = in[29];
    assign out[45] = in[30];
    assign out[46] = in[31];
    assign out[47] = in[0];
endmodule

module S1(
    input  [5:0] in,
    output reg [3:0] out
);
    always@ (*) begin
        case(in[4:1])
            4'd0: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd14;
                    2'd1:    out = 4'd0;
                    2'd2:    out = 4'd4;
                    2'd3:    out = 4'd15;
                    default: out = 4'd0;
                endcase
            end

            4'd1: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd4;
                    2'd1:    out = 4'd15;
                    2'd2:    out = 4'd1;
                    2'd3:    out = 4'd12;
                    default: out = 4'd0;
                endcase
            end
            
            4'd2: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd13;
                    2'd1:    out = 4'd7;
                    2'd2:    out = 4'd14;
                    2'd3:    out = 4'd8;
                    default: out = 4'd0;
                endcase
            end
            
            4'd3: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd1;
                    2'd1:    out = 4'd4;
                    2'd2:    out = 4'd8;
                    2'd3:    out = 4'd2;
                    default: out = 4'd0;
                endcase
            end
            
            4'd4: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd2;
                    2'd1:    out = 4'd14;
                    2'd2:    out = 4'd13;
                    2'd3:    out = 4'd4;
                    default: out = 4'd0;
                endcase
            end
            
            4'd5: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd15;
                    2'd1:    out = 4'd2;
                    2'd2:    out = 4'd6;
                    2'd3:    out = 4'd9;
                    default: out = 4'd0;
                endcase
            end
            
            4'd6: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd11;
                    2'd1:    out = 4'd13;
                    2'd2:    out = 4'd2;
                    2'd3:    out = 4'd1;
                    default: out = 4'd0;
                endcase
            end
            
            4'd7: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd8;
                    2'd1:    out = 4'd1;
                    2'd2:    out = 4'd11;
                    2'd3:    out = 4'd7;
                    default: out = 4'd0;
                endcase
            end
            
            4'd8: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd3;
                    2'd1:    out = 4'd10;
                    2'd2:    out = 4'd15;
                    2'd3:    out = 4'd5;
                    default: out = 4'd0;
                endcase
            end
            
            4'd9: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd10;
                    2'd1:    out = 4'd6;
                    2'd2:    out = 4'd12;
                    2'd3:    out = 4'd11;
                    default: out = 4'd0;
                endcase
            end
            
            4'd10: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd6;
                    2'd1:    out = 4'd12;
                    2'd2:    out = 4'd9;
                    2'd3:    out = 4'd3;
                    default: out = 4'd0;
                endcase
            end
            
            4'd11: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd12;
                    2'd1:    out = 4'd11;
                    2'd2:    out = 4'd7;
                    2'd3:    out = 4'd14;
                    default: out = 4'd0;
                endcase
            end
            
            4'd12: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd5;
                    2'd1:    out = 4'd9;
                    2'd2:    out = 4'd3;
                    2'd3:    out = 4'd10;
                    default: out = 4'd0;
                endcase
            end
            
            4'd13: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd9;
                    2'd1:    out = 4'd5;
                    2'd2:    out = 4'd10;
                    2'd3:    out = 4'd0;
                    default: out = 4'd0;
                endcase
            end
            
            4'd14: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd0;
                    2'd1:    out = 4'd3;
                    2'd2:    out = 4'd5;
                    2'd3:    out = 4'd6;
                    default: out = 4'd0;
                endcase
            end
            
            4'd15: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd7;
                    2'd1:    out = 4'd8;
                    2'd2:    out = 4'd0;
                    2'd3:    out = 4'd13;
                    default: out = 4'd0;
                endcase
            end
            
            default : out = 0;
        endcase
    end

endmodule

module S2(
    input  [5:0] in,
    output reg [3:0] out
);
    always@ (*) begin
        case(in[4:1])
            4'd0: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd15;
                    2'd1:    out = 4'd3;
                    2'd2:    out = 4'd0;
                    2'd3:    out = 4'd13;
                    default: out = 4'd0;
                endcase
            end

            4'd1: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd1;
                    2'd1:    out = 4'd13;
                    2'd2:    out = 4'd14;
                    2'd3:    out = 4'd8;
                    default: out = 4'd0;
                endcase
            end
            
            4'd2: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd8;
                    2'd1:    out = 4'd4;
                    2'd2:    out = 4'd7;
                    2'd3:    out = 4'd10;
                    default: out = 4'd0;
                endcase
            end
            
            4'd3: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd14;
                    2'd1:    out = 4'd7;
                    2'd2:    out = 4'd11;
                    2'd3:    out = 4'd1;
                    default: out = 4'd0;
                endcase
            end
            
            4'd4: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd6;
                    2'd1:    out = 4'd15;
                    2'd2:    out = 4'd10;
                    2'd3:    out = 4'd3;
                    default: out = 4'd0;
                endcase
            end
            
            4'd5: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd11;
                    2'd1:    out = 4'd2;
                    2'd2:    out = 4'd4;
                    2'd3:    out = 4'd15;
                    default: out = 4'd0;
                endcase
            end
            
            4'd6: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd3;
                    2'd1:    out = 4'd8;
                    2'd2:    out = 4'd13;
                    2'd3:    out = 4'd4;
                    default: out = 4'd0;
                endcase
            end
            
            4'd7: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd4;
                    2'd1:    out = 4'd14;
                    2'd2:    out = 4'd1;
                    2'd3:    out = 4'd2;
                    default: out = 4'd0;
                endcase
            end
            
            4'd8: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd9;
                    2'd1:    out = 4'd12;
                    2'd2:    out = 4'd5;
                    2'd3:    out = 4'd11;
                    default: out = 4'd0;
                endcase
            end
            
            4'd9: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd7;
                    2'd1:    out = 4'd0;
                    2'd2:    out = 4'd8;
                    2'd3:    out = 4'd6;
                    default: out = 4'd0;
                endcase
            end
            
            4'd10: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd2;
                    2'd1:    out = 4'd1;
                    2'd2:    out = 4'd12;
                    2'd3:    out = 4'd7;
                    default: out = 4'd0;
                endcase
            end
            
            4'd11: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd13;
                    2'd1:    out = 4'd10;
                    2'd2:    out = 4'd6;
                    2'd3:    out = 4'd12;
                    default: out = 4'd0;
                endcase
            end
            
            4'd12: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd12;
                    2'd1:    out = 4'd6;
                    2'd2:    out = 4'd9;
                    2'd3:    out = 4'd0;
                    default: out = 4'd0;
                endcase
            end
            
            4'd13: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd0;
                    2'd1:    out = 4'd9;
                    2'd2:    out = 4'd3;
                    2'd3:    out = 4'd5;
                    default: out = 4'd0;
                endcase
            end
            
            4'd14: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd5;
                    2'd1:    out = 4'd11;
                    2'd2:    out = 4'd2;
                    2'd3:    out = 4'd14;
                    default: out = 4'd0;
                endcase
            end
            
            4'd15: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd10;
                    2'd1:    out = 4'd5;
                    2'd2:    out = 4'd15;
                    2'd3:    out = 4'd9;
                    default: out = 4'd0;
                endcase
            end
            
            default : out = 0;
        endcase
    end

endmodule

module S3(
    input  [5:0] in,
    output reg [3:0] out
);
    always@ (*) begin
        case(in[4:1])
            4'd0: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd10;
                    2'd1:    out = 4'd13;
                    2'd2:    out = 4'd13;
                    2'd3:    out = 4'd1;
                    default: out = 4'd0;
                endcase
            end

            4'd1: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd0;
                    2'd1:    out = 4'd7;
                    2'd2:    out = 4'd6;
                    2'd3:    out = 4'd10;
                    default: out = 4'd0;
                endcase
            end
            
            4'd2: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd9;
                    2'd1:    out = 4'd0;
                    2'd2:    out = 4'd4;
                    2'd3:    out = 4'd13;
                    default: out = 4'd0;
                endcase
            end
            
            4'd3: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd14;
                    2'd1:    out = 4'd9;
                    2'd2:    out = 4'd9;
                    2'd3:    out = 4'd0;
                    default: out = 4'd0;
                endcase
            end
            
            4'd4: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd6;
                    2'd1:    out = 4'd3;
                    2'd2:    out = 4'd8;
                    2'd3:    out = 4'd6;
                    default: out = 4'd0;
                endcase
            end
            
            4'd5: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd3;
                    2'd1:    out = 4'd4;
                    2'd2:    out = 4'd15;
                    2'd3:    out = 4'd9;
                    default: out = 4'd0;
                endcase
            end
            
            4'd6: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd15;
                    2'd1:    out = 4'd6;
                    2'd2:    out = 4'd3;
                    2'd3:    out = 4'd8;
                    default: out = 4'd0;
                endcase
            end
            
            4'd7: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd5;
                    2'd1:    out = 4'd10;
                    2'd2:    out = 4'd0;
                    2'd3:    out = 4'd7;
                    default: out = 4'd0;
                endcase
            end
            
            4'd8: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd1;
                    2'd1:    out = 4'd2;
                    2'd2:    out = 4'd11;
                    2'd3:    out = 4'd4;
                    default: out = 4'd0;
                endcase
            end
            
            4'd9: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd13;
                    2'd1:    out = 4'd8;
                    2'd2:    out = 4'd1;
                    2'd3:    out = 4'd15;
                    default: out = 4'd0;
                endcase
            end
            
            4'd10: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd12;
                    2'd1:    out = 4'd5;
                    2'd2:    out = 4'd2;
                    2'd3:    out = 4'd14;
                    default: out = 4'd0;
                endcase
            end
            
            4'd11: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd7;
                    2'd1:    out = 4'd14;
                    2'd2:    out = 4'd12;
                    2'd3:    out = 4'd3;
                    default: out = 4'd0;
                endcase
            end
            
            4'd12: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd11;
                    2'd1:    out = 4'd12;
                    2'd2:    out = 4'd5;
                    2'd3:    out = 4'd11;
                    default: out = 4'd0;
                endcase
            end
            
            4'd13: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd4;
                    2'd1:    out = 4'd11;
                    2'd2:    out = 4'd10;
                    2'd3:    out = 4'd5;
                    default: out = 4'd0;
                endcase
            end
            
            4'd14: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd2;
                    2'd1:    out = 4'd15;
                    2'd2:    out = 4'd14;
                    2'd3:    out = 4'd2;
                    default: out = 4'd0;
                endcase
            end
            
            4'd15: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd8;
                    2'd1:    out = 4'd1;
                    2'd2:    out = 4'd7;
                    2'd3:    out = 4'd12;
                    default: out = 4'd0;
                endcase
            end
            
            default : out = 0;
        endcase
    end

endmodule

module S4(
    input  [5:0] in,
    output reg [3:0] out
);
        always@ (*) begin
        case(in[4:1])
            4'd0: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd7;
                    2'd1:    out = 4'd13;
                    2'd2:    out = 4'd10;
                    2'd3:    out = 4'd3;
                    default: out = 4'd0;
                endcase
            end

            4'd1: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd13;
                    2'd1:    out = 4'd8;
                    2'd2:    out = 4'd6;
                    2'd3:    out = 4'd15;
                    default: out = 4'd0;
                endcase
            end
            
            4'd2: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd14;
                    2'd1:    out = 4'd11;
                    2'd2:    out = 4'd9;
                    2'd3:    out = 4'd0;
                    default: out = 4'd0;
                endcase
            end
            
            4'd3: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd3;
                    2'd1:    out = 4'd5;
                    2'd2:    out = 4'd0;
                    2'd3:    out = 4'd6;
                    default: out = 4'd0;
                endcase
            end
            
            4'd4: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd0;
                    2'd1:    out = 4'd6;
                    2'd2:    out = 4'd12;
                    2'd3:    out = 4'd10;
                    default: out = 4'd0;
                endcase
            end
            
            4'd5: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd6;
                    2'd1:    out = 4'd15;
                    2'd2:    out = 4'd11;
                    2'd3:    out = 4'd1;
                    default: out = 4'd0;
                endcase
            end
            
            4'd6: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd9;
                    2'd1:    out = 4'd0;
                    2'd2:    out = 4'd7;
                    2'd3:    out = 4'd13;
                    default: out = 4'd0;
                endcase
            end
            
            4'd7: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd10;
                    2'd1:    out = 4'd3;
                    2'd2:    out = 4'd13;
                    2'd3:    out = 4'd8;
                    default: out = 4'd0;
                endcase
            end
            
            4'd8: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd1;
                    2'd1:    out = 4'd4;
                    2'd2:    out = 4'd15;
                    2'd3:    out = 4'd9;
                    default: out = 4'd0;
                endcase
            end
            
            4'd9: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd2;
                    2'd1:    out = 4'd7;
                    2'd2:    out = 4'd1;
                    2'd3:    out = 4'd4;
                    default: out = 4'd0;
                endcase
            end
            
            4'd10: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd8;
                    2'd1:    out = 4'd2;
                    2'd2:    out = 4'd3;
                    2'd3:    out = 4'd5;
                    default: out = 4'd0;
                endcase
            end
            
            4'd11: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd5;
                    2'd1:    out = 4'd12;
                    2'd2:    out = 4'd14;
                    2'd3:    out = 4'd11;
                    default: out = 4'd0;
                endcase
            end
            
            4'd12: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd11;
                    2'd1:    out = 4'd1;
                    2'd2:    out = 4'd5;
                    2'd3:    out = 4'd12;
                    default: out = 4'd0;
                endcase
            end
            
            4'd13: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd12;
                    2'd1:    out = 4'd10;
                    2'd2:    out = 4'd2;
                    2'd3:    out = 4'd7;
                    default: out = 4'd0;
                endcase
            end
            
            4'd14: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd4;
                    2'd1:    out = 4'd14;
                    2'd2:    out = 4'd8;
                    2'd3:    out = 4'd2;
                    default: out = 4'd0;
                endcase
            end
            
            4'd15: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd15;
                    2'd1:    out = 4'd9;
                    2'd2:    out = 4'd4;
                    2'd3:    out = 4'd14;
                    default: out = 4'd0;
                endcase
            end
            
            default : out = 0;
        endcase
    end

endmodule

module S5(
    input  [5:0] in,
    output reg [3:0] out
);
        always@ (*) begin
        case(in[4:1])
            4'd0: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd2;
                    2'd1:    out = 4'd14;
                    2'd2:    out = 4'd4;
                    2'd3:    out = 4'd11;
                    default: out = 4'd0;
                endcase
            end

            4'd1: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd12;
                    2'd1:    out = 4'd11;
                    2'd2:    out = 4'd2;
                    2'd3:    out = 4'd8;
                    default: out = 4'd0;
                endcase
            end
            
            4'd2: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd4;
                    2'd1:    out = 4'd2;
                    2'd2:    out = 4'd1;
                    2'd3:    out = 4'd12;
                    default: out = 4'd0;
                endcase
            end
            
            4'd3: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd1;
                    2'd1:    out = 4'd12;
                    2'd2:    out = 4'd11;
                    2'd3:    out = 4'd7;
                    default: out = 4'd0;
                endcase
            end
            
            4'd4: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd7;
                    2'd1:    out = 4'd4;
                    2'd2:    out = 4'd10;
                    2'd3:    out = 4'd1;
                    default: out = 4'd0;
                endcase
            end
            
            4'd5: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd10;
                    2'd1:    out = 4'd7;
                    2'd2:    out = 4'd13;
                    2'd3:    out = 4'd14;
                    default: out = 4'd0;
                endcase
            end
            
            4'd6: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd11;
                    2'd1:    out = 4'd13;
                    2'd2:    out = 4'd7;
                    2'd3:    out = 4'd2;
                    default: out = 4'd0;
                endcase
            end
            
            4'd7: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd6;
                    2'd1:    out = 4'd1;
                    2'd2:    out = 4'd8;
                    2'd3:    out = 4'd13;
                    default: out = 4'd0;
                endcase
            end
            
            4'd8: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd8;
                    2'd1:    out = 4'd5;
                    2'd2:    out = 4'd15;
                    2'd3:    out = 4'd6;
                    default: out = 4'd0;
                endcase
            end
            
            4'd9: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd5;
                    2'd1:    out = 4'd0;
                    2'd2:    out = 4'd9;
                    2'd3:    out = 4'd15;
                    default: out = 4'd0;
                endcase
            end
            
            4'd10: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd3;
                    2'd1:    out = 4'd15;
                    2'd2:    out = 4'd12;
                    2'd3:    out = 4'd0;
                    default: out = 4'd0;
                endcase
            end
            
            4'd11: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd15;
                    2'd1:    out = 4'd10;
                    2'd2:    out = 4'd5;
                    2'd3:    out = 4'd9;
                    default: out = 4'd0;
                endcase
            end
            
            4'd12: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd13;
                    2'd1:    out = 4'd3;
                    2'd2:    out = 4'd6;
                    2'd3:    out = 4'd10;
                    default: out = 4'd0;
                endcase
            end
            
            4'd13: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd0;
                    2'd1:    out = 4'd9;
                    2'd2:    out = 4'd3;
                    2'd3:    out = 4'd4;
                    default: out = 4'd0;
                endcase
            end
            
            4'd14: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd14;
                    2'd1:    out = 4'd8;
                    2'd2:    out = 4'd0;
                    2'd3:    out = 4'd5;
                    default: out = 4'd0;
                endcase
            end
            
            4'd15: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd9;
                    2'd1:    out = 4'd6;
                    2'd2:    out = 4'd14;
                    2'd3:    out = 4'd3;
                    default: out = 4'd0;
                endcase
            end
            
            default : out = 0;
        endcase
    end

endmodule

module S6(
    input  [5:0] in,
    output reg [3:0] out
);
        always@ (*) begin
        case(in[4:1])
            4'd0: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd12;
                    2'd1:    out = 4'd10;
                    2'd2:    out = 4'd9;
                    2'd3:    out = 4'd4;
                    default: out = 4'd0;
                endcase
            end

            4'd1: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd1;
                    2'd1:    out = 4'd15;
                    2'd2:    out = 4'd14;
                    2'd3:    out = 4'd3;
                    default: out = 4'd0;
                endcase
            end
            
            4'd2: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd10;
                    2'd1:    out = 4'd4;
                    2'd2:    out = 4'd15;
                    2'd3:    out = 4'd2;
                    default: out = 4'd0;
                endcase
            end
            
            4'd3: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd15;
                    2'd1:    out = 4'd2;
                    2'd2:    out = 4'd5;
                    2'd3:    out = 4'd12;
                    default: out = 4'd0;
                endcase
            end
            
            4'd4: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd9;
                    2'd1:    out = 4'd7;
                    2'd2:    out = 4'd2;
                    2'd3:    out = 4'd9;
                    default: out = 4'd0;
                endcase
            end
            
            4'd5: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd2;
                    2'd1:    out = 4'd12;
                    2'd2:    out = 4'd8;
                    2'd3:    out = 4'd5;
                    default: out = 4'd0;
                endcase
            end
            
            4'd6: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd6;
                    2'd1:    out = 4'd9;
                    2'd2:    out = 4'd12;
                    2'd3:    out = 4'd15;
                    default: out = 4'd0;
                endcase
            end
            
            4'd7: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd8;
                    2'd1:    out = 4'd5;
                    2'd2:    out = 4'd3;
                    2'd3:    out = 4'd10;
                    default: out = 4'd0;
                endcase
            end
            
            4'd8: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd0;
                    2'd1:    out = 4'd6;
                    2'd2:    out = 4'd7;
                    2'd3:    out = 4'd11;
                    default: out = 4'd0;
                endcase
            end
            
            4'd9: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd13;
                    2'd1:    out = 4'd1;
                    2'd2:    out = 4'd0;
                    2'd3:    out = 4'd14;
                    default: out = 4'd0;
                endcase
            end
            
            4'd10: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd3;
                    2'd1:    out = 4'd13;
                    2'd2:    out = 4'd4;
                    2'd3:    out = 4'd1;
                    default: out = 4'd0;
                endcase
            end
            
            4'd11: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd4;
                    2'd1:    out = 4'd14;
                    2'd2:    out = 4'd10;
                    2'd3:    out = 4'd7;
                    default: out = 4'd0;
                endcase
            end
            
            4'd12: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd14;
                    2'd1:    out = 4'd0;
                    2'd2:    out = 4'd1;
                    2'd3:    out = 4'd6;
                    default: out = 4'd0;
                endcase
            end
            
            4'd13: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd7;
                    2'd1:    out = 4'd11;
                    2'd2:    out = 4'd13;
                    2'd3:    out = 4'd0;
                    default: out = 4'd0;
                endcase
            end
            
            4'd14: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd5;
                    2'd1:    out = 4'd3;
                    2'd2:    out = 4'd11;
                    2'd3:    out = 4'd8;
                    default: out = 4'd0;
                endcase
            end
            
            4'd15: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd11;
                    2'd1:    out = 4'd8;
                    2'd2:    out = 4'd6;
                    2'd3:    out = 4'd13;
                    default: out = 4'd0;
                endcase
            end
            
            default : out = 0;
        endcase
    end

endmodule

module S7(
    input  [5:0] in,
    output reg [3:0] out
);
        always@ (*) begin
        case(in[4:1])
            4'd0: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd4;
                    2'd1:    out = 4'd13;
                    2'd2:    out = 4'd1;
                    2'd3:    out = 4'd6;
                    default: out = 4'd0;
                endcase
            end

            4'd1: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd11;
                    2'd1:    out = 4'd0;
                    2'd2:    out = 4'd4;
                    2'd3:    out = 4'd11;
                    default: out = 4'd0;
                endcase
            end
            
            4'd2: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd2;
                    2'd1:    out = 4'd11;
                    2'd2:    out = 4'd11;
                    2'd3:    out = 4'd13;
                    default: out = 4'd0;
                endcase
            end
            
            4'd3: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd14;
                    2'd1:    out = 4'd7;
                    2'd2:    out = 4'd13;
                    2'd3:    out = 4'd8;
                    default: out = 4'd0;
                endcase
            end
            
            4'd4: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd15;
                    2'd1:    out = 4'd4;
                    2'd2:    out = 4'd12;
                    2'd3:    out = 4'd1;
                    default: out = 4'd0;
                endcase
            end
            
            4'd5: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd0;
                    2'd1:    out = 4'd9;
                    2'd2:    out = 4'd3;
                    2'd3:    out = 4'd4;
                    default: out = 4'd0;
                endcase
            end
            
            4'd6: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd8;
                    2'd1:    out = 4'd1;
                    2'd2:    out = 4'd7;
                    2'd3:    out = 4'd10;
                    default: out = 4'd0;
                endcase
            end
            
            4'd7: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd13;
                    2'd1:    out = 4'd10;
                    2'd2:    out = 4'd14;
                    2'd3:    out = 4'd7;
                    default: out = 4'd0;
                endcase
            end
            
            4'd8: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd3;
                    2'd1:    out = 4'd14;
                    2'd2:    out = 4'd10;
                    2'd3:    out = 4'd9;
                    default: out = 4'd0;
                endcase
            end
            
            4'd9: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd12;
                    2'd1:    out = 4'd3;
                    2'd2:    out = 4'd15;
                    2'd3:    out = 4'd5;
                    default: out = 4'd0;
                endcase
            end
            
            4'd10: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd9;
                    2'd1:    out = 4'd5;
                    2'd2:    out = 4'd6;
                    2'd3:    out = 4'd0;
                    default: out = 4'd0;
                endcase
            end
            
            4'd11: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd7;
                    2'd1:    out = 4'd12;
                    2'd2:    out = 4'd8;
                    2'd3:    out = 4'd15;
                    default: out = 4'd0;
                endcase
            end
            
            4'd12: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd5;
                    2'd1:    out = 4'd2;
                    2'd2:    out = 4'd0;
                    2'd3:    out = 4'd14;
                    default: out = 4'd0;
                endcase
            end
            
            4'd13: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd10;
                    2'd1:    out = 4'd15;
                    2'd2:    out = 4'd5;
                    2'd3:    out = 4'd2;
                    default: out = 4'd0;
                endcase
            end
            
            4'd14: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd6;
                    2'd1:    out = 4'd8;
                    2'd2:    out = 4'd9;
                    2'd3:    out = 4'd3;
                    default: out = 4'd0;
                endcase
            end
            
            4'd15: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd1;
                    2'd1:    out = 4'd6;
                    2'd2:    out = 4'd2;
                    2'd3:    out = 4'd12;
                    default: out = 4'd0;
                endcase
            end
            
            default : out = 0;
        endcase
    end

endmodule

module S8(
    input  [5:0] in,
    output reg [3:0] out
);
        always@ (*) begin
        case(in[4:1])
            4'd0: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd13;
                    2'd1:    out = 4'd1;
                    2'd2:    out = 4'd7;
                    2'd3:    out = 4'd2;
                    default: out = 4'd0;
                endcase
            end

            4'd1: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd2;
                    2'd1:    out = 4'd15;
                    2'd2:    out = 4'd11;
                    2'd3:    out = 4'd1;
                    default: out = 4'd0;
                endcase
            end
            
            4'd2: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd8;
                    2'd1:    out = 4'd13;
                    2'd2:    out = 4'd4;
                    2'd3:    out = 4'd14;
                    default: out = 4'd0;
                endcase
            end
            
            4'd3: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd4;
                    2'd1:    out = 4'd8;
                    2'd2:    out = 4'd1;
                    2'd3:    out = 4'd7;
                    default: out = 4'd0;
                endcase
            end
            
            4'd4: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd6;
                    2'd1:    out = 4'd10;
                    2'd2:    out = 4'd9;
                    2'd3:    out = 4'd4;
                    default: out = 4'd0;
                endcase
            end
            
            4'd5: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd15;
                    2'd1:    out = 4'd3;
                    2'd2:    out = 4'd12;
                    2'd3:    out = 4'd10;
                    default: out = 4'd0;
                endcase
            end
            
            4'd6: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd11;
                    2'd1:    out = 4'd7;
                    2'd2:    out = 4'd14;
                    2'd3:    out = 4'd8;
                    default: out = 4'd0;
                endcase
            end
            
            4'd7: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd1;
                    2'd1:    out = 4'd4;
                    2'd2:    out = 4'd2;
                    2'd3:    out = 4'd13;
                    default: out = 4'd0;
                endcase
            end
            
            4'd8: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd10;
                    2'd1:    out = 4'd12;
                    2'd2:    out = 4'd0;
                    2'd3:    out = 4'd15;
                    default: out = 4'd0;
                endcase
            end
            
            4'd9: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd9;
                    2'd1:    out = 4'd5;
                    2'd2:    out = 4'd6;
                    2'd3:    out = 4'd12;
                    default: out = 4'd0;
                endcase
            end
            
            4'd10: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd3;
                    2'd1:    out = 4'd6;
                    2'd2:    out = 4'd10;
                    2'd3:    out = 4'd9;
                    default: out = 4'd0;
                endcase
            end
            
            4'd11: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd14;
                    2'd1:    out = 4'd11;
                    2'd2:    out = 4'd13;
                    2'd3:    out = 4'd0;
                    default: out = 4'd0;
                endcase
            end
            
            4'd12: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd5;
                    2'd1:    out = 4'd0;
                    2'd2:    out = 4'd15;
                    2'd3:    out = 4'd3;
                    default: out = 4'd0;
                endcase
            end
            
            4'd13: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd0;
                    2'd1:    out = 4'd14;
                    2'd2:    out = 4'd3;
                    2'd3:    out = 4'd5;
                    default: out = 4'd0;
                endcase
            end
            
            4'd14: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd12;
                    2'd1:    out = 4'd9;
                    2'd2:    out = 4'd5;
                    2'd3:    out = 4'd6;
                    default: out = 4'd0;
                endcase
            end
            
            4'd15: begin
                case({in[5], in[0]})
                    2'd0:    out = 4'd7;
                    2'd1:    out = 4'd2;
                    2'd2:    out = 4'd8;
                    2'd3:    out = 4'd11;
                    default: out = 4'd0;
                endcase
            end
            
            default : out = 0;
        endcase
    end

endmodule

module f_function(
    input  [31:0] in,
    input  [47:0] key,
    output [31:0] out
);      
    wire [47:0] temp;
    wire [3:0]  s1,s2,s3,s4,s5,s6,s7,s8;
    wire [47:0] exp_out;

    Expansion expansion(.in(in), .out(exp_out));
    assign temp = exp_out ^ key;
    S1 S1(.in(temp[47:42]), .out(s1));
    S2 S2(.in(temp[41:36]), .out(s2));
    S3 S3(.in(temp[35:30]), .out(s3));
    S4 S4(.in(temp[29:24]), .out(s4));
    S5 S5(.in(temp[23:18]), .out(s5));
    S6 S6(.in(temp[17:12]), .out(s6));
    S7 S7(.in(temp[11:6]) , .out(s7));
    S8 S8(.in(temp[5:0])  , .out(s8));
    P_permutation P(.in({s1,s2,s3,s4,s5,s6,s7,s8}) , .out(out));

endmodule

module DES(
    input  i_clk,
    input  i_rst,
    //for clock gating
    input  enable,
    //shift==1 : circularly shift 1 bit
    //shift==0 : circularly shift 2 bit
    input  shift,
    //first to use initial permutation or not
    input  first,
    //last to use final permutation or not
    input  last,
    //use PC1 output or not
    input  prep_key1,
    //fnsel==1 : decrypt
    //fnsel==0 : encrypt
    input  fnsel,
    input  [127:0] i_data,
    output reg [63:0]  o_data
);  
    wire [55:0] temp1;
    wire [63:0] temp2;
    wire [63:0] temp3;
    wire [31:0] temp4;

    reg  [27:0] up_shift;
    reg  [27:0] down_shift;

    reg  [27:0] up_r, up_w;
    reg  [27:0] down_r, down_w;
    wire [47:0] key;

    reg  [31:0] R, L;
    wire [31:0] R_xor;
    assign R_xor = temp4 ^ L;

    //-----------------------------------------------------------//
    PC1 PC1(.in(i_data[127:64]), .out(temp1));
    initial_permutation init_p(.in(i_data[63:0]) ,.out(temp2));
    final_permutation   final_p(.in({R_xor, R}) ,.out(temp3));
    
    PC2 PC2(.in({down_r, up_r}), .out(key));
    f_function F(.in(R), .key(key), .out(temp4));
    //-----------------------------------------------------------//

    always@ (*) begin
        o_data[31:0]  = last ? temp3[31:0]  : R_xor;  
        o_data[63:32] = last ? temp3[63:32] : R;
    end

    always@ (*) begin
        R = first ? temp2[31:0]  : i_data[31:0]; 
        L = first ? temp2[63:32] : i_data[63:32]; 
    end

    always@ (*) begin
        if(fnsel) begin
            up_shift   = prep_key1 ? {temp1[26:0],  temp1[27]}  : up_r;
            down_shift = prep_key1 ? {temp1[54:28], temp1[55]}  : down_r;
        end
        else begin
            up_shift   = prep_key1 ? temp1[27:0]  : up_r;
            down_shift = prep_key1 ? temp1[55:28] : down_r;
        end
    end

    always@ (*) begin
        if(fnsel) begin
            up_w   = shift ? {up_shift[0],   up_shift[27:1]}   : {up_shift[1:0],   up_shift[27:2]};
            down_w = shift ? {down_shift[0], down_shift[27:1]} : {down_shift[1:0], down_shift[27:2]};
        end
        else begin
            up_w   = shift ? {up_shift[26:0],   up_shift[27]}   : {up_shift[25:0],   up_shift[27:26]};
            down_w = shift ? {down_shift[26:0], down_shift[27]} : {down_shift[25:0], down_shift[27:26]};
        end 
    end

    always@ (posedge i_clk or posedge i_rst) begin
        if(i_rst) begin
            up_r   <= 0;
            down_r <= 0;
        end
        else if(enable) begin
            up_r   <= up_w;
            down_r <= down_w;
        end
    end 

endmodule

module Gray_Binary_Conversion(
    input  i_clk,
    input  i_rst,
    //for clock gating
    input  enable,
    //fn_sel => 1: G to B 
    //       => 0: B to G
    input  fn_sel,
    //first bit of output or not
    input  first, 
    input  [7:0] i_data,
    //previous o_data[0], for G to B
    input  prev,
    output reg [7:0] o_data
);
    reg data;
    reg temp7, temp6, temp5, temp4, temp3, temp2, temp1, temp0;

    always@ (*) begin
        temp7 = (first) ? 1'b0 :
                (fn_sel)? prev : data;
        temp6 = (fn_sel)? o_data[7] : i_data[7];
        temp5 = (fn_sel)? o_data[6] : i_data[6];
        temp4 = (fn_sel)? o_data[5] : i_data[5];
        temp3 = (fn_sel)? o_data[4] : i_data[4];
        temp2 = (fn_sel)? o_data[3] : i_data[3];
        temp1 = (fn_sel)? o_data[2] : i_data[2];
        temp0 = (fn_sel)? o_data[1] : i_data[1];

        o_data[7] = i_data[7] ^ temp7;
        o_data[6] = i_data[6] ^ temp6;
        o_data[5] = i_data[5] ^ temp5;
        o_data[4] = i_data[4] ^ temp4;
        o_data[3] = i_data[3] ^ temp3;
        o_data[2] = i_data[2] ^ temp2;
        o_data[1] = i_data[1] ^ temp1;
        o_data[0] = i_data[0] ^ temp0;
    end

    always@ (posedge i_clk or posedge i_rst) begin
        if(i_rst) begin
            data <= 0;
        end
        else if(enable)begin
            data <= i_data[0];
        end
    end 

endmodule
