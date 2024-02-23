// opcode definition
`define OP_ADD      1
`define OP_SUB      2
`define OP_MUL      3
`define OP_ADDI     4
`define OP_LW       5
`define OP_SW       6
`define OP_AND      7
`define OP_OR       8
`define OP_NOR      9
`define OP_BEQ      10
`define OP_BNE      11
`define OP_SLT      12
`define OP_FP_ADD   13
`define OP_FP_SUB   14
`define OP_FP_MUL   15
`define OP_SLL      16
`define OP_SRL      17
`define OP_EOF      18

// MIPS status definition
`define R_TYPE_SUCCESS 0
`define I_TYPE_SUCCESS 1
`define MIPS_OVERFLOW 2
`define MIPS_END 3
