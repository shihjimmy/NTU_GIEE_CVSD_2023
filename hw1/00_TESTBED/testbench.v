`timescale 1ns/1ps
`define CYCLE       10.0
`define RST_DELAY   2
`define MAX_CYCLE   100000

`ifdef I0
    `define Inst_I  "../00_TESTBED/pattern/INST0_I.dat"
    `define Inst_O  "../00_TESTBED/pattern/INST0_O.dat"
    `define PAT_NUM 40
    `define FLAG 0
`elsif I1
    `define Inst_I  "../00_TESTBED/pattern/INST1_I.dat"
    `define Inst_O  "../00_TESTBED/pattern/INST1_O.dat"
    `define PAT_NUM 40
    `define FLAG 0
`elsif I2
    `define Inst_I  "../00_TESTBED/pattern/INST2_I.dat"
    `define Inst_O  "../00_TESTBED/pattern/INST2_O.dat"
    `define PAT_NUM 40
    `define FLAG 0
`elsif I3
    `define Inst_I  "../00_TESTBED/pattern/INST3_I.dat"
    `define Inst_O  "../00_TESTBED/pattern/INST3_O.dat"
    `define PAT_NUM 40
    `define FLAG 0
`elsif I4
    `define Inst_I  "../00_TESTBED/pattern/INST4_I.dat"
    `define Inst_O  "../00_TESTBED/pattern/INST4_O.dat"
    `define PAT_NUM 40
    `define FLAG 0
`elsif I5
    `define Inst_I  "../00_TESTBED/pattern/INST5_I.dat"
    `define Inst_O  "../00_TESTBED/pattern/INST5_O.dat"
    `define PAT_NUM 40
    `define FLAG 0
`elsif I6
    `define Inst_I  "../00_TESTBED/pattern/INST6_I.dat"
    `define Inst_O  "../00_TESTBED/pattern/INST6_O.dat"
    `define PAT_NUM 40
    `define FLAG 0
`elsif I7
    `define Inst_I  "../00_TESTBED/pattern/INST7_I.dat"
    `define Inst_O  "../00_TESTBED/pattern/INST7_O.dat"
    `define PAT_NUM 40
    `define FLAG 0
`elsif I8
    `define Inst_I  "../00_TESTBED/pattern/INST8_I.dat"
    `define Inst_O  "../00_TESTBED/pattern/INST8_O.dat"
    `define PAT_NUM 40
    `define FLAG 1    
`elsif I9
    `define Inst_I  "../00_TESTBED/pattern/INST9_I.dat"
    `define Inst_O  "../00_TESTBED/pattern/INST9_O.dat"
    `define PAT_NUM 40
    `define FLAG 1
`endif


module testbed;

    parameter INT_W  = 6;
    parameter FRAC_W = 10;
    parameter INST_W = 4;
    parameter DATA_W = INT_W + FRAC_W;

    // inout port
    reg                      i_clk;
    reg                      i_rst_n;
    reg  signed [DATA_W-1:0] i_data_a;
    reg  signed [DATA_W-1:0] i_data_b;
    reg         [INST_W-1:0] i_inst;

    wire                     o_valid;
    wire                     o_busy;
    wire signed [DATA_W-1:0] o_data;

    // self defined
    integer                  i;
    integer                  j;
    integer                  error;
    integer                  correct;
    integer                  over;

    reg [2*DATA_W+INST_W-1:0] inst_idata [0:`PAT_NUM-1];
    reg [(DATA_W+1)-1:0]      inst_odata [0:`PAT_NUM-1];

    reg signed [DATA_W-1:0] test_inA;
    reg signed [DATA_W-1:0] test_inB;
    reg        [INST_W-1:0] test_inst;
    reg signed [DATA_W-1:0] test_outD;


    initial begin
        $readmemb(`Inst_I, inst_idata);
        $readmemb(`Inst_O, inst_odata); 
    end


    alu u_alu (
        .i_clk          (i_clk      ),
        .i_rst_n        (i_rst_n    ),
        .i_data_a       (i_data_a   ),
        .i_data_b       (i_data_b   ),
        .i_inst         (i_inst     ),
        .o_valid        (o_valid    ),
        .o_busy         (o_busy     ),
        .o_data         (o_data     )
    );

    initial i_clk = 0;
    always #(`CYCLE/2.0) i_clk = ~i_clk; 

    initial begin
       $fsdbDumpfile("alu.fsdb");
       $fsdbDumpvars(0, testbed, "+mda");
    end

    initial begin
        i        = 0;
        i_rst_n  = 1;
        i_data_a = 0;
        i_data_b = 0;
        i_inst   = 0;
        j        = 0;
        error    = 0;
        correct  = 0;
        over     = 0;
        reset;

        while (i < `PAT_NUM) begin
            if (!o_busy) begin
                @(negedge i_clk);
                i_data_b = inst_idata[i][DATA_W-1:0];
                i_data_a = inst_idata[i][DATA_W+:DATA_W];
                i_inst   = inst_idata[i][2*DATA_W+:INST_W];
                i = i + 1;
            end
            @(negedge i_clk);
        end      
    end

    always @(negedge i_clk) begin
        if (o_valid) begin
            test_inB  = inst_idata[j][DATA_W-1:0];
            test_inA  = inst_idata[j][DATA_W+:DATA_W];
            test_inst = inst_idata[j][2*DATA_W+:INST_W];
            test_outD = inst_odata[j][DATA_W-1:0];
            if (`FLAG) begin // check FP
                if (test_outD !== o_data) begin
                    $display (
                        "Test[%d]: Error! Inst=%b, A=%b, B=%b, Golden(FP)=%b, Yours(FP)=%b", 
                        j, test_inst, test_inA, test_inB, test_outD, o_data
                    );      
                    error = error+1;        
                end else if (test_outD === o_data) begin
                    correct = correct + 1;
                end
            end else begin // check others
                if (test_outD !== o_data) begin
                    $display (
                        "Test[%d]: Error! Inst=%b, A=%b, B=%b, Golden=%b, Yours=%b", 
                        j, test_inst, test_inA, test_inB, test_outD, o_data
                    );      
                    error = error+1;        
                end else if (test_outD === o_data) begin
                    correct = correct + 1;
                end
            end
            j = j + 1;
        end
        if (j < `PAT_NUM)  over = 0;
        else               over = 1;
    end

    initial begin
        wait(over);
        if(error === 0 && correct === `PAT_NUM) begin
            $display("----------------------------------------------");
            $display("-                 ALL PASS!                  -");
            $display("----------------------------------------------");
        end else begin
            $display("----------------------------------------------");
            $display("  Wrong! Total error: %d                      ", error);
            $display("----------------------------------------------");
        end
        # (2 * `CYCLE);
        $finish;
    end    

    initial begin
        # (`MAX_CYCLE * `CYCLE);
        $display("----------------------------------------------");
        $display("Latency of your design is over 100000 cycles!!");
        $display("----------------------------------------------");
        $finish;
    end

    task reset; begin
        # ( 0.25 * `CYCLE);
        i_rst_n = 0;    
        # ((`RST_DELAY) * `CYCLE);
        i_rst_n = 1;    
    end endtask

endmodule