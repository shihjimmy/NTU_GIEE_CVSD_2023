`define approximate_1 0000101110 //0.000010111(binary)  = 0.044921875(decimal)
`define approximate_2 1100110001 //0.1100110001(binary) = 0.7978515625(decimal)

module alu #(
    parameter INT_W  = 6,
    parameter FRAC_W = 10,
    parameter INST_W = 4,
    parameter DATA_W = INT_W + FRAC_W
)(
    input                     i_clk,
    input                     i_rst_n,
    input signed [DATA_W-1:0] i_data_a,
    input signed [DATA_W-1:0] i_data_b,
    input        [INST_W-1:0] i_inst,
    output                    o_valid,
    output                    o_busy,
    output       [DATA_W-1:0] o_data
);

    localparam IDLE = 3'b000;
    localparam START = 3'b001;
    localparam PREP = 3'b010;
    localparam CALC = 3'b011;
    localparam ITER = 3'b100;
    localparam COUT = 3'b101;

    reg o_valid_r, o_valid_w;
    reg o_busy_r, o_busy_w;
    reg [2:0] state_r, state_w;
    reg [DATA_W-1:0] o_data_r,o_data_w;

    reg [DATA_W-1:0] inst_1_result, temp_1_1;
    reg [DATA_W-1:0] inst_2_result, temp_2_1;

    reg [DATA_W-1:0]   inst_3_result;
    reg [2*DATA_W-1:0] temp_3_1;
    reg [DATA_W:0]   temp_3_2;
    reg Cin_3;
    reg [FRAC_W-1:0] Sum_3;

    reg [DATA_W-1:0] inst_4_result;
    reg [2*DATA_W:0] temp_4_1;
    reg [DATA_W:0]   temp_4_2;
    reg Cin_4;
    reg [FRAC_W-1:0] Sum_4;

    reg [DATA_W-1:0] inst_5_result;
    reg [31:0] temp_5_1;
    reg [41:0] temp_5_2;
    reg [42:0] temp_5_3;
    reg [58:0] temp_5_4;
    reg [74:0] temp_5_5;
    reg [DATA_W-1:0] temp_5_6, temp_5_7;
    reg [2*DATA_W-1:0] temp_5_8;
    reg [3*DATA_W-1:0] temp_5_9;
    reg Cin_5, Cin_5_2;
    reg [FRAC_W-1:0] Sum_5,Sum_5_2;


    reg [DATA_W-1:0] inst_6_result;
    reg [7:0] val8;
    reg [3:0] val4;
    reg [1:0] val2;
    reg [4:0] temp_6_1;

    reg [4:0] count_r, count_w;
    reg [DATA_W-1:0] iter7_data_r, iter7_data_w;
    reg [4:0] CPOP_r, CPOP_w;
    reg [DATA_W-1:0] iter8_data_r, iter8_data_w;
    
    reg [DATA_W-1:0] inst_FP_result;
    reg [4:0] exp_a, exp_b, diff, exp_FP;
    reg [4:0] ldz;
    reg bigger, guard, round, sticky, Cin_FP;
    reg [26:0] fract_a, fract_b, operand_a, operand_b;
    reg [26:0] result;
    reg [26:0] temp_FP, temp_FP_2;
    reg [7:0] FP_val8;
    reg [3:0] FP_val4;
    reg [1:0] FP_val2;

    assign o_data = o_data_r;
    assign o_valid = o_valid_r;
    assign o_busy = o_busy_r; 


    // State transition
    always@ (*) begin
        case(state_r)
            IDLE:  state_w = START;
            START: state_w = PREP;
            PREP:  state_w = CALC;
            CALC:  state_w = ITER;
            ITER:  begin
                if(i_inst == 4'b0110) begin
                // LRCW
                    if((count_w == CPOP_r && CPOP_r!=0) || CPOP_r==0) begin
                        state_w = COUT;
                    end
                    else
                        state_w = ITER;
                end
                else if(i_inst == 4'b0111) begin
                // LFSR
                    if((count_w == i_data_b[4:0] && i_data_b!=0) || i_data_b==0)
                        state_w = COUT;
                    else
                        state_w = ITER;
                end
                else begin
                    state_w = COUT;
                end
            end
            COUT:  state_w = PREP;
            default: state_w = state_r;
        endcase
    end


    // Output Logic
    always@ (*) begin
        o_data_w = o_data_r;
        o_busy_w = o_busy_r;
        o_valid_w = o_valid_r;

        if(state_r == IDLE) begin
            o_valid_w = 0;
            o_busy_w = 0;
        end
        else if(state_r == START) begin
            o_valid_w = 0;
            o_busy_w = 1;
        end
        else if(state_r == ITER) begin
            case(i_inst)
                4'b0000: o_data_w = inst_1_result;
                4'b0001: o_data_w = inst_2_result;
                4'b0010: o_data_w = inst_3_result;
                4'b0011: o_data_w = inst_4_result;
                4'b0100: o_data_w = inst_5_result;
                4'b0101: o_data_w = inst_6_result;
                4'b0110: begin
                    if(state_w==COUT)
                        o_data_w = iter7_data_w;
                    else
                        o_data_w = 0;
                end
                4'b0111: begin
                    if(state_w==COUT)
                        o_data_w = iter8_data_w;
                    else
                        o_data_w = 0;
                end
                4'b1000: o_data_w = inst_FP_result;
                4'b1001: o_data_w = inst_FP_result;
                default: o_data_w = o_data_r;
            endcase

            if(state_r == ITER && state_w == ITER) begin
                o_busy_w = 1;
                o_valid_w = 0;
            end
            else begin
                o_busy_w = 0;
                o_valid_w = 1;
            end
        end
        else if(state_r == COUT)begin
            o_busy_w = 1;
            o_valid_w = 0;
        end
    end
    

    /*
        INSTRUCION 1: 0000
    */
    integer i;
    always@ (*) begin
        temp_1_1 = i_data_a + i_data_b;
        
        if(i_data_a[DATA_W-1] & i_data_b[DATA_W-1] & (!temp_1_1[DATA_W-1])) begin
            /*
                saturation occurs, let result be minimum
                result = 100000..0
            */
            inst_1_result[DATA_W-1] = 1'b1;
            for(i=0;i<DATA_W-1;i=i+1) begin
                inst_1_result[i] = 1'b0;
            end
        end
        else if((!i_data_a[DATA_W-1]) & (!i_data_b[DATA_W-1]) & temp_1_1[DATA_W-1]) begin
            /*
                saturation occurs, let result be maximum
                result = 0111111..1
            */
            inst_1_result[DATA_W-1] = 1'b0;
            for(i=0;i<DATA_W-1;i=i+1) begin
                inst_1_result[i] = 1'b1;
            end
        end
        else begin
            inst_1_result = temp_1_1;
        end
    end


    /*
        INSTRUCION 2: 0001
    */
    always@ (*) begin
        temp_2_1 = i_data_a - i_data_b;
        
        if((!i_data_a[DATA_W-1]) & i_data_b[DATA_W-1] & temp_2_1[DATA_W-1]) begin
            /*
                saturation occurs, let result be maximum
                result = 011111..1
            */
            inst_2_result[DATA_W-1] = 1'b0;
            for(i=0;i<DATA_W-1;i=i+1) begin
                inst_2_result[i] = 1'b1;
            end
        end
        else if(i_data_a[DATA_W-1] & (!i_data_b[DATA_W-1]) & (!temp_2_1[DATA_W-1])) begin
            /*
                saturation occurs, let result be minimum
                result = 100000..0
            */
            inst_2_result[DATA_W-1] = 1'b1;
            for(i=0;i<DATA_W-1;i=i+1) begin
                inst_2_result[i] = 1'b0;
            end
        end
        else begin
            inst_2_result = temp_2_1;
        end
    end


    /*
        INSTRUCION 3: 0010
    */
    always@ (*) begin
        /*
            Multiplication:
                First, make sure it doesn't overflow
                Next, do the rounding
        */
        temp_3_1 = i_data_a * i_data_b;

        // rounding , but maybe Cin will lead to overflow
        {Cin_3, Sum_3} = (temp_3_1[(2*FRAC_W-1)-:FRAC_W] + 1'b1);
        temp_3_2[(FRAC_W-1)-:FRAC_W] = (temp_3_1[FRAC_W-1]) ? Sum_3 : temp_3_1[(2*FRAC_W-1)-:FRAC_W];
        temp_3_2[DATA_W-:(INT_W+1)] = $signed(temp_3_1[(2*FRAC_W+INT_W-1):(2*FRAC_W)]) + $signed({1'b0,Cin_3});
        
        // overflow check
        if(    ( ({i_data_a[DATA_W-1], i_data_b[DATA_W-1]}==2'b11) || ({i_data_a[DATA_W-1], i_data_b[DATA_W-1]}==2'b00) )
            && ( temp_3_1[(2*FRAC_W+INT_W-1)]  ||  ( (!temp_3_1[(2*FRAC_W+INT_W-1)])  &&  (|temp_3_1[(2*DATA_W-1)-:INT_W]) ) ) 
            ) begin
            // neg * neg or pos * pos
            /*
                saturation occurs, let result be maximum
                result = 011111..1
            */  

            inst_3_result[DATA_W-1] = 1'b0;
            for(i=0;i<DATA_W-1;i=i+1) begin
                inst_3_result[i] = 1'b1;
            end 
        end
        else if( ( ({i_data_a[DATA_W-1], i_data_b[DATA_W-1]}==2'b10) || ({i_data_a[DATA_W-1], i_data_b[DATA_W-1]}==2'b01) )
            &&   ( (!temp_3_1[(2*FRAC_W+INT_W-1)])  || ( temp_3_1[(2*FRAC_W+INT_W-1)] && (|(~temp_3_1[(2*DATA_W-1)-:INT_W])) ) ) 
            ) begin
            // pos * neg or neg * pos
            /*
                saturation occurs, let result be minimum
                result = 100000..0
            */
            
            inst_3_result[DATA_W-1] = 1'b1;
            for(i=0;i<DATA_W-1;i=i+1) begin
                inst_3_result[i] = 1'b0;
            end
        end
        else begin
            if(temp_3_2[DATA_W-:2] == 2'b10) begin
                /*
                    saturation occurs, let result be minimum
                    result = 100000..0
                */
                inst_3_result[DATA_W-1] = 1'b1;
                for(i=0;i<DATA_W-1;i=i+1) begin
                    inst_3_result[i] = 1'b0;
                end
            end
            else if(temp_3_2[DATA_W-:2] == 2'b01) begin
                /*
                    saturation occurs, let result be maximum
                    result = 011111..1
                */  
                inst_3_result[DATA_W-1] = 1'b0;
                for(i=0;i<DATA_W-1;i=i+1) begin
                    inst_3_result[i] = 1'b1;
                end 
            end
            else begin
                inst_3_result = temp_3_2[DATA_W-1:0];
            end
        end
    end


    /*
        INSTRUCION 4: 0011
    */
    always@ (*) begin
        temp_4_1 = $signed(temp_3_1) + $signed({o_data_r,10'd0});
        
        // rounding , but maybe Cin will lead to overflow
        {Cin_4, Sum_4} = (temp_4_1[(2*FRAC_W-1)-:FRAC_W] + 1'b1);
        temp_4_2[(FRAC_W-1)-:FRAC_W] = (temp_4_1[FRAC_W-1]) ? Sum_4 : temp_4_1[(2*FRAC_W-1)-:FRAC_W];
        temp_4_2[DATA_W-:(INT_W+1)] = $signed(temp_4_1[(2*FRAC_W+INT_W-1):(2*FRAC_W)]) + $signed({1'b0,Cin_4});

        if(temp_4_1[2*DATA_W] && (!(&temp_4_1[(2*DATA_W-1):(2*FRAC_W+INT_W-1)]))) begin
            /*
                saturation occurs, let result be minimum
                result = 100000..0
            */
            inst_4_result[DATA_W-1] = 1'b1;
            for(i=0;i<DATA_W-1;i=i+1) begin
                inst_4_result[i] = 1'b0;
            end
        end
        else if(!temp_4_1[2*DATA_W] && (|temp_4_1[(2*DATA_W-1):(2*FRAC_W+INT_W-1)])) begin
            /*
                saturation occurs, let result be maximum
                result = 011111..1
            */  
            inst_4_result[DATA_W-1] = 1'b0;
            for(i=0;i<DATA_W-1;i=i+1) begin
                inst_4_result[i] = 1'b1;
            end 
        end
        else begin
            if(temp_4_2[DATA_W-:2] == 2'b10) begin
                /*
                    saturation occurs, let result be minimum
                    result = 100000..0
                */
                inst_4_result[DATA_W-1] = 1'b1;
                for(i=0;i<DATA_W-1;i=i+1) begin
                    inst_4_result[i] = 1'b0;
                end
            end
            else if(temp_4_2[DATA_W-:2] == 2'b01) begin
                /*
                    saturation occurs, let result be maximum
                    result = 011111..1
                */  
                inst_4_result[DATA_W-1] = 1'b0;
                for(i=0;i<DATA_W-1;i=i+1) begin
                    inst_4_result[i] = 1'b1;
                end 
            end
            else begin
                inst_4_result = temp_4_2[DATA_W-1:0];
            end
        end
    end


    /*
        INSTRUCION 5: 0100
    */
    always@ (*) begin
        /*
            Implement GELU function:
        */
        temp_5_1 = i_data_a * i_data_a;
        temp_5_2 = $signed(temp_5_1) * $signed(10'b0000101110);
        temp_5_3 = $signed(temp_5_2) + $signed({2'b01,30'b0});
        temp_5_4 = $signed(temp_5_3) * i_data_a;
        temp_5_5 = $signed(temp_5_4) * $signed({6'b0,10'b1100110001});


        //  time to round temp_5_5
        {Cin_5, Sum_5} = (temp_5_5[(5*FRAC_W-1)-:FRAC_W] + 1'b1);
        temp_5_6[(FRAC_W-1)-:FRAC_W] = (temp_5_5[4*FRAC_W-1]) ? Sum_5 : temp_5_5[(5*FRAC_W-1)-:FRAC_W];
        temp_5_6[(DATA_W-1)-:INT_W] = temp_5_5[(5*FRAC_W+INT_W-1)-:INT_W] + Cin_5;

        
        // tanh function
        if( ($signed(temp_5_6) > $signed({6'b111111,1'b1,9'b0})) && ($signed(temp_5_6) < $signed({6'd0,1'b1,9'd0})) )  begin
            // -0.5 ~ 0.5
            temp_5_7 = temp_5_6;
        end
        else if($signed(temp_5_6) < $signed({5'b11111,2'b01,9'b0})) begin
            // <-1.5
            temp_5_7 = {6'b111111,10'd0}; //-1
        end
        else if($signed(temp_5_6) > $signed({5'd0,2'b11,9'b0})) begin
            // >1.5
            temp_5_7 = {5'd0,1'b1,10'd0}; //1
        end
        else if( ($signed(temp_5_6) >= $signed({6'd0,1'b1,9'd0})) && ($signed(temp_5_6) <= $signed({5'd0,2'b11,9'b0})) ) begin
            // 0.5 ~ 1.5
            // round
            temp_5_7 = (temp_5_6[0]) ? ({temp_5_6[DATA_W-1], temp_5_6[DATA_W-1:1]} + {7'd0,1'b1,7'd0,1'b1}) : ({temp_5_6[DATA_W-1], temp_5_6[DATA_W-1:1]} + {7'd0,1'b1,8'd0});
        end
        else begin
            // -0.5 ~ -1.5
            // round
            temp_5_7 = (temp_5_6[0]) ? ({temp_5_6[DATA_W-1], temp_5_6[DATA_W-1:1]} + {8'b11111111,7'd0,1'b1}) : ({temp_5_6[DATA_W-1], temp_5_6[DATA_W-1:1]} + {8'b11111111,8'd0});
        end
        
        temp_5_8 = $signed(temp_5_7 + {5'd0,1'b1,10'd0}) * $signed({6'd0,1'b1,9'b0});
        temp_5_9 = $signed(temp_5_8) * $signed(i_data_a);

        
        // round
        {Cin_5_2, Sum_5_2} = (temp_5_9[(3*FRAC_W-1)-:FRAC_W] + 1'b1);
        inst_5_result[(FRAC_W-1)-:FRAC_W] = (temp_5_9[2*FRAC_W-1]) ? Sum_5_2 : temp_5_9[(3*FRAC_W-1)-:FRAC_W];
        inst_5_result[(DATA_W-1)-:INT_W] = temp_5_9[(3*FRAC_W+INT_W-1)-:INT_W] + Cin_5_2;
    end


    /*
        INSTRUCION 6: 0101
    */
    always@ (*) begin
        if(i_data_a==0) begin
            temp_6_1 = 5'b10000;
        end
        else begin
            temp_6_1[4] = 0;
            temp_6_1[3] = (i_data_a[(DATA_W-1)-:8] == 8'd0);
            val8 = (temp_6_1[3]) ? (i_data_a[7:0]) : (i_data_a[15:8]);
            temp_6_1[2] = (val8[7:4] == 4'd0);
            val4 = (temp_6_1[2]) ? (val8[3:0]) : (val8[7:4]);
            temp_6_1[1] = (val4[3:2] == 2'd0);
            val2 = (temp_6_1[1]) ? (val4[1:0]) : (val4[3:2]);
            temp_6_1[0] = (val2[1] == 1'd0);
        end

        inst_6_result = {11'b0, temp_6_1};
    end

    
    /*
        INSTRUCION 7: 0110
    */
    always@ (*) begin
        if(state_r == CALC) begin
            iter7_data_w = 0;

            CPOP_w =  (i_data_a[0]) + (i_data_a[1])
                    + (i_data_a[2]) + (i_data_a[3])
                    + (i_data_a[4]) + (i_data_a[5])
                    + (i_data_a[6]) + (i_data_a[7])
                    + (i_data_a[8]) + (i_data_a[9])
                    + (i_data_a[10]) + (i_data_a[11])
                    + (i_data_a[12]) + (i_data_a[13])
                    + (i_data_a[14]) + (i_data_a[15]);
        end
        else if(state_r == ITER) begin
            CPOP_w = CPOP_r;

            if(CPOP_r==0)
                iter7_data_w = i_data_b;
            else if(count_r==0)
                iter7_data_w = {i_data_b[DATA_W-2:0],(~i_data_b[DATA_W-1])};
            else
                iter7_data_w = {iter7_data_r[DATA_W-2:0],(~iter7_data_r[DATA_W-1])};
        end
        else begin
            CPOP_w = CPOP_r;
            iter7_data_w = iter7_data_r;
        end
    end


    /*
        INSTRUCION 8: 0111
    */
    always@ (*) begin
        if(state_r == CALC) begin
            iter8_data_w = 0;
        end
        else if(state_r == ITER) begin
            if(i_data_b==0)
                iter8_data_w = i_data_a;
            else if(count_r==0)
                iter8_data_w = { i_data_a[DATA_W-2:0], (((i_data_a[15]^i_data_a[13])^i_data_a[12])^i_data_a[10]) };
            else
                iter8_data_w = { iter8_data_r[DATA_W-2:0], (((iter8_data_r[15]^iter8_data_r[13])^iter8_data_r[12])^iter8_data_r[10]) };
        end
        else begin
            iter8_data_w = iter8_data_r;
        end
    end

    always@ (*) begin
        if(state_r == CALC) begin
            count_w = 0;
        end
        else if (state_r == ITER) begin
            count_w = count_r + 1'b1;
        end
        else begin
            count_w = count_r;
        end
    end


    /*
        INSTRUCION 9:  1000
        INSTRUCION 10: 1001
    */
    always@ (*) begin
        exp_a = i_data_a[(DATA_W-2)-:5] - 5'b01111;
        exp_b = i_data_b[(DATA_W-2)-:5] - 5'b01111;

        if($signed(exp_a) > $signed(exp_b) )begin
            diff = exp_a - exp_b;
            bigger = 1;
        end
        else begin
            diff  = exp_b - exp_a;
            bigger = 0;
        end

        case(diff)
            0: begin
                fract_a = {6'd1, i_data_a[9:0], 11'd0};
                fract_b = {6'd1, i_data_b[9:0], 11'd0};
            end
            1: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 1'd1, i_data_b[9:0], 10'd0};
                end
                else begin
                    fract_a = {6'd0, 1'd1, i_data_a[9:0], 10'd0};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            2: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 2'd1, i_data_b[9:0], 9'd0};
                end
                else begin
                    fract_a = {6'd0, 2'd1, i_data_a[9:0], 9'd0};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            3: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 3'd1, i_data_b[9:0], 8'd0};
                end
                else begin
                    fract_a = {6'd0, 3'd1, i_data_a[9:0], 8'd0};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            4: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 4'd1, i_data_b[9:0], 7'd0};
                end
                else begin
                    fract_a = {6'd0, 4'd1, i_data_a[9:0], 7'd0};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            5: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 5'd1, i_data_b[9:0], 6'd0};
                end
                else begin
                    fract_a = {6'd0, 5'd1, i_data_a[9:0], 6'd0};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            6: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 6'd1, i_data_b[9:0], 5'd0};
                end
                else begin
                    fract_a = {6'd0, 6'd1, i_data_a[9:0], 5'd0};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            7: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 7'd1, i_data_b[9:0], 4'd0};
                end
                else begin
                    fract_a = {6'd0, 7'd1, i_data_a[9:0], 4'd0};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            8: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 8'd1, i_data_b[9:0], 3'd0};
                end
                else begin
                    fract_a = {6'd0, 8'd1, i_data_a[9:0], 3'd0};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            9: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 9'd1, i_data_b[9:0], 2'd0};
                end
                else begin
                    fract_a = {6'd0, 9'd1, i_data_a[9:0], 2'd0};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            10: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 10'd1, i_data_b[9:0], 1'd0};
                end
                else begin
                    fract_a = {6'd0, 10'd1, i_data_a[9:0], 1'd0};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            11: begin
                if(bigger) begin
                    fract_a = {6'd1, i_data_a[9:0], 11'd0};
                    fract_b = {6'd0, 11'd1, i_data_b[9:0]};
                end
                else begin
                    fract_a = {6'd0, 11'd1, i_data_a[9:0]};
                    fract_b = {6'd1, i_data_b[9:0], 11'd0};
                end
            end
            default: begin
                fract_a = 0;
                fract_b = 0;
            end
        endcase

        operand_a = i_data_a[DATA_W-1] ? (~fract_a + 1'b1) : fract_a;

        if( (i_inst == 4'b1000 && (!i_data_b[DATA_W-1])) || (i_inst == 4'b1001 && i_data_b[DATA_W-1]) ) begin
            operand_b = fract_b;
        end
        else if( (i_inst == 4'b1000 && i_data_b[DATA_W-1]) || (i_inst == 4'b1001 && (!i_data_b[DATA_W-1]))  ) begin
            operand_b = ~fract_b + 1'b1;
        end
        else begin
            operand_b = 0;
        end

        result = operand_a + operand_b;
        
        temp_FP_2[26] = result[26]; // sign bit

        temp_FP = (result[26]) ? ~(result-1'b1) : result; 

        // count leading zeros 
        if(temp_FP[26:11]==0) begin
            ldz = 5'b10000;
        end
        else begin
            ldz[4] = 0;
            ldz[3] = (temp_FP[26-:8] == 8'd0);
            FP_val8 = (ldz[3]) ? (temp_FP[18-:8]) : (temp_FP[26-:8]);
            ldz[2] = (FP_val8[7:4] == 4'd0);
            FP_val4 = (ldz[2]) ? (FP_val8[3:0]) : (FP_val8[7:4]);
            ldz[1] = (FP_val4[3:2] == 2'd0);
            FP_val2 = (ldz[1]) ? (FP_val4[1:0]) : (FP_val4[3:2]);
            ldz[0] = (FP_val2[1] == 1'd0);
        end

        case(ldz)
            16: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 5'd11;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 5'd11;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[9:0];
                temp_FP_2[10:0] = 11'd0;
            end
            15: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 5'd10;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 5'd10;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[10:1];
                temp_FP_2[10:0] = {temp_FP[0], 10'd0};
            end
            14: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 5'd9;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 5'd9;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[11:2];
                temp_FP_2[10:0] = {temp_FP[1:0], 9'd0};
            end
            13: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 5'd8;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 5'd8;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[12:3];
                temp_FP_2[10:0] = {temp_FP[2:0], 8'd0};
            end
            12: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 4'd7;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 4'd7;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[13:4];
                temp_FP_2[10:0] = {temp_FP[3:0], 7'd0};
            end
            11: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 4'd6;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 4'd6;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[14:5];
                temp_FP_2[10:0] = {temp_FP[4:0], 6'd0};
            end
            10: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 4'd5;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 4'd5;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[15:6];
                temp_FP_2[10:0] = {temp_FP[5:0], 5'd0};
            end
            9: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 4'd4;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 4'd4;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[16:7];
                temp_FP_2[10:0] = {temp_FP[6:0], 4'd0};
            end
            8: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 3'd3;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 3'd3;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[17:8];
                temp_FP_2[10:0] = {temp_FP[7:0], 3'd0};
            end
            7: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 2'd2;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 2'd2;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[18:9];
                temp_FP_2[10:0] = {temp_FP[8:0], 2'd0};
            end
            6: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] - 1'b1;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] - 1'b1;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[19:10];
                temp_FP_2[10:0] = {temp_FP[9:0], 1'd0};
            end
            5: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5];
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5];
                end

                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[20:11];
                temp_FP_2[10:0] = {temp_FP[10:0]};
            end
            4: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] + 1'b1;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] + 1'b1;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[21:12];
                temp_FP_2[10:0] = {temp_FP[11:1]};
            end
            3: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] + 2'd2;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] + 2'd2;
                end

                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[22:13];
                temp_FP_2[10:0] = {temp_FP[12:2]};
            end
            2: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] + 3'd3;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] + 3'd3;
                end
                
                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[23:14];
                temp_FP_2[10:0] = {temp_FP[13:3]};
            end
            1: begin
                if(bigger) begin
                    exp_FP = i_data_a[(DATA_W-2)-:5] + 4'd4;
                end
                else begin
                    exp_FP = i_data_b[(DATA_W-2)-:5] + 4'd4;
                end

                temp_FP_2[25 -: 5] = exp_FP;
                temp_FP_2[20 -: 10] = temp_FP[24:15];
                temp_FP_2[10:0] = {temp_FP[14:4]};
            end
            default: begin
                temp_FP_2 = 0;
                exp_FP = 0;
            end
        endcase

        // round
        guard = temp_FP_2[11];
        round = temp_FP_2[10];
        sticky = |temp_FP_2[9:0];

        if( (sticky & round) || (guard & round & (!sticky)) ) begin
            Cin_FP = 1;
        end
        else begin
            Cin_FP = 0;
        end

        inst_FP_result = temp_FP_2[26:11] + Cin_FP;
    end


    always@ (posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n) begin
            state_r <= IDLE;
            o_valid_r <= 0;
            o_data_r  <= 0;
            o_busy_r  <= 1;
            count_r <= 0;
            CPOP_r <= 0;
            iter7_data_r <= 0;
            iter8_data_r <= 0;
        end
        else begin
            state_r <= state_w;
            o_valid_r <= o_valid_w;
            o_data_r <= o_data_w;
            o_busy_r <= o_busy_w;
            count_r <= count_w;
            CPOP_r <= CPOP_w;
            iter7_data_r <= iter7_data_w;
            iter8_data_r <= iter8_data_w;
        end
    end

endmodule
