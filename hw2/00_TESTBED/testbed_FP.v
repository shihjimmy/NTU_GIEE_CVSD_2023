`timescale 1ns/100ps
`define CYCLE       10.0
`define HCYCLE      (`CYCLE/2)
`define MAX_CYCLE   120000
`define MULT "../00_TESTBED/testMultiply.dat" 
`define ADD  "../00_TESTBED/testAddition.dat"
`define SUB  "../00_TESTBED/testSubtraction.dat"

module testbed;

    reg clk;
    reg  [31:0] a,b;
    wire [31:0] result;
    reg  [5:0]  opcode;
    reg [95:0] MULT_ARRAY [0:999];
    reg [95:0] ADD_ARRAY  [0:999];
    reg [95:0] SUB_ARRAY  [0:999];
    
    integer i;
    integer mult_error, add_error, sub_error;

    FP_unit FP(.a(a), .b(b), .opcode(opcode), .result(result));
    
    always #(`HCYCLE) clk = ~clk;
    
    initial begin
		$fsdbDumpfile("FP.fsdb");
        $fsdbDumpvars(0, testbed, "+mda");

		$readmemh (`MULT, MULT_ARRAY);
		$readmemh (`ADD,  ADD_ARRAY);
		$readmemh (`SUB,  SUB_ARRAY);

        clk = 0;
        mult_error = 0;
        add_error = 0;
        sub_error = 0;
        
        #(`CYCLE*5)
        opcode = 6'd15;
        for(i=0;i<1000;i=i+1) begin
            a = MULT_ARRAY[i][95:64];
            b = MULT_ARRAY[i][63:32];

            #(`CYCLE*5)
            if(result!==MULT_ARRAY[i][31:0]) begin
                mult_error = mult_error + 1;
                $display("-----------------");
                $display("Multiplication error!!!!!");
                $display("ERROR! DATA[%d], ans = %b, yours = %b", i , MULT_ARRAY[i][31:0], result);
                $display("-----------------");
            end
        end

        #(`CYCLE*5)
        opcode = 6'd13;
        for(i=0;i<1000;i=i+1) begin
            a = ADD_ARRAY[i][95:64];
            b = ADD_ARRAY[i][63:32];

            #(`CYCLE*5)
            if(result!==ADD_ARRAY[i][31:0]) begin
                add_error = add_error + 1;
                $display("-----------------");
                $display("Addition error!!!!!");
                $display("ERROR! DATA[%d], ans = %b, yours = %b", i , ADD_ARRAY[i][31:0], result);
                $display("-----------------");
            end
        end

        #(`CYCLE*5)
        opcode = 6'd14;
        for(i=0;i<1000;i=i+1) begin
            a = SUB_ARRAY[i][95:64];
            b = SUB_ARRAY[i][63:32];

            #(`CYCLE*5)
            if(result!==SUB_ARRAY[i][31:0]) begin
                sub_error = sub_error + 1;
                $display("-----------------");
                $display("Subtraction error!!!!!");
                $display("ERROR! DATA[%d], ans = %b, yours = %b", i , SUB_ARRAY[i][31:0], result);
                $display("-----------------");
            end
        end

        if(sub_error==0 && add_error==0 && mult_error==0) begin
            $display("----------------------------------------------");
            $display("-                 ALL PASS!                  -");
            $display("----------------------------------------------");
        end
        else begin
            $display("----------------------------------------------");
            $display("You have mult error: %d of  1000 cases", mult_error);
            $display("You have add error:  %d of  1000 cases", add_error);
            $display("You have sub error:  %d of  1000 cases", sub_error);
            $display("----------------------------------------------");
        end

        #(`MAX_CYCLE * `CYCLE) 
        $finish;
	end

endmodule
