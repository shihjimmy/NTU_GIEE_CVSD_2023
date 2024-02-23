`timescale 1ns/100ps
`define CYCLE       10.0
`define HCYCLE      (`CYCLE/2)
`define MAX_CYCLE   120000

`ifdef p0
    `define Inst "../00_TESTBED/PATTERN/p0/inst.dat"
	`define Data "../00_TESTBED/PATTERN/p0/data.dat"
	`define Status "../00_TESTBED/PATTERN/p0/status.dat"
`endif

`ifdef p1
    `define Inst "../00_TESTBED/PATTERN/p1/inst.dat"
	`define Data "../00_TESTBED/PATTERN/p1/data.dat"
	`define Status "../00_TESTBED/PATTERN/p1/status.dat"
`endif

module testbed;
	reg clk, rst_n;
	wire [ 31 : 0 ] imem_addr;
	wire [ 31 : 0 ] imem_inst;
	wire            dmem_we;
	wire [ 31 : 0 ] dmem_addr;
	wire [ 31 : 0 ] dmem_wdata;
	wire [ 31 : 0 ] dmem_rdata;
	wire [  1 : 0 ] mips_status;
	wire            mips_status_valid;

	reg [31:0] golden_data   [0:63];
	reg [1:0]  golden_status [0:1023];
	reg [1:0]  core_status   [0:1023];

	initial begin
		$fsdbDumpfile("mips.fsdb");
        $fsdbDumpvars(0, testbed, "+mda");

		$readmemb (`Inst, u_inst_mem.mem_r);
		$readmemb (`Data, golden_data);
		$readmemb (`Status, golden_status);

		clk = 0;
		rst_n = 1;

		#(`CYCLE)
		rst_n = 0;

		#(`CYCLE*4)
		rst_n = 1;
	end

	always #(`HCYCLE) clk = ~clk;

	core u_core (
		.i_clk(clk),
		.i_rst_n(rst_n),
		.o_i_addr(imem_addr),
		.i_i_inst(imem_inst),
		.o_d_we(dmem_we),
		.o_d_addr(dmem_addr),
		.o_d_wdata(dmem_wdata),
		.i_d_rdata(dmem_rdata),
		.o_status(mips_status),
		.o_status_valid(mips_status_valid)
	);

	inst_mem  u_inst_mem (
		.i_clk(clk),
		.i_rst_n(rst_n),
		.i_addr(imem_addr),
		.o_inst(imem_inst)
	);

	data_mem  u_data_mem (
		.i_clk(clk),
		.i_rst_n(rst_n),
		.i_we(dmem_we),
		.i_addr(dmem_addr),
		.i_wdata(dmem_wdata),
		.o_rdata(dmem_rdata)
	);

	integer i, j;
	reg break;
	integer error_status, error_data;

	initial begin
		i = 0;
		break = 0;
		error_status = 0;
		error_data = 0;

		while(i <= 1024 && break==0) begin
			@(negedge clk)
			if(mips_status_valid) begin
				core_status[i] = mips_status;
				if(mips_status == `MIPS_OVERFLOW || mips_status == `MIPS_END) begin
					break = 1;
				end
				i = i + 1;
			end
		end

		for(j=0; j<i; j=j+1) begin
			if(golden_status[j] !== core_status[j]) begin
				error_status = error_status + 1;
				$display("YOU ARE WRONG!");
				$display 
				(
					"Status[%d]: Error! Out=%b, yours=%b", 
					j, golden_status[j], core_status[j]
				); 
			end
			// else begin
			// 	$display("CORRECT");
			// 	$display 
			// 	(
			// 		"Status[%d]: Correct! Out=%b, yours=%b", 
			// 		j, golden_status[j], core_status[j]
			// 	); 
			// end
		end

		for(j=0; j<64; j=j+1) begin
			if(golden_data[j] !== u_data_mem.mem_r[j]) begin
				error_data = error_data + 1;
				$display("YOU ARE WRONG!");
				$display 
				(
					"Data[%d]: Error! Out=%b, yours=%b", 
					j, golden_data[j], u_data_mem.mem_r[j]
				); 
			end
			// else begin
			// 	$display("CORRECT");
			// 	$display 
			// 	(
			// 		"Data[%d]: Correct! Out=%b, yours=%b", 
			// 		j, golden_data[j], u_data_mem.mem_r[j]
			// 	); 
			// end
		end
	
		if(error_status==0) begin
			$display("----------------------------------------------");
            $display("-                 STATUS PASS!               -");
            $display("----------------------------------------------");
		end

		if(error_data==0) begin
			$display("----------------------------------------------");
            $display("-                 DATA PASS!                 -");
            $display("----------------------------------------------");
		end
		
		if(error_status==0 && error_data==0) begin
			$display("----------------------------------------------");
            $display("-                 ALL PASS!                  -");
            $display("----------------------------------------------");
		end

		$finish;
	end

	initial begin
        #(`MAX_CYCLE * `CYCLE)
        $display("----------------------------------------------");
        $display("Latency of your design is over 120000 cycles!!");
        $display("----------------------------------------------");
        $finish;
    end

endmodule
