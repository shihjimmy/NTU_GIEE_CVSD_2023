module core #( // DO NOT MODIFY!!!
    parameter ADDR_WIDTH = 32,
    parameter INST_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (   
    input                    i_clk,
    input                    i_rst_n,
    output  [ADDR_WIDTH-1:0] o_i_addr,
    input   [INST_WIDTH-1:0] i_i_inst,
    output                   o_d_we,
    output  [ADDR_WIDTH-1:0] o_d_addr,
    output  [DATA_WIDTH-1:0] o_d_wdata,
    input   [DATA_WIDTH-1:0] i_d_rdata,
    output  [           1:0] o_status,
    output                   o_status_valid
);  
    // states
    localparam IDLE = 2'b00;
    localparam CALC = 2'b01;
    localparam USE_MEM = 2'b10;
    localparam FINISH = 2'b11;

    reg [1:0] state_r, state_w;

    // for output
    reg [1:0] o_status_r, o_status_w;
    reg o_status_valid_r, o_status_valid_w;
    reg [ADDR_WIDTH-1:0] o_d_addr_r, o_d_addr_w;
    reg [DATA_WIDTH-1:0] o_d_wdata_r, o_d_wdata_w;
    reg [ADDR_WIDTH-1:0] o_i_addr_r, o_i_addr_w;
    reg o_d_we_r, o_d_we_w;

    assign o_status = o_status_r;
    assign o_status_valid = o_status_valid_r;
    assign o_d_we = o_d_we_r;
    assign o_d_wdata = o_d_wdata_r;
    assign o_d_addr = o_d_addr_r;
    assign o_i_addr = o_i_addr_r;

    // for register file
    reg reg_wen_temp;
    reg reg_wen;
    reg [4:0] reg_waddr;
    reg [DATA_WIDTH-1:0] reg_wdata;
    reg [4:0] reg_raddr_1, reg_raddr_2;
    wire [DATA_WIDTH-1:0] reg_rdata_1, reg_rdata_2;

    // for instrucitons fetching and decoding
    reg [ADDR_WIDTH-1:0] PC_next;
    reg [5:0]  opcode;
    reg [4:0]  s1, s2, s3;
    reg [15:0] im;
    reg R_type, I_type, EOF;

    // for ALU
    reg ALU_overflow;
    reg PC_overflow;
    reg mem_overflow;
    reg overflow;
    wire [DATA_WIDTH-1:0] FP_result;

    register_file #(5,32,32) regfile_32 (
        .i_clk(i_clk), .i_rst_n(i_rst_n), .i_write(reg_wen), .i_wdata(reg_wdata),
        .i_waddr(reg_waddr), .i_addr_1(reg_raddr_1), .i_addr_2(reg_raddr_2), 
        .o_rdata_1(reg_rdata_1), .o_rdata_2(reg_rdata_2) 
    );

    FP_unit FP(.a(reg_rdata_1), .b(reg_rdata_2), .opcode(opcode), .result(FP_result));

    // state transition
    always@ (*) begin
        case(state_r) 
            IDLE:    state_w = CALC;
            CALC:    state_w = USE_MEM;
            USE_MEM: state_w = FINISH;
            FINISH:  state_w = (EOF || overflow) ? FINISH : CALC;
            default: state_w = state_r;
        endcase
    end

    // output status
    always@ (*) begin
        if(state_r == USE_MEM) begin
            o_status_w = (overflow) ? `MIPS_OVERFLOW : 
                         (EOF)      ? `MIPS_END :
                         (I_type)   ? `I_TYPE_SUCCESS : `R_TYPE_SUCCESS; // I_type
            o_status_valid_w = 1;
        end
        else begin
            o_status_w = 0;
            o_status_valid_w = 0;
        end
    end

    always@ (*) begin
        if(state_r == CALC) begin
            case(opcode)
                `OP_LW  : begin
                    o_d_addr_w  = $signed(reg_rdata_1) + $signed(im);
                    o_d_we_w    = 0;
                    o_d_wdata_w = 0;
                end
                
                `OP_SW  : begin
                    o_d_addr_w  = $signed(reg_rdata_2) + $signed(im);
                    o_d_we_w    = 1;
                    o_d_wdata_w = reg_rdata_1;
                end

                default: begin
                    o_d_addr_w  = o_d_addr_r;
                    o_d_we_w    = o_d_we_r;
                    o_d_wdata_w = o_d_wdata_r;
                end
            endcase
        end
        else if(state_r == USE_MEM)begin
            o_d_addr_w  = o_d_addr_r;
            o_d_we_w    = 0;
            o_d_wdata_w = o_d_wdata_r;
        end
        else begin
            o_d_addr_w  = o_d_addr_r;
            o_d_we_w    = o_d_we_r;
            o_d_wdata_w = o_d_wdata_r;
        end
    end

    // Instruction fetching
    always@ (*) begin
        if(state_r == USE_MEM)
            // In order to get new instruction at stage:CALC
            o_i_addr_w = PC_next;
        else
            o_i_addr_w = o_i_addr_r;
    end

    // Instruction decoding
    always@ (*) begin
        opcode = i_i_inst[31:26];
        I_type = (opcode == 6'd4) || (opcode == 6'd5) || (opcode == 6'd6) || (opcode == 6'd10) || (opcode == 6'd11);
        R_type = (opcode != 6'd18) && (!I_type);
        EOF = (opcode == 6'd18);
        
        if(R_type) begin
            s1 = i_i_inst[15:11];
            s2 = i_i_inst[25:21];
            s3 = i_i_inst[20:16];
            im = 0;
        end
        else if(I_type) begin
            s1 = i_i_inst[20:16];
            s2 = i_i_inst[25:21];
            s3 = 0;
            im = i_i_inst[15:0];
        end
        else begin
            s1 = 0;
            s2 = 0;
            s3 = 0;
            im = 0;
        end
    end

    // ALU 
    always@ (*) begin
        case(opcode)
            `OP_ADD   : begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = $signed(reg_rdata_1) + $signed(reg_rdata_2);

                ALU_overflow = (reg_rdata_1[DATA_WIDTH-1] & reg_rdata_2[DATA_WIDTH-1] & (!reg_wdata[DATA_WIDTH-1]))
                            || ((!reg_rdata_1[DATA_WIDTH-1]) & (!reg_rdata_2[DATA_WIDTH-1]) & reg_wdata[DATA_WIDTH-1]);
            end

            `OP_SUB   :begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = $signed(reg_rdata_1) - $signed(reg_rdata_2);

                ALU_overflow = (reg_rdata_1[DATA_WIDTH-1] & (!reg_rdata_2[DATA_WIDTH-1]) & (!reg_wdata[DATA_WIDTH-1]))
                            || ((!reg_rdata_1[DATA_WIDTH-1]) & reg_rdata_2[DATA_WIDTH-1] & reg_wdata[DATA_WIDTH-1]);    
            end

            `OP_MUL   : begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = $signed(reg_rdata_1) * $signed(reg_rdata_2);

                ALU_overflow = 
                ( ( ({reg_rdata_1[DATA_WIDTH-1], reg_rdata_2[DATA_WIDTH-1]}==2'b11) || ({reg_rdata_1[DATA_WIDTH-1], reg_rdata_2[DATA_WIDTH-1]}==2'b00) )
                    && reg_wdata[DATA_WIDTH-1]  )   || 
                ( ( ({reg_rdata_1[DATA_WIDTH-1], reg_rdata_2[DATA_WIDTH-1]}==2'b10) || ({reg_rdata_1[DATA_WIDTH-1], reg_rdata_2[DATA_WIDTH-1]}==2'b01) )
                    && (!reg_wdata[DATA_WIDTH-1]) ); 
            end

            `OP_ADDI  : begin
                reg_raddr_1 = s2;
                reg_raddr_2 = 0;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = $signed(reg_rdata_1) + $signed(im);
                ALU_overflow = (reg_rdata_1[DATA_WIDTH-1] & im[15] & (!reg_wdata[DATA_WIDTH-1]))
                            || ((!reg_rdata_1[DATA_WIDTH-1]) & (!im[15]) & reg_wdata[DATA_WIDTH-1]);
            end

            `OP_LW    : begin
                reg_raddr_1 = s2;
                reg_raddr_2 = 0;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = i_d_rdata;
                ALU_overflow = 0; 
            end

            `OP_SW    : begin
                reg_raddr_1 = s1;
                reg_raddr_2 = s2;
                reg_wen_temp = 0;
                reg_waddr = 0;
                reg_wdata = 0;
                ALU_overflow = 0;
            end
            
            `OP_AND   : begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = reg_rdata_1 & reg_rdata_2;
                ALU_overflow = 0;
            end

            `OP_OR    : begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = reg_rdata_1 | reg_rdata_2;
                ALU_overflow = 0;
            end

            `OP_NOR   : begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = ~(reg_rdata_1 | reg_rdata_2);
                ALU_overflow = 0;
            end

            `OP_BEQ   : begin
                reg_raddr_1 = s1;
                reg_raddr_2 = s2;
                reg_wen_temp = 0;
                reg_waddr = 0;
                reg_wdata = 0;
                ALU_overflow = 0;
            end

            `OP_BNE   : begin
                reg_raddr_1 = s1;
                reg_raddr_2 = s2;
                reg_wen_temp = 0;
                reg_waddr = 0;
                reg_wdata = 0;
                ALU_overflow = 0;
            end

            `OP_SLT   : begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = ($signed(reg_rdata_1) < $signed(reg_rdata_2)) ? 1 : 0;
                ALU_overflow = 0;
            end

            `OP_FP_ADD: begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = FP_result;
                ALU_overflow = 0;
            end

            `OP_FP_SUB: begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = FP_result;
                ALU_overflow = 0;
            end

            `OP_FP_MUL: begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = FP_result;
                ALU_overflow = 0;
            end

            `OP_SLL   : begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = reg_rdata_1 << reg_rdata_2;
                ALU_overflow = 0;
            end

            `OP_SRL   : begin
                reg_raddr_1 = s2;
                reg_raddr_2 = s3;
                reg_wen_temp = 1;
                reg_waddr = s1;
                reg_wdata = reg_rdata_1 >> reg_rdata_2;
                ALU_overflow = 0;
            end
            
            `OP_EOF   : begin
                reg_raddr_1 = 0;
                reg_raddr_2 = 0;
                reg_wen_temp = 0;
                reg_waddr = 0;
                reg_wdata = 0;
                ALU_overflow = 0;
            end

            default: begin
                reg_raddr_1 = 0;
                reg_raddr_2 = 0;
                reg_wen_temp = 0;
                reg_waddr = 0;
                reg_wdata = 0;
                ALU_overflow = 0;
            end
        endcase
    end

    always@ (*) begin
        if(state_r==CALC || opcode==`OP_LW) begin
            reg_wen = reg_wen_temp;
        end
        else begin
            reg_wen = 0;
        end
    end

    always@ (*) begin
        case(opcode) 
            `OP_BEQ   : begin
                if(reg_rdata_1==reg_rdata_2) 
                    PC_next = $signed(o_i_addr_r) + $signed(im);
                else
                    PC_next = o_i_addr_r + 4;
            end
            
            `OP_BNE   : begin
                if(reg_rdata_1!=reg_rdata_2) 
                    PC_next = $signed(o_i_addr_r) + $signed(im);
                else
                    PC_next = o_i_addr_r + 4;
            end

            `OP_EOF   :  PC_next = o_i_addr_r;
            default   :  PC_next = o_i_addr_r + 4;
        endcase  
    end

    always@ (*) begin
        PC_overflow = |PC_next[ADDR_WIDTH-1:12];
        mem_overflow = (opcode==`OP_LW || opcode==`OP_SW) && (|o_d_addr_w[ADDR_WIDTH-1:8]);
        overflow = ALU_overflow || PC_overflow || mem_overflow;
    end

    always@ (posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) begin
            state_r          <= IDLE;
            o_status_r       <= 0;
            o_d_addr_r       <= 0;
            o_d_wdata_r      <= 0;
            o_d_we_r         <= 0;
            o_i_addr_r       <= 0;
            o_status_valid_r <= 0;
        end
        else begin
            state_r          <= state_w;
            o_status_r       <= o_status_w;
            o_d_addr_r       <= o_d_addr_w;
            o_d_wdata_r      <= o_d_wdata_w;
            o_d_we_r         <= o_d_we_w;
            o_i_addr_r       <= o_i_addr_w;
            o_status_valid_r <= o_status_valid_w;
        end
    end

endmodule

module register_file #(
    parameter ADDR_WIDTH = 5,  // 2^5 = 32
    parameter DATA_WIDTH = 32,
    parameter LENGTH = 32
) ( 
    input i_clk,
    input i_rst_n,
    input i_write,
    input [DATA_WIDTH-1:0] i_wdata,
    input [ADDR_WIDTH-1:0] i_waddr,
    input [ADDR_WIDTH-1:0] i_addr_1,
    input [ADDR_WIDTH-1:0] i_addr_2,
    output [DATA_WIDTH-1:0] o_rdata_1, o_rdata_2
);
    reg [DATA_WIDTH-1:0] mem [0:LENGTH-1];
    reg [DATA_WIDTH-1:0] mem_nxt [0:LENGTH-1];
    
    assign o_rdata_1 = mem[i_addr_1];
    assign o_rdata_2 = mem[i_addr_2];

    integer i;
    always@ (*) begin
        for (i=0; i<LENGTH; i=i+1) begin
            mem_nxt[i] = (i_write && (i_waddr == i)) ? i_wdata : mem[i];
        end
    end

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            for (i=0; i<LENGTH; i=i+1) begin
                mem[i] <= 32'h0;
            end
        end
        else begin
            for (i=0; i<LENGTH; i=i+1) begin
                mem[i] <= mem_nxt[i];
            end
        end
    end

endmodule

module FP_unit(
    //Inputs in the format of IEEE-754 Representation
    input [31:0] a,
    input [31:0] b, 
    input [5:0] opcode,
    //Outputs in the format of IEEE-754 Representation
    output [31:0] result 
);
    wire [31:0] add_sub_result;
    wire [31:0] mult_result;
    wire ADD_OR_SUB;

    assign ADD_OR_SUB = (opcode==`OP_FP_SUB) ? 1'b1 : 1'b0;
    assign result = (opcode==`OP_FP_MUL) ? mult_result :
                    (opcode==`OP_FP_ADD || opcode==`OP_FP_SUB) ? add_sub_result : 0;

    FP_add_sub_unit add_sub(a, b, ADD_OR_SUB, add_sub_result);
    FP_mul_unit multiply(a, b, mult_result);

endmodule

module FP_add_sub_unit(
    input [31:0] a,
    input [31:0] b, 
    input ADD_OR_SUB,	
    output [31:0] result 
);  
    wire [31:0] operand_a, operand_b;
    wire [36:0] significand_a, significand_b;
    reg  [36:0] input_a, input_b;
    wire Comp_enable;
    wire output_sign;
    wire [7:0] exponent_diff;

    wire [36:0] temp_1, temp_1_1;
    wire [63:0] temp_2;
    
    reg [6:0]  tmp_cnt, cnt;
    reg [31:0] val32;
    reg [15:0] val16;
    reg [7:0]  val8;
    reg [3:0]  val4;

    reg [7:0] exp_shift;
    wire [7:0] exp_result;
    reg [22:0] mantissa;
    wire [23:0] mantissa_result;
    reg round, sticky, guard;
    wire final_round;
    
    assign {Comp_enable, operand_a, operand_b} = (a[30:0] < b[30:0]) ? {1'b1, b, a} : {1'b0, a, b};
    assign output_sign = ADD_OR_SUB ? ((Comp_enable) ? !operand_a[31] : operand_a[31]) : operand_a[31];

    //Evaluating Exponent Difference
    assign exponent_diff = operand_a[30:23] - operand_b[30:23];
    assign significand_a = {3'd1, operand_a[22:0], 11'd0};
    assign significand_b = {3'd1, operand_b[22:0], 11'd0} >> exponent_diff;

    always@ (*) begin
        if(Comp_enable) begin
            if(ADD_OR_SUB) begin
                input_a = (!operand_a[31]) ? (~significand_a + 1'b1) : significand_a;
                input_b = operand_b[31] ? (~significand_b + 1'b1) : significand_b;
            end
            else begin
                input_a = operand_a[31] ? (~significand_a + 1'b1) : significand_a;
                input_b = operand_b[31] ? (~significand_b + 1'b1) : significand_b;
            end
        end
        else begin
            if(ADD_OR_SUB) begin
                input_a = operand_a[31] ? (~significand_a + 1'b1) : significand_a;
                input_b = (!operand_b[31]) ? (~significand_b + 1'b1) : significand_b;
            end
            else begin
                input_a = operand_a[31] ? (~significand_a + 1'b1) : significand_a;
                input_b = operand_b[31] ? (~significand_b + 1'b1) : significand_b;
            end
        end
    end

    assign temp_1 = (input_a + input_b);
    assign temp_1_1 = temp_1[36] ? (~temp_1 + 1'b1) : temp_1;
    assign temp_2 = {27'd0, temp_1_1};

    //Then, we should check how many leading zeros
    always@ (*) begin
        if (temp_2[63:0] == 64'b0) begin
            tmp_cnt = 64;
        end
        else begin
            tmp_cnt[6] = 1'b0;
            tmp_cnt[5] = (temp_2[63:31] == 32'b0);
            val32 = tmp_cnt[5] ? temp_2[31:0] : temp_2[63:32];
            tmp_cnt[4] = (val32[31:16] == 16'b0);
            val16 = tmp_cnt[4] ? val32[15:0] : val32[31:16];
            tmp_cnt[3] = (val16[15:8] == 8'b0);
            val8 = tmp_cnt[3] ? val16[7:0] : val16 [15:8];
            tmp_cnt[2] = (val8[7:4] == 4'b0);
            val4 = tmp_cnt[2] ? val8[3:0] : val8[7:4];
            tmp_cnt[1] = (val4[3:2] == 2'b0);
            tmp_cnt[0] = tmp_cnt[1] ? ~val4[1] : ~val4[3];
        end
        cnt = tmp_cnt - 27;
    end

    always@ (*) begin
        case(cnt)
            0: begin
                mantissa = temp_1_1[35-:23];
                guard = temp_1_1[13];
                round  = temp_1_1[12];
                sticky = |temp_1_1[11:0];
                exp_shift = 2;
            end

            1: begin
                mantissa = temp_1_1[34-:23];
                guard = temp_1_1[12];
                round  = temp_1_1[11];
                sticky = |temp_1_1[10:0];
                exp_shift = 1;
            end

            2: begin
                mantissa = temp_1_1[33-:23];
                guard = temp_1_1[11];
                round  = temp_1_1[10];
                sticky = |temp_1_1[9:0];
                exp_shift = 0;
            end

            3: begin
                mantissa = temp_1_1[32-:23];
                guard = temp_1_1[10];
                round  = temp_1_1[9];
                sticky = |temp_1_1[8:0];
                exp_shift = -1;
            end

            4: begin
                mantissa = temp_1_1[31-:23];
                guard = temp_1_1[9];
                round  = temp_1_1[8];
                sticky = |temp_1_1[7:0];
                exp_shift = -2;
            end 

            5: begin
                mantissa = temp_1_1[30-:23];
                guard = temp_1_1[8];
                round  = temp_1_1[7];
                sticky = |temp_1_1[6:0];
                exp_shift = -3;
            end

            6: begin
                mantissa = temp_1_1[29-:23];
                guard = temp_1_1[7];
                round  = temp_1_1[6];
                sticky = |temp_1_1[5:0];
                exp_shift = -4;
            end

            7: begin
                mantissa = temp_1_1[28-:23];
                guard = temp_1_1[6];
                round  = temp_1_1[5];
                sticky = |temp_1_1[4:0];
                exp_shift = -5;
            end

            8: begin
                mantissa = temp_1_1[27-:23];
                guard = temp_1_1[5];
                round  = temp_1_1[4];
                sticky = |temp_1_1[3:0];
                exp_shift = -6;
            end

            9: begin
                mantissa = temp_1_1[26-:23];
                guard = temp_1_1[4];
                round  = temp_1_1[3];
                sticky = |temp_1_1[2:0];
                exp_shift = -7;
            end

            10: begin
                mantissa = temp_1_1[25-:23];
                guard = temp_1_1[3];
                round  = temp_1_1[2];
                sticky = |temp_1_1[1:0];
                exp_shift = -8;
            end

            11: begin
                mantissa = temp_1_1[24-:23];
                guard = temp_1_1[2];
                round  = temp_1_1[1];
                sticky = |temp_1_1[0];
                exp_shift = -9;
            end

            12: begin
                mantissa = temp_1_1[23-:23];
                guard = temp_1_1[1];
                round  = temp_1_1[0];
                sticky = 0;
                exp_shift = -10;
            end

            13: begin
                mantissa = temp_1_1[22:0];
                guard = temp_1_1[0];
                round  = 0;
                sticky = 0;
                exp_shift = -11;
            end

            14: begin
                mantissa = {temp_1_1[21:0],1'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -12;
            end

            15: begin
                mantissa = {temp_1_1[20:0],2'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -13;
            end

            16: begin
                mantissa = {temp_1_1[19:0],3'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -14;
            end

            17: begin
                mantissa = {temp_1_1[18:0],4'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -15;
            end

            18: begin
                mantissa = {temp_1_1[17:0],5'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -16;
            end

            19: begin
                mantissa = {temp_1_1[16:0],6'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -17;
            end

            20: begin
                mantissa = {temp_1_1[15:0],7'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -18;
            end

            21: begin
                mantissa = {temp_1_1[14:0],8'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -19;
            end

            22: begin
                mantissa = {temp_1_1[13:0],9'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -20;
            end

            23: begin
                mantissa = {temp_1_1[12:0],10'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -21;
            end

            24: begin
                mantissa = {temp_1_1[11:0],11'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -22;
            end

            25: begin
                mantissa = {temp_1_1[10:0],12'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -23;
            end

            26: begin
                mantissa = {temp_1_1[9:0],13'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -24;
            end

            27: begin
                mantissa = {temp_1_1[8:0],14'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -25;
            end

            28: begin
                mantissa = {temp_1_1[7:0],15'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -26;
            end

            29: begin
                mantissa = {temp_1_1[6:0],16'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -27;
            end

            30: begin
                mantissa = {temp_1_1[5:0],17'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -28;
            end

            31: begin
                mantissa = {temp_1_1[4:0],18'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -29;
            end

            32: begin
                mantissa = {temp_1_1[3:0],19'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -30;
            end

            33: begin
                mantissa = {temp_1_1[2:0],20'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -31;
            end

            34: begin
                mantissa = {temp_1_1[1:0],21'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -32;
            end

            35: begin
                mantissa = {temp_1_1[0],22'd0};
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -33;
            end

            36: begin
                mantissa = 23'd0;
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = -34;
            end

            default: begin
                mantissa = 0;
                guard = 0;
                round  = 0;
                sticky = 0;
                exp_shift = 0;
            end
        endcase
    end

    assign final_round = (  ( {guard, round, sticky} == 3'b011 ) || 
                            ( {guard, round, sticky} == 3'b110 ) ||
                            ( {guard, round, sticky} == 3'b111 ) ) ? 1 : 0;

    assign mantissa_result = mantissa + final_round;
    assign exp_result = operand_a[30:23] + exp_shift + mantissa_result[23];
    assign result = {output_sign, exp_result, mantissa_result[22:0]};

endmodule

module FP_mul_unit(
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] result
);
    wire sign;
    wire product_round, product_guard, product_sticky;
    wire rounding;
    wire normalised;
    wire [8:0]  exponent, sum_exponent;
    wire [22:0] product_mantissa;
    wire [23:0] operand_a, operand_b;
    wire [47:0] product, product_normalised; 

    assign sign = a[31] ^ b[31];
    assign operand_a = {1'b1,a[22:0]};
    assign operand_b = {1'b1,b[22:0]};

    //Calculating Product
    assign product = operand_a * operand_b;			

    //Rounding
    assign normalised = product[47] ? 1 : 0;
    assign product_normalised = normalised ? product : product << 1;	

    assign product_sticky = |product_normalised[22:0];  
    assign product_round = product_normalised[23]; 
    assign product_guard = product_normalised[24];
    assign rounding = ( ( {product_guard, product_round, product_sticky} == 3'b011 ) || 
                        ( {product_guard, product_round, product_sticky} == 3'b110 ) ||
                        ( {product_guard, product_round, product_sticky} == 3'b111 ) ) ? 1 : 0;

    assign product_mantissa = product_normalised[46-:23] + rounding; 

    //Get exponent and result
    assign sum_exponent = a[30:23] +b[30:23];
    assign exponent = sum_exponent - 9'd127 + normalised;
    assign result = {sign, exponent[7:0], product_mantissa};

endmodule
