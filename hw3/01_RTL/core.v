module core (                       
	input         i_clk,
	input         i_rst_n,
	input         i_op_valid,
	input  [ 3:0] i_op_mode,
    output        o_op_ready,
	input         i_in_valid,
	input  [ 7:0] i_in_data,
	output        o_in_ready,
	output        o_out_valid,
	output [13:0] o_out_data
);
	//------STATES--------//
	localparam IDLE = 5'd0;
	localparam PREP = 5'd1;
	localparam LOAD = 5'd2;

	localparam PREP_8 = 5'd3;
	localparam OUTPUT_8 = 5'd4;
	localparam CONV_LOAD_8 = 5'd5;
	localparam CONV_CALC_8 = 5'd6;
	localparam CONV_OUTPUT_8 = 5'd7;

	localparam PREP_16 = 5'd8;
	localparam OUTPUT_16 = 5'd9;
	localparam CONV_LOAD_16 = 5'd10;
	localparam CONV_CALC_16 = 5'd11;
	localparam CONV_OUTPUT_16 = 5'd12;

	localparam PREP_32 = 5'd13;
	localparam OUTPUT_32 = 5'd14;
	localparam CONV_LOAD_32 = 5'd15;
	localparam CONV_CALC_32 = 5'd16;
	localparam CONV_OUTPUT_32 = 5'd17;

	localparam MEDIAN_LOAD = 5'd18;
	localparam MEDIAN_CALC = 5'd19;
	localparam MEDIAN_OUTPUT = 5'd20;

	localparam NMS_LOAD = 5'd21;
	localparam NMS_SOBEL = 5'd22;
	localparam NMS_OUTPUT = 5'd23;

    localparam CONV_FINAL = 5'd24;
    localparam ORIGIN_DEPTH_MODULATION = 5'd25;
    localparam FINISH_LOADING = 5'd26;
    localparam MEDIAN_FINAL = 5'd27;
	//-------------------//


	//-------------------//
	//for outputs
	reg 		o_op_ready_r, 	o_op_ready_w;
	reg 		o_in_ready_r, 	o_in_ready_w;
	reg 		o_out_valid_r, 	o_out_valid_w;
	reg [13:0] 	o_out_data_r, 	o_out_data_w;

	assign o_op_ready  = o_op_ready_r;
	assign o_in_ready  = o_in_ready_r;
	assign o_out_valid = o_out_valid_r;
	assign o_out_data  = o_out_data_r;

	always@ (posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n) begin
			o_op_ready_r  <= 0;
			o_in_ready_r  <= 0; 
			o_out_valid_r <= 0; 
			o_out_data_r  <= 0; 
		end
		else begin
			o_op_ready_r  <= o_op_ready_w;
			o_in_ready_r  <= o_in_ready_w; 
			o_out_valid_r <= o_out_valid_w; 
			o_out_data_r  <= o_out_data_w;
		end
	end
	//-------------------//


	//-------------------//
	//states
	reg [4:0] state_r, state_w;

	always@ (posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n) begin
			state_r <= 0; 
		end
		else begin
			state_r <= state_w;
		end
	end
	//-------------------//


	//-------------------//
	//for SRAM in/outputs

	//for loading data (opcode=0000)
	reg  [10:0] SRAM_load_data_r, SRAM_load_data_w;

	reg  SRAM_CEN_1_r;
	reg  SRAM_WEN_1_r;
	reg  [8:0] SRAM_ADDRESS_1_r;
	reg  [7:0] SRAM_INPUT_DATA_1_r;
	wire [7:0] SRAM_READ_DATA_1;

	reg  SRAM_CEN_2_r;
	reg  SRAM_WEN_2_r;
	reg  [8:0] SRAM_ADDRESS_2_r;
	reg  [7:0] SRAM_INPUT_DATA_2_r;
	wire [7:0] SRAM_READ_DATA_2;

	reg  SRAM_CEN_3_r;
	reg  SRAM_WEN_3_r;
	reg  [8:0] SRAM_ADDRESS_3_r;
	reg  [7:0] SRAM_INPUT_DATA_3_r;
	wire [7:0] SRAM_READ_DATA_3;

	reg  SRAM_CEN_4_r;
	reg  SRAM_WEN_4_r;
	reg  [8:0] SRAM_ADDRESS_4_r;
	reg  [7:0] SRAM_INPUT_DATA_4_r;
	wire [7:0] SRAM_READ_DATA_4;

	reg  SRAM_CEN_1_w;
	reg  SRAM_WEN_1_w;
	reg  [8:0] SRAM_ADDRESS_1_w;
	reg  [7:0] SRAM_INPUT_DATA_1_w;

	reg  SRAM_CEN_2_w;
	reg  SRAM_WEN_2_w;
	reg  [8:0] SRAM_ADDRESS_2_w;
	reg  [7:0] SRAM_INPUT_DATA_2_w;

	reg  SRAM_CEN_3_w;
	reg  SRAM_WEN_3_w;
	reg  [8:0] SRAM_ADDRESS_3_w;
	reg  [7:0] SRAM_INPUT_DATA_3_w;

	reg  SRAM_CEN_4_w;
	reg  SRAM_WEN_4_w;
	reg  [8:0] SRAM_ADDRESS_4_w;
	reg  [7:0] SRAM_INPUT_DATA_4_w;

	//registers for temporarily storing data from SRAM
	reg [7:0] read_data_r[0:8];
	reg [7:0] read_data_w[0:8];
	reg [7:0] SRAM_READ_DATA;

	integer i;
	always@(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n) begin
			SRAM_load_data_r   <= 0;
			
			SRAM_CEN_1_r       <= 0;
			SRAM_CEN_2_r       <= 0;
			SRAM_CEN_3_r       <= 0;
			SRAM_CEN_4_r       <= 0;
			
			SRAM_WEN_1_r       <= 0;
			SRAM_WEN_2_r       <= 0;
			SRAM_WEN_3_r       <= 0;
			SRAM_WEN_4_r       <= 0;

			SRAM_INPUT_DATA_1_r <= 0;
			SRAM_INPUT_DATA_2_r <= 0;
			SRAM_INPUT_DATA_3_r <= 0;
			SRAM_INPUT_DATA_4_r <= 0;

			SRAM_ADDRESS_1_r    <= 0;
			SRAM_ADDRESS_2_r    <= 0;
			SRAM_ADDRESS_3_r    <= 0;
			SRAM_ADDRESS_4_r    <= 0;

			for(i=0;i<9;i=i+1) begin
				read_data_r[i] <= 0;
			end
		end
		else begin
			SRAM_load_data_r   <= SRAM_load_data_w;

			SRAM_CEN_1_r       <= SRAM_CEN_1_w;
			SRAM_CEN_2_r       <= SRAM_CEN_2_w;
			SRAM_CEN_3_r       <= SRAM_CEN_3_w;
			SRAM_CEN_4_r       <= SRAM_CEN_4_w;
			
			SRAM_WEN_1_r       <= SRAM_WEN_1_w;
			SRAM_WEN_2_r       <= SRAM_WEN_2_w;
			SRAM_WEN_3_r       <= SRAM_WEN_3_w;
			SRAM_WEN_4_r       <= SRAM_WEN_4_w;

			SRAM_INPUT_DATA_1_r <= SRAM_INPUT_DATA_1_w;
			SRAM_INPUT_DATA_2_r <= SRAM_INPUT_DATA_2_w;
			SRAM_INPUT_DATA_3_r <= SRAM_INPUT_DATA_3_w;
			SRAM_INPUT_DATA_4_r <= SRAM_INPUT_DATA_4_w;

			SRAM_ADDRESS_1_r    <= SRAM_ADDRESS_1_w;
			SRAM_ADDRESS_2_r    <= SRAM_ADDRESS_2_w;
			SRAM_ADDRESS_3_r    <= SRAM_ADDRESS_3_w;
			SRAM_ADDRESS_4_r    <= SRAM_ADDRESS_4_w;

			for(i=0;i<9;i=i+1) begin
				read_data_r[i] <= read_data_w[i];
			end
		end
	end

	sram_512x8 sram_1(.CLK(i_clk), .CEN(SRAM_CEN_1_r), .WEN(SRAM_WEN_1_r), .A(SRAM_ADDRESS_1_r), .D(SRAM_INPUT_DATA_1_r), .Q(SRAM_READ_DATA_1));
	sram_512x8 sram_2(.CLK(i_clk), .CEN(SRAM_CEN_2_r), .WEN(SRAM_WEN_2_r), .A(SRAM_ADDRESS_2_r), .D(SRAM_INPUT_DATA_2_r), .Q(SRAM_READ_DATA_2));
	sram_512x8 sram_3(.CLK(i_clk), .CEN(SRAM_CEN_3_r), .WEN(SRAM_WEN_3_r), .A(SRAM_ADDRESS_3_r), .D(SRAM_INPUT_DATA_3_r), .Q(SRAM_READ_DATA_3));
	sram_512x8 sram_4(.CLK(i_clk), .CEN(SRAM_CEN_4_r), .WEN(SRAM_WEN_4_r), .A(SRAM_ADDRESS_4_r), .D(SRAM_INPUT_DATA_4_r), .Q(SRAM_READ_DATA_4));
	//-------------------//


	//-------------------//
	//common inputs for modules
	reg  [7:0] a1, a2, a3, a4, a5, a6, a7, a8, a9;

	//convolution
	wire [11:0] conv_result;
    reg  [11:0] conv_calc;
    reg  [16:0] conv_r[0:3], conv_w[0:3];
    reg  [16:0] conv_temp;
    reg  [13:0] conv_temp_2;

	//median filter
	wire [13:0] median_result;
	wire  median_start;
	wire  o_median_finish;

	//sobel gradient
	wire [13:0] sobel_result;
	wire [1:0]  NMS_direction;
	wire  sobel_start;
	wire  o_sobel_finish;
	reg  [13:0] sobel_answers_r[0:3], sobel_answers_w[0:3];
	reg  [1:0]  NMS_direction_r[0:3], NMS_direction_w[0:3];

	assign median_start = (state_r==MEDIAN_CALC);
	assign sobel_start  = (state_r==NMS_SOBEL);
	
	convolution    CONV   ( .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), 
						   .a6(a6), .a7(a7), .a8(a8), .a9(a9), .conv_result(conv_result) );
 
	median_filter  MEDIAN ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_start(median_start),
						   .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), 
						   .a6(a6), .a7(a7), .a8(a8), .a9(a9), .o_median_finish(o_median_finish), 
						   .median_result(median_result) );
 
	Sobel_gradient sobel  ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_start(sobel_start),
						   .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), 
						   .a6(a6), .a7(a7), .a8(a8), .a9(a9), .o_sobel_finish(o_sobel_finish), 
						   .sobel_result(sobel_result), .NMS_direction(NMS_direction));

	always@(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n) begin
			sobel_answers_r[0] <= 0;
			sobel_answers_r[1] <= 0;
			sobel_answers_r[2] <= 0;
			sobel_answers_r[3] <= 0;

			NMS_direction_r[0] <= 0;
			NMS_direction_r[1] <= 0;
			NMS_direction_r[2] <= 0;
			NMS_direction_r[3] <= 0;

            conv_r[0] <= 0;
			conv_r[1] <= 0;
			conv_r[2] <= 0;
			conv_r[3] <= 0;

            conv_calc <= 0;
		end
		else begin
			sobel_answers_r[0] <= sobel_answers_w[0]; 
			sobel_answers_r[1] <= sobel_answers_w[1];
			sobel_answers_r[2] <= sobel_answers_w[2];
			sobel_answers_r[3] <= sobel_answers_w[3];

			NMS_direction_r[0] <= NMS_direction_w[0];
			NMS_direction_r[1] <= NMS_direction_w[1];
			NMS_direction_r[2] <= NMS_direction_w[2];
			NMS_direction_r[3] <= NMS_direction_w[3];

            conv_r[0] <= conv_w[0];
			conv_r[1] <= conv_w[1];
			conv_r[2] <= conv_w[2];
			conv_r[3] <= conv_w[3];

            conv_calc <= conv_result;
		end
	end
	//-------------------//


	//-------------------//
	//operation origin
	reg zero_padding_r, zero_padding_w;
    reg zero_padding_buffer_r;
    wire zero_padding_buffer_w;
    assign zero_padding_buffer_w = zero_padding_r;

	reg [2:0] page;
	reg [5:0] origin_output_point;
	reg [5:0] origin_r, origin_w;

	wire on_left, on_top, on_bottom, on_right, on_left_top_corner, on_left_bottom_corner, on_right_bottom_corner, on_right_top_corner;

	assign on_left_top_corner = origin_r==0;
	assign on_left_bottom_corner = origin_r==6;
	assign on_right_top_corner = origin_r==48;
	assign on_right_bottom_corner = origin_r==54;
	assign on_left = (origin_r[2:0]==3'd0) && (!on_left_top_corner) && (!on_left_bottom_corner);
	assign on_right = (origin_r[2:0]==3'd6) && (!on_right_top_corner) && (!on_right_bottom_corner);
	assign on_top = (origin_r>=1) && (origin_r<=5);
	assign on_bottom = (origin_r>=49) && (origin_r<=53);

	//current scale
	/*
		2'b00: PREP_32;
		2'b01: PREP_16;
		2'b10: PREP_8;
	*/
	reg [1:0] scale_r, scale_w;

	//output and convolution counters
    reg [2:0] conv_output_r, conv_output_w;
	reg [7:0] conv_channels_32_r, conv_channels_32_w;
	reg [6:0] conv_channels_16_r, conv_channels_16_w;
	reg [5:0] conv_channels_8_r,  conv_channels_8_w;

	//NMS and Median counters
	reg [3:0] median_output_r, median_output_w;
    reg [1:0] sobel_count_r, sobel_count_w;
	reg [1:0] NMS_output_r, NMS_output_w;
	reg [2:0] NMS_output_count_r, NMS_output_count_w;
	
	reg [3:0] SRAM_load_count_r, SRAM_load_count_w;
	wire   load_start;
	wire   SRAM_load_finsh;
    
    //since SRAM delay 2 cycles for access data
	assign SRAM_load_finsh = (SRAM_load_count_r == 4'd11) ? 1 : 0;  
	assign load_start = ((state_r == CONV_LOAD_32) || (state_r == CONV_LOAD_16) || (state_r == CONV_LOAD_8)
					||   (state_r == MEDIAN_LOAD)  || (state_r == NMS_LOAD) );

	reg [13:0] NMS_result;

	always@(posedge i_clk or negedge i_rst_n) begin 
		if(!i_rst_n) begin
			origin_r 			 <= 0;
			scale_r  			 <= 0;
			SRAM_load_count_r    <= 0;
            
            zero_padding_buffer_r <= 0;
            zero_padding_r        <= 0;

			conv_channels_32_r <= 0;    
			conv_channels_16_r <= 0;
			conv_channels_8_r  <= 0;
            conv_output_r      <= 0;

			median_output_r      <= 0;
            sobel_count_r        <= 0;
			NMS_output_count_r   <= 0;
			NMS_output_r         <= 0;
		end
		else begin
			origin_r 			 <= origin_w;
			scale_r  			 <= scale_w;
			SRAM_load_count_r    <= SRAM_load_count_w;

            zero_padding_buffer_r <= zero_padding_buffer_w;
            zero_padding_r        <= zero_padding_w;
			
			conv_channels_32_r <= conv_channels_32_w;
			conv_channels_16_r <= conv_channels_16_w;
			conv_channels_8_r  <= conv_channels_8_w;
            conv_output_r      <= conv_output_w;
		
			median_output_r      <= median_output_w;
            sobel_count_r        <= sobel_count_w;
			NMS_output_count_r   <= NMS_output_count_w;
			NMS_output_r         <= NMS_output_w;
		end
	end
	//-------------------//


	//-------------------//
	//origin logic
	always@ (*) begin
        case(i_op_mode)
            4'b0001: begin
                //right shift
                if(origin_r[2:0]==3'b110) begin
                    origin_w = origin_r;
                end
                else begin
                    origin_w = origin_r + 6'd1;
                end
            end

            4'b0010: begin
                //left shift
                if(origin_r[2:0]==3'b000) begin
                    origin_w = origin_r;
                end
                else begin
                    origin_w = origin_r - 6'd1;
                end
            end

            4'b0011: begin
                //up shift
                if(origin_r[5:3]==3'b000) begin
                    origin_w = origin_r;
                end
                else begin
                    origin_w = origin_r - 6'd8;
                end
            end

            4'b0100: begin
                //down shift
                if(origin_r[5:3]==3'b110) begin
                    origin_w = origin_r;
                end
                else begin
                    origin_w = origin_r + 6'd8;
                end
            end

            default: origin_w = origin_r;
        endcase
	end

    reg load_top_left;
    reg load_top_right;
    reg load_bottom_left;
    reg load_bottom_right;

    always@ (*) begin
        load_top_left = (state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b00)
					 || (state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b00)
					 || (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b00)
					 || (state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b00)
					 || (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b00);

        load_top_right = (state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b01)
					 || (state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b01)
					 || (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b01)
					 || (state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b01)
					 || (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b01);

        load_bottom_left = (state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b10)
					 || (state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b10)
					 || (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b10)
					 || (state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b10)
					 || (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b10);
        
        load_bottom_right = (state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b11)
					 || (state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b11)
					 || (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b11)
					 || (state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b11)
					 || (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b11);
    end

	//origin output point
	always@ (*) begin
		if(   (state_r == OUTPUT_32 && conv_channels_32_r[1:0] == 2'b00) 
			||(state_r == OUTPUT_16 && conv_channels_16_r[1:0] == 2'b00)
			||(state_r == OUTPUT_8  && conv_channels_8_r[1:0]  == 2'b00)   )
		begin
			origin_output_point = origin_r;
		end 
		else if(   (state_r == OUTPUT_32 && conv_channels_32_r[1:0] == 2'b01) 
				 ||(state_r == OUTPUT_16 && conv_channels_16_r[1:0] == 2'b01)
				 ||(state_r == OUTPUT_8  && conv_channels_8_r[1:0]  == 2'b01)   )
		begin
			origin_output_point = origin_r + 1'b1;
		end
		else if(   (state_r == OUTPUT_32 && conv_channels_32_r[1:0] == 2'b10) 
				 ||(state_r == OUTPUT_16 && conv_channels_16_r[1:0] == 2'b10)
				 ||(state_r == OUTPUT_8  && conv_channels_8_r[1:0]  == 2'b10)   )
		begin
			origin_output_point = origin_r + 4'd8;
		end
		else if(   (state_r == OUTPUT_32 && conv_channels_32_r[1:0] == 2'b11) 
				 ||(state_r == OUTPUT_16 && conv_channels_16_r[1:0] == 2'b11)
				 ||(state_r == OUTPUT_8  && conv_channels_8_r[1:0]  == 2'b11)   )
		begin
			origin_output_point = origin_r + 4'd9;
		end
		else if(load_start)begin
			case(SRAM_load_count_r)
				0:	begin
					if
					( 
						load_top_left
					)
					begin
						origin_output_point = (origin_r>=9) ? origin_r - 9 : 0;
					end
					else if
					( 
						load_top_right
					)
					begin
						origin_output_point = (origin_r>=8) ? origin_r - 8 : 0;
					end
					else if
					( 
						load_bottom_left
					)
					begin
						origin_output_point = (origin_r>=1) ? origin_r - 1 : 0;
					end
					else if
					( 
						load_bottom_right
					)
					begin
						origin_output_point = origin_r;
					end
					else
					begin
						origin_output_point = 0;
					end
				end

				1: begin
					if
					( 
						load_top_left
					)
					begin
						origin_output_point = (origin_r>=8) ? origin_r - 8 : 0;
					end
					else if
					( 
						load_top_right
					)
					begin
						origin_output_point = (origin_r>=7) ? origin_r - 7 : 0;
					end
					else if
					( 
						load_bottom_left
					)
					begin
						origin_output_point = origin_r;
					end
					else if
					( 
						load_bottom_right
					)
					begin
						origin_output_point = origin_r + 1;
					end
					else
					begin
						origin_output_point = 0;
					end
				end

				2: begin
					if
					( 
						load_top_left
					)
					begin
						origin_output_point = (origin_r>=7) ? origin_r - 7 : 0;
					end
					else if
					( 
						load_top_right
					)
					begin
						origin_output_point = (origin_r>=6) ? origin_r - 6 : 0;
					end
					else if
					( 
						load_bottom_left
					)
					begin
						origin_output_point = origin_r + 1;
					end
					else if
					( 
						load_bottom_right
					)
					begin
						origin_output_point = origin_r + 2;
					end
					else
					begin
						origin_output_point = 0;
					end
				end

				3: begin
					if
					( 
						load_top_left
					)
					begin
						origin_output_point = (origin_r>=1) ? origin_r - 1 : 0;
					end
					else if
					( 
						load_top_right
					)
					begin
						origin_output_point = origin_r;
					end
					else if
					( 
						load_bottom_left
					)
					begin
						origin_output_point = origin_r + 7;
					end
					else if
					( 
						load_bottom_right
					)
					begin
						origin_output_point = origin_r + 8;
					end
					else
					begin
						origin_output_point = 0;
					end
				end

				4: begin
					if
					( 
						load_top_left
					)
					begin
						origin_output_point = origin_r;
					end
					else if
					( 
						load_top_right
					)
					begin
						origin_output_point = origin_r + 1;
					end
					else if
					( 
						load_bottom_left
					)
					begin
						origin_output_point = origin_r + 8;
					end
					else if
					( 
						load_bottom_right
					)
					begin
						origin_output_point = origin_r + 9;
					end
					else
					begin
						origin_output_point = 0;
					end
				end

				5: begin
					if
					( 
						load_top_left
					)
					begin
						origin_output_point = origin_r + 1;
					end
					else if
					( 
						load_top_right
					)
					begin
						origin_output_point = origin_r + 2;
					end
					else if
					( 
						load_bottom_left
					)
					begin
						origin_output_point = origin_r + 9;
					end
					else if
					( 
						load_bottom_right
					)
					begin
						origin_output_point = origin_r + 10;
					end
					else
					begin
						origin_output_point = 0;
					end
				end

				6: begin
					if
					( 
						load_top_left
					)
					begin
						origin_output_point = origin_r + 7;
					end
					else if
					( 
						load_top_right
					)
					begin
						origin_output_point = origin_r + 8;
					end
					else if
					( 
						load_bottom_left
					)
					begin
						origin_output_point = origin_r + 15;
					end
					else if
					( 
						load_bottom_right
					)
					begin
						origin_output_point = origin_r + 16;
					end
					else
					begin
						origin_output_point = 0;
					end
				end

				7: begin
					if
					( 
						load_top_left
					)
					begin
						origin_output_point = origin_r + 8;
					end
					else if
					( 
						load_top_right
					)
					begin
						origin_output_point = origin_r + 9;
					end
					else if
					( 
						load_bottom_left
					)
					begin
						origin_output_point = origin_r + 16;
					end
					else if
					( 
						load_bottom_right
					)
					begin
						origin_output_point = origin_r + 17;
					end
					else
					begin
						origin_output_point = 0;
					end
				end

				8: begin
					if
					( 
						load_top_left
					)
					begin
						origin_output_point = origin_r + 9;
					end
					else if
					( 
						load_top_right
					)
					begin
						origin_output_point = origin_r + 10;
					end
					else if
					( 
						load_bottom_left
					)
					begin
						origin_output_point = origin_r + 17;
					end
					else if
					( 
						load_bottom_right
					)
					begin
						origin_output_point = origin_r + 18;
					end
					else
					begin
						origin_output_point = 0;
					end
				end

				default: origin_output_point = 0;
			endcase
		end
		else begin
			origin_output_point = 0;
		end
	end

	//output page
	always@ (*) begin
		if(state_r == OUTPUT_32 || state_r == CONV_LOAD_32) begin
			page = conv_channels_32_r[4:2];
		end	
		else if(state_r == OUTPUT_16 || state_r == CONV_LOAD_16) begin
			page = conv_channels_16_r[4:2];
		end
		else if(state_r == OUTPUT_8 || state_r == CONV_LOAD_8) begin
			page = conv_channels_8_r[4:2];
		end
		else if(state_r == MEDIAN_LOAD) begin
			page = {1'b0, median_output_r[3:2]};
		end	
		else if(state_r == NMS_LOAD) begin
			page = {1'b0, NMS_output_r};
		end
		else begin
			page = 0;
		end
	end

	//zero_padding_w
	always@ (*) begin
		if(on_bottom) begin
			zero_padding_w = (
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1]==1'b1 && (SRAM_load_count_r>=6 && SRAM_load_count_r<=8))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1]==1'b1 && (SRAM_load_count_r>=6 && SRAM_load_count_r<=8))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1]==1'b1  && (SRAM_load_count_r>=6 && SRAM_load_count_r<=8))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1]==1'b1    && (SRAM_load_count_r>=6 && SRAM_load_count_r<=8))
			||  (state_r==NMS_LOAD     && sobel_count_r[1]==1'b1      && (SRAM_load_count_r>=6 && SRAM_load_count_r<=8))
			) ? 1 : 0;
		end
		else if(on_top) begin
			zero_padding_w = (
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1]==1'b0 && (SRAM_load_count_r>=0 && SRAM_load_count_r<=2))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1]==1'b0 && (SRAM_load_count_r>=0 && SRAM_load_count_r<=2))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1]==1'b0  && (SRAM_load_count_r>=0 && SRAM_load_count_r<=2))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1]==1'b0    && (SRAM_load_count_r>=0 && SRAM_load_count_r<=2))
			||  (state_r==NMS_LOAD     && sobel_count_r[1]==1'b0      && (SRAM_load_count_r>=0 && SRAM_load_count_r<=2))
			) ? 1 : 0;
		end	
		else if(on_left) begin
			zero_padding_w = (
				(state_r==CONV_LOAD_32 && conv_channels_32_r[0]==1'b0 && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[0]==1'b0 && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[0]==1'b0  && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||	(state_r==MEDIAN_LOAD  && median_output_r[0]==1'b0    && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||  (state_r==NMS_LOAD     && sobel_count_r[0]==1'b0      && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			) ? 1 : 0;
		end
		else if(on_right) begin
			zero_padding_w = (
				(state_r==CONV_LOAD_32 && conv_channels_32_r[0]==1'b1 && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[0]==1'b1 && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[0]==1'b1  && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||	(state_r==MEDIAN_LOAD  && median_output_r[0]==1'b1    && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||  (state_r==NMS_LOAD     && sobel_count_r[0]==1'b1      && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			) ? 1 : 0;
		end
		else if(on_left_top_corner) begin
			zero_padding_w = (
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b00 && (SRAM_load_count_r!=4 && SRAM_load_count_r!=5 && SRAM_load_count_r!=7 && SRAM_load_count_r!=8))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b00 && (SRAM_load_count_r!=4 && SRAM_load_count_r!=5 && SRAM_load_count_r!=7 && SRAM_load_count_r!=8))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b00  && (SRAM_load_count_r!=4 && SRAM_load_count_r!=5 && SRAM_load_count_r!=7 && SRAM_load_count_r!=8))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b00    && (SRAM_load_count_r!=4 && SRAM_load_count_r!=5 && SRAM_load_count_r!=7 && SRAM_load_count_r!=8))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b00      && (SRAM_load_count_r!=4 && SRAM_load_count_r!=5 && SRAM_load_count_r!=7 && SRAM_load_count_r!=8))
			) 
			||
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b01 && (SRAM_load_count_r==0 || SRAM_load_count_r==1 || SRAM_load_count_r==2))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b01 && (SRAM_load_count_r==0 || SRAM_load_count_r==1 || SRAM_load_count_r==2))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b01  && (SRAM_load_count_r==0 || SRAM_load_count_r==1 || SRAM_load_count_r==2))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b01    && (SRAM_load_count_r==0 || SRAM_load_count_r==1 || SRAM_load_count_r==2))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b01      && (SRAM_load_count_r==0 || SRAM_load_count_r==1 || SRAM_load_count_r==2))
			) 
			||
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b10 && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b10 && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b10  && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b10    && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b10      && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			)  )? 1 : 0;
		end
		else if(on_left_bottom_corner) begin
			zero_padding_w = (
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b10 && (SRAM_load_count_r!=4 && SRAM_load_count_r!=5 && SRAM_load_count_r!=1 && SRAM_load_count_r!=2))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b10 && (SRAM_load_count_r!=4 && SRAM_load_count_r!=5 && SRAM_load_count_r!=1 && SRAM_load_count_r!=2))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b10  && (SRAM_load_count_r!=4 && SRAM_load_count_r!=5 && SRAM_load_count_r!=1 && SRAM_load_count_r!=2))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b10    && (SRAM_load_count_r!=4 && SRAM_load_count_r!=5 && SRAM_load_count_r!=1 && SRAM_load_count_r!=2))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b10      && (SRAM_load_count_r!=4 && SRAM_load_count_r!=5 && SRAM_load_count_r!=1 && SRAM_load_count_r!=2))
			) 
			||
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b00 && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b00 && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b00  && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b00    && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b00      && (SRAM_load_count_r==0 || SRAM_load_count_r==3 || SRAM_load_count_r==6))
			)
			||
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b11 && (SRAM_load_count_r==6 || SRAM_load_count_r==7 || SRAM_load_count_r==8))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b11 && (SRAM_load_count_r==6 || SRAM_load_count_r==7 || SRAM_load_count_r==8))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b11  && (SRAM_load_count_r==6 || SRAM_load_count_r==7 || SRAM_load_count_r==8))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b11    && (SRAM_load_count_r==6 || SRAM_load_count_r==7 || SRAM_load_count_r==8))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b11      && (SRAM_load_count_r==6 || SRAM_load_count_r==7 || SRAM_load_count_r==8))
			)   )? 1 : 0;
		end
		else if(on_right_top_corner) begin
			zero_padding_w =  (
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b01 && (SRAM_load_count_r!=4 && SRAM_load_count_r!=3 && SRAM_load_count_r!=6 && SRAM_load_count_r!=7))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b01 && (SRAM_load_count_r!=4 && SRAM_load_count_r!=3 && SRAM_load_count_r!=6 && SRAM_load_count_r!=7))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b01  && (SRAM_load_count_r!=4 && SRAM_load_count_r!=3 && SRAM_load_count_r!=6 && SRAM_load_count_r!=7))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b01    && (SRAM_load_count_r!=4 && SRAM_load_count_r!=3 && SRAM_load_count_r!=6 && SRAM_load_count_r!=7))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b01      && (SRAM_load_count_r!=4 && SRAM_load_count_r!=3 && SRAM_load_count_r!=6 && SRAM_load_count_r!=7))
			) 
			||
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b00 && (SRAM_load_count_r==0 || SRAM_load_count_r==1 || SRAM_load_count_r==2))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b00 && (SRAM_load_count_r==0 || SRAM_load_count_r==1 || SRAM_load_count_r==2))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b00  && (SRAM_load_count_r==0 || SRAM_load_count_r==1 || SRAM_load_count_r==2))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b00    && (SRAM_load_count_r==0 || SRAM_load_count_r==1 || SRAM_load_count_r==2))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b00      && (SRAM_load_count_r==0 || SRAM_load_count_r==1 || SRAM_load_count_r==2))
			)
			||
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b11 && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b11 && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b11  && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b11    && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b11      && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			)   ) ? 1 : 0;
		end
		else if(on_right_bottom_corner) begin
			zero_padding_w =  (
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b11 && (SRAM_load_count_r!=4 && SRAM_load_count_r!=0 && SRAM_load_count_r!=1 && SRAM_load_count_r!=3))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b11 && (SRAM_load_count_r!=4 && SRAM_load_count_r!=0 && SRAM_load_count_r!=1 && SRAM_load_count_r!=3))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b11  && (SRAM_load_count_r!=4 && SRAM_load_count_r!=0 && SRAM_load_count_r!=1 && SRAM_load_count_r!=3))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b11    && (SRAM_load_count_r!=4 && SRAM_load_count_r!=0 && SRAM_load_count_r!=1 && SRAM_load_count_r!=3))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b11      && (SRAM_load_count_r!=4 && SRAM_load_count_r!=0 && SRAM_load_count_r!=1 && SRAM_load_count_r!=3))
			) 
			||
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b01 && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b01 && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b01  && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b01    && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b01      && (SRAM_load_count_r==2 || SRAM_load_count_r==5 || SRAM_load_count_r==8))
			)
			||
			(
				(state_r==CONV_LOAD_32 && conv_channels_32_r[1:0]==2'b10 && (SRAM_load_count_r==6 || SRAM_load_count_r==7 || SRAM_load_count_r==8))
			||	(state_r==CONV_LOAD_16 && conv_channels_16_r[1:0]==2'b10 && (SRAM_load_count_r==6 || SRAM_load_count_r==7 || SRAM_load_count_r==8))
			||  (state_r==CONV_LOAD_8  && conv_channels_8_r[1:0]==2'b10  && (SRAM_load_count_r==6 || SRAM_load_count_r==7 || SRAM_load_count_r==8))
			||	(state_r==MEDIAN_LOAD  && median_output_r[1:0]==2'b10    && (SRAM_load_count_r==6 || SRAM_load_count_r==7 || SRAM_load_count_r==8))
			||  (state_r==NMS_LOAD     && sobel_count_r[1:0]==2'b10      && (SRAM_load_count_r==6 || SRAM_load_count_r==7 || SRAM_load_count_r==8))
			)   ) ? 1 : 0;
		end
		else begin
			zero_padding_w = 0;
		end
	end	

	//scale logic
	always@ (*) begin
        case(i_op_mode)
            4'b0101: begin
                //reduce channels
                case(scale_r) 
                    2'b00:   scale_w = 2'b01;
                    2'b01:   scale_w = 2'b10;
                    2'b10:   scale_w = scale_r;
                    default: scale_w = scale_r;
                endcase
            end

            4'b0110: begin
                //increase channels
                case(scale_r) 
                    2'b00:   scale_w = scale_r;
                    2'b01:   scale_w = 2'b00;
                    2'b10:   scale_w = 2'b01;
                    default: scale_w = scale_r;
                endcase
            end

            default: scale_w = scale_r;
        endcase
	end
	//-------------------//


	//-------------------//
	//counters logic
	always@ (*) begin
		if(state_r == OUTPUT_32 || state_r == CONV_OUTPUT_32) begin
			conv_channels_32_w = conv_channels_32_r + 1'b1;
		end
		else if(state_r == PREP_32)begin
			conv_channels_32_w = 0;
		end
		else begin
			conv_channels_32_w = conv_channels_32_r;
		end
	end

	always@ (*) begin
		if(state_r == OUTPUT_16 || state_r == CONV_OUTPUT_16) begin
			conv_channels_16_w = conv_channels_16_r + 1'b1;
		end
		else if(state_r == PREP_16)begin
			conv_channels_16_w = 0;
		end
		else begin
			conv_channels_16_w = conv_channels_16_r;
		end
	end

	always@ (*) begin
		if(state_r == OUTPUT_8 || state_r == CONV_OUTPUT_8) begin
			conv_channels_8_w = conv_channels_8_r + 1'b1;
		end
		else if(state_r == PREP_8) begin
			conv_channels_8_w = 0;
		end
		else begin
			conv_channels_8_w = conv_channels_8_r;
		end
	end

	always@ (*) begin
		if(state_r == MEDIAN_OUTPUT) begin
			median_output_w = median_output_r + 1'b1;
		end
		else if(state_r == PREP_8 || state_r == PREP_32 || state_r == PREP_16) begin
			median_output_w = 0;
		end	
		else begin
			median_output_w = median_output_r;
		end
	end

	always@ (*) begin
		if(state_r == NMS_OUTPUT) begin
			NMS_output_count_w = NMS_output_count_r + 1'b1;
		end
		else begin
			NMS_output_count_w  = 0;
		end
	end

	always@ (*) begin
		if(state_r == NMS_OUTPUT && (NMS_output_count_r==4)) begin
			NMS_output_w = NMS_output_r + 1'b1;
		end	
		else if(state_r == PREP_8 || state_r == PREP_32 || state_r == PREP_16) begin
			NMS_output_w = 0;
		end		
		else begin
			NMS_output_w = NMS_output_r;
		end
	end

	always@ (*) begin
		if(state_r == LOAD) begin
			SRAM_load_data_w = SRAM_load_data_r + 1'b1;
		end
		else begin
			SRAM_load_data_w = 0;
		end
	end

	always@ (*) begin
		if(load_start) begin
			SRAM_load_count_w = SRAM_load_count_r + 1'b1;
		end
		else begin
			SRAM_load_count_w = 0;
		end
	end

    always@ (*) begin
        if(state_r == CONV_FINAL) begin
            conv_output_w = conv_output_r + 1;
        end
        else if(state_r == PREP_8 || state_r == PREP_16 || state_r == PREP_32) begin
            conv_output_w = 0;
        end
        else begin
            conv_output_w = conv_output_r;
        end
    end

    always@ (*) begin
        if(o_sobel_finish) begin
            sobel_count_w = sobel_count_r + 1;
        end
        else if(state_r == NMS_OUTPUT) begin
            sobel_count_w = 0;
        end
        else begin
            sobel_count_w = sobel_count_r;
        end
    end
	//-------------------//


	//-------------------//
	//Next state logic
	always@ (*) begin	
		case(state_r) 
			IDLE: state_w = PREP;
			
			PREP: begin
				if(i_op_valid) begin
					state_w = LOAD;
				end
				else begin
					state_w = PREP;
				end
			end

			LOAD: begin
				if(&SRAM_load_data_r) begin
                    //since SRAM will  delay 1 cycle
					state_w = FINISH_LOADING;
				end
				else begin
					state_w = LOAD;
				end
			end

            FINISH_LOADING: state_w = PREP_32;

			PREP_32: begin
				if(i_op_valid) begin
					case(i_op_mode) 
                        4'b0001: state_w = ORIGIN_DEPTH_MODULATION;
                        4'b0010: state_w = ORIGIN_DEPTH_MODULATION;
                        4'b0011: state_w = ORIGIN_DEPTH_MODULATION;
                        4'b0100: state_w = ORIGIN_DEPTH_MODULATION;
						4'b0101: state_w = ORIGIN_DEPTH_MODULATION;      //reduce channels
						4'b0110: state_w = ORIGIN_DEPTH_MODULATION;      //increase channels but reach limit
						4'b0111: state_w = OUTPUT_32;                    //output 32 channels
						4'b1000: state_w = CONV_LOAD_32;                 //convolution
						4'b1001: state_w = MEDIAN_LOAD;                  //median filter
						4'b1010: state_w = NMS_LOAD;                     //NMS
 						default: state_w = state_r;                      //origin shifts
					endcase
				end	
				else begin
					state_w = PREP_32;
				end
			end

			PREP_16: begin
				if(i_op_valid) begin
					case(i_op_mode)
                        4'b0001: state_w = ORIGIN_DEPTH_MODULATION;
                        4'b0010: state_w = ORIGIN_DEPTH_MODULATION;
                        4'b0011: state_w = ORIGIN_DEPTH_MODULATION;
                        4'b0100: state_w = ORIGIN_DEPTH_MODULATION;
						4'b0101: state_w = ORIGIN_DEPTH_MODULATION;      //reduce channels
						4'b0110: state_w = ORIGIN_DEPTH_MODULATION;      //increase channels 
						4'b0111: state_w = OUTPUT_16;                    //output 16 channels
						4'b1000: state_w = CONV_LOAD_16;                 //convolution
						4'b1001: state_w = MEDIAN_LOAD;                  //median filter
						4'b1010: state_w = NMS_LOAD;                     //NMS
 						default: state_w = state_r;                      //origin shifts
					endcase
				end	
				else begin
					state_w = PREP_16;
				end
			end

			PREP_8: begin
				if(i_op_valid) begin
					case(i_op_mode) 
                        4'b0001: state_w = ORIGIN_DEPTH_MODULATION;
                        4'b0010: state_w = ORIGIN_DEPTH_MODULATION;
                        4'b0011: state_w = ORIGIN_DEPTH_MODULATION;
                        4'b0100: state_w = ORIGIN_DEPTH_MODULATION;
						4'b0101: state_w = ORIGIN_DEPTH_MODULATION;      //reduce channels btu reach limit
						4'b0110: state_w = ORIGIN_DEPTH_MODULATION;      //increase channels 
						4'b0111: state_w = OUTPUT_8;                     //output 8 channels
						4'b1000: state_w = CONV_LOAD_8;                  //convolution
						4'b1001: state_w = MEDIAN_LOAD;                  //median filter
						4'b1010: state_w = NMS_LOAD;                     //NMS
 						default: state_w = state_r;                      //origin shifts
					endcase 
				end	
				else begin
					state_w = PREP_8;
				end
			end

            ORIGIN_DEPTH_MODULATION: begin
                case(scale_w)
					2'b00:   state_w = PREP_32;
					2'b01:   state_w = PREP_16;
					2'b10:   state_w = PREP_8;
					default: state_w = state_r;
				endcase
            end

            //output data will be late for 2 cycles
            //plus another delay from SRAM
            //because of synchronous SRAM and DFF-ed output
			OUTPUT_32: begin
				if(conv_channels_32_r==130) begin
					state_w = PREP_32;
				end
				else begin
					state_w = state_r;
				end
			end

			OUTPUT_16: begin
				if(conv_channels_16_r==66) begin
					state_w = PREP_16;
				end
				else begin
					state_w = state_r;
				end
			end

			OUTPUT_8: begin
				if(conv_channels_8_r==34) begin
					state_w = PREP_8;
				end
				else begin
					state_w = state_r;
				end
			end

			CONV_LOAD_32: begin
				if(SRAM_load_finsh) begin
					state_w = CONV_CALC_32;
				end
				else begin
					state_w = state_r;
				end
			end

			CONV_LOAD_16: begin
				if(SRAM_load_finsh) begin
					state_w = CONV_CALC_16;
				end
				else begin
					state_w = state_r;
				end
			end

			CONV_LOAD_8: begin
				if(SRAM_load_finsh) begin
					state_w = CONV_CALC_8;
				end
				else begin
					state_w = state_r;
				end
			end

			CONV_CALC_32: state_w = CONV_OUTPUT_32;

			CONV_CALC_16: state_w = CONV_OUTPUT_16;

			CONV_CALC_8:  state_w  = CONV_OUTPUT_8;

			CONV_OUTPUT_32: begin
				if(&conv_channels_32_r[6:0]) begin
					state_w = CONV_FINAL;
				end
				else begin
					state_w = CONV_LOAD_32;
				end
			end

			CONV_OUTPUT_16: begin
				if(&conv_channels_16_r[5:0]) begin
					state_w = CONV_FINAL;
				end
				else begin
					state_w = CONV_LOAD_16;
				end
			end

			CONV_OUTPUT_8: begin
				if(&conv_channels_8_r[4:0]) begin
					state_w = CONV_FINAL;
				end
				else begin
					state_w = CONV_LOAD_8;
				end
			end

            CONV_FINAL: begin
                // since output will  delay one cycle
                if(conv_output_r==4) begin
                    case(scale_r)
						2'b00:  state_w = PREP_32;
						2'b01:  state_w = PREP_16;
						2'b10:  state_w = PREP_8;
						default: state_w = state_r;
					endcase
                end
                else begin
                    state_w = state_r;
                end
            end

			MEDIAN_LOAD: begin
				if(SRAM_load_finsh) begin
					state_w = MEDIAN_CALC;
				end
				else begin
					state_w = state_r;
				end
			end

			MEDIAN_CALC: begin
				if(o_median_finish) begin
					state_w = MEDIAN_OUTPUT;
				end
				else begin
					state_w = state_r;
				end
			end

			MEDIAN_OUTPUT: begin
				if(&median_output_r) begin
					state_w = MEDIAN_FINAL;
				end
				else begin
					state_w = MEDIAN_LOAD;
				end
			end

            MEDIAN_FINAL: begin
                case(scale_r)
						2'b00:  state_w = PREP_32;
						2'b01:  state_w = PREP_16;
						2'b10:  state_w = PREP_8;
						default: state_w = state_r;
				endcase
            end

			NMS_LOAD: begin
				if(SRAM_load_finsh) begin
					state_w = NMS_SOBEL;
				end
				else begin
					state_w = state_r;
				end
			end

			NMS_SOBEL: begin
                if(o_sobel_finish) begin
                    if(&sobel_count_r) begin
                        state_w = NMS_OUTPUT;
                    end
                    else if(sobel_count_r<3) begin
                        state_w = NMS_LOAD;
                    end
                    else begin
                        state_w = state_r;
                    end
                end
				else begin
					state_w = state_r;
				end
			end

			NMS_OUTPUT: begin
				if( (&NMS_output_r) && (NMS_output_count_r==4)) begin
					case(scale_r)
						2'b00:   state_w = PREP_32;
						2'b01:   state_w = PREP_16;
						2'b10:   state_w = PREP_8;
						default: state_w = state_r;
					endcase
				end
				else if(NMS_output_count_r==4) begin
					state_w = NMS_LOAD;
				end
				else begin
					state_w = state_r;
				end
			end

			default: state_w = state_r;
		endcase
	end
	//-------------------//


	//-------------------//
	//Output logic
	always@ (*) begin
		if(state_w == LOAD) begin
			o_in_ready_w = 1;
		end
		else begin
			o_in_ready_w = 0;
		end
	end	

	always@ (*) begin
		if ( (state_w == PREP || state_w == PREP_32 || state_w == PREP_16 || state_w ==PREP_8) 
		  && (state_r != PREP && state_r != PREP_32 && state_r != PREP_16 && state_r !=PREP_8) )
		begin
			o_op_ready_w = 1;
		end
		else begin
			o_op_ready_w = 0;
		end
	end	

	always@ (*) begin
		if(    (state_r == OUTPUT_32  && state_w == OUTPUT_32  && (conv_channels_32_r>=2)) 
            || (state_r == OUTPUT_16  && state_w == OUTPUT_16  && (conv_channels_16_r>=2))      
            || (state_r == OUTPUT_8   && state_w == OUTPUT_8   && (conv_channels_8_r>=2)) 
            || (state_r == CONV_FINAL && state_w == CONV_FINAL)    
            ||  state_r == MEDIAN_OUTPUT 
            || (state_r == NMS_OUTPUT && state_w == NMS_OUTPUT)
        )
		begin
			o_out_valid_w = 1;
		end
		else begin
			o_out_valid_w = 0;
		end
	end
	
	always@ (*) begin
		if( state_r == OUTPUT_32 || state_r == OUTPUT_16 || state_r == OUTPUT_8 ) begin
			o_out_data_w = SRAM_READ_DATA;
		end
		else if( state_r == CONV_FINAL ) begin
            o_out_data_w = conv_temp_2;
		end
		else if( state_r == MEDIAN_OUTPUT ) begin
			o_out_data_w = median_result;
		end
		else if( state_r == NMS_OUTPUT ) begin
			o_out_data_w = NMS_result;
		end
		else begin
			o_out_data_w = 0;
		end
	end


    always@ (*) begin
        case(conv_output_r)
                0:  conv_temp = conv_r[0];
                1:  conv_temp = conv_r[1];
                2:  conv_temp = conv_r[2];
                3:  conv_temp = conv_r[3];
            default: conv_temp = 0;
        endcase

        //round to the nearest integer
        conv_temp_2 = {1'b0, conv_temp[16:4]} + conv_temp[3];
    end
	//-------------------//


	//-------------------//
	//SRAM input logic
	always@ (*) begin
		if(state_r == LOAD && i_in_valid) begin
			if(SRAM_load_data_r[10:9] == 2'b00) begin
				//0~511
				SRAM_CEN_1_w = 0;
				SRAM_CEN_2_w = 1;
				SRAM_CEN_3_w = 1;
				SRAM_CEN_4_w = 1;

				SRAM_WEN_1_w = 0;
				SRAM_WEN_2_w = 0;
				SRAM_WEN_3_w = 0;
				SRAM_WEN_4_w = 0;

				SRAM_ADDRESS_1_w = SRAM_load_data_r[8:0];
				SRAM_ADDRESS_2_w = 0;
				SRAM_ADDRESS_3_w = 0;
				SRAM_ADDRESS_4_w = 0;

				SRAM_INPUT_DATA_1_w = i_in_data;
				SRAM_INPUT_DATA_2_w = 0;
				SRAM_INPUT_DATA_3_w = 0;
				SRAM_INPUT_DATA_4_w = 0;
			end
			else if(SRAM_load_data_r[10:9] == 2'b01) begin
				//512~1023
				SRAM_CEN_1_w = 1;
				SRAM_CEN_2_w = 0;
				SRAM_CEN_3_w = 1;
				SRAM_CEN_4_w = 1;

				SRAM_WEN_1_w = 0;
				SRAM_WEN_2_w = 0;
				SRAM_WEN_3_w = 0;
				SRAM_WEN_4_w = 0;

				SRAM_ADDRESS_1_w = 0;
				SRAM_ADDRESS_2_w = SRAM_load_data_r[8:0];
				SRAM_ADDRESS_3_w = 0;
				SRAM_ADDRESS_4_w = 0;

				SRAM_INPUT_DATA_1_w = 0;
				SRAM_INPUT_DATA_2_w = i_in_data;
				SRAM_INPUT_DATA_3_w = 0;
				SRAM_INPUT_DATA_4_w = 0;
			end
			else if(SRAM_load_data_r[10:9] == 2'b10) begin
				//1024~1535
				SRAM_CEN_1_w = 1;
				SRAM_CEN_2_w = 1;
				SRAM_CEN_3_w = 0;
				SRAM_CEN_4_w = 1;

				SRAM_WEN_1_w = 0;
				SRAM_WEN_2_w = 0;
				SRAM_WEN_3_w = 0;
				SRAM_WEN_4_w = 0;

				SRAM_ADDRESS_1_w = 0;
				SRAM_ADDRESS_2_w = 0;
				SRAM_ADDRESS_3_w = SRAM_load_data_r[8:0];
				SRAM_ADDRESS_4_w = 0;

				SRAM_INPUT_DATA_1_w = 0;
				SRAM_INPUT_DATA_2_w = 0;
				SRAM_INPUT_DATA_3_w = i_in_data;
				SRAM_INPUT_DATA_4_w = 0;
			end
			else begin
				//1536~2047
				SRAM_CEN_1_w = 1;
				SRAM_CEN_2_w = 1;
				SRAM_CEN_3_w = 1;
				SRAM_CEN_4_w = 0;

				SRAM_WEN_1_w = 0;
				SRAM_WEN_2_w = 0;
				SRAM_WEN_3_w = 0;
				SRAM_WEN_4_w = 0;

				SRAM_ADDRESS_1_w = 0;
				SRAM_ADDRESS_2_w = 0;
				SRAM_ADDRESS_3_w = 0;
				SRAM_ADDRESS_4_w = SRAM_load_data_r[8:0];

				SRAM_INPUT_DATA_1_w = 0;
				SRAM_INPUT_DATA_2_w = 0;
				SRAM_INPUT_DATA_3_w = 0;
				SRAM_INPUT_DATA_4_w = i_in_data;
			end
		end
		else if(state_r == OUTPUT_32 || state_r == CONV_LOAD_32) begin
			if(conv_channels_32_r[6:5] == 2'b00) begin
				//0~31
				SRAM_CEN_1_w = 0;
				SRAM_CEN_2_w = 1;
				SRAM_CEN_3_w = 1;
				SRAM_CEN_4_w = 1;

				SRAM_WEN_1_w = 1;
				SRAM_WEN_2_w = 0;
				SRAM_WEN_3_w = 0;
				SRAM_WEN_4_w = 0;

				SRAM_ADDRESS_1_w = {page ,origin_output_point};
				SRAM_ADDRESS_2_w = 0;
				SRAM_ADDRESS_3_w = 0;
				SRAM_ADDRESS_4_w = 0;

				SRAM_INPUT_DATA_1_w = 0;
				SRAM_INPUT_DATA_2_w = 0;
				SRAM_INPUT_DATA_3_w = 0;
				SRAM_INPUT_DATA_4_w = 0;
			end
			else if(conv_channels_32_r[6:5] == 2'b01) begin
				//32~63
				SRAM_CEN_1_w = 1;
				SRAM_CEN_2_w = 0;
				SRAM_CEN_3_w = 1;
				SRAM_CEN_4_w = 1;

				SRAM_WEN_1_w = 0;
				SRAM_WEN_2_w = 1;
				SRAM_WEN_3_w = 0;
				SRAM_WEN_4_w = 0;

				SRAM_ADDRESS_1_w = 0;
				SRAM_ADDRESS_2_w = {page ,origin_output_point};
				SRAM_ADDRESS_3_w = 0;
				SRAM_ADDRESS_4_w = 0;

				SRAM_INPUT_DATA_1_w = 0;
				SRAM_INPUT_DATA_2_w = 0;
				SRAM_INPUT_DATA_3_w = 0;
				SRAM_INPUT_DATA_4_w = 0;
			end
			else if(conv_channels_32_r[6:5] == 2'b10) begin
				//64~95
				SRAM_CEN_1_w = 1;
				SRAM_CEN_2_w = 1;
				SRAM_CEN_3_w = 0;
				SRAM_CEN_4_w = 1;

				SRAM_WEN_1_w = 0;
				SRAM_WEN_2_w = 0;
				SRAM_WEN_3_w = 1;
				SRAM_WEN_4_w = 0;

				SRAM_ADDRESS_1_w = 0;
				SRAM_ADDRESS_2_w = 0;
				SRAM_ADDRESS_3_w = {page ,origin_output_point};
				SRAM_ADDRESS_4_w = 0;

				SRAM_INPUT_DATA_1_w = 0;
				SRAM_INPUT_DATA_2_w = 0;
				SRAM_INPUT_DATA_3_w = 0;
				SRAM_INPUT_DATA_4_w = 0;
			end
			else begin
				//96~127
				SRAM_CEN_1_w = 1;
				SRAM_CEN_2_w = 1;
				SRAM_CEN_3_w = 1;
				SRAM_CEN_4_w = 0;

				SRAM_WEN_1_w = 0;
				SRAM_WEN_2_w = 0;
				SRAM_WEN_3_w = 0;
				SRAM_WEN_4_w = 1;

				SRAM_ADDRESS_1_w = 0;
				SRAM_ADDRESS_2_w = 0;
				SRAM_ADDRESS_3_w = 0;
				SRAM_ADDRESS_4_w = {page ,origin_output_point};

				SRAM_INPUT_DATA_1_w = 0;
				SRAM_INPUT_DATA_2_w = 0;
				SRAM_INPUT_DATA_3_w = 0;
				SRAM_INPUT_DATA_4_w = 0;
			end
		end
		else if(state_r == OUTPUT_16 || state_r == CONV_LOAD_16) begin
			if(conv_channels_16_r[5] == 1'b0) begin
				//0~31
				SRAM_CEN_1_w = 0;
				SRAM_CEN_2_w = 1;
				SRAM_CEN_3_w = 1;
				SRAM_CEN_4_w = 1;

				SRAM_WEN_1_w = 1;
				SRAM_WEN_2_w = 0;
				SRAM_WEN_3_w = 0;
				SRAM_WEN_4_w = 0;

				SRAM_ADDRESS_1_w = {page ,origin_output_point};
				SRAM_ADDRESS_2_w = 0;
				SRAM_ADDRESS_3_w = 0;
				SRAM_ADDRESS_4_w = 0;

				SRAM_INPUT_DATA_1_w = 0;
				SRAM_INPUT_DATA_2_w = 0;
				SRAM_INPUT_DATA_3_w = 0;
				SRAM_INPUT_DATA_4_w = 0;
			end
			else begin
				//32~63
				SRAM_CEN_1_w = 1;
				SRAM_CEN_2_w = 0;
				SRAM_CEN_3_w = 1;
				SRAM_CEN_4_w = 1;

				SRAM_WEN_1_w = 0;
				SRAM_WEN_2_w = 1;
				SRAM_WEN_3_w = 0;
				SRAM_WEN_4_w = 0;

				SRAM_ADDRESS_1_w = 0;
				SRAM_ADDRESS_2_w = {page ,origin_output_point};
				SRAM_ADDRESS_3_w = 0;
				SRAM_ADDRESS_4_w = 0;

				SRAM_INPUT_DATA_1_w = 0;
				SRAM_INPUT_DATA_2_w = 0;
				SRAM_INPUT_DATA_3_w = 0;
				SRAM_INPUT_DATA_4_w = 0;
			end
		end
		else if(state_r == OUTPUT_8 || state_r == CONV_LOAD_8 || state_r == MEDIAN_LOAD || state_r == NMS_LOAD) begin
			//0~31
			SRAM_CEN_1_w = 0;
			SRAM_CEN_2_w = 1;
			SRAM_CEN_3_w = 1;
			SRAM_CEN_4_w = 1;

			SRAM_WEN_1_w = 1;
			SRAM_WEN_2_w = 0;
			SRAM_WEN_3_w = 0;
			SRAM_WEN_4_w = 0;

			SRAM_ADDRESS_1_w = {page ,origin_output_point};
			SRAM_ADDRESS_2_w = 0;
			SRAM_ADDRESS_3_w = 0;
			SRAM_ADDRESS_4_w = 0;

			SRAM_INPUT_DATA_1_w = 0;
			SRAM_INPUT_DATA_2_w = 0;
			SRAM_INPUT_DATA_3_w = 0;
			SRAM_INPUT_DATA_4_w = 0;
		end
		else begin
			SRAM_CEN_1_w = 1;
			SRAM_CEN_2_w = 1;
			SRAM_CEN_3_w = 1;
			SRAM_CEN_4_w = 1;

			SRAM_WEN_1_w = 0;
			SRAM_WEN_2_w = 0;
			SRAM_WEN_3_w = 0;
			SRAM_WEN_4_w = 0;

			SRAM_ADDRESS_1_w = 0;
			SRAM_ADDRESS_2_w = 0;
			SRAM_ADDRESS_3_w = 0;
			SRAM_ADDRESS_4_w = 0;

			SRAM_INPUT_DATA_1_w = 0;
			SRAM_INPUT_DATA_2_w = 0;
			SRAM_INPUT_DATA_3_w = 0;
			SRAM_INPUT_DATA_4_w = 0;
		end
	end

    reg [7:0] read_access_32;
    reg [6:0] read_access_16;

    always@(*) begin
        read_access_32 = conv_channels_32_r-2;
        read_access_16 = conv_channels_16_r-2;
    end

	//SRAM_READ_DATA logic
	always@ (*) begin
		if(zero_padding_buffer_r) begin
			SRAM_READ_DATA = 0;
		end
		else begin
			if(state_r == OUTPUT_32) begin
				if(read_access_32[6:5] == 2'b00) begin
					SRAM_READ_DATA = SRAM_READ_DATA_1;
				end
				else if(read_access_32[6:5] == 2'b01) begin
					SRAM_READ_DATA = SRAM_READ_DATA_2;
				end
				else if(read_access_32[6:5] == 2'b10) begin
					SRAM_READ_DATA = SRAM_READ_DATA_3;
				end
				else begin
					SRAM_READ_DATA = SRAM_READ_DATA_4;
				end
			end
			else if(state_r == OUTPUT_16) begin
				if(read_access_16[5] == 1'b0) begin
					SRAM_READ_DATA = SRAM_READ_DATA_1;
				end
				else begin
					SRAM_READ_DATA = SRAM_READ_DATA_2;
				end
			end
			else if(state_r == OUTPUT_8 || state_r == CONV_LOAD_8 || state_r == MEDIAN_LOAD || state_r == NMS_LOAD) begin
				SRAM_READ_DATA = SRAM_READ_DATA_1;
			end
            else if(state_r == CONV_LOAD_32) begin
                if(conv_channels_32_r[6:5] == 2'b00) begin
					SRAM_READ_DATA = SRAM_READ_DATA_1;
				end
				else if(conv_channels_32_r[6:5] == 2'b01) begin
					SRAM_READ_DATA = SRAM_READ_DATA_2;
				end
				else if(conv_channels_32_r[6:5] == 2'b10) begin
					SRAM_READ_DATA = SRAM_READ_DATA_3;
				end
				else begin
					SRAM_READ_DATA = SRAM_READ_DATA_4;
				end
            end
            else if(state_r == CONV_LOAD_16) begin
                if(conv_channels_16_r[5] == 1'b0) begin
					SRAM_READ_DATA = SRAM_READ_DATA_1;
				end
				else begin
					SRAM_READ_DATA = SRAM_READ_DATA_2;
				end
            end
			else begin
				SRAM_READ_DATA = 0;
			end
		end
	end

	//SRAM get data logic
	always@ (*) begin
		for(i=0;i<9;i=i+1) begin
			read_data_w[i] = read_data_r[i];
		end

		if
        (!SRAM_load_finsh && (state_r==CONV_LOAD_32 || state_r==CONV_LOAD_16 || state_r==CONV_LOAD_8 
          || state_r==NMS_LOAD || state_r==MEDIAN_LOAD)
          && (SRAM_load_count_r>=2)
        ) 
		begin
			read_data_w[8] = SRAM_READ_DATA;
			read_data_w[7] = read_data_r[8];
			read_data_w[6] = read_data_r[7];
			read_data_w[5] = read_data_r[6];
			read_data_w[4] = read_data_r[5];
			read_data_w[3] = read_data_r[4];
			read_data_w[2] = read_data_r[3];
			read_data_w[1] = read_data_r[2];
			read_data_w[0] = read_data_r[1];
		end
	end	
	//-------------------//

    
    //-------------------//
    //accumulate convolution result
    always@ (*) begin
        if( (state_r == CONV_OUTPUT_32 && conv_channels_32_r[1:0]==2'b00) 
         || (state_r == CONV_OUTPUT_16 && conv_channels_16_r[1:0]==2'b00) 
         || (state_r == CONV_OUTPUT_8  && conv_channels_8_r[1:0]==2'b00)) 
        begin
            conv_w[0] = conv_r[0] + {5'd0, conv_calc};
            conv_w[1] = conv_r[1];
            conv_w[2] = conv_r[2];
            conv_w[3] = conv_r[3];
        end
        else if( (state_r == CONV_OUTPUT_32 && conv_channels_32_r[1:0]==2'b01) 
         || (state_r == CONV_OUTPUT_16 && conv_channels_16_r[1:0]==2'b01) 
         || (state_r == CONV_OUTPUT_8  && conv_channels_8_r[1:0]==2'b01) ) 
        begin
            conv_w[1] = conv_r[1] + {5'd0, conv_calc};
            conv_w[0] = conv_r[0];
            conv_w[2] = conv_r[2];
            conv_w[3] = conv_r[3];
        end
        else if( (state_r == CONV_OUTPUT_32 && conv_channels_32_r[1:0]==2'b10) 
         || (state_r == CONV_OUTPUT_16 && conv_channels_16_r[1:0]==2'b10) 
         || (state_r == CONV_OUTPUT_8  && conv_channels_8_r[1:0]==2'b10)) 
        begin
            conv_w[2] = conv_r[2] + {5'd0, conv_calc};
            conv_w[1] = conv_r[1];
            conv_w[0] = conv_r[0];
            conv_w[3] = conv_r[3];
        end
        else if( (state_r == CONV_OUTPUT_32 && conv_channels_32_r[1:0]==2'b11) 
         || (state_r == CONV_OUTPUT_16 && conv_channels_16_r[1:0]==2'b11) 
         || (state_r == CONV_OUTPUT_8  && conv_channels_8_r[1:0]==2'b11)) 
        begin
            conv_w[3] = conv_r[3] + {5'd0, conv_calc};
            conv_w[1] = conv_r[1];
            conv_w[2] = conv_r[2];
            conv_w[0] = conv_r[0];
        end
        else if(state_r == PREP_8 || state_r ==PREP_16 || state_r == PREP_32) begin
            conv_w[0] = 0;
            conv_w[1] = 0;
            conv_w[2] = 0;
            conv_w[3] = 0;
        end
        else begin
            conv_w[0] = conv_r[0];
            conv_w[1] = conv_r[1];
            conv_w[2] = conv_r[2];
            conv_w[3] = conv_r[3];
        end
    end
    //-------------------//
	

	//-------------------//
	//selecting a1-a9  for computing
	always@ (*) begin
		if(  state_r == CONV_CALC_32 || state_r == CONV_CALC_16 || state_r == CONV_CALC_8
		   ||state_r == MEDIAN_CALC  || state_r == NMS_SOBEL ) begin
			a1 = read_data_r[0];
			a2 = read_data_r[1];
			a3 = read_data_r[2];
			a4 = read_data_r[3];
			a5 = read_data_r[4];
			a6 = read_data_r[5];
			a7 = read_data_r[6];
			a8 = read_data_r[7];
			a9 = read_data_r[8];
		end
		else begin
			a1 = 0;
			a2 = 0;
			a3 = 0;
			a4 = 0;
			a5 = 0;
			a6 = 0;
			a7 = 0;
			a8 = 0;
			a9 = 0;
		end
	end
	//-------------------//


	//-------------------//
	//calculate final NMS result
	always@ (*) begin
		if(state_r == NMS_SOBEL && o_sobel_finish) begin
			NMS_direction_w[3] = NMS_direction;
			NMS_direction_w[2] = NMS_direction_r[3];
			NMS_direction_w[1] = NMS_direction_r[2];
			NMS_direction_w[0] = NMS_direction_r[1];
		end
		else begin
			NMS_direction_w[3] = NMS_direction_r[3];
			NMS_direction_w[2] = NMS_direction_r[2];
			NMS_direction_w[1] = NMS_direction_r[1];
			NMS_direction_w[0] = NMS_direction_r[0];
		end
	end	

	always@ (*) begin
		if(state_r == NMS_SOBEL && o_sobel_finish) begin
			sobel_answers_w[3] = sobel_result;
			sobel_answers_w[2] = sobel_answers_r[3];
			sobel_answers_w[1] = sobel_answers_r[2];
			sobel_answers_w[0] = sobel_answers_r[1];
		end
		else begin
			sobel_answers_w[3] = sobel_answers_r[3];
			sobel_answers_w[2] = sobel_answers_r[2];
			sobel_answers_w[1] = sobel_answers_r[1];
			sobel_answers_w[0] = sobel_answers_r[0];
		end
	end

	always@ (*) begin
		case(NMS_output_count_r)
			0: begin
				if(NMS_direction_r[0]==2'b00) begin
					//0
					NMS_result = (sobel_answers_r[0] < sobel_answers_r[1]) ? 0 : sobel_answers_r[0];
				end
				else if(NMS_direction_r[0]==2'b01) begin
					//45
					NMS_result = (sobel_answers_r[0] < sobel_answers_r[3]) ? 0 : sobel_answers_r[0];
				end
				else if(NMS_direction_r[0]==2'b10) begin
					//90
					NMS_result = (sobel_answers_r[0] < sobel_answers_r[2]) ? 0 : sobel_answers_r[0];
				end
				else begin
					//135
					NMS_result = sobel_answers_r[0];
				end
			end

			1: begin
				if(NMS_direction_r[1]==2'b00) begin
					NMS_result = (sobel_answers_r[1] < sobel_answers_r[0]) ? 0 : sobel_answers_r[1];
				end
				else if(NMS_direction_r[1]==2'b01) begin
					NMS_result = sobel_answers_r[1];
				end
				else if(NMS_direction_r[1]==2'b10) begin
					NMS_result = (sobel_answers_r[1] < sobel_answers_r[3]) ? 0 : sobel_answers_r[1];
				end
				else begin
					NMS_result = (sobel_answers_r[1] < sobel_answers_r[2]) ? 0 : sobel_answers_r[1];
				end
			end

			2: begin
				if(NMS_direction_r[2]==2'b00) begin
					NMS_result = (sobel_answers_r[2] < sobel_answers_r[3]) ? 0 : sobel_answers_r[2];
				end
				else if(NMS_direction_r[2]==2'b01) begin
					NMS_result = sobel_answers_r[2];
				end
				else if(NMS_direction_r[2]==2'b10) begin
					NMS_result = (sobel_answers_r[2] < sobel_answers_r[0]) ? 0 : sobel_answers_r[2];
				end
				else begin
					NMS_result = (sobel_answers_r[2] < sobel_answers_r[1]) ? 0 : sobel_answers_r[2];
				end
			end

			3: begin
				if(NMS_direction_r[3]==2'b00) begin
					NMS_result = (sobel_answers_r[3] < sobel_answers_r[2]) ? 0 : sobel_answers_r[3];
				end
				else if(NMS_direction_r[3]==2'b01) begin
					NMS_result = (sobel_answers_r[3] < sobel_answers_r[0]) ? 0 : sobel_answers_r[3];
				end
				else if(NMS_direction_r[3]==2'b10) begin
					NMS_result = (sobel_answers_r[3] < sobel_answers_r[1]) ? 0 : sobel_answers_r[3];
				end
				else begin
					NMS_result = sobel_answers_r[3];
				end
			end

			default: NMS_result = 0;
		endcase
	end
	//-------------------//

endmodule

module convolution (
	input   [ 7:0] a1,
	input   [ 7:0] a2,
	input   [ 7:0] a3,
	input   [ 7:0] a4,
	input   [ 7:0] a5,
	input   [ 7:0] a6,
	input   [ 7:0] a7,
	input   [ 7:0] a8,
	input   [ 7:0] a9,
	output [ 11:0] conv_result
);	
    assign conv_result = ( {4'd0, a1}       + {3'd0, a2, 1'd0} + {4'd0, a3} )
					   + ( {3'd0, a4, 1'd0} + {2'd0, a5, 2'd0} + {3'd0, a6, 1'd0} )  
					   + ( {4'd0, a7}       + {3'd0, a8, 1'd0} + {4'd0, a9} );
endmodule

module median_filter (
    input   i_clk,
    input   i_rst_n,
    input   i_start,
	input   [7:0] a1,
	input   [7:0] a2,
	input   [7:0] a3,
	input   [7:0] a4,
	input   [7:0] a5,
	input   [7:0] a6,
	input   [7:0] a7,
	input   [7:0] a8,
	input   [7:0] a9,
	output   o_median_finish,
    output  [13:0] median_result
);
	localparam S_IDLE   = 2'd0;
	localparam S_SORT   = 2'd1;
	localparam S_OUTPUT = 2'd2;

	reg [1:0] state_r, state_w;
	reg [3:0] cnt1_r, cnt1_w;
	reg [3:0] cnt2_r, cnt2_w;
	reg [7:0] mem_r [0:8];
	reg [7:0] mem_w [0:8];
	reg o_median_finish_r, o_median_finish_w;
	integer i;

	assign o_median_finish = o_median_finish_r;
	assign median_result = {6'd0, mem_r[4]}; //median
	
	always @(*) begin
    	state_w = state_r;
    	cnt1_w = cnt1_r;
    	cnt2_w = cnt2_r;
    	o_median_finish_w = 0;

    	case (state_r)
    	    S_IDLE: begin
    	        if(i_start) begin
    	            state_w = S_SORT;
					cnt1_w = 0;
    	    		cnt2_w = 7;
				end
    	    end

			S_SORT: begin
    	        if(cnt1_r==cnt2_r) begin
    	            if(cnt2_r==0) begin
    	                //finish sorting
    	                state_w = S_OUTPUT;
    	                cnt1_w = 0;
						o_median_finish_w = 1;
        	        end
        	        else begin
        	            //finish sorting for one round, go to next round
        	            cnt1_w = 0;
        	            cnt2_w = cnt2_r - 1;
        	        end
        	    end 
        	    else begin
        	        cnt1_w = cnt1_r + 1;
        	    end
        	end

        	S_OUTPUT: begin
        	    state_w = S_IDLE;
				cnt1_w = 0;
    			cnt2_w = 0;
    			o_median_finish_w = 0;
        	end
    	endcase
	end

	//Sorting
	always @(*) begin
	    for (i = 0; i < 9; i = i + 1) begin
	        mem_w[i] = mem_r[i];
	    end
	
	    case (state_r)
	        S_IDLE: begin
	            if (i_start) begin
	                mem_w[0] = a1;
					mem_w[1] = a2;
					mem_w[2] = a3;
					mem_w[3] = a4;
					mem_w[4] = a5;
					mem_w[5] = a6;
					mem_w[6] = a7;
					mem_w[7] = a8;
					mem_w[8] = a9;
	            end
	        end

	        S_SORT: begin
	            if (mem_r[cnt1_r] > mem_r[cnt1_r+1]) begin
	                mem_w[cnt1_r] = mem_r[cnt1_r+1];
	                mem_w[cnt1_r+1] = mem_r[cnt1_r];
	            end
	        end
	    endcase
	end

	always @(posedge i_clk or negedge i_rst_n) begin
	    if (!i_rst_n) begin
	        state_r    <= S_IDLE;
	        cnt1_r     <= 0;
	        cnt2_r     <= 0;
	        o_median_finish_r <= 0;

	        for(i=0;i<9;i=i+1) begin
	            mem_r[i] <= 0;
	        end
	    end
	    else begin
	        state_r    <= state_w;
	        cnt1_r     <= cnt1_w;
	        cnt2_r     <= cnt2_w;
	        o_median_finish_r <= o_median_finish_w;

	        for(i=0;i<9;i=i+1) begin
	            mem_r[i] <= mem_w[i];
	        end
	    end
	end
endmodule

module comparator(
	input [20:0] a1,
	input [20:0] a2,
	input [20:0] a3,
	input [20:0] a4,
	output reg [1:0] smallest
);
	reg [3:0] comp1, comp2, comp3, comp4;
	reg [20:0] temp1,temp2,temp3,temp4;

	always@ (*) begin
        //get absolute value
		temp1 = a1[20] ? ~a1+1 : a1;
		temp2 = a2[20] ? ~a2+1 : a2;
		temp3 = a3[20] ? ~a3+1 : a3;
		temp4 = a4[20] ? ~a4+1 : a4;

		comp1[0] = 0;
		comp1[1] = temp1 > temp2;
		comp1[2] = temp1 > temp3;
		comp1[3] = temp1 > temp4;

		comp2[0] = !comp1[1];
        comp2[1] = 0;
		comp2[2] = temp2 > temp3;
		comp2[3] = temp2 > temp4;

		comp3[0] = !comp1[2];
		comp3[1] = !comp2[2];
        comp3[2] = 0;
		comp3[3] = temp3 > temp4;

		comp4[0] = !comp1[3];
		comp4[1] = !comp2[3];
		comp4[2] = !comp3[3];
        comp4[3] = 0;

		if(&(~comp1))
			smallest = 2'b00;
		else if(&(~comp2))
			smallest = 2'b01;
		else if(&(~comp3))
			smallest = 2'b10;
		else if(&(~comp4))
			smallest = 2'b11;
		else
			smallest = 0;
	end
endmodule

module Sobel_gradient(
	input   i_clk,
    input   i_rst_n,
    input   i_start,
	input   [7:0] a1,
	input   [7:0] a2,
	input   [7:0] a3,
	input   [7:0] a4,
	input   [7:0] a5,
	input   [7:0] a6,
	input   [7:0] a7,
	input   [7:0] a8,
	input   [7:0] a9,
	output  o_sobel_finish,
	output  [13:0] sobel_result,
	output  [1:0]  NMS_direction
);	
	localparam IDLE = 3'd0;
	localparam CALC_1 = 3'd1;
	localparam CALC_2 = 3'd2;
	localparam CALC_3 = 3'd3;
	localparam THETA = 3'd4;
	localparam COUT  = 3'd5;

	integer i;

	reg [2:0] state_r , state_w;
	reg [7:0] in_data_r[0:8], in_data_w[0:8];
	reg [9:0] temp_1, temp_2, temp_3, temp_4, temp_5, temp_6;
	reg [10:0] res_1, res_2, res_3;
	reg [11:0] ans;
	reg [13:0] Gxy;
	reg [12:0] Gxy_temp;
	reg [13:0] Gxy_r[0:1], Gxy_w[0:1];

	reg [20:0] add_1, add_2, add_3;

	reg [20:0] indata1, indata2, indata3, indata4;
	wire [1:0] smallest;
	reg [1:0]  smallest_r, smallest_w;

	reg o_sobel_finish_r, o_sobel_finish_w;
	reg [1:0]  NMS_direction_r, NMS_direction_w;
	reg [13:0] sobel_result_r, sobel_result_w;

	assign NMS_direction = NMS_direction_r;
	assign o_sobel_finish = o_sobel_finish_r;
	assign sobel_result = sobel_result_r;

	comparator comp(.a1(indata1), .a2(indata2), .a3(indata3), .a4(indata4), .smallest(smallest));

	always@ (*) begin
		case(state_r)
			IDLE:   state_w = (i_start) ? CALC_1 : IDLE;
			CALC_1: state_w = CALC_2;
			CALC_2: state_w = CALC_3;
			CALC_3: state_w = THETA;
			THETA:  state_w = COUT;
			COUT:   state_w = IDLE;
            default: state_w = state_r;
		endcase
	end

	always@ (*) begin
		if(i_start && state_r == IDLE) begin
			in_data_w[0] = a1;
			in_data_w[1] = a2;
			in_data_w[2] = a3;
			in_data_w[3] = a4;
			in_data_w[4] = a5;
			in_data_w[5] = a6;
			in_data_w[6] = a7;
			in_data_w[7] = a8;
			in_data_w[8] = a9;
		end
		else begin
			for(i=0;i<9;i=i+1) begin
				in_data_w[i] = in_data_r[i];
			end
		end
	end

	always@ (*) begin
		if(state_r==CALC_1) begin
			temp_1 = ~{ 2'd0 , in_data_r[0]} + 1'b1;
			temp_2 = { 2'd0, in_data_r[2]};
			temp_3 = ~{ 1'd0 , in_data_r[3], 1'b0} + 1'b1;
			temp_4 = { 1'd0, in_data_r[5], 1'b0};
			temp_5 = ~{ 2'd0 , in_data_r[6]} + 1'b1;
			temp_6 = {2'd0, in_data_r[8]};
		end
		else if(state_r==CALC_2) begin
			temp_1 = ~{ 2'd0 , in_data_r[0]} + 1'b1;
			temp_2 = { 2'd0, in_data_r[6]};
			temp_3 = ~{ 1'd0, in_data_r[1], 1'b0} + 1'b1;
			temp_4 = { 1'd0, in_data_r[7], 1'b0};
			temp_5 = ~{ 2'd0 , in_data_r[2]} + 1'b1;
			temp_6 = { 2'd0, in_data_r[8]};
		end
		else begin
			temp_1 = 0;
			temp_2 = 0;
			temp_3 = 0;
			temp_4 = 0;
			temp_5 = 0;
			temp_6 = 0;
		end
	end

	always@ (*) begin
		res_1 = $signed(temp_1) + $signed(temp_2);
		res_2 = $signed(temp_3) + $signed(temp_4);
		res_3 = $signed(temp_5) + $signed(temp_6);
		ans = $signed(res_1)  + $signed(res_2);
		Gxy_temp = $signed(ans) + $signed(res_3); 
		Gxy[12:0] = (Gxy_temp[12]) ? (~Gxy_temp + 1) : Gxy_temp;
		Gxy[13] = Gxy_temp[12];
	end

	always@ (*) begin
		if(state_r==CALC_1 || state_r==CALC_2) begin
			Gxy_w[1] = Gxy;
			Gxy_w[0] = Gxy_r[1];
		end
		else begin
			Gxy_w[0] = Gxy_r[0];
			Gxy_w[1] = Gxy_r[1];
		end
	end

	always@ (*) begin
        add_1 = {8'd0 ,Gxy_r[0][12:0]} + {6'd0 ,Gxy_r[0][12:0], 2'd0};
		add_2 = {4'd0 ,Gxy_r[0][12:0], 4'd0} + {3'd0 ,Gxy_r[0][12:0], 5'd0};
		add_3 = add_1 + add_2;

		indata1 = {1'b0, Gxy_r[1][12:0], 7'd0};
		indata2 = indata1 - add_3;
		indata3 = indata1 - {1'b0, Gxy_r[0][12:0], 7'd0};
		indata4 = indata2 - {Gxy_r[0][12:0], 8'd0};
	end

	always@ (*) begin
		if(state_r == CALC_3) begin
			smallest_w = smallest;
		end
		else begin
			smallest_w = smallest_r;
		end
	end

    wire neg;
    assign neg = Gxy_r[0][13] ^ Gxy_r[1][13];

	always@ (*) begin
		if(state_r == THETA) begin
			if( Gxy_r[1][12:0]==0 ) begin
                NMS_direction_w = 2'b00; //0
            end
            else if( Gxy_r[0][12:0]==0 && Gxy_r[1][12:0]!=0 ) begin
                NMS_direction_w = 2'b10; //90
            end
            else if( Gxy_r[0][12:0] == Gxy_r[1][12:0]) begin
                if(neg)
                    NMS_direction_w = 2'b01; //45
                else
                    NMS_direction_w = 2'b11; //135
            end
            else begin
                case(smallest_r) 
			    	2'b00: begin
                        NMS_direction_w = 2'b00; //0
                    end

			    	2'b01:  begin
			    		if(neg) begin
			    			if(indata2[20]) begin
			    				//180
			    				NMS_direction_w = 2'b00;
			    			end
			    			else begin
			    				//135
			    				NMS_direction_w = 2'b11;
			    			end
			    		end
			    		else begin
			    			if(indata2[20]) begin
			    				//0
			    				NMS_direction_w = 2'b00;
			    			end
			    			else begin
			    				//45
			    				NMS_direction_w = 2'b01;
			    			end
			    		end
			    	end

			    	2'b10: begin
                        if(neg)
                            NMS_direction_w = 2'b11; //135
                        else
                            NMS_direction_w = 2'b01; //45
                    end

			    	2'b11: begin
			    		if(neg) begin
			    			if(indata4[20]) begin
			    				//135
			    				NMS_direction_w = 2'b11;
			    			end
			    			else begin
			    				//90
			    				NMS_direction_w = 2'b10;
			    			end
			    		end
			    		else begin
			    			if(indata4[20]) begin
			    				//45
			    				NMS_direction_w = 2'b01;
			    			end
			    			else begin
			    				//90
			    				NMS_direction_w = 2'b10;
			    			end
			    		end
			    	end

			    	default: NMS_direction_w = 0;
			    endcase
            end
		end
		else begin
			NMS_direction_w = NMS_direction_r;
		end
	end

	always@ (*) begin
		if(state_w == COUT) begin
			o_sobel_finish_w = 1;
			sobel_result_w = {1'b0, Gxy_r[0][12:0]} + {1'b0, Gxy_r[1][12:0]};
		end
		else begin
			o_sobel_finish_w = 0;
			sobel_result_w = sobel_result_r;
		end
	end

	always@(posedge i_clk or negedge i_rst_n) begin
		if(!i_rst_n) begin
			state_r  <= IDLE;

			Gxy_r[0] <= 0;
			Gxy_r[1] <= 0;

			smallest_r      <= 0;
			NMS_direction_r <= 0;
			sobel_result_r  <= 0;

			for(i=0;i<9;i=i+1) begin
				in_data_r[i] <= 0;
			end

            o_sobel_finish_r <= 0;
		end
		else begin
			state_r <= state_w;

			Gxy_r[0] <= Gxy_w[0];
			Gxy_r[1] <= Gxy_w[1];

			smallest_r      <= smallest_w;
			NMS_direction_r <= NMS_direction_w;
			sobel_result_r  <= sobel_result_w;

			for(i=0;i<9;i=i+1) begin
				in_data_r[i] <= in_data_w[i];
			end

            o_sobel_finish_r <= o_sobel_finish_w;
		end
	end

endmodule
