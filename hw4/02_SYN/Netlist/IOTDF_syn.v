/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Mon Nov 20 05:48:27 2023
/////////////////////////////////////////////////////////////


module IOTDF ( clk, rst, in_en, iot_in, fn_sel, busy, valid, iot_out );
  input [7:0] iot_in;
  input [2:0] fn_sel;
  output [127:0] iot_out;
  input clk, rst, in_en;
  output busy, valid;
  wire   DES_first, DES_last, DES_shift, \DES_indata[127] , \DES_indata[126] ,
         \DES_indata[125] , \DES_indata[124] , \DES_indata[123] ,
         \DES_indata[122] , \DES_indata[121] , \DES_indata[120] ,
         \DES_indata[119] , \DES_indata[118] , \DES_indata[117] ,
         \DES_indata[116] , \DES_indata[115] , \DES_indata[114] ,
         \DES_indata[113] , \DES_indata[112] , \DES_indata[111] ,
         \DES_indata[110] , \DES_indata[109] , \DES_indata[108] ,
         \DES_indata[107] , \DES_indata[106] , \DES_indata[105] ,
         \DES_indata[104] , \DES_indata[103] , \DES_indata[102] ,
         \DES_indata[101] , \DES_indata[100] , \DES_indata[99] ,
         \DES_indata[98] , \DES_indata[97] , \DES_indata[96] ,
         \DES_indata[95] , \DES_indata[94] , \DES_indata[93] ,
         \DES_indata[92] , \DES_indata[91] , \DES_indata[90] ,
         \DES_indata[89] , \DES_indata[88] , \DES_indata[87] ,
         \DES_indata[86] , \DES_indata[85] , \DES_indata[84] ,
         \DES_indata[83] , \DES_indata[82] , \DES_indata[81] ,
         \DES_indata[80] , \DES_indata[79] , \DES_indata[78] ,
         \DES_indata[77] , \DES_indata[76] , \DES_indata[75] ,
         \DES_indata[74] , \DES_indata[73] , \DES_indata[72] ,
         \DES_indata[71] , \DES_indata[70] , \DES_indata[69] ,
         \DES_indata[68] , \DES_indata[67] , \DES_indata[66] ,
         \DES_indata[65] , \DES_indata[64] , \DES_indata[63] ,
         \DES_indata[62] , \DES_indata[61] , \DES_indata[60] ,
         \DES_indata[59] , \DES_indata[58] , \DES_indata[57] ,
         \DES_indata[56] , GB_first, enable_count, N237, N240, N243, net546,
         net552, net557, net562, net567, net572, net577, net582, net587,
         net592, net597, net602, net607, net612, net617, net622, net627,
         net632, net637, net642, net647, net652, net657, net662, net667,
         net672, net677, net682, net687, net692, net697, net702, net707,
         net712, n7, n76, n78, n79, n80, n83, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n194, n195, n196, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n2370, n238, n239, n2400, n241,
         n242, n2430, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614;
  wire   [2:0] state_r;
  wire   [3:0] count_r;
  wire   [7:0] GB_indata;
  wire   [2:0] CRC_in;
  wire   [7:0] CRC_indata;
  wire   [63:0] DES_odata;
  wire   [7:0] GB_odata;
  wire   [2:0] CRC_nxt;
  wire   [2:0] state_w;
  wire   [63:0] o_data_w;
  wire   [3:0] count_w;

  DES DES ( .i_clk(clk), .i_rst(rst), .enable(n613), .shift(DES_shift), 
        .first(DES_first), .last(DES_last), .prep_key1(n7), .fnsel(n460), 
        .o_data(DES_odata), .\i_data[127] (\DES_indata[127] ), .\i_data[126] (
        \DES_indata[126] ), .\i_data[125] (\DES_indata[125] ), .\i_data[124] (
        \DES_indata[124] ), .\i_data[123] (\DES_indata[123] ), .\i_data[122] (
        \DES_indata[122] ), .\i_data[121] (\DES_indata[121] ), .\i_data[119] (
        \DES_indata[119] ), .\i_data[118] (\DES_indata[118] ), .\i_data[117] (
        \DES_indata[117] ), .\i_data[116] (\DES_indata[116] ), .\i_data[115] (
        \DES_indata[115] ), .\i_data[114] (\DES_indata[114] ), .\i_data[113] (
        \DES_indata[113] ), .\i_data[111] (\DES_indata[111] ), .\i_data[110] (
        \DES_indata[110] ), .\i_data[109] (\DES_indata[109] ), .\i_data[108] (
        \DES_indata[108] ), .\i_data[107] (\DES_indata[107] ), .\i_data[106] (
        \DES_indata[106] ), .\i_data[105] (\DES_indata[105] ), .\i_data[103] (
        \DES_indata[103] ), .\i_data[102] (\DES_indata[102] ), .\i_data[101] (
        \DES_indata[101] ), .\i_data[100] (\DES_indata[100] ), .\i_data[99] (
        \DES_indata[99] ), .\i_data[98] (\DES_indata[98] ), .\i_data[97] (
        \DES_indata[97] ), .\i_data[95] (\DES_indata[95] ), .\i_data[94] (
        \DES_indata[94] ), .\i_data[93] (\DES_indata[93] ), .\i_data[92] (
        \DES_indata[92] ), .\i_data[91] (\DES_indata[91] ), .\i_data[90] (
        \DES_indata[90] ), .\i_data[89] (\DES_indata[89] ), .\i_data[87] (
        \DES_indata[87] ), .\i_data[86] (\DES_indata[86] ), .\i_data[85] (
        \DES_indata[85] ), .\i_data[84] (\DES_indata[84] ), .\i_data[83] (
        \DES_indata[83] ), .\i_data[82] (\DES_indata[82] ), .\i_data[81] (
        \DES_indata[81] ), .\i_data[79] (\DES_indata[79] ), .\i_data[78] (
        \DES_indata[78] ), .\i_data[77] (\DES_indata[77] ), .\i_data[76] (
        \DES_indata[76] ), .\i_data[75] (\DES_indata[75] ), .\i_data[74] (
        \DES_indata[74] ), .\i_data[73] (\DES_indata[73] ), .\i_data[71] (
        \DES_indata[71] ), .\i_data[70] (\DES_indata[70] ), .\i_data[69] (
        \DES_indata[69] ), .\i_data[68] (\DES_indata[68] ), .\i_data[67] (
        \DES_indata[67] ), .\i_data[66] (\DES_indata[66] ), .\i_data[65] (
        \DES_indata[65] ), .\i_data[63] (\DES_indata[63] ), .\i_data[62] (
        \DES_indata[62] ), .\i_data[61] (\DES_indata[61] ), .\i_data[60] (
        \DES_indata[60] ), .\i_data[59] (\DES_indata[59] ), .\i_data[58] (
        \DES_indata[58] ), .\i_data[57] (\DES_indata[57] ), .\i_data[56] (
        \DES_indata[56] ), .\i_data[55] (n86), .\i_data[54] (n88), 
        .\i_data[53] (n90), .\i_data[52] (n92), .\i_data[51] (n94), 
        .\i_data[50] (n96), .\i_data[49] (n550), .\i_data[48] (n100), 
        .\i_data[47] (n102), .\i_data[46] (n104), .\i_data[45] (n106), 
        .\i_data[44] (n108), .\i_data[43] (n110), .\i_data[42] (n112), 
        .\i_data[41] (n114), .\i_data[40] (n116), .\i_data[39] (n463), 
        .\i_data[38] (n120), .\i_data[37] (n122), .\i_data[36] (n124), 
        .\i_data[35] (n126), .\i_data[34] (n128), .\i_data[33] (n130), 
        .\i_data[32] (n132), .\i_data[31] (n134), .\i_data[30] (n136), 
        .\i_data[29] (n138), .\i_data[28] (n140), .\i_data[27] (n142), 
        .\i_data[26] (n144), .\i_data[25] (n146), .\i_data[24] (n148), 
        .\i_data[23] (n462), .\i_data[22] (n152), .\i_data[21] (n154), 
        .\i_data[20] (n156), .\i_data[19] (n158), .\i_data[18] (n160), 
        .\i_data[17] (n162), .\i_data[16] (n164), .\i_data[15] (n166), 
        .\i_data[14] (n168), .\i_data[13] (n170), .\i_data[12] (n172), 
        .\i_data[11] (n174), .\i_data[10] (n176), .\i_data[9] (n178), 
        .\i_data[8] (n180), .\i_data[7] (n456), .\i_data[6] (n184), 
        .\i_data[5] (n186), .\i_data[4] (n188), .\i_data[3] (n190), 
        .\i_data[2] (n191), .\i_data[1] (n471), .\i_data[0] (n195) );
  Gray_Binary_Conversion GB ( .i_clk(clk), .i_rst(rst), .enable(n450), 
        .fn_sel(n452), .first(GB_first), .i_data(GB_indata), .prev(iot_out[0]), 
        .o_data(GB_odata) );
  CRC3_D8 CRC ( .i_data(CRC_indata), .crc(CRC_in), .crc_nxt(CRC_nxt) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_0 clk_gate_count_r_reg ( .CLK(clk), .EN(
        enable_count), .ENCLK(net546), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_33 clk_gate_o_data_r_reg ( .CLK(clk), .EN(N237), 
        .ENCLK(net552), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_32 clk_gate_o_data_r_reg_0 ( .CLK(clk), .EN(N237), 
        .ENCLK(net557), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_31 clk_gate_o_data_r_reg_1 ( .CLK(clk), .EN(N237), 
        .ENCLK(net562), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_30 clk_gate_o_data_r_reg_2 ( .CLK(clk), .EN(N237), 
        .ENCLK(net567), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_29 clk_gate_o_data_r_reg_3 ( .CLK(clk), .EN(N237), 
        .ENCLK(net572), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_28 clk_gate_o_data_r_reg_4 ( .CLK(clk), .EN(N237), 
        .ENCLK(net577), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_27 clk_gate_o_data_r_reg_5 ( .CLK(clk), .EN(N237), 
        .ENCLK(net582), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_26 clk_gate_o_data_r_reg_6 ( .CLK(clk), .EN(N237), 
        .ENCLK(net587), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_25 clk_gate_o_data_r_reg_7 ( .CLK(clk), .EN(N237), 
        .ENCLK(net592), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_24 clk_gate_o_data_r_reg_8 ( .CLK(clk), .EN(N237), 
        .ENCLK(net597), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_23 clk_gate_o_data_r_reg_9 ( .CLK(clk), .EN(N237), 
        .ENCLK(net602), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_22 clk_gate_o_data_r_reg_10 ( .CLK(clk), .EN(N237), .ENCLK(net607), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_21 clk_gate_o_data_r_reg_11 ( .CLK(clk), .EN(N237), .ENCLK(net612), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_20 clk_gate_o_data_r_reg_12 ( .CLK(clk), .EN(N237), .ENCLK(net617), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_19 clk_gate_o_data_r_reg_13 ( .CLK(clk), .EN(N237), .ENCLK(net622), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_18 clk_gate_o_data_r_reg_14 ( .CLK(clk), .EN(N237), .ENCLK(net627), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_17 clk_gate_o_data_r_reg_15 ( .CLK(clk), .EN(N240), .ENCLK(net632), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_16 clk_gate_o_data_r_reg_16 ( .CLK(clk), .EN(N240), .ENCLK(net637), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_15 clk_gate_o_data_r_reg_17 ( .CLK(clk), .EN(N240), .ENCLK(net642), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_14 clk_gate_o_data_r_reg_18 ( .CLK(clk), .EN(N240), .ENCLK(net647), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_13 clk_gate_o_data_r_reg_19 ( .CLK(clk), .EN(N240), .ENCLK(net652), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_12 clk_gate_o_data_r_reg_20 ( .CLK(clk), .EN(N240), .ENCLK(net657), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_11 clk_gate_o_data_r_reg_21 ( .CLK(clk), .EN(N240), .ENCLK(net662), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_10 clk_gate_o_data_r_reg_22 ( .CLK(clk), .EN(N240), .ENCLK(net667), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_9 clk_gate_o_data_r_reg_23 ( .CLK(clk), .EN(N240), 
        .ENCLK(net672), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_8 clk_gate_o_data_r_reg_24 ( .CLK(clk), .EN(N240), 
        .ENCLK(net677), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_7 clk_gate_o_data_r_reg_25 ( .CLK(clk), .EN(N240), 
        .ENCLK(net682), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_6 clk_gate_o_data_r_reg_26 ( .CLK(clk), .EN(N240), 
        .ENCLK(net687), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_5 clk_gate_o_data_r_reg_27 ( .CLK(clk), .EN(N240), 
        .ENCLK(net692), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_4 clk_gate_o_data_r_reg_28 ( .CLK(clk), .EN(N240), 
        .ENCLK(net697), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_3 clk_gate_o_data_r_reg_29 ( .CLK(clk), .EN(N240), 
        .ENCLK(net702), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_2 clk_gate_o_data_r_reg_30 ( .CLK(clk), .EN(N240), 
        .ENCLK(net707), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_IOTDF_1 clk_gate_o_data_r_reg_31 ( .CLK(clk), .EN(N243), 
        .ENCLK(net712), .TE(1'b0) );
  DFFRX1 o_data_r_reg_0_ ( .D(o_data_w[0]), .CK(net712), .RN(n529), .Q(
        iot_out[0]), .QN(n196) );
  DFFSX1 busy_r_reg ( .D(n449), .CK(clk), .SN(n493), .Q(busy) );
  DFFRX1 valid_r_reg ( .D(n448), .CK(clk), .RN(n482), .Q(valid) );
  DFFRX1 o_data_r_reg_120_ ( .D(n571), .CK(net557), .RN(n483), .Q(iot_out[120]) );
  DFFRX1 o_data_r_reg_64_ ( .D(n549), .CK(net627), .RN(n483), .Q(iot_out[64])
         );
  DFFRX1 o_data_r_reg_72_ ( .D(n579), .CK(net617), .RN(n483), .Q(iot_out[72])
         );
  DFFRX1 o_data_r_reg_80_ ( .D(n587), .CK(net607), .RN(n483), .Q(iot_out[80])
         );
  DFFRX1 o_data_r_reg_88_ ( .D(n595), .CK(net597), .RN(n483), .Q(iot_out[88])
         );
  DFFRX1 o_data_r_reg_96_ ( .D(n603), .CK(net587), .RN(n483), .Q(iot_out[96])
         );
  DFFRX1 o_data_r_reg_104_ ( .D(n559), .CK(net577), .RN(n483), .Q(iot_out[104]) );
  DFFRX1 o_data_r_reg_112_ ( .D(n560), .CK(net567), .RN(n483), .Q(iot_out[112]) );
  DFFRX1 o_data_r_reg_42_ ( .D(o_data_w[42]), .CK(net657), .RN(n487), .Q(
        iot_out[42]), .QN(n111) );
  DFFRX1 o_data_r_reg_75_ ( .D(n582), .CK(net617), .RN(n489), .Q(iot_out[75])
         );
  DFFRX1 o_data_r_reg_123_ ( .D(n574), .CK(net557), .RN(n490), .Q(iot_out[123]) );
  DFFRX1 o_data_r_reg_58_ ( .D(o_data_w[58]), .CK(net637), .RN(n488), .Q(
        iot_out[58]) );
  DFFRX1 o_data_r_reg_121_ ( .D(n572), .CK(net557), .RN(n488), .Q(iot_out[121]) );
  DFFRX1 o_data_r_reg_122_ ( .D(n573), .CK(net557), .RN(n489), .Q(iot_out[122]) );
  DFFRX1 o_data_r_reg_124_ ( .D(n575), .CK(net552), .RN(n491), .Q(iot_out[124]) );
  DFFRX1 o_data_r_reg_125_ ( .D(n576), .CK(net552), .RN(n491), .Q(iot_out[125]) );
  DFFRX1 o_data_r_reg_126_ ( .D(n577), .CK(net552), .RN(n492), .Q(iot_out[126]) );
  DFFRX1 o_data_r_reg_127_ ( .D(n578), .CK(net552), .RN(n493), .Q(iot_out[127]) );
  DFFRX1 o_data_r_reg_67_ ( .D(n546), .CK(net627), .RN(n489), .Q(iot_out[67])
         );
  DFFRX1 o_data_r_reg_65_ ( .D(n548), .CK(net627), .RN(n488), .Q(iot_out[65])
         );
  DFFRX1 o_data_r_reg_73_ ( .D(n580), .CK(net617), .RN(n488), .Q(iot_out[73])
         );
  DFFRX1 o_data_r_reg_81_ ( .D(n588), .CK(net607), .RN(n488), .Q(iot_out[81])
         );
  DFFRX1 o_data_r_reg_89_ ( .D(n596), .CK(net597), .RN(n488), .Q(iot_out[89])
         );
  DFFRX1 o_data_r_reg_97_ ( .D(n604), .CK(net587), .RN(n488), .Q(iot_out[97])
         );
  DFFRX1 o_data_r_reg_105_ ( .D(n561), .CK(net577), .RN(n488), .Q(iot_out[105]) );
  DFFRX1 o_data_r_reg_113_ ( .D(n562), .CK(net567), .RN(n488), .Q(iot_out[113]) );
  DFFRX1 o_data_r_reg_66_ ( .D(n547), .CK(net627), .RN(n488), .Q(iot_out[66])
         );
  DFFRX1 o_data_r_reg_74_ ( .D(n581), .CK(net617), .RN(n489), .Q(iot_out[74])
         );
  DFFRX1 o_data_r_reg_82_ ( .D(n589), .CK(net607), .RN(n489), .Q(iot_out[82])
         );
  DFFRX1 o_data_r_reg_90_ ( .D(n597), .CK(net597), .RN(n489), .Q(iot_out[90])
         );
  DFFRX1 o_data_r_reg_98_ ( .D(n605), .CK(net587), .RN(n489), .Q(iot_out[98])
         );
  DFFRX1 o_data_r_reg_106_ ( .D(n563), .CK(net577), .RN(n489), .Q(iot_out[106]) );
  DFFRX1 o_data_r_reg_114_ ( .D(n564), .CK(net567), .RN(n489), .Q(iot_out[114]) );
  DFFRX1 o_data_r_reg_68_ ( .D(n545), .CK(net622), .RN(n490), .Q(iot_out[68])
         );
  DFFRX1 o_data_r_reg_76_ ( .D(n583), .CK(net612), .RN(n490), .Q(iot_out[76])
         );
  DFFRX1 o_data_r_reg_84_ ( .D(n591), .CK(net602), .RN(n490), .Q(iot_out[84])
         );
  DFFRX1 o_data_r_reg_92_ ( .D(n599), .CK(net592), .RN(n490), .Q(iot_out[92])
         );
  DFFRX1 o_data_r_reg_108_ ( .D(n552), .CK(net572), .RN(n490), .Q(iot_out[108]) );
  DFFRX1 o_data_r_reg_116_ ( .D(n567), .CK(net562), .RN(n490), .Q(iot_out[116]) );
  DFFRX1 o_data_r_reg_69_ ( .D(n544), .CK(net622), .RN(n491), .Q(iot_out[69])
         );
  DFFRX1 o_data_r_reg_77_ ( .D(n584), .CK(net612), .RN(n491), .Q(iot_out[77])
         );
  DFFRX1 o_data_r_reg_85_ ( .D(n592), .CK(net602), .RN(n491), .Q(iot_out[85])
         );
  DFFRX1 o_data_r_reg_93_ ( .D(n600), .CK(net592), .RN(n491), .Q(iot_out[93])
         );
  DFFRX1 o_data_r_reg_101_ ( .D(n553), .CK(net582), .RN(n491), .Q(iot_out[101]) );
  DFFRX1 o_data_r_reg_109_ ( .D(n554), .CK(net572), .RN(n491), .Q(iot_out[109]) );
  DFFRX1 o_data_r_reg_117_ ( .D(n568), .CK(net562), .RN(n491), .Q(iot_out[117]) );
  DFFRX1 o_data_r_reg_70_ ( .D(n543), .CK(net622), .RN(n491), .Q(iot_out[70])
         );
  DFFRX1 o_data_r_reg_78_ ( .D(n585), .CK(net612), .RN(n492), .Q(iot_out[78])
         );
  DFFRX1 o_data_r_reg_86_ ( .D(n593), .CK(net602), .RN(n492), .Q(iot_out[86])
         );
  DFFRX1 o_data_r_reg_94_ ( .D(n601), .CK(net592), .RN(n492), .Q(iot_out[94])
         );
  DFFRX1 o_data_r_reg_102_ ( .D(n555), .CK(net582), .RN(n492), .Q(iot_out[102]) );
  DFFRX1 o_data_r_reg_110_ ( .D(n556), .CK(net572), .RN(n492), .Q(iot_out[110]) );
  DFFRX1 o_data_r_reg_118_ ( .D(n569), .CK(net562), .RN(n492), .Q(iot_out[118]) );
  DFFRX1 o_data_r_reg_71_ ( .D(n542), .CK(net622), .RN(n492), .Q(iot_out[71])
         );
  DFFRX1 o_data_r_reg_79_ ( .D(n586), .CK(net612), .RN(n492), .Q(iot_out[79])
         );
  DFFRX1 o_data_r_reg_87_ ( .D(n594), .CK(net602), .RN(n492), .Q(iot_out[87])
         );
  DFFRX1 o_data_r_reg_95_ ( .D(n602), .CK(net592), .RN(n492), .Q(iot_out[95])
         );
  DFFRX1 o_data_r_reg_103_ ( .D(n557), .CK(net582), .RN(n493), .Q(iot_out[103]) );
  DFFRX1 o_data_r_reg_111_ ( .D(n558), .CK(net572), .RN(n493), .Q(iot_out[111]) );
  DFFRX1 o_data_r_reg_119_ ( .D(n570), .CK(net562), .RN(n493), .Q(iot_out[119]) );
  DFFRX1 o_data_r_reg_100_ ( .D(n551), .CK(net582), .RN(n490), .Q(iot_out[100]) );
  DFFRX1 o_data_r_reg_107_ ( .D(n565), .CK(net577), .RN(n490), .Q(iot_out[107]) );
  DFFRX1 o_data_r_reg_83_ ( .D(n590), .CK(net607), .RN(n489), .Q(iot_out[83])
         );
  DFFRX1 o_data_r_reg_91_ ( .D(n598), .CK(net597), .RN(n489), .Q(iot_out[91])
         );
  DFFRX1 o_data_r_reg_115_ ( .D(n566), .CK(net567), .RN(n490), .Q(iot_out[115]) );
  DFFRX1 o_data_r_reg_52_ ( .D(o_data_w[52]), .CK(net642), .RN(n487), .Q(
        iot_out[52]), .QN(n91) );
  DFFRX1 o_data_r_reg_99_ ( .D(n606), .CK(net587), .RN(n490), .Q(iot_out[99])
         );
  DFFRX1 o_data_r_reg_60_ ( .D(o_data_w[60]), .CK(net632), .RN(n490), .Q(
        iot_out[60]) );
  DFFRX1 o_data_r_reg_54_ ( .D(o_data_w[54]), .CK(net642), .RN(n487), .Q(
        iot_out[54]), .QN(n87) );
  DFFRX1 o_data_r_reg_55_ ( .D(o_data_w[55]), .CK(net642), .RN(n488), .Q(
        iot_out[55]), .QN(n85) );
  DFFRX1 o_data_r_reg_5_ ( .D(o_data_w[5]), .CK(net707), .RN(n484), .Q(
        iot_out[5]), .QN(n185) );
  DFFRX1 o_data_r_reg_49_ ( .D(o_data_w[49]), .CK(net647), .RN(n487), .Q(
        iot_out[49]), .QN(n97) );
  DFFRX1 o_data_r_reg_41_ ( .D(o_data_w[41]), .CK(net657), .RN(n486), .Q(
        iot_out[41]), .QN(n113) );
  DFFRX1 o_data_r_reg_7_ ( .D(o_data_w[7]), .CK(net702), .RN(n484), .Q(
        iot_out[7]), .QN(n181) );
  DFFRX1 o_data_r_reg_47_ ( .D(o_data_w[47]), .CK(net652), .RN(n487), .Q(
        iot_out[47]), .QN(n101) );
  DFFRX1 o_data_r_reg_25_ ( .D(o_data_w[25]), .CK(net677), .RN(n485), .Q(
        iot_out[25]), .QN(n145) );
  DFFRX1 o_data_r_reg_43_ ( .D(o_data_w[43]), .CK(net657), .RN(n487), .Q(
        iot_out[43]), .QN(n109) );
  DFFRX1 o_data_r_reg_63_ ( .D(o_data_w[63]), .CK(net632), .RN(n492), .Q(
        iot_out[63]) );
  DFFRX1 o_data_r_reg_33_ ( .D(o_data_w[33]), .CK(net667), .RN(n486), .Q(
        iot_out[33]), .QN(n129) );
  DFFRX1 o_data_r_reg_6_ ( .D(o_data_w[6]), .CK(net702), .RN(n484), .Q(
        iot_out[6]), .QN(n183) );
  DFFRX1 o_data_r_reg_21_ ( .D(o_data_w[21]), .CK(net682), .RN(n485), .Q(
        iot_out[21]), .QN(n153) );
  DFFRX1 o_data_r_reg_51_ ( .D(o_data_w[51]), .CK(net647), .RN(n487), .Q(
        iot_out[51]), .QN(n93) );
  DFFRX1 o_data_r_reg_3_ ( .D(o_data_w[3]), .CK(net707), .RN(n484), .Q(
        iot_out[3]), .QN(n189) );
  DFFRX1 o_data_r_reg_20_ ( .D(o_data_w[20]), .CK(net682), .RN(n485), .Q(
        iot_out[20]), .QN(n155) );
  DFFRX1 o_data_r_reg_59_ ( .D(o_data_w[59]), .CK(net637), .RN(n489), .Q(
        iot_out[59]) );
  DFFRX1 o_data_r_reg_13_ ( .D(o_data_w[13]), .CK(net692), .RN(n484), .Q(
        iot_out[13]), .QN(n169) );
  DFFRX1 o_data_r_reg_29_ ( .D(o_data_w[29]), .CK(net672), .RN(n486), .Q(
        iot_out[29]), .QN(n137) );
  DFFRX1 o_data_r_reg_15_ ( .D(o_data_w[15]), .CK(net692), .RN(n485), .Q(
        iot_out[15]), .QN(n165) );
  DFFRX1 o_data_r_reg_28_ ( .D(o_data_w[28]), .CK(net672), .RN(n486), .Q(
        iot_out[28]), .QN(n139) );
  DFFRX1 o_data_r_reg_57_ ( .D(o_data_w[57]), .CK(net637), .RN(n488), .Q(
        iot_out[57]) );
  DFFRX1 o_data_r_reg_37_ ( .D(o_data_w[37]), .CK(net662), .RN(n486), .Q(
        iot_out[37]), .QN(n121) );
  DFFRX1 o_data_r_reg_45_ ( .D(o_data_w[45]), .CK(net652), .RN(n487), .Q(
        iot_out[45]), .QN(n105) );
  DFFRX1 o_data_r_reg_12_ ( .D(o_data_w[12]), .CK(net692), .RN(n484), .Q(
        iot_out[12]), .QN(n171) );
  DFFRX1 o_data_r_reg_18_ ( .D(o_data_w[18]), .CK(net687), .RN(n485), .Q(
        iot_out[18]), .QN(n159) );
  DFFRX1 o_data_r_reg_17_ ( .D(o_data_w[17]), .CK(net687), .RN(n485), .Q(
        iot_out[17]), .QN(n161) );
  DFFRX1 o_data_r_reg_19_ ( .D(o_data_w[19]), .CK(net687), .RN(n485), .Q(
        iot_out[19]), .QN(n157) );
  DFFRX1 o_data_r_reg_31_ ( .D(o_data_w[31]), .CK(net672), .RN(n486), .Q(
        iot_out[31]), .QN(n133) );
  DFFRX1 o_data_r_reg_53_ ( .D(o_data_w[53]), .CK(net642), .RN(n487), .Q(
        iot_out[53]), .QN(n89) );
  DFFRX1 o_data_r_reg_61_ ( .D(o_data_w[61]), .CK(net632), .RN(n491), .Q(
        iot_out[61]) );
  DFFRX1 o_data_r_reg_27_ ( .D(o_data_w[27]), .CK(net677), .RN(n485), .Q(
        iot_out[27]), .QN(n141) );
  DFFRX1 o_data_r_reg_11_ ( .D(o_data_w[11]), .CK(net697), .RN(n484), .Q(
        iot_out[11]), .QN(n173) );
  DFFRX1 o_data_r_reg_35_ ( .D(o_data_w[35]), .CK(net667), .RN(n486), .Q(
        iot_out[35]), .QN(n125) );
  DFFRX4 o_data_r_reg_50_ ( .D(o_data_w[50]), .CK(net647), .RN(n529), .Q(
        iot_out[50]), .QN(n95) );
  DFFRX1 o_data_r_reg_16_ ( .D(o_data_w[16]), .CK(net687), .RN(n482), .Q(
        iot_out[16]), .QN(n163) );
  DFFRX1 o_data_r_reg_44_ ( .D(o_data_w[44]), .CK(net652), .RN(n487), .Q(
        iot_out[44]), .QN(n107) );
  DFFRX1 o_data_r_reg_40_ ( .D(o_data_w[40]), .CK(net657), .RN(n483), .Q(
        iot_out[40]), .QN(n115) );
  DFFRX1 o_data_r_reg_10_ ( .D(o_data_w[10]), .CK(net697), .RN(n484), .Q(
        iot_out[10]), .QN(n175) );
  DFFRX1 o_data_r_reg_2_ ( .D(o_data_w[2]), .CK(net712), .RN(n484), .Q(
        iot_out[2]), .QN(n192) );
  DFFRX1 o_data_r_reg_8_ ( .D(o_data_w[8]), .CK(net702), .RN(n529), .Q(
        iot_out[8]), .QN(n179) );
  DFFRX2 o_data_r_reg_1_ ( .D(o_data_w[1]), .CK(net712), .RN(n484), .Q(
        iot_out[1]), .QN(n194) );
  DFFRX1 count_r_reg_1_ ( .D(count_w[1]), .CK(net546), .RN(n529), .Q(
        count_r[1]) );
  DFFRX1 count_r_reg_0_ ( .D(count_w[0]), .CK(net546), .RN(n529), .Q(
        count_r[0]) );
  DFFRX1 state_r_reg_1_ ( .D(state_w[1]), .CK(clk), .RN(n529), .QN(n78) );
  DFFRX1 count_r_reg_2_ ( .D(count_w[2]), .CK(net546), .RN(n529), .Q(
        count_r[2]), .QN(n83) );
  DFFRX1 o_data_r_reg_39_ ( .D(o_data_w[39]), .CK(net662), .RN(n529), .Q(
        iot_out[39]), .QN(n470) );
  DFFRX1 state_r_reg_0_ ( .D(state_w[0]), .CK(clk), .RN(n482), .Q(state_r[0]), 
        .QN(n79) );
  DFFRX1 state_r_reg_2_ ( .D(state_w[2]), .CK(clk), .RN(n482), .Q(state_r[2]), 
        .QN(n76) );
  DFFRX1 count_r_reg_3_ ( .D(count_w[3]), .CK(net546), .RN(n482), .Q(
        count_r[3]), .QN(n80) );
  DFFRX1 o_data_r_reg_46_ ( .D(o_data_w[46]), .CK(net652), .RN(n487), .Q(
        iot_out[46]), .QN(n103) );
  DFFRX1 o_data_r_reg_38_ ( .D(o_data_w[38]), .CK(net662), .RN(n486), .Q(
        iot_out[38]), .QN(n119) );
  DFFRX1 o_data_r_reg_23_ ( .D(o_data_w[23]), .CK(net682), .RN(n485), .Q(
        iot_out[23]), .QN(n149) );
  DFFRX1 o_data_r_reg_22_ ( .D(o_data_w[22]), .CK(net682), .RN(n485), .Q(
        iot_out[22]), .QN(n151) );
  DFFRX1 o_data_r_reg_9_ ( .D(o_data_w[9]), .CK(net697), .RN(n484), .Q(
        iot_out[9]), .QN(n177) );
  DFFRX2 o_data_r_reg_24_ ( .D(o_data_w[24]), .CK(net677), .RN(n482), .Q(
        iot_out[24]), .QN(n147) );
  DFFRX2 o_data_r_reg_36_ ( .D(o_data_w[36]), .CK(net662), .RN(n486), .Q(
        iot_out[36]), .QN(n123) );
  DFFRX2 o_data_r_reg_62_ ( .D(o_data_w[62]), .CK(net632), .RN(n491), .Q(
        iot_out[62]) );
  DFFRX2 o_data_r_reg_30_ ( .D(o_data_w[30]), .CK(net672), .RN(n486), .Q(
        iot_out[30]), .QN(n135) );
  DFFRX2 o_data_r_reg_32_ ( .D(o_data_w[32]), .CK(net667), .RN(n529), .Q(
        iot_out[32]), .QN(n131) );
  DFFRX2 o_data_r_reg_4_ ( .D(o_data_w[4]), .CK(net707), .RN(n484), .Q(
        iot_out[4]), .QN(n187) );
  DFFRX2 o_data_r_reg_48_ ( .D(o_data_w[48]), .CK(net647), .RN(n483), .Q(
        iot_out[48]), .QN(n99) );
  DFFRX4 o_data_r_reg_14_ ( .D(o_data_w[14]), .CK(net692), .RN(n485), .Q(
        iot_out[14]), .QN(n167) );
  DFFRX2 o_data_r_reg_34_ ( .D(o_data_w[34]), .CK(net667), .RN(n486), .Q(
        iot_out[34]), .QN(n127) );
  DFFRX4 o_data_r_reg_26_ ( .D(o_data_w[26]), .CK(net677), .RN(n529), .Q(
        iot_out[26]), .QN(n143) );
  DFFRX2 o_data_r_reg_56_ ( .D(o_data_w[56]), .CK(net637), .RN(n483), .Q(
        iot_out[56]) );
  INVX12 U564 ( .A(n507), .Y(n504) );
  AOI222X2 U565 ( .A0(n191), .A1(n498), .B0(iot_in[2]), .B1(n239), .C0(
        DES_odata[2]), .C1(n525), .Y(n337) );
  NAND3XL U566 ( .A(n458), .B(n459), .C(n354), .Y(o_data_w[22]) );
  INVX1 U567 ( .A(n343), .Y(n158) );
  AND2X1 U568 ( .A(iot_out[57]), .B(n504), .Y(\DES_indata[57] ) );
  AOI22X2 U569 ( .A0(iot_in[6]), .A1(n239), .B0(DES_odata[6]), .B1(n525), .Y(
        n252) );
  AOI222X2 U570 ( .A0(n195), .A1(n498), .B0(iot_in[0]), .B1(n239), .C0(
        DES_odata[0]), .C1(n525), .Y(n405) );
  AOI22XL U571 ( .A0(DES_odata[41]), .A1(n522), .B0(n114), .B1(n496), .Y(n310)
         );
  INVX1 U572 ( .A(n293), .Y(n114) );
  AOI22X2 U573 ( .A0(DES_odata[8]), .A1(n521), .B0(n180), .B1(n498), .Y(n224)
         );
  CLKAND2X3 U574 ( .A(iot_out[7]), .B(n505), .Y(n456) );
  AOI22XL U575 ( .A0(DES_odata[37]), .A1(n523), .B0(n122), .B1(n496), .Y(n321)
         );
  INVX1 U576 ( .A(n301), .Y(n122) );
  INVXL U577 ( .A(n508), .Y(n453) );
  INVX4 U578 ( .A(n506), .Y(n505) );
  INVX8 U579 ( .A(n508), .Y(n503) );
  AOI31X4 U580 ( .A0(fn_sel[0]), .A1(n607), .A2(n457), .B0(n451), .Y(n407) );
  BUFX12 U581 ( .A(n407), .Y(n499) );
  CLKBUFX2 U582 ( .A(n407), .Y(n500) );
  BUFX8 U583 ( .A(n499), .Y(n506) );
  BUFX8 U584 ( .A(n499), .Y(n507) );
  NOR2BX1 U585 ( .AN(fn_sel[0]), .B(n480), .Y(n452) );
  NAND2X1 U586 ( .A(n613), .B(n76), .Y(n406) );
  NAND2XL U587 ( .A(iot_out[45]), .B(n504), .Y(n282) );
  CLKINVX1 U588 ( .A(n357), .Y(n172) );
  NAND2XL U589 ( .A(iot_out[49]), .B(n504), .Y(n274) );
  NOR2X1 U590 ( .A(n406), .B(n608), .Y(DES_first) );
  NOR4X1 U591 ( .A(count_r[0]), .B(count_r[1]), .C(count_r[2]), .D(count_r[3]), 
        .Y(n444) );
  OR2X1 U592 ( .A(n457), .B(fn_sel[0]), .Y(n464) );
  CLKINVX1 U593 ( .A(n444), .Y(n608) );
  BUFX8 U594 ( .A(n499), .Y(n508) );
  NAND2X4 U595 ( .A(fn_sel[2]), .B(n457), .Y(n480) );
  NAND2X1 U596 ( .A(iot_out[27]), .B(n504), .Y(n324) );
  AOI22X1 U597 ( .A0(DES_odata[38]), .A1(n523), .B0(n120), .B1(n496), .Y(n319)
         );
  NAND3X1 U598 ( .A(n467), .B(n468), .C(n393), .Y(o_data_w[10]) );
  AOI22X1 U599 ( .A0(DES_odata[10]), .A1(n525), .B0(n176), .B1(n494), .Y(n393)
         );
  AOI22X1 U600 ( .A0(DES_odata[16]), .A1(n524), .B0(n164), .B1(n494), .Y(n368)
         );
  AOI22X1 U601 ( .A0(DES_odata[48]), .A1(n522), .B0(n100), .B1(n497), .Y(n296)
         );
  NAND2X1 U602 ( .A(iot_out[5]), .B(n504), .Y(n267) );
  AOI22XL U603 ( .A0(GB_odata[1]), .A1(n516), .B0(CRC_nxt[1]), .B1(n338), .Y(
        n359) );
  CLKBUFX2 U604 ( .A(n500), .Y(n509) );
  INVX4 U605 ( .A(fn_sel[1]), .Y(n457) );
  INVX1 U606 ( .A(n278), .Y(n102) );
  CLKINVX1 U607 ( .A(n267), .Y(n186) );
  NAND2X1 U608 ( .A(iot_out[53]), .B(n504), .Y(n263) );
  CLKINVX1 U609 ( .A(n263), .Y(n90) );
  CLKINVX1 U610 ( .A(n282), .Y(n106) );
  CLKINVX1 U611 ( .A(n324), .Y(n142) );
  NAND2X1 U612 ( .A(iot_out[25]), .B(n504), .Y(n328) );
  NAND2X1 U613 ( .A(iot_out[11]), .B(n505), .Y(n361) );
  CLKINVX1 U614 ( .A(n361), .Y(n174) );
  AND2X2 U615 ( .A(iot_out[23]), .B(n505), .Y(n462) );
  AND2X2 U616 ( .A(iot_out[1]), .B(n504), .Y(n471) );
  NAND2X1 U617 ( .A(iot_out[35]), .B(n504), .Y(n305) );
  CLKINVX1 U618 ( .A(n305), .Y(n126) );
  NAND2X1 U619 ( .A(iot_out[0]), .B(n504), .Y(n223) );
  INVX1 U620 ( .A(n421), .Y(n613) );
  NAND2X1 U621 ( .A(iot_out[12]), .B(n505), .Y(n357) );
  AND2X2 U622 ( .A(iot_out[59]), .B(n504), .Y(\DES_indata[59] ) );
  AND2X2 U623 ( .A(iot_out[61]), .B(n505), .Y(\DES_indata[61] ) );
  CLKINVX1 U624 ( .A(n328), .Y(n146) );
  AND2X2 U625 ( .A(iot_out[63]), .B(n504), .Y(\DES_indata[63] ) );
  OR2X1 U626 ( .A(n526), .B(n209), .Y(n454) );
  OR2X1 U627 ( .A(n194), .B(n518), .Y(n455) );
  NAND3XL U628 ( .A(n454), .B(n455), .C(n210), .Y(o_data_w[9]) );
  NAND2X1 U629 ( .A(iot_out[3]), .B(n504), .Y(n313) );
  OR2X1 U630 ( .A(n526), .B(n353), .Y(n458) );
  OR2X1 U631 ( .A(n518), .B(n167), .Y(n459) );
  NOR2XL U632 ( .A(fn_sel[2]), .B(n464), .Y(n460) );
  OR2X2 U633 ( .A(fn_sel[2]), .B(fn_sel[0]), .Y(n461) );
  NOR2BX2 U634 ( .AN(fn_sel[1]), .B(n461), .Y(n451) );
  NOR2X1 U635 ( .A(n470), .B(n407), .Y(n463) );
  OR2X1 U636 ( .A(n526), .B(n299), .Y(n465) );
  OR2X1 U637 ( .A(n518), .B(n119), .Y(n466) );
  NAND3X1 U638 ( .A(n465), .B(n466), .C(n300), .Y(o_data_w[46]) );
  OR2XL U639 ( .A(n470), .B(n499), .Y(n297) );
  CLKINVX1 U640 ( .A(n274), .Y(n550) );
  NAND2XL U641 ( .A(iot_out[2]), .B(n504), .Y(n392) );
  OR2X1 U642 ( .A(n526), .B(n392), .Y(n467) );
  OR2X1 U643 ( .A(n518), .B(n192), .Y(n468) );
  CLKBUFX2 U644 ( .A(n480), .Y(n469) );
  NOR2XL U645 ( .A(n469), .B(n533), .Y(GB_indata[4]) );
  NOR2XL U646 ( .A(n480), .B(n530), .Y(GB_indata[7]) );
  NOR2XL U647 ( .A(n469), .B(n534), .Y(GB_indata[3]) );
  NOR2XL U648 ( .A(n469), .B(n535), .Y(GB_indata[2]) );
  NAND2X1 U649 ( .A(iot_out[31]), .B(n504), .Y(n316) );
  NOR2XL U650 ( .A(n469), .B(n531), .Y(GB_indata[6]) );
  NAND2XL U651 ( .A(GB_odata[6]), .B(n516), .Y(n251) );
  NAND3XL U652 ( .A(n472), .B(n473), .C(n312), .Y(o_data_w[40]) );
  NAND2BX1 U653 ( .AN(n78), .B(n79), .Y(n421) );
  NAND3XL U654 ( .A(n474), .B(n475), .C(n304), .Y(o_data_w[44]) );
  OR2X1 U655 ( .A(n526), .B(n311), .Y(n472) );
  OR2X1 U656 ( .A(n518), .B(n131), .Y(n473) );
  NAND3XL U657 ( .A(n478), .B(n479), .C(n368), .Y(o_data_w[16]) );
  OR2XL U658 ( .A(n526), .B(n367), .Y(n478) );
  NAND3XL U659 ( .A(n476), .B(n477), .C(n319), .Y(o_data_w[38]) );
  OR2XL U660 ( .A(n526), .B(n318), .Y(n476) );
  OR2X1 U661 ( .A(n526), .B(n303), .Y(n474) );
  OR2X1 U662 ( .A(n518), .B(n123), .Y(n475) );
  AOI22X1 U663 ( .A0(iot_in[7]), .A1(n239), .B0(DES_odata[7]), .B1(n525), .Y(
        n238) );
  NAND2XL U664 ( .A(n79), .B(n78), .Y(n411) );
  OR2X1 U665 ( .A(n518), .B(n135), .Y(n477) );
  OR2X1 U666 ( .A(n518), .B(n179), .Y(n479) );
  CLKINVX1 U667 ( .A(n235), .Y(n612) );
  INVX1 U668 ( .A(n290), .Y(n188) );
  INVXL U669 ( .A(n363), .Y(n176) );
  INVX1 U670 ( .A(n259), .Y(n86) );
  INVXL U671 ( .A(n250), .Y(n184) );
  INVXL U672 ( .A(n318), .Y(n136) );
  CLKINVX1 U673 ( .A(n223), .Y(n195) );
  NOR2XL U674 ( .A(n610), .B(n469), .Y(n213) );
  NOR2XL U675 ( .A(n406), .B(n515), .Y(n211) );
  CLKINVX1 U676 ( .A(n526), .Y(n527) );
  NAND2XL U677 ( .A(n404), .B(n405), .Y(o_data_w[0]) );
  NAND2X1 U678 ( .A(iot_out[7]), .B(n503), .Y(n236) );
  NAND2XL U679 ( .A(iot_out[23]), .B(n503), .Y(n332) );
  OAI211XL U680 ( .A0(n235), .A1(n267), .B0(n268), .C0(n269), .Y(o_data_w[5])
         );
  NAND2XL U681 ( .A(iot_out[1]), .B(n503), .Y(n209) );
  NAND2XL U682 ( .A(n336), .B(n337), .Y(o_data_w[2]) );
  NAND2XL U683 ( .A(iot_out[28]), .B(n503), .Y(n322) );
  NAND2XL U684 ( .A(iot_out[15]), .B(n504), .Y(n351) );
  NAND2XL U685 ( .A(iot_out[51]), .B(n453), .Y(n270) );
  NAND2XL U686 ( .A(iot_out[43]), .B(n504), .Y(n286) );
  NAND2XL U687 ( .A(GB_odata[4]), .B(n516), .Y(n291) );
  NAND2XL U688 ( .A(iot_out[20]), .B(n503), .Y(n341) );
  NAND2XL U689 ( .A(iot_out[14]), .B(n505), .Y(n353) );
  NAND2XL U690 ( .A(iot_out[16]), .B(n504), .Y(n349) );
  NAND2XL U691 ( .A(iot_out[9]), .B(n505), .Y(n365) );
  NAND2XL U692 ( .A(iot_out[19]), .B(n504), .Y(n343) );
  INVX1 U693 ( .A(iot_in[7]), .Y(n530) );
  NAND2XL U694 ( .A(iot_out[8]), .B(n504), .Y(n367) );
  NAND2XL U695 ( .A(iot_out[24]), .B(n504), .Y(n330) );
  NAND2XL U696 ( .A(GB_odata[3]), .B(n516), .Y(n314) );
  NAND2XL U697 ( .A(iot_out[13]), .B(n503), .Y(n355) );
  NOR2X1 U698 ( .A(n411), .B(n76), .Y(n450) );
  OAI211XL U699 ( .A0(n235), .A1(n236), .B0(n2370), .C0(n238), .Y(o_data_w[7])
         );
  NAND2XL U700 ( .A(GB_odata[7]), .B(n516), .Y(n2370) );
  NAND2XL U701 ( .A(iot_out[21]), .B(n504), .Y(n339) );
  NAND2XL U702 ( .A(iot_out[18]), .B(n504), .Y(n345) );
  NAND2XL U703 ( .A(iot_out[29]), .B(n504), .Y(n320) );
  NAND2XL U704 ( .A(iot_out[26]), .B(n503), .Y(n326) );
  NAND2XL U705 ( .A(iot_out[17]), .B(n504), .Y(n347) );
  NAND2XL U706 ( .A(iot_out[22]), .B(n503), .Y(n334) );
  AND2XL U707 ( .A(iot_out[58]), .B(n503), .Y(\DES_indata[58] ) );
  NAND2XL U708 ( .A(iot_out[42]), .B(n503), .Y(n288) );
  NAND2XL U709 ( .A(iot_out[40]), .B(n503), .Y(n295) );
  NAND2XL U710 ( .A(iot_out[48]), .B(n503), .Y(n276) );
  NAND2XL U711 ( .A(iot_out[46]), .B(n503), .Y(n280) );
  NAND2XL U712 ( .A(iot_out[44]), .B(n503), .Y(n284) );
  AND2XL U713 ( .A(iot_out[56]), .B(n503), .Y(\DES_indata[56] ) );
  AND2XL U714 ( .A(iot_out[62]), .B(n503), .Y(\DES_indata[62] ) );
  AND2XL U715 ( .A(iot_out[60]), .B(n503), .Y(\DES_indata[60] ) );
  NAND2XL U716 ( .A(iot_out[52]), .B(n503), .Y(n265) );
  NAND2XL U717 ( .A(iot_out[54]), .B(n503), .Y(n261) );
  NAND2XL U718 ( .A(iot_out[50]), .B(n503), .Y(n272) );
  NAND2XL U719 ( .A(iot_out[34]), .B(n503), .Y(n307) );
  NAND2XL U720 ( .A(iot_out[32]), .B(n503), .Y(n311) );
  NAND2XL U721 ( .A(iot_out[38]), .B(n503), .Y(n299) );
  NAND2XL U722 ( .A(iot_out[36]), .B(n503), .Y(n303) );
  OAI21XL U723 ( .A0(n442), .A1(n421), .B0(n430), .Y(DES_shift) );
  NOR2XL U724 ( .A(n530), .B(n446), .Y(CRC_indata[7]) );
  NAND2BX1 U725 ( .AN(n415), .B(in_en), .Y(n446) );
  NAND3XL U726 ( .A(n410), .B(n411), .C(n412), .Y(state_w[2]) );
  NAND2XL U727 ( .A(n613), .B(state_r[2]), .Y(n430) );
  NAND3XL U728 ( .A(count_r[0]), .B(n614), .C(count_r[3]), .Y(n420) );
  NAND2XL U729 ( .A(n441), .B(n76), .Y(n422) );
  OAI21XL U730 ( .A0(n80), .A1(n481), .B0(n432), .Y(count_w[3]) );
  OA21XL U731 ( .A0(count_r[2]), .A1(n611), .B0(n433), .Y(n481) );
  NOR2XL U732 ( .A(n411), .B(state_r[2]), .Y(n418) );
  NAND3XL U733 ( .A(state_r[0]), .B(n78), .C(state_r[2]), .Y(n409) );
  CLKINVX1 U734 ( .A(rst), .Y(n529) );
  CLKBUFX3 U735 ( .A(n520), .Y(n525) );
  CLKBUFX3 U736 ( .A(n519), .Y(n523) );
  CLKBUFX3 U737 ( .A(n519), .Y(n521) );
  CLKBUFX3 U738 ( .A(n519), .Y(n522) );
  NOR2X1 U739 ( .A(n526), .B(n513), .Y(n239) );
  CLKBUFX3 U740 ( .A(n520), .Y(n524) );
  INVX3 U741 ( .A(n517), .Y(n516) );
  CLKBUFX3 U742 ( .A(n612), .Y(n498) );
  CLKBUFX3 U743 ( .A(n612), .Y(n497) );
  CLKBUFX3 U744 ( .A(n612), .Y(n495) );
  CLKBUFX3 U745 ( .A(n612), .Y(n494) );
  CLKBUFX3 U746 ( .A(n612), .Y(n496) );
  CLKBUFX3 U747 ( .A(n500), .Y(n510) );
  CLKBUFX3 U748 ( .A(n501), .Y(n514) );
  CLKBUFX3 U749 ( .A(n500), .Y(n511) );
  CLKBUFX3 U750 ( .A(n501), .Y(n513) );
  CLKBUFX3 U751 ( .A(n501), .Y(n512) );
  CLKBUFX3 U752 ( .A(n211), .Y(n520) );
  CLKBUFX3 U753 ( .A(n211), .Y(n519) );
  NOR2X1 U754 ( .A(n436), .B(n438), .Y(N240) );
  AND2X2 U755 ( .A(n439), .B(n512), .Y(n436) );
  NOR2X1 U756 ( .A(n436), .B(n437), .Y(N243) );
  CLKINVX1 U757 ( .A(n213), .Y(n517) );
  CLKINVX1 U758 ( .A(n213), .Y(n518) );
  NOR2X1 U759 ( .A(n338), .B(n516), .Y(n439) );
  CLKINVX1 U760 ( .A(n349), .Y(n164) );
  CLKINVX1 U761 ( .A(n347), .Y(n162) );
  CLKINVX1 U762 ( .A(n345), .Y(n160) );
  CLKINVX1 U763 ( .A(n316), .Y(n134) );
  CLKINVX1 U764 ( .A(n322), .Y(n140) );
  CLKINVX1 U765 ( .A(n351), .Y(n166) );
  CLKINVX1 U766 ( .A(n355), .Y(n170) );
  CLKINVX1 U767 ( .A(n353), .Y(n168) );
  CLKINVX1 U768 ( .A(n320), .Y(n138) );
  CLKINVX1 U769 ( .A(n313), .Y(n190) );
  CLKINVX1 U770 ( .A(n270), .Y(n94) );
  CLKINVX1 U771 ( .A(n367), .Y(n180) );
  CLKINVX1 U772 ( .A(n341), .Y(n156) );
  CLKINVX1 U773 ( .A(n365), .Y(n178) );
  CLKINVX1 U774 ( .A(n286), .Y(n110) );
  CLKINVX1 U775 ( .A(n339), .Y(n154) );
  CLKINVX1 U776 ( .A(n309), .Y(n130) );
  CLKINVX1 U777 ( .A(n330), .Y(n148) );
  CLKINVX1 U778 ( .A(n326), .Y(n144) );
  CLKINVX1 U779 ( .A(n392), .Y(n191) );
  CLKINVX1 U780 ( .A(n334), .Y(n152) );
  CLKINVX1 U781 ( .A(n450), .Y(n610) );
  CLKINVX1 U782 ( .A(n272), .Y(n96) );
  CLKINVX1 U783 ( .A(n311), .Y(n132) );
  NOR2X1 U784 ( .A(n469), .B(n532), .Y(GB_indata[5]) );
  CLKINVX1 U785 ( .A(n299), .Y(n120) );
  CLKINVX1 U786 ( .A(n261), .Y(n88) );
  CLKINVX1 U787 ( .A(n307), .Y(n128) );
  CLKINVX1 U788 ( .A(n295), .Y(n116) );
  CLKINVX1 U789 ( .A(n284), .Y(n108) );
  CLKINVX1 U790 ( .A(n303), .Y(n124) );
  CLKINVX1 U791 ( .A(n265), .Y(n92) );
  CLKINVX1 U792 ( .A(n276), .Y(n100) );
  CLKINVX1 U793 ( .A(n280), .Y(n104) );
  CLKBUFX2 U794 ( .A(n407), .Y(n501) );
  CLKINVX1 U795 ( .A(n288), .Y(n112) );
  CLKBUFX3 U796 ( .A(n502), .Y(n515) );
  CLKBUFX2 U797 ( .A(n407), .Y(n502) );
  CLKINVX1 U798 ( .A(state_w[0]), .Y(n539) );
  NOR2X1 U799 ( .A(n534), .B(n446), .Y(CRC_indata[3]) );
  NOR2X1 U800 ( .A(n533), .B(n446), .Y(CRC_indata[4]) );
  NOR2X1 U801 ( .A(n535), .B(n446), .Y(CRC_indata[2]) );
  NOR2X1 U802 ( .A(n537), .B(n446), .Y(CRC_indata[0]) );
  NOR2X1 U803 ( .A(n532), .B(n446), .Y(CRC_indata[5]) );
  NOR2BX1 U804 ( .AN(n440), .B(n438), .Y(N237) );
  OAI2BB1XL U805 ( .A0N(n503), .A1N(n406), .B0(n439), .Y(n440) );
  NOR2X1 U806 ( .A(n536), .B(n446), .Y(CRC_indata[1]) );
  NOR2X1 U807 ( .A(n531), .B(n446), .Y(CRC_indata[6]) );
  CLKINVX1 U808 ( .A(n428), .Y(n614) );
  CLKINVX1 U809 ( .A(n420), .Y(n609) );
  NOR2X1 U810 ( .A(n469), .B(n536), .Y(GB_indata[1]) );
  CLKINVX1 U811 ( .A(n430), .Y(n7) );
  NOR2XL U812 ( .A(n420), .B(n406), .Y(DES_last) );
  NOR2XL U813 ( .A(n608), .B(n422), .Y(n447) );
  NAND2XL U814 ( .A(n406), .B(n526), .Y(n235) );
  NOR2X1 U815 ( .A(n469), .B(n537), .Y(GB_indata[0]) );
  NOR2X1 U816 ( .A(n422), .B(n415), .Y(n338) );
  CLKINVX1 U817 ( .A(enable_count), .Y(n611) );
  NAND4BX1 U818 ( .AN(n418), .B(n409), .C(n414), .D(n430), .Y(n437) );
  NAND2BX1 U819 ( .AN(n437), .B(n422), .Y(n438) );
  CLKINVX1 U820 ( .A(n526), .Y(n528) );
  CLKBUFX3 U821 ( .A(n529), .Y(n492) );
  CLKBUFX3 U822 ( .A(n529), .Y(n491) );
  CLKBUFX3 U823 ( .A(n529), .Y(n490) );
  CLKBUFX3 U824 ( .A(n529), .Y(n489) );
  CLKBUFX3 U825 ( .A(n529), .Y(n488) );
  CLKBUFX3 U826 ( .A(n529), .Y(n486) );
  CLKBUFX3 U827 ( .A(n529), .Y(n484) );
  CLKBUFX3 U828 ( .A(n529), .Y(n487) );
  CLKBUFX3 U829 ( .A(n529), .Y(n485) );
  CLKBUFX3 U830 ( .A(n529), .Y(n483) );
  CLKBUFX3 U831 ( .A(n529), .Y(n482) );
  CLKBUFX3 U832 ( .A(n529), .Y(n493) );
  AOI22X1 U833 ( .A0(GB_odata[0]), .A1(n516), .B0(CRC_nxt[0]), .B1(n338), .Y(
        n404) );
  OAI221XL U834 ( .A0(n526), .A1(n223), .B0(n518), .B1(n196), .C0(n224), .Y(
        o_data_w[8]) );
  INVXL U835 ( .A(fn_sel[2]), .Y(n607) );
  OAI221XL U836 ( .A0(n526), .A1(n330), .B0(n518), .B1(n147), .C0(n331), .Y(
        o_data_w[32]) );
  AOI22X1 U837 ( .A0(DES_odata[32]), .A1(n523), .B0(n132), .B1(n495), .Y(n331)
         );
  OAI221XL U838 ( .A0(n526), .A1(n288), .B0(n517), .B1(n111), .C0(n289), .Y(
        o_data_w[50]) );
  AOI22X1 U839 ( .A0(DES_odata[50]), .A1(n522), .B0(n96), .B1(n497), .Y(n289)
         );
  NAND2XL U840 ( .A(iot_out[37]), .B(n504), .Y(n301) );
  AOI22X1 U841 ( .A0(DES_odata[26]), .A1(n524), .B0(n144), .B1(n495), .Y(n346)
         );
  OAI211XL U842 ( .A0(n235), .A1(n250), .B0(n251), .C0(n252), .Y(o_data_w[6])
         );
  NAND2XL U843 ( .A(iot_out[30]), .B(n503), .Y(n318) );
  OAI211XL U844 ( .A0(n235), .A1(n313), .B0(n314), .C0(n315), .Y(o_data_w[3])
         );
  AOI22X1 U845 ( .A0(iot_in[3]), .A1(n239), .B0(DES_odata[3]), .B1(n525), .Y(
        n315) );
  OAI221XL U846 ( .A0(n526), .A1(n290), .B0(n518), .B1(n187), .C0(n372), .Y(
        o_data_w[12]) );
  AOI22X1 U847 ( .A0(DES_odata[12]), .A1(n525), .B0(n172), .B1(n494), .Y(n372)
         );
  AOI22X1 U848 ( .A0(DES_odata[40]), .A1(n522), .B0(n116), .B1(n496), .Y(n312)
         );
  OAI221XL U849 ( .A0(n526), .A1(n307), .B0(n518), .B1(n127), .C0(n308), .Y(
        o_data_w[42]) );
  AOI22X1 U850 ( .A0(DES_odata[42]), .A1(n522), .B0(n112), .B1(n496), .Y(n308)
         );
  OAI221XL U851 ( .A0(n526), .A1(n363), .B0(n518), .B1(n175), .C0(n364), .Y(
        o_data_w[18]) );
  AOI22X1 U852 ( .A0(DES_odata[18]), .A1(n524), .B0(n160), .B1(n494), .Y(n364)
         );
  NAND2XL U853 ( .A(iot_out[33]), .B(n504), .Y(n309) );
  OAI221XL U854 ( .A0(n526), .A1(n326), .B0(n518), .B1(n143), .C0(n327), .Y(
        o_data_w[34]) );
  AOI22X1 U855 ( .A0(DES_odata[34]), .A1(n523), .B0(n128), .B1(n496), .Y(n327)
         );
  AOI22X1 U856 ( .A0(GB_odata[2]), .A1(n516), .B0(CRC_nxt[2]), .B1(n338), .Y(
        n336) );
  OAI221XL U857 ( .A0(n526), .A1(n349), .B0(n518), .B1(n163), .C0(n350), .Y(
        o_data_w[24]) );
  AOI22X1 U858 ( .A0(DES_odata[24]), .A1(n524), .B0(n148), .B1(n495), .Y(n350)
         );
  NAND2XL U859 ( .A(iot_out[47]), .B(n504), .Y(n278) );
  AOI22X1 U860 ( .A0(DES_odata[9]), .A1(n523), .B0(n178), .B1(n494), .Y(n210)
         );
  NAND2XL U861 ( .A(iot_out[10]), .B(n505), .Y(n363) );
  OAI221XL U862 ( .A0(n526), .A1(n267), .B0(n518), .B1(n185), .C0(n371), .Y(
        o_data_w[13]) );
  AOI22X1 U863 ( .A0(DES_odata[13]), .A1(n524), .B0(n170), .B1(n494), .Y(n371)
         );
  NAND2XL U864 ( .A(iot_out[4]), .B(n504), .Y(n290) );
  OAI221XL U865 ( .A0(n526), .A1(n313), .B0(n518), .B1(n189), .C0(n381), .Y(
        o_data_w[11]) );
  AOI22X1 U866 ( .A0(DES_odata[11]), .A1(n524), .B0(n174), .B1(n494), .Y(n381)
         );
  NAND2XL U867 ( .A(iot_out[41]), .B(n504), .Y(n293) );
  NAND2X1 U868 ( .A(GB_odata[5]), .B(n516), .Y(n268) );
  AOI22X1 U869 ( .A0(iot_in[5]), .A1(n239), .B0(DES_odata[5]), .B1(n525), .Y(
        n269) );
  OAI211XL U870 ( .A0(n235), .A1(n290), .B0(n291), .C0(n292), .Y(o_data_w[4])
         );
  AOI22X1 U871 ( .A0(iot_in[4]), .A1(n239), .B0(DES_odata[4]), .B1(n525), .Y(
        n292) );
  OAI221XL U872 ( .A0(n526), .A1(n341), .B0(n518), .B1(n155), .C0(n342), .Y(
        o_data_w[28]) );
  AOI22X1 U873 ( .A0(DES_odata[28]), .A1(n523), .B0(n140), .B1(n495), .Y(n342)
         );
  OAI221XL U874 ( .A0(n208), .A1(n272), .B0(n518), .B1(n95), .C0(n273), .Y(
        o_data_w[58]) );
  AOI22X1 U875 ( .A0(DES_odata[58]), .A1(n521), .B0(\DES_indata[58] ), .B1(
        n497), .Y(n273) );
  OAI221XL U876 ( .A0(n526), .A1(n334), .B0(n518), .B1(n151), .C0(n335), .Y(
        o_data_w[30]) );
  AOI22X1 U877 ( .A0(DES_odata[30]), .A1(n523), .B0(n136), .B1(n495), .Y(n335)
         );
  AOI22X1 U878 ( .A0(DES_odata[22]), .A1(n524), .B0(n152), .B1(n496), .Y(n354)
         );
  OAI221XL U879 ( .A0(n526), .A1(n343), .B0(n518), .B1(n157), .C0(n344), .Y(
        o_data_w[27]) );
  AOI22X1 U880 ( .A0(DES_odata[27]), .A1(n524), .B0(n142), .B1(n495), .Y(n344)
         );
  OAI221XL U881 ( .A0(n526), .A1(n357), .B0(n518), .B1(n171), .C0(n358), .Y(
        o_data_w[20]) );
  AOI22X1 U882 ( .A0(DES_odata[20]), .A1(n523), .B0(n156), .B1(n494), .Y(n358)
         );
  OAI221XL U883 ( .A0(n526), .A1(n284), .B0(n517), .B1(n107), .C0(n285), .Y(
        o_data_w[52]) );
  AOI22X1 U884 ( .A0(DES_odata[52]), .A1(n521), .B0(n92), .B1(n497), .Y(n285)
         );
  NAND2X1 U885 ( .A(n359), .B(n360), .Y(o_data_w[1]) );
  AOI222XL U886 ( .A0(n471), .A1(n498), .B0(iot_in[1]), .B1(n239), .C0(
        DES_odata[1]), .C1(n525), .Y(n360) );
  OAI221XL U887 ( .A0(n208), .A1(n295), .B0(n517), .B1(n115), .C0(n296), .Y(
        o_data_w[48]) );
  OAI221XL U888 ( .A0(n526), .A1(n276), .B0(n517), .B1(n99), .C0(n277), .Y(
        o_data_w[56]) );
  AOI22X1 U889 ( .A0(DES_odata[56]), .A1(n521), .B0(\DES_indata[56] ), .B1(
        n497), .Y(n277) );
  OAI221XL U890 ( .A0(n208), .A1(n339), .B0(n518), .B1(n153), .C0(n340), .Y(
        o_data_w[29]) );
  AOI22X1 U891 ( .A0(DES_odata[29]), .A1(n523), .B0(n138), .B1(n495), .Y(n340)
         );
  OAI221XL U892 ( .A0(n208), .A1(n332), .B0(n518), .B1(n149), .C0(n333), .Y(
        o_data_w[31]) );
  AOI22X1 U893 ( .A0(DES_odata[31]), .A1(n523), .B0(n134), .B1(n495), .Y(n333)
         );
  OAI221XL U894 ( .A0(n365), .A1(n526), .B0(n177), .B1(n518), .C0(n366), .Y(
        o_data_w[17]) );
  AOI22X1 U895 ( .A0(DES_odata[17]), .A1(n524), .B0(n162), .B1(n494), .Y(n366)
         );
  OAI221XL U896 ( .A0(n208), .A1(n355), .B0(n518), .B1(n169), .C0(n356), .Y(
        o_data_w[21]) );
  AOI22X1 U897 ( .A0(DES_odata[21]), .A1(n524), .B0(n154), .B1(n495), .Y(n356)
         );
  OAI221XL U898 ( .A0(n208), .A1(n280), .B0(n517), .B1(n103), .C0(n281), .Y(
        o_data_w[54]) );
  AOI22X1 U899 ( .A0(DES_odata[54]), .A1(n521), .B0(n88), .B1(n497), .Y(n281)
         );
  AOI22X1 U900 ( .A0(DES_odata[44]), .A1(n522), .B0(n108), .B1(n496), .Y(n304)
         );
  OAI221XL U901 ( .A0(n526), .A1(n236), .B0(n518), .B1(n181), .C0(n369), .Y(
        o_data_w[15]) );
  AOI22X1 U902 ( .A0(DES_odata[15]), .A1(n525), .B0(n166), .B1(n494), .Y(n369)
         );
  OAI221XL U903 ( .A0(n526), .A1(n261), .B0(n518), .B1(n87), .C0(n262), .Y(
        o_data_w[62]) );
  AOI22X1 U904 ( .A0(DES_odata[62]), .A1(n521), .B0(\DES_indata[62] ), .B1(
        n498), .Y(n262) );
  OAI221XL U905 ( .A0(n526), .A1(n250), .B0(n518), .B1(n183), .C0(n370), .Y(
        o_data_w[14]) );
  AOI22X1 U906 ( .A0(DES_odata[14]), .A1(n525), .B0(n168), .B1(n494), .Y(n370)
         );
  OAI221XL U907 ( .A0(n526), .A1(n347), .B0(n518), .B1(n161), .C0(n348), .Y(
        o_data_w[25]) );
  AOI22X1 U908 ( .A0(DES_odata[25]), .A1(n524), .B0(n146), .B1(n495), .Y(n348)
         );
  OAI221XL U909 ( .A0(n208), .A1(n322), .B0(n518), .B1(n139), .C0(n323), .Y(
        o_data_w[36]) );
  AOI22X1 U910 ( .A0(DES_odata[36]), .A1(n523), .B0(n124), .B1(n496), .Y(n323)
         );
  OAI221XL U911 ( .A0(n208), .A1(n265), .B0(n518), .B1(n91), .C0(n266), .Y(
        o_data_w[60]) );
  AOI22X1 U912 ( .A0(DES_odata[60]), .A1(n521), .B0(\DES_indata[60] ), .B1(
        n498), .Y(n266) );
  NAND2XL U913 ( .A(iot_out[55]), .B(n504), .Y(n259) );
  AOI22X1 U914 ( .A0(DES_odata[46]), .A1(n522), .B0(n104), .B1(n497), .Y(n300)
         );
  OAI221XL U915 ( .A0(n208), .A1(n351), .B0(n518), .B1(n165), .C0(n352), .Y(
        o_data_w[23]) );
  AOI22X1 U916 ( .A0(DES_odata[23]), .A1(n524), .B0(n462), .B1(n495), .Y(n352)
         );
  OAI221XL U917 ( .A0(n526), .A1(n361), .B0(n518), .B1(n173), .C0(n362), .Y(
        o_data_w[19]) );
  AOI22X1 U918 ( .A0(DES_odata[19]), .A1(n524), .B0(n158), .B1(n494), .Y(n362)
         );
  NOR2XL U919 ( .A(n610), .B(n608), .Y(GB_first) );
  CLKINVX1 U920 ( .A(iot_in[6]), .Y(n531) );
  OAI221XL U921 ( .A0(n526), .A1(n301), .B0(n518), .B1(n121), .C0(n302), .Y(
        o_data_w[45]) );
  AOI22X1 U922 ( .A0(DES_odata[45]), .A1(n522), .B0(n106), .B1(n497), .Y(n302)
         );
  CLKINVX1 U923 ( .A(iot_in[5]), .Y(n532) );
  OAI221XL U924 ( .A0(n208), .A1(n328), .B0(n518), .B1(n145), .C0(n329), .Y(
        o_data_w[33]) );
  AOI22X1 U925 ( .A0(DES_odata[33]), .A1(n523), .B0(n130), .B1(n495), .Y(n329)
         );
  OAI221XL U926 ( .A0(n526), .A1(n320), .B0(n518), .B1(n137), .C0(n321), .Y(
        o_data_w[37]) );
  OAI221XL U927 ( .A0(n526), .A1(n324), .B0(n518), .B1(n141), .C0(n325), .Y(
        o_data_w[35]) );
  AOI22X1 U928 ( .A0(DES_odata[35]), .A1(n523), .B0(n126), .B1(n496), .Y(n325)
         );
  OAI221XL U929 ( .A0(n208), .A1(n316), .B0(n518), .B1(n133), .C0(n317), .Y(
        o_data_w[39]) );
  AOI22X1 U930 ( .A0(DES_odata[39]), .A1(n522), .B0(n463), .B1(n496), .Y(n317)
         );
  OAI221XL U931 ( .A0(n208), .A1(n274), .B0(n518), .B1(n97), .C0(n275), .Y(
        o_data_w[57]) );
  AOI22XL U932 ( .A0(DES_odata[57]), .A1(n521), .B0(\DES_indata[57] ), .B1(
        n498), .Y(n275) );
  OAI221XL U933 ( .A0(n526), .A1(n259), .B0(n517), .B1(n85), .C0(n260), .Y(
        o_data_w[63]) );
  AOI22XL U934 ( .A0(DES_odata[63]), .A1(n521), .B0(\DES_indata[63] ), .B1(
        n498), .Y(n260) );
  OAI221XL U935 ( .A0(n526), .A1(n263), .B0(n517), .B1(n89), .C0(n264), .Y(
        o_data_w[61]) );
  AOI22XL U936 ( .A0(DES_odata[61]), .A1(n521), .B0(\DES_indata[61] ), .B1(
        n498), .Y(n264) );
  OAI221XL U937 ( .A0(n526), .A1(n270), .B0(n517), .B1(n93), .C0(n271), .Y(
        o_data_w[59]) );
  AOI22XL U938 ( .A0(DES_odata[59]), .A1(n521), .B0(\DES_indata[59] ), .B1(
        n498), .Y(n271) );
  NOR2BX1 U939 ( .AN(iot_out[115]), .B(n509), .Y(\DES_indata[115] ) );
  NOR2BXL U940 ( .AN(iot_out[99]), .B(n499), .Y(\DES_indata[99] ) );
  NOR2BXL U941 ( .AN(iot_out[91]), .B(n514), .Y(\DES_indata[91] ) );
  OAI221XL U942 ( .A0(n526), .A1(n297), .B0(n517), .B1(n470), .C0(n298), .Y(
        o_data_w[47]) );
  AOI22X1 U943 ( .A0(DES_odata[47]), .A1(n522), .B0(n102), .B1(n497), .Y(n298)
         );
  NOR2BXL U944 ( .AN(iot_out[90]), .B(n514), .Y(\DES_indata[90] ) );
  NOR2BXL U945 ( .AN(iot_out[89]), .B(n506), .Y(\DES_indata[89] ) );
  NOR2BXL U946 ( .AN(iot_out[93]), .B(n508), .Y(\DES_indata[93] ) );
  NOR2BXL U947 ( .AN(iot_out[85]), .B(n507), .Y(\DES_indata[85] ) );
  NOR2BXL U948 ( .AN(iot_out[86]), .B(n499), .Y(\DES_indata[86] ) );
  NOR2BXL U949 ( .AN(iot_out[87]), .B(n501), .Y(\DES_indata[87] ) );
  NOR2BX1 U950 ( .AN(iot_out[83]), .B(n507), .Y(\DES_indata[83] ) );
  NOR2BX1 U951 ( .AN(iot_out[114]), .B(n507), .Y(\DES_indata[114] ) );
  NOR2BX1 U952 ( .AN(iot_out[66]), .B(n513), .Y(\DES_indata[66] ) );
  NOR2BX1 U953 ( .AN(iot_out[113]), .B(n506), .Y(\DES_indata[113] ) );
  NOR2BX1 U954 ( .AN(iot_out[73]), .B(n499), .Y(\DES_indata[73] ) );
  NOR2BX1 U955 ( .AN(iot_out[65]), .B(n515), .Y(\DES_indata[65] ) );
  NOR2BX1 U956 ( .AN(iot_out[116]), .B(n515), .Y(\DES_indata[116] ) );
  NOR2BX1 U957 ( .AN(iot_out[68]), .B(n501), .Y(\DES_indata[68] ) );
  NOR2BX1 U958 ( .AN(iot_out[117]), .B(n508), .Y(\DES_indata[117] ) );
  NOR2BX1 U959 ( .AN(iot_out[109]), .B(n511), .Y(\DES_indata[109] ) );
  NOR2BX1 U960 ( .AN(iot_out[69]), .B(n508), .Y(\DES_indata[69] ) );
  NOR2BX1 U961 ( .AN(iot_out[118]), .B(n512), .Y(\DES_indata[118] ) );
  NOR2BX1 U962 ( .AN(iot_out[110]), .B(n511), .Y(\DES_indata[110] ) );
  NOR2BX1 U963 ( .AN(iot_out[70]), .B(n514), .Y(\DES_indata[70] ) );
  NOR2BX1 U964 ( .AN(iot_out[119]), .B(n506), .Y(\DES_indata[119] ) );
  NOR2BX1 U965 ( .AN(iot_out[111]), .B(n506), .Y(\DES_indata[111] ) );
  NOR2BX1 U966 ( .AN(iot_out[71]), .B(n510), .Y(\DES_indata[71] ) );
  NOR2BX1 U967 ( .AN(iot_out[84]), .B(n513), .Y(\DES_indata[84] ) );
  NOR2BX1 U968 ( .AN(iot_out[67]), .B(n501), .Y(\DES_indata[67] ) );
  NOR2BX1 U969 ( .AN(iot_out[82]), .B(n501), .Y(\DES_indata[82] ) );
  NOR2BX1 U970 ( .AN(iot_out[74]), .B(n407), .Y(\DES_indata[74] ) );
  NOR2BX1 U971 ( .AN(iot_out[81]), .B(n500), .Y(\DES_indata[81] ) );
  NOR2BX1 U972 ( .AN(iot_out[77]), .B(n499), .Y(\DES_indata[77] ) );
  NOR2BX1 U973 ( .AN(iot_out[78]), .B(n515), .Y(\DES_indata[78] ) );
  NOR2BX1 U974 ( .AN(iot_out[79]), .B(n510), .Y(\DES_indata[79] ) );
  NOR2BX1 U975 ( .AN(iot_out[76]), .B(n500), .Y(\DES_indata[76] ) );
  NOR2BX1 U976 ( .AN(iot_out[122]), .B(n507), .Y(\DES_indata[122] ) );
  NOR2BX1 U977 ( .AN(iot_out[121]), .B(n513), .Y(\DES_indata[121] ) );
  NOR2BX1 U978 ( .AN(iot_out[124]), .B(n502), .Y(\DES_indata[124] ) );
  NOR2BX1 U979 ( .AN(iot_out[125]), .B(n512), .Y(\DES_indata[125] ) );
  NOR2BX1 U980 ( .AN(iot_out[126]), .B(n512), .Y(\DES_indata[126] ) );
  NOR2BX1 U981 ( .AN(iot_out[127]), .B(n407), .Y(\DES_indata[127] ) );
  NOR2BXL U982 ( .AN(iot_out[94]), .B(n502), .Y(\DES_indata[94] ) );
  NOR2BXL U983 ( .AN(iot_out[95]), .B(n500), .Y(\DES_indata[95] ) );
  NOR2BXL U984 ( .AN(iot_out[92]), .B(n509), .Y(\DES_indata[92] ) );
  NOR2BX1 U985 ( .AN(iot_out[123]), .B(n509), .Y(\DES_indata[123] ) );
  OAI221XL U986 ( .A0(n208), .A1(n293), .B0(n517), .B1(n113), .C0(n294), .Y(
        o_data_w[49]) );
  AOI22X1 U987 ( .A0(DES_odata[49]), .A1(n522), .B0(n550), .B1(n497), .Y(n294)
         );
  OAI221XL U988 ( .A0(n208), .A1(n305), .B0(n518), .B1(n125), .C0(n306), .Y(
        o_data_w[43]) );
  AOI22X1 U989 ( .A0(DES_odata[43]), .A1(n522), .B0(n110), .B1(n496), .Y(n306)
         );
  OAI221XL U990 ( .A0(n526), .A1(n309), .B0(n518), .B1(n129), .C0(n310), .Y(
        o_data_w[41]) );
  OAI221XL U991 ( .A0(n208), .A1(n286), .B0(n518), .B1(n109), .C0(n287), .Y(
        o_data_w[51]) );
  AOI22X1 U992 ( .A0(DES_odata[51]), .A1(n522), .B0(n94), .B1(n497), .Y(n287)
         );
  OAI221XL U993 ( .A0(n208), .A1(n278), .B0(n517), .B1(n101), .C0(n279), .Y(
        o_data_w[55]) );
  AOI22X1 U994 ( .A0(DES_odata[55]), .A1(n521), .B0(n86), .B1(n498), .Y(n279)
         );
  NOR2BXL U995 ( .AN(iot_out[100]), .B(n511), .Y(\DES_indata[100] ) );
  NOR2BXL U996 ( .AN(iot_out[98]), .B(n502), .Y(\DES_indata[98] ) );
  NOR2BXL U997 ( .AN(iot_out[97]), .B(n508), .Y(\DES_indata[97] ) );
  NOR2BX1 U998 ( .AN(iot_out[107]), .B(n502), .Y(\DES_indata[107] ) );
  NOR2BX1 U999 ( .AN(iot_out[75]), .B(n407), .Y(\DES_indata[75] ) );
  NOR2BX1 U1000 ( .AN(iot_out[106]), .B(n510), .Y(\DES_indata[106] ) );
  NOR2BX1 U1001 ( .AN(iot_out[105]), .B(n509), .Y(\DES_indata[105] ) );
  NOR2BX1 U1002 ( .AN(iot_out[108]), .B(n500), .Y(\DES_indata[108] ) );
  NOR2BX1 U1003 ( .AN(iot_out[101]), .B(n514), .Y(\DES_indata[101] ) );
  NOR2BX1 U1004 ( .AN(iot_out[102]), .B(n510), .Y(\DES_indata[102] ) );
  NOR2BX1 U1005 ( .AN(iot_out[103]), .B(n511), .Y(\DES_indata[103] ) );
  OAI221XL U1006 ( .A0(n526), .A1(n282), .B0(n517), .B1(n105), .C0(n283), .Y(
        o_data_w[53]) );
  AOI22X1 U1007 ( .A0(DES_odata[53]), .A1(n521), .B0(n90), .B1(n497), .Y(n283)
         );
  AOI21XL U1008 ( .A0(n614), .A1(n443), .B0(n444), .Y(n442) );
  OAI21XL U1009 ( .A0(count_r[0]), .A1(n80), .B0(n445), .Y(n443) );
  CLKINVX1 U1010 ( .A(iot_in[4]), .Y(n533) );
  NAND2BX1 U1011 ( .AN(n414), .B(n426), .Y(n410) );
  OAI32XL U1012 ( .A0(fn_sel[0]), .A1(fn_sel[2]), .A2(fn_sel[1]), .B0(n457), 
        .B1(n607), .Y(n426) );
  OAI211X1 U1013 ( .A0(n609), .A1(n423), .B0(n424), .C0(n540), .Y(state_w[0])
         );
  NAND2XL U1014 ( .A(n78), .B(n76), .Y(n423) );
  OAI211XL U1015 ( .A0(n78), .A1(n76), .B0(n79), .C0(n609), .Y(n424) );
  CLKINVX1 U1016 ( .A(n425), .Y(n540) );
  OAI211XL U1017 ( .A0(n414), .A1(fn_sel[2]), .B0(n410), .C0(n422), .Y(n425)
         );
  OAI2BB2XL U1018 ( .B0(n539), .B1(n538), .A0N(valid), .A1N(n538), .Y(n448) );
  CLKINVX1 U1019 ( .A(n408), .Y(n538) );
  OAI31XL U1020 ( .A0(n539), .A1(state_w[1]), .A2(n541), .B0(n409), .Y(n408)
         );
  CLKINVX1 U1021 ( .A(state_w[2]), .Y(n541) );
  NAND3XL U1022 ( .A(fn_sel[1]), .B(n607), .C(fn_sel[0]), .Y(n415) );
  CLKINVX1 U1023 ( .A(iot_in[3]), .Y(n534) );
  CLKINVX1 U1024 ( .A(n248), .Y(n542) );
  AOI222XL U1025 ( .A0(n526), .A1(\DES_indata[71] ), .B0(n528), .B1(
        \DES_indata[63] ), .C0(n516), .C1(iot_out[63]), .Y(n248) );
  CLKINVX1 U1026 ( .A(n249), .Y(n543) );
  AOI222XL U1027 ( .A0(n526), .A1(\DES_indata[70] ), .B0(n528), .B1(
        \DES_indata[62] ), .C0(n516), .C1(iot_out[62]), .Y(n249) );
  CLKINVX1 U1028 ( .A(n253), .Y(n544) );
  AOI222XL U1029 ( .A0(n526), .A1(\DES_indata[69] ), .B0(n528), .B1(
        \DES_indata[61] ), .C0(n516), .C1(iot_out[61]), .Y(n253) );
  CLKINVX1 U1030 ( .A(n254), .Y(n545) );
  AOI222XL U1031 ( .A0(n526), .A1(\DES_indata[68] ), .B0(n528), .B1(
        \DES_indata[60] ), .C0(n516), .C1(iot_out[60]), .Y(n254) );
  CLKINVX1 U1032 ( .A(n255), .Y(n546) );
  AOI222XL U1033 ( .A0(n526), .A1(\DES_indata[67] ), .B0(n528), .B1(
        \DES_indata[59] ), .C0(n516), .C1(iot_out[59]), .Y(n255) );
  CLKINVX1 U1034 ( .A(n256), .Y(n547) );
  AOI222XL U1035 ( .A0(n526), .A1(\DES_indata[66] ), .B0(n528), .B1(
        \DES_indata[58] ), .C0(n516), .C1(iot_out[58]), .Y(n256) );
  CLKINVX1 U1036 ( .A(n257), .Y(n548) );
  AOI222XL U1037 ( .A0(n526), .A1(\DES_indata[65] ), .B0(n528), .B1(
        \DES_indata[57] ), .C0(n516), .C1(iot_out[57]), .Y(n257) );
  CLKINVX1 U1038 ( .A(n258), .Y(n549) );
  AOI222XL U1039 ( .A0(n526), .A1(\DES_indata[64] ), .B0(n527), .B1(
        \DES_indata[56] ), .C0(n516), .C1(iot_out[56]), .Y(n258) );
  NOR2X1 U1040 ( .A(n447), .B(n196), .Y(CRC_in[0]) );
  NOR2X1 U1041 ( .A(n447), .B(n192), .Y(CRC_in[2]) );
  NOR2X1 U1042 ( .A(n447), .B(n194), .Y(CRC_in[1]) );
  OAI211X1 U1043 ( .A0(n414), .A1(n415), .B0(n416), .C0(n417), .Y(state_w[1])
         );
  AOI32XL U1044 ( .A0(n78), .A1(n76), .A2(n609), .B0(n419), .B1(n420), .Y(n416) );
  NOR3BXL U1045 ( .AN(n410), .B(n418), .C(n7), .Y(n417) );
  NAND2XL U1046 ( .A(n421), .B(n422), .Y(n419) );
  CLKINVX1 U1047 ( .A(n402), .Y(n553) );
  AOI222XL U1048 ( .A0(n526), .A1(\DES_indata[101] ), .B0(n527), .B1(
        \DES_indata[93] ), .C0(n516), .C1(iot_out[93]), .Y(n402) );
  CLKINVX1 U1049 ( .A(n217), .Y(n602) );
  AOI222XL U1050 ( .A0(n526), .A1(\DES_indata[95] ), .B0(n528), .B1(
        \DES_indata[87] ), .C0(n516), .C1(iot_out[87]), .Y(n217) );
  CLKINVX1 U1051 ( .A(n218), .Y(n601) );
  AOI222XL U1052 ( .A0(n526), .A1(\DES_indata[94] ), .B0(n528), .B1(
        \DES_indata[86] ), .C0(n516), .C1(iot_out[86]), .Y(n218) );
  CLKINVX1 U1053 ( .A(n219), .Y(n600) );
  AOI222XL U1054 ( .A0(n526), .A1(\DES_indata[93] ), .B0(n528), .B1(
        \DES_indata[85] ), .C0(n516), .C1(iot_out[85]), .Y(n219) );
  CLKINVX1 U1055 ( .A(n212), .Y(n606) );
  AOI222XL U1056 ( .A0(n526), .A1(\DES_indata[99] ), .B0(n528), .B1(
        \DES_indata[91] ), .C0(n516), .C1(iot_out[91]), .Y(n212) );
  CLKINVX1 U1057 ( .A(n214), .Y(n605) );
  AOI222XL U1058 ( .A0(n526), .A1(\DES_indata[98] ), .B0(n528), .B1(
        \DES_indata[90] ), .C0(n516), .C1(iot_out[90]), .Y(n214) );
  CLKINVX1 U1059 ( .A(n215), .Y(n604) );
  AOI222XL U1060 ( .A0(n526), .A1(\DES_indata[97] ), .B0(n528), .B1(
        \DES_indata[89] ), .C0(n516), .C1(iot_out[89]), .Y(n215) );
  CLKINVX1 U1061 ( .A(n382), .Y(n570) );
  AOI222XL U1062 ( .A0(n526), .A1(\DES_indata[119] ), .B0(n527), .B1(
        \DES_indata[111] ), .C0(n516), .C1(iot_out[111]), .Y(n382) );
  CLKINVX1 U1063 ( .A(n383), .Y(n569) );
  AOI222XL U1064 ( .A0(n526), .A1(\DES_indata[118] ), .B0(n527), .B1(
        \DES_indata[110] ), .C0(n516), .C1(iot_out[110]), .Y(n383) );
  CLKINVX1 U1065 ( .A(n384), .Y(n568) );
  AOI222XL U1066 ( .A0(n526), .A1(\DES_indata[117] ), .B0(n527), .B1(
        \DES_indata[109] ), .C0(n516), .C1(iot_out[109]), .Y(n384) );
  CLKINVX1 U1067 ( .A(n378), .Y(n573) );
  AOI222XL U1068 ( .A0(n526), .A1(\DES_indata[122] ), .B0(n527), .B1(
        \DES_indata[114] ), .C0(n516), .C1(iot_out[114]), .Y(n378) );
  CLKINVX1 U1069 ( .A(n379), .Y(n572) );
  AOI222XL U1070 ( .A0(n526), .A1(\DES_indata[121] ), .B0(n527), .B1(
        \DES_indata[113] ), .C0(n516), .C1(iot_out[113]), .Y(n379) );
  CLKINVX1 U1071 ( .A(n373), .Y(n578) );
  AOI222XL U1072 ( .A0(n526), .A1(\DES_indata[127] ), .B0(n527), .B1(
        \DES_indata[119] ), .C0(n516), .C1(iot_out[119]), .Y(n373) );
  CLKINVX1 U1073 ( .A(n2400), .Y(n586) );
  AOI222XL U1074 ( .A0(n526), .A1(\DES_indata[79] ), .B0(n528), .B1(
        \DES_indata[71] ), .C0(n516), .C1(iot_out[71]), .Y(n2400) );
  CLKINVX1 U1075 ( .A(n374), .Y(n577) );
  AOI222XL U1076 ( .A0(n526), .A1(\DES_indata[126] ), .B0(n527), .B1(
        \DES_indata[118] ), .C0(n516), .C1(iot_out[118]), .Y(n374) );
  CLKINVX1 U1077 ( .A(n241), .Y(n585) );
  AOI222XL U1078 ( .A0(n526), .A1(\DES_indata[78] ), .B0(n528), .B1(
        \DES_indata[70] ), .C0(n516), .C1(iot_out[70]), .Y(n241) );
  CLKINVX1 U1079 ( .A(n375), .Y(n576) );
  AOI222XL U1080 ( .A0(n526), .A1(\DES_indata[125] ), .B0(n527), .B1(
        \DES_indata[117] ), .C0(n516), .C1(iot_out[117]), .Y(n375) );
  CLKINVX1 U1081 ( .A(n242), .Y(n584) );
  AOI222XL U1082 ( .A0(n526), .A1(\DES_indata[77] ), .B0(n528), .B1(
        \DES_indata[69] ), .C0(n516), .C1(iot_out[69]), .Y(n242) );
  CLKINVX1 U1083 ( .A(n376), .Y(n575) );
  AOI222XL U1084 ( .A0(n526), .A1(\DES_indata[124] ), .B0(n527), .B1(
        \DES_indata[116] ), .C0(n516), .C1(iot_out[116]), .Y(n376) );
  CLKINVX1 U1085 ( .A(n220), .Y(n599) );
  AOI222XL U1086 ( .A0(n526), .A1(\DES_indata[92] ), .B0(n528), .B1(
        \DES_indata[84] ), .C0(n516), .C1(iot_out[84]), .Y(n220) );
  CLKINVX1 U1087 ( .A(n2430), .Y(n583) );
  AOI222XL U1088 ( .A0(n526), .A1(\DES_indata[76] ), .B0(n528), .B1(
        \DES_indata[68] ), .C0(n516), .C1(iot_out[68]), .Y(n2430) );
  CLKINVX1 U1089 ( .A(n377), .Y(n574) );
  AOI222XL U1090 ( .A0(n526), .A1(\DES_indata[123] ), .B0(n527), .B1(
        \DES_indata[115] ), .C0(n516), .C1(iot_out[115]), .Y(n377) );
  CLKINVX1 U1091 ( .A(n244), .Y(n582) );
  AOI222XL U1092 ( .A0(n526), .A1(\DES_indata[75] ), .B0(n528), .B1(
        \DES_indata[67] ), .C0(n516), .C1(iot_out[67]), .Y(n244) );
  CLKINVX1 U1093 ( .A(n245), .Y(n581) );
  AOI222XL U1094 ( .A0(n526), .A1(\DES_indata[74] ), .B0(n528), .B1(
        \DES_indata[66] ), .C0(n516), .C1(iot_out[66]), .Y(n245) );
  CLKINVX1 U1095 ( .A(n233), .Y(n588) );
  AOI222XL U1096 ( .A0(n526), .A1(\DES_indata[81] ), .B0(n528), .B1(
        \DES_indata[73] ), .C0(n516), .C1(iot_out[73]), .Y(n233) );
  CLKINVX1 U1097 ( .A(n246), .Y(n580) );
  AOI222XL U1098 ( .A0(n526), .A1(\DES_indata[73] ), .B0(n528), .B1(
        \DES_indata[65] ), .C0(n516), .C1(iot_out[65]), .Y(n246) );
  CLKINVX1 U1099 ( .A(n227), .Y(n594) );
  AOI222XL U1100 ( .A0(n526), .A1(\DES_indata[87] ), .B0(n528), .B1(
        \DES_indata[79] ), .C0(n516), .C1(iot_out[79]), .Y(n227) );
  CLKINVX1 U1101 ( .A(n228), .Y(n593) );
  AOI222XL U1102 ( .A0(n526), .A1(\DES_indata[86] ), .B0(n528), .B1(
        \DES_indata[78] ), .C0(n516), .C1(iot_out[78]), .Y(n228) );
  CLKINVX1 U1103 ( .A(n229), .Y(n592) );
  AOI222XL U1104 ( .A0(n526), .A1(\DES_indata[85] ), .B0(n528), .B1(
        \DES_indata[77] ), .C0(n516), .C1(iot_out[77]), .Y(n229) );
  CLKINVX1 U1105 ( .A(n230), .Y(n591) );
  AOI222XL U1106 ( .A0(n526), .A1(\DES_indata[84] ), .B0(n528), .B1(
        \DES_indata[76] ), .C0(n516), .C1(iot_out[76]), .Y(n230) );
  CLKINVX1 U1107 ( .A(n221), .Y(n598) );
  AOI222XL U1108 ( .A0(n526), .A1(\DES_indata[91] ), .B0(n528), .B1(
        \DES_indata[83] ), .C0(n516), .C1(iot_out[83]), .Y(n221) );
  CLKINVX1 U1109 ( .A(n231), .Y(n590) );
  AOI222XL U1110 ( .A0(n526), .A1(\DES_indata[83] ), .B0(n528), .B1(
        \DES_indata[75] ), .C0(n516), .C1(iot_out[75]), .Y(n231) );
  CLKINVX1 U1111 ( .A(n222), .Y(n597) );
  AOI222XL U1112 ( .A0(n526), .A1(\DES_indata[90] ), .B0(n528), .B1(
        \DES_indata[82] ), .C0(n516), .C1(iot_out[82]), .Y(n222) );
  CLKINVX1 U1113 ( .A(n232), .Y(n589) );
  AOI222XL U1114 ( .A0(n526), .A1(\DES_indata[82] ), .B0(n528), .B1(
        \DES_indata[74] ), .C0(n516), .C1(iot_out[74]), .Y(n232) );
  CLKINVX1 U1115 ( .A(n225), .Y(n596) );
  AOI222XL U1116 ( .A0(n526), .A1(\DES_indata[89] ), .B0(n528), .B1(
        \DES_indata[81] ), .C0(n516), .C1(iot_out[81]), .Y(n225) );
  NOR2BXL U1117 ( .AN(iot_out[88]), .B(n510), .Y(\DES_indata[88] ) );
  CLKINVX1 U1118 ( .A(n216), .Y(n603) );
  AOI222XL U1119 ( .A0(n526), .A1(\DES_indata[96] ), .B0(n528), .B1(
        \DES_indata[88] ), .C0(n516), .C1(iot_out[88]), .Y(n216) );
  CLKINVX1 U1120 ( .A(n400), .Y(n557) );
  AOI222XL U1121 ( .A0(n526), .A1(\DES_indata[103] ), .B0(n527), .B1(
        \DES_indata[95] ), .C0(n516), .C1(iot_out[95]), .Y(n400) );
  CLKINVX1 U1122 ( .A(n401), .Y(n555) );
  AOI222XL U1123 ( .A0(n526), .A1(\DES_indata[102] ), .B0(n527), .B1(
        \DES_indata[94] ), .C0(n516), .C1(iot_out[94]), .Y(n401) );
  CLKINVX1 U1124 ( .A(n403), .Y(n551) );
  AOI222XL U1125 ( .A0(n526), .A1(\DES_indata[100] ), .B0(n527), .B1(
        \DES_indata[92] ), .C0(n516), .C1(iot_out[92]), .Y(n403) );
  CLKINVX1 U1126 ( .A(n390), .Y(n558) );
  AOI222XL U1127 ( .A0(n526), .A1(\DES_indata[111] ), .B0(n527), .B1(
        \DES_indata[103] ), .C0(n516), .C1(iot_out[103]), .Y(n390) );
  CLKINVX1 U1128 ( .A(n391), .Y(n556) );
  AOI222XL U1129 ( .A0(n526), .A1(\DES_indata[110] ), .B0(n527), .B1(
        \DES_indata[102] ), .C0(n516), .C1(iot_out[102]), .Y(n391) );
  CLKINVX1 U1130 ( .A(n394), .Y(n554) );
  AOI222XL U1131 ( .A0(n526), .A1(\DES_indata[109] ), .B0(n527), .B1(
        \DES_indata[101] ), .C0(n213), .C1(iot_out[101]), .Y(n394) );
  CLKINVX1 U1132 ( .A(n385), .Y(n567) );
  AOI222XL U1133 ( .A0(n526), .A1(\DES_indata[116] ), .B0(n527), .B1(
        \DES_indata[108] ), .C0(n213), .C1(iot_out[108]), .Y(n385) );
  CLKINVX1 U1134 ( .A(n386), .Y(n566) );
  AOI222XL U1135 ( .A0(n526), .A1(\DES_indata[115] ), .B0(n527), .B1(
        \DES_indata[107] ), .C0(n213), .C1(iot_out[107]), .Y(n386) );
  CLKINVX1 U1136 ( .A(n387), .Y(n564) );
  AOI222XL U1137 ( .A0(n526), .A1(\DES_indata[114] ), .B0(n527), .B1(
        \DES_indata[106] ), .C0(n213), .C1(iot_out[106]), .Y(n387) );
  CLKINVX1 U1138 ( .A(n388), .Y(n562) );
  AOI222XL U1139 ( .A0(n526), .A1(\DES_indata[113] ), .B0(n527), .B1(
        \DES_indata[105] ), .C0(n213), .C1(iot_out[105]), .Y(n388) );
  NOR2BX1 U1140 ( .AN(iot_out[112]), .B(n506), .Y(\DES_indata[112] ) );
  NOR2BX1 U1141 ( .AN(iot_out[72]), .B(n507), .Y(\DES_indata[72] ) );
  NOR2BX1 U1142 ( .AN(iot_out[64]), .B(n508), .Y(\DES_indata[64] ) );
  CLKINVX1 U1143 ( .A(n380), .Y(n571) );
  AOI222XL U1144 ( .A0(n526), .A1(\DES_indata[120] ), .B0(n527), .B1(
        \DES_indata[112] ), .C0(n213), .C1(iot_out[112]), .Y(n380) );
  NOR2BX1 U1145 ( .AN(iot_out[120]), .B(n500), .Y(\DES_indata[120] ) );
  CLKINVX1 U1146 ( .A(n234), .Y(n587) );
  AOI222XL U1147 ( .A0(n526), .A1(\DES_indata[80] ), .B0(n528), .B1(
        \DES_indata[72] ), .C0(n516), .C1(iot_out[72]), .Y(n234) );
  CLKINVX1 U1148 ( .A(n247), .Y(n579) );
  AOI222XL U1149 ( .A0(n526), .A1(\DES_indata[72] ), .B0(n528), .B1(
        \DES_indata[64] ), .C0(n516), .C1(iot_out[64]), .Y(n247) );
  NOR2BX1 U1150 ( .AN(iot_out[80]), .B(n501), .Y(\DES_indata[80] ) );
  CLKINVX1 U1151 ( .A(n226), .Y(n595) );
  AOI222XL U1152 ( .A0(n526), .A1(\DES_indata[88] ), .B0(n528), .B1(
        \DES_indata[80] ), .C0(n516), .C1(iot_out[80]), .Y(n226) );
  CLKINVX1 U1153 ( .A(n395), .Y(n552) );
  AOI222XL U1154 ( .A0(n526), .A1(\DES_indata[108] ), .B0(n527), .B1(
        \DES_indata[100] ), .C0(n213), .C1(iot_out[100]), .Y(n395) );
  CLKINVX1 U1155 ( .A(n396), .Y(n565) );
  AOI222XL U1156 ( .A0(n526), .A1(\DES_indata[107] ), .B0(n527), .B1(
        \DES_indata[99] ), .C0(n213), .C1(iot_out[99]), .Y(n396) );
  CLKINVX1 U1157 ( .A(n397), .Y(n563) );
  AOI222XL U1158 ( .A0(n526), .A1(\DES_indata[106] ), .B0(n527), .B1(
        \DES_indata[98] ), .C0(n213), .C1(iot_out[98]), .Y(n397) );
  CLKINVX1 U1159 ( .A(n398), .Y(n561) );
  AOI222XL U1160 ( .A0(n526), .A1(\DES_indata[105] ), .B0(n527), .B1(
        \DES_indata[97] ), .C0(n213), .C1(iot_out[97]), .Y(n398) );
  NOR2BXL U1161 ( .AN(iot_out[96]), .B(n502), .Y(\DES_indata[96] ) );
  CLKINVX1 U1162 ( .A(n399), .Y(n559) );
  AOI222XL U1163 ( .A0(n526), .A1(\DES_indata[104] ), .B0(n527), .B1(
        \DES_indata[96] ), .C0(n213), .C1(iot_out[96]), .Y(n399) );
  NOR2BX1 U1164 ( .AN(iot_out[104]), .B(n407), .Y(\DES_indata[104] ) );
  CLKINVX1 U1165 ( .A(n389), .Y(n560) );
  AOI222XL U1166 ( .A0(n526), .A1(\DES_indata[112] ), .B0(n527), .B1(
        \DES_indata[104] ), .C0(n213), .C1(iot_out[104]), .Y(n389) );
  AOI2BB2XL U1167 ( .B0(n609), .B1(n76), .A0N(n469), .A1N(n414), .Y(n412) );
  CLKINVX1 U1168 ( .A(iot_in[2]), .Y(n535) );
  NAND2XL U1169 ( .A(count_r[2]), .B(count_r[1]), .Y(n428) );
  CLKINVX1 U1170 ( .A(iot_in[0]), .Y(n537) );
  NAND2X1 U1171 ( .A(state_r[2]), .B(n441), .Y(n414) );
  NOR2XL U1172 ( .A(n78), .B(n79), .Y(n441) );
  CLKINVX1 U1173 ( .A(iot_in[1]), .Y(n536) );
  CLKBUFX3 U1174 ( .A(n208), .Y(n526) );
  NAND3XL U1175 ( .A(n78), .B(n76), .C(state_r[0]), .Y(n208) );
  OAI21XL U1176 ( .A0(state_r[2]), .A1(n78), .B0(n427), .Y(enable_count) );
  AOI2BB1XL U1177 ( .A0N(count_r[1]), .A1N(n611), .B0(count_w[0]), .Y(n433) );
  AOI2BB1XL U1178 ( .A0N(state_r[2]), .A1N(n79), .B0(n450), .Y(n427) );
  NAND4XL U1179 ( .A(count_r[0]), .B(n614), .C(enable_count), .D(n80), .Y(n432) );
  NOR2XL U1180 ( .A(n611), .B(count_r[0]), .Y(count_w[0]) );
  OAI21XL U1181 ( .A0(n433), .A1(n83), .B0(n434), .Y(count_w[2]) );
  NAND4XL U1182 ( .A(count_r[0]), .B(count_r[1]), .C(enable_count), .D(n83), 
        .Y(n434) );
  NOR2X1 U1183 ( .A(n611), .B(n435), .Y(count_w[1]) );
  XNOR2XL U1184 ( .A(count_r[1]), .B(count_r[0]), .Y(n435) );
  OAI31XL U1185 ( .A0(n80), .A1(n427), .A2(n428), .B0(n429), .Y(n449) );
  OAI211XL U1186 ( .A0(state_r[2]), .A1(n79), .B0(n411), .C0(busy), .Y(n429)
         );
  NAND2XL U1187 ( .A(iot_out[6]), .B(n505), .Y(n250) );
  OAI221XL U1188 ( .A0(n208), .A1(n345), .B0(n518), .B1(n159), .C0(n346), .Y(
        o_data_w[26]) );
  OAI21XL U1189 ( .A0(n460), .A1(n80), .B0(count_r[0]), .Y(n445) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_8 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_9 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_10 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_11 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_12 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_13 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_14 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_15 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_16 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_17 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_18 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_19 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_20 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_21 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_22 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_23 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_24 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_25 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_26 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_27 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_28 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_29 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_30 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_31 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_32 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_33 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_IOTDF_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module CRC3_D8 ( i_data, crc, crc_nxt );
  input [7:0] i_data;
  input [2:0] crc;
  output [2:0] crc_nxt;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;

  XOR2X1 U1 ( .A(i_data[2]), .B(i_data[3]), .Y(n3) );
  XOR2X1 U2 ( .A(i_data[4]), .B(n3), .Y(n8) );
  XNOR2X1 U3 ( .A(i_data[1]), .B(n7), .Y(n4) );
  XOR2X1 U4 ( .A(i_data[5]), .B(i_data[2]), .Y(n7) );
  XOR2X1 U5 ( .A(i_data[6]), .B(i_data[1]), .Y(n1) );
  XOR2X1 U6 ( .A(n6), .B(n8), .Y(crc_nxt[0]) );
  XOR2X1 U7 ( .A(n1), .B(n2), .Y(crc_nxt[2]) );
  XOR2X1 U8 ( .A(n4), .B(n5), .Y(crc_nxt[1]) );
  XNOR2X1 U9 ( .A(n6), .B(crc[0]), .Y(n5) );
  XNOR2X1 U10 ( .A(n9), .B(crc[2]), .Y(n6) );
  XNOR2X1 U11 ( .A(i_data[7]), .B(i_data[0]), .Y(n9) );
  XOR2X1 U12 ( .A(crc[1]), .B(n3), .Y(n2) );
endmodule


module Gray_Binary_Conversion ( i_clk, i_rst, enable, fn_sel, first, i_data, 
        prev, o_data );
  input [7:0] i_data;
  output [7:0] o_data;
  input i_clk, i_rst, enable, fn_sel, first, prev;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n2, n12, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35;

  DFFRX1 data_reg ( .D(n13), .CK(i_clk), .RN(n34), .QN(n11) );
  BUFX4 U2 ( .A(fn_sel), .Y(n33) );
  CLKINVX1 U3 ( .A(i_data[1]), .Y(n16) );
  AOI2BB2X4 U4 ( .B0(prev), .B1(n33), .A0N(n11), .A1N(n33), .Y(n10) );
  OR2XL U5 ( .A(i_data[7]), .B(n33), .Y(n29) );
  OAI22X1 U6 ( .A0(i_data[5]), .A1(n33), .B0(o_data[5]), .B1(n35), .Y(n6) );
  NAND2XL U7 ( .A(i_data[0]), .B(n1), .Y(n14) );
  NAND2X1 U8 ( .A(n2), .B(n12), .Y(n15) );
  NAND2X1 U9 ( .A(n14), .B(n15), .Y(o_data[0]) );
  CLKINVX1 U10 ( .A(i_data[0]), .Y(n2) );
  INVXL U11 ( .A(n1), .Y(n12) );
  OAI2BB2X1 U12 ( .B0(o_data[1]), .B1(n35), .A0N(n16), .A1N(n35), .Y(n1) );
  INVXL U13 ( .A(n4), .Y(n21) );
  NOR2X2 U14 ( .A(o_data[3]), .B(n35), .Y(n20) );
  OR2X4 U15 ( .A(n19), .B(n20), .Y(n4) );
  NAND2X1 U16 ( .A(n21), .B(n22), .Y(n24) );
  NAND2X1 U17 ( .A(n23), .B(n24), .Y(o_data[2]) );
  INVXL U18 ( .A(n33), .Y(n35) );
  NOR2XL U19 ( .A(i_data[4]), .B(n33), .Y(n17) );
  NOR2X1 U20 ( .A(o_data[4]), .B(n35), .Y(n18) );
  OR2X2 U21 ( .A(n17), .B(n18), .Y(n5) );
  XNOR2X4 U22 ( .A(n5), .B(i_data[3]), .Y(o_data[3]) );
  OAI2BB2XL U23 ( .B0(o_data[2]), .B1(n35), .A0N(n22), .A1N(n35), .Y(n3) );
  OR2X4 U24 ( .A(n31), .B(n32), .Y(n7) );
  NOR2XL U25 ( .A(i_data[3]), .B(n33), .Y(n19) );
  NAND2X1 U26 ( .A(n4), .B(i_data[2]), .Y(n23) );
  INVX1 U27 ( .A(i_data[2]), .Y(n22) );
  XNOR2X4 U28 ( .A(n7), .B(i_data[5]), .Y(o_data[5]) );
  OR2XL U29 ( .A(o_data[7]), .B(n35), .Y(n30) );
  NAND2X1 U30 ( .A(n29), .B(n30), .Y(n8) );
  NAND2X1 U31 ( .A(n8), .B(i_data[6]), .Y(n27) );
  NAND2X1 U32 ( .A(n25), .B(n26), .Y(n28) );
  NAND2X1 U33 ( .A(n27), .B(n28), .Y(o_data[6]) );
  CLKINVX1 U34 ( .A(n8), .Y(n25) );
  CLKINVX1 U35 ( .A(i_data[6]), .Y(n26) );
  NOR2X1 U36 ( .A(o_data[6]), .B(n35), .Y(n32) );
  NOR2XL U37 ( .A(i_data[6]), .B(n33), .Y(n31) );
  XNOR2X1 U38 ( .A(n6), .B(i_data[4]), .Y(o_data[4]) );
  XNOR2X1 U39 ( .A(n3), .B(i_data[1]), .Y(o_data[1]) );
  XOR2X1 U40 ( .A(i_data[7]), .B(n9), .Y(o_data[7]) );
  NOR2X1 U41 ( .A(first), .B(n10), .Y(n9) );
  OAI2BB2XL U42 ( .B0(n11), .B1(enable), .A0N(i_data[0]), .A1N(enable), .Y(n13) );
  CLKINVX1 U43 ( .A(i_rst), .Y(n34) );
endmodule


module DES ( i_clk, i_rst, enable, shift, first, last, prep_key1, fnsel, 
        o_data, \i_data[127] , \i_data[126] , \i_data[125] , \i_data[124] , 
        \i_data[123] , \i_data[122] , \i_data[121] , \i_data[119] , 
        \i_data[118] , \i_data[117] , \i_data[116] , \i_data[115] , 
        \i_data[114] , \i_data[113] , \i_data[111] , \i_data[110] , 
        \i_data[109] , \i_data[108] , \i_data[107] , \i_data[106] , 
        \i_data[105] , \i_data[103] , \i_data[102] , \i_data[101] , 
        \i_data[100] , \i_data[99] , \i_data[98] , \i_data[97] , \i_data[95] , 
        \i_data[94] , \i_data[93] , \i_data[92] , \i_data[91] , \i_data[90] , 
        \i_data[89] , \i_data[87] , \i_data[86] , \i_data[85] , \i_data[84] , 
        \i_data[83] , \i_data[82] , \i_data[81] , \i_data[79] , \i_data[78] , 
        \i_data[77] , \i_data[76] , \i_data[75] , \i_data[74] , \i_data[73] , 
        \i_data[71] , \i_data[70] , \i_data[69] , \i_data[68] , \i_data[67] , 
        \i_data[66] , \i_data[65] , \i_data[63] , \i_data[62] , \i_data[61] , 
        \i_data[60] , \i_data[59] , \i_data[58] , \i_data[57] , \i_data[56] , 
        \i_data[55] , \i_data[54] , \i_data[53] , \i_data[52] , \i_data[51] , 
        \i_data[50] , \i_data[49] , \i_data[48] , \i_data[47] , \i_data[46] , 
        \i_data[45] , \i_data[44] , \i_data[43] , \i_data[42] , \i_data[41] , 
        \i_data[40] , \i_data[39] , \i_data[38] , \i_data[37] , \i_data[36] , 
        \i_data[35] , \i_data[34] , \i_data[33] , \i_data[32] , \i_data[31] , 
        \i_data[30] , \i_data[29] , \i_data[28] , \i_data[27] , \i_data[26] , 
        \i_data[25] , \i_data[24] , \i_data[23] , \i_data[22] , \i_data[21] , 
        \i_data[20] , \i_data[19] , \i_data[18] , \i_data[17] , \i_data[16] , 
        \i_data[15] , \i_data[14] , \i_data[13] , \i_data[12] , \i_data[11] , 
        \i_data[10] , \i_data[9] , \i_data[8] , \i_data[7] , \i_data[6] , 
        \i_data[5] , \i_data[4] , \i_data[3] , \i_data[2] , \i_data[1] , 
        \i_data[0]  );
  output [63:0] o_data;
  input i_clk, i_rst, enable, shift, first, last, prep_key1, fnsel,
         \i_data[127] , \i_data[126] , \i_data[125] , \i_data[124] ,
         \i_data[123] , \i_data[122] , \i_data[121] , \i_data[119] ,
         \i_data[118] , \i_data[117] , \i_data[116] , \i_data[115] ,
         \i_data[114] , \i_data[113] , \i_data[111] , \i_data[110] ,
         \i_data[109] , \i_data[108] , \i_data[107] , \i_data[106] ,
         \i_data[105] , \i_data[103] , \i_data[102] , \i_data[101] ,
         \i_data[100] , \i_data[99] , \i_data[98] , \i_data[97] , \i_data[95] ,
         \i_data[94] , \i_data[93] , \i_data[92] , \i_data[91] , \i_data[90] ,
         \i_data[89] , \i_data[87] , \i_data[86] , \i_data[85] , \i_data[84] ,
         \i_data[83] , \i_data[82] , \i_data[81] , \i_data[79] , \i_data[78] ,
         \i_data[77] , \i_data[76] , \i_data[75] , \i_data[74] , \i_data[73] ,
         \i_data[71] , \i_data[70] , \i_data[69] , \i_data[68] , \i_data[67] ,
         \i_data[66] , \i_data[65] , \i_data[63] , \i_data[62] , \i_data[61] ,
         \i_data[60] , \i_data[59] , \i_data[58] , \i_data[57] , \i_data[56] ,
         \i_data[55] , \i_data[54] , \i_data[53] , \i_data[52] , \i_data[51] ,
         \i_data[50] , \i_data[49] , \i_data[48] , \i_data[47] , \i_data[46] ,
         \i_data[45] , \i_data[44] , \i_data[43] , \i_data[42] , \i_data[41] ,
         \i_data[40] , \i_data[39] , \i_data[38] , \i_data[37] , \i_data[36] ,
         \i_data[35] , \i_data[34] , \i_data[33] , \i_data[32] , \i_data[31] ,
         \i_data[30] , \i_data[29] , \i_data[28] , \i_data[27] , \i_data[26] ,
         \i_data[25] , \i_data[24] , \i_data[23] , \i_data[22] , \i_data[21] ,
         \i_data[20] , \i_data[19] , \i_data[18] , \i_data[17] , \i_data[16] ,
         \i_data[15] , \i_data[14] , \i_data[13] , \i_data[12] , \i_data[11] ,
         \i_data[10] , \i_data[9] , \i_data[8] , \i_data[7] , \i_data[6] ,
         \i_data[5] , \i_data[4] , \i_data[3] , \i_data[2] , \i_data[1] ,
         \i_data[0] ;
  wire   \down_r[27] , \down_r[26] , \down_r[25] , \down_r[24] , \down_r[23] ,
         \down_r[22] , \down_r[21] , \down_r[20] , \down_r[19] , \down_r[18] ,
         \down_r[17] , \down_r[16] , \down_r[15] , \down_r[14] , \down_r[13] ,
         \down_r[12] , \down_r[11] , \down_r[10] , \down_r[9] , \down_r[8] ,
         \down_r[7] , \down_r[6] , \down_r[5] , \down_r[4] , \down_r[3] ,
         \down_r[2] , \down_r[1] , \down_r[0] , \up_r[27] , \up_r[26] ,
         \up_r[25] , \up_r[24] , \up_r[23] , \up_r[22] , \up_r[21] ,
         \up_r[20] , \up_r[19] , \up_r[18] , \up_r[17] , \up_r[16] ,
         \up_r[15] , \up_r[14] , \up_r[13] , \up_r[12] , \up_r[11] ,
         \up_r[10] , \up_r[9] , \up_r[8] , \up_r[7] , \up_r[6] , \up_r[5] ,
         \up_r[4] , \up_r[3] , \up_r[2] , \up_r[1] , \up_r[0] , net729, net735,
         net740, net745, net750, net755, net760, net765, net770, net775,
         net780, net785, net790, net795, n120, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n299, n300, n301, n302, n303,
         n304, n305, n306, n308, n309, n310, n312, n313, n314, n315, n316,
         n317, n318, n319, n321, n322, n323, n324, n325, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n121, n298, n307, n311, n320, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382;
  wire   [31:0] temp4;
  wire   [31:0] R_xor;
  wire   [55:0] temp1;
  wire   [63:0] temp2;
  wire   [63:0] temp3;
  wire   [31:0] R;
  wire   [47:0] key;
  wire   [27:0] up_w;
  wire   [27:0] down_w;

  AO22X4 U116 ( .A0(n43), .A1(R_xor[8]), .B0(temp3[8]), .B1(n49), .Y(o_data[8]) );
  AO22X4 U362 ( .A0(temp2[8]), .A1(n52), .B0(\i_data[8] ), .B1(n57), .Y(R[8])
         );
  AO22X4 U363 ( .A0(temp2[7]), .A1(n52), .B0(\i_data[7] ), .B1(n62), .Y(R[7])
         );
  AO22X4 U366 ( .A0(temp2[4]), .A1(n52), .B0(\i_data[4] ), .B1(n62), .Y(R[4])
         );
  AO22X4 U367 ( .A0(temp2[3]), .A1(n52), .B0(\i_data[3] ), .B1(n62), .Y(R[3])
         );
  AO22X4 U372 ( .A0(temp2[28]), .A1(n53), .B0(\i_data[28] ), .B1(n62), .Y(
        R[28]) );
  AO22X4 U380 ( .A0(temp2[20]), .A1(n53), .B0(\i_data[20] ), .B1(n55), .Y(
        R[20]) );
  AO22X4 U389 ( .A0(temp2[12]), .A1(n53), .B0(\i_data[12] ), .B1(n63), .Y(
        R[12]) );
  AO22X4 U390 ( .A0(temp2[11]), .A1(n53), .B0(\i_data[11] ), .B1(n63), .Y(
        R[11]) );
  PC1 PC1 ( .out(temp1), .\in[63] (\i_data[127] ), .\in[62] (\i_data[126] ), 
        .\in[61] (\i_data[125] ), .\in[60] (\i_data[124] ), .\in[59] (
        \i_data[123] ), .\in[58] (\i_data[122] ), .\in[57] (\i_data[121] ), 
        .\in[55] (\i_data[119] ), .\in[54] (\i_data[118] ), .\in[53] (
        \i_data[117] ), .\in[52] (\i_data[116] ), .\in[51] (\i_data[115] ), 
        .\in[50] (\i_data[114] ), .\in[49] (\i_data[113] ), .\in[47] (
        \i_data[111] ), .\in[46] (\i_data[110] ), .\in[45] (\i_data[109] ), 
        .\in[44] (\i_data[108] ), .\in[43] (\i_data[107] ), .\in[42] (
        \i_data[106] ), .\in[41] (\i_data[105] ), .\in[39] (\i_data[103] ), 
        .\in[38] (\i_data[102] ), .\in[37] (\i_data[101] ), .\in[36] (
        \i_data[100] ), .\in[35] (\i_data[99] ), .\in[34] (\i_data[98] ), 
        .\in[33] (\i_data[97] ), .\in[31] (\i_data[95] ), .\in[30] (
        \i_data[94] ), .\in[29] (\i_data[93] ), .\in[28] (\i_data[92] ), 
        .\in[27] (\i_data[91] ), .\in[26] (\i_data[90] ), .\in[25] (
        \i_data[89] ), .\in[23] (\i_data[87] ), .\in[22] (\i_data[86] ), 
        .\in[21] (\i_data[85] ), .\in[20] (\i_data[84] ), .\in[19] (
        \i_data[83] ), .\in[18] (\i_data[82] ), .\in[17] (\i_data[81] ), 
        .\in[15] (\i_data[79] ), .\in[14] (\i_data[78] ), .\in[13] (
        \i_data[77] ), .\in[12] (\i_data[76] ), .\in[11] (\i_data[75] ), 
        .\in[10] (\i_data[74] ), .\in[9] (\i_data[73] ), .\in[7] (\i_data[71] ), .\in[6] (\i_data[70] ), .\in[5] (\i_data[69] ), .\in[4] (\i_data[68] ), 
        .\in[3] (\i_data[67] ), .\in[2] (\i_data[66] ), .\in[1] (\i_data[65] )
         );
  initial_permutation init_p ( .in({\i_data[63] , \i_data[62] , \i_data[61] , 
        \i_data[60] , \i_data[59] , \i_data[58] , \i_data[57] , \i_data[56] , 
        \i_data[55] , \i_data[54] , \i_data[53] , \i_data[52] , \i_data[51] , 
        \i_data[50] , \i_data[49] , \i_data[48] , \i_data[47] , \i_data[46] , 
        \i_data[45] , \i_data[44] , \i_data[43] , \i_data[42] , \i_data[41] , 
        \i_data[40] , \i_data[39] , \i_data[38] , \i_data[37] , \i_data[36] , 
        \i_data[35] , \i_data[34] , \i_data[33] , \i_data[32] , \i_data[31] , 
        \i_data[30] , \i_data[29] , \i_data[28] , \i_data[27] , \i_data[26] , 
        \i_data[25] , \i_data[24] , \i_data[23] , \i_data[22] , \i_data[21] , 
        \i_data[20] , \i_data[19] , \i_data[18] , \i_data[17] , \i_data[16] , 
        \i_data[15] , \i_data[14] , \i_data[13] , \i_data[12] , \i_data[11] , 
        \i_data[10] , \i_data[9] , \i_data[8] , \i_data[7] , \i_data[6] , 
        \i_data[5] , \i_data[4] , \i_data[3] , \i_data[2] , \i_data[1] , 
        \i_data[0] }), .out(temp2) );
  final_permutation final_p ( .in({R_xor[31:8], n4, R_xor[6:0], R}), .out(
        temp3) );
  PC2 PC2 ( .out(key), .\in[55] (\down_r[27] ), .\in[54] (\down_r[26] ), 
        .\in[53] (\down_r[25] ), .\in[52] (\down_r[24] ), .\in[51] (
        \down_r[23] ), .\in[50] (\down_r[22] ), .\in[49] (\down_r[21] ), 
        .\in[48] (\down_r[20] ), .\in[46] (\down_r[18] ), .\in[45] (
        \down_r[17] ), .\in[44] (\down_r[16] ), .\in[43] (\down_r[15] ), 
        .\in[42] (\down_r[14] ), .\in[41] (\down_r[13] ), .\in[40] (
        \down_r[12] ), .\in[39] (\down_r[11] ), .\in[37] (\down_r[9] ), 
        .\in[36] (\down_r[8] ), .\in[35] (\down_r[7] ), .\in[33] (\down_r[5] ), 
        .\in[32] (\down_r[4] ), .\in[30] (\down_r[2] ), .\in[29] (\down_r[1] ), 
        .\in[28] (\down_r[0] ), .\in[27] (\up_r[27] ), .\in[26] (\up_r[26] ), 
        .\in[25] (\up_r[25] ), .\in[24] (\up_r[24] ), .\in[23] (\up_r[23] ), 
        .\in[22] (\up_r[22] ), .\in[20] (\up_r[20] ), .\in[19] (\up_r[19] ), 
        .\in[17] (\up_r[17] ), .\in[16] (\up_r[16] ), .\in[15] (\up_r[15] ), 
        .\in[14] (\up_r[14] ), .\in[12] (\up_r[12] ), .\in[11] (\up_r[11] ), 
        .\in[10] (\up_r[10] ), .\in[9] (\up_r[9] ), .\in[8] (\up_r[8] ), 
        .\in[7] (\up_r[7] ), .\in[6] (\up_r[6] ), .\in[5] (\up_r[5] ), 
        .\in[4] (\up_r[4] ), .\in[3] (\up_r[3] ), .\in[1] (\up_r[1] ), 
        .\in[0] (\up_r[0] ) );
  f_function F ( .in(R), .key(key), .out(temp4) );
  SNPS_CLOCK_GATE_HIGH_DES_0 clk_gate_down_r_reg ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net729), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_13 clk_gate_down_r_reg_0 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net735), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_12 clk_gate_down_r_reg_1 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net740), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_11 clk_gate_down_r_reg_2 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net745), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_10 clk_gate_down_r_reg_3 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net750), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_9 clk_gate_down_r_reg_4 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net755), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_8 clk_gate_down_r_reg_5 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net760), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_7 clk_gate_up_r_reg ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net765), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_6 clk_gate_up_r_reg_0 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net770), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_5 clk_gate_up_r_reg_1 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net775), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_4 clk_gate_up_r_reg_2 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net780), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_3 clk_gate_up_r_reg_3 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net785), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_2 clk_gate_up_r_reg_4 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net790), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_DES_1 clk_gate_up_r_reg_5 ( .CLK(i_clk), .EN(enable), 
        .ENCLK(net795), .TE(1'b0) );
  DFFRX1 down_r_reg_10_ ( .D(down_w[10]), .CK(net750), .RN(n27), .Q(
        \down_r[10] ) );
  DFFRX1 down_r_reg_6_ ( .D(down_w[6]), .CK(net755), .RN(n27), .Q(\down_r[6] )
         );
  DFFRX1 down_r_reg_19_ ( .D(down_w[19]), .CK(net740), .RN(n28), .Q(
        \down_r[19] ) );
  DFFRX1 down_r_reg_3_ ( .D(down_w[3]), .CK(net760), .RN(n29), .Q(\down_r[3] )
         );
  DFFRX1 up_r_reg_18_ ( .D(up_w[18]), .CK(net775), .RN(n29), .Q(\up_r[18] ) );
  DFFRX1 up_r_reg_2_ ( .D(up_w[2]), .CK(net795), .RN(n30), .Q(\up_r[2] ) );
  DFFRX1 up_r_reg_21_ ( .D(up_w[21]), .CK(net770), .RN(n30), .Q(\up_r[21] ) );
  DFFRX1 up_r_reg_13_ ( .D(up_w[13]), .CK(net780), .RN(n31), .Q(\up_r[13] ) );
  DFFRX1 down_r_reg_22_ ( .D(down_w[22]), .CK(net735), .RN(n27), .Q(
        \down_r[22] ) );
  DFFRX1 down_r_reg_9_ ( .D(down_w[9]), .CK(net750), .RN(n29), .Q(\down_r[9] )
         );
  DFFRX1 up_r_reg_4_ ( .D(up_w[4]), .CK(net790), .RN(n30), .Q(\up_r[4] ) );
  DFFRX1 down_r_reg_15_ ( .D(down_w[15]), .CK(net745), .RN(n28), .Q(
        \down_r[15] ) );
  DFFRX1 up_r_reg_3_ ( .D(up_w[3]), .CK(net795), .RN(n31), .Q(\up_r[3] ) );
  DFFRX1 up_r_reg_12_ ( .D(up_w[12]), .CK(net780), .RN(n30), .Q(\up_r[12] ) );
  DFFRX1 down_r_reg_16_ ( .D(down_w[16]), .CK(net740), .RN(n27), .Q(
        \down_r[16] ) );
  DFFRX1 up_r_reg_7_ ( .D(up_w[7]), .CK(net790), .RN(n31), .Q(\up_r[7] ) );
  DFFRX1 up_r_reg_17_ ( .D(up_w[17]), .CK(net775), .RN(n31), .Q(\up_r[17] ) );
  DFFRX1 down_r_reg_25_ ( .D(down_w[25]), .CK(net729), .RN(n28), .Q(
        \down_r[25] ) );
  DFFRX1 down_r_reg_18_ ( .D(down_w[18]), .CK(net740), .RN(n27), .Q(
        \down_r[18] ) );
  DFFRX1 down_r_reg_11_ ( .D(down_w[11]), .CK(net750), .RN(n28), .Q(
        \down_r[11] ) );
  DFFRX1 up_r_reg_0_ ( .D(up_w[0]), .CK(net795), .RN(n29), .Q(\up_r[0] ) );
  DFFRX1 up_r_reg_22_ ( .D(up_w[22]), .CK(net770), .RN(n29), .Q(\up_r[22] ) );
  DFFRX1 down_r_reg_7_ ( .D(down_w[7]), .CK(net755), .RN(n29), .Q(\down_r[7] )
         );
  DFFRX1 up_r_reg_27_ ( .D(up_w[27]), .CK(net765), .RN(n30), .Q(\up_r[27] ) );
  DFFRX1 up_r_reg_20_ ( .D(up_w[20]), .CK(net770), .RN(n29), .Q(\up_r[20] ) );
  DFFRX1 down_r_reg_0_ ( .D(down_w[0]), .CK(net760), .RN(n27), .Q(\down_r[0] )
         );
  DFFRX1 up_r_reg_14_ ( .D(up_w[14]), .CK(net780), .RN(n29), .Q(\up_r[14] ) );
  DFFRX1 up_r_reg_6_ ( .D(up_w[6]), .CK(net790), .RN(n30), .Q(\up_r[6] ) );
  DFFRX1 up_r_reg_8_ ( .D(up_w[8]), .CK(net785), .RN(n30), .Q(\up_r[8] ) );
  DFFRX1 up_r_reg_26_ ( .D(up_w[26]), .CK(net765), .RN(n29), .Q(\up_r[26] ) );
  DFFRX1 down_r_reg_20_ ( .D(down_w[20]), .CK(net735), .RN(n27), .Q(
        \down_r[20] ) );
  DFFRX1 up_r_reg_10_ ( .D(up_w[10]), .CK(net785), .RN(n30), .Q(\up_r[10] ) );
  DFFRX1 down_r_reg_13_ ( .D(down_w[13]), .CK(net745), .RN(n28), .Q(
        \down_r[13] ) );
  DFFRX1 up_r_reg_24_ ( .D(up_w[24]), .CK(net765), .RN(n29), .Q(\up_r[24] ) );
  DFFRX1 down_r_reg_5_ ( .D(down_w[5]), .CK(net755), .RN(n29), .Q(\down_r[5] )
         );
  DFFRX1 up_r_reg_5_ ( .D(up_w[5]), .CK(net790), .RN(n31), .Q(\up_r[5] ) );
  DFFRX1 down_r_reg_2_ ( .D(down_w[2]), .CK(net760), .RN(n28), .Q(\down_r[2] )
         );
  DFFRX1 down_r_reg_24_ ( .D(down_w[24]), .CK(net729), .RN(n27), .Q(
        \down_r[24] ) );
  DFFRX1 down_r_reg_21_ ( .D(down_w[21]), .CK(net735), .RN(n28), .Q(
        \down_r[21] ) );
  DFFRX1 up_r_reg_23_ ( .D(up_w[23]), .CK(net770), .RN(n30), .Q(\up_r[23] ) );
  DFFRX1 down_r_reg_26_ ( .D(down_w[26]), .CK(net729), .RN(n27), .Q(
        \down_r[26] ) );
  DFFRX1 up_r_reg_11_ ( .D(up_w[11]), .CK(net785), .RN(n31), .Q(\up_r[11] ) );
  DFFRX1 down_r_reg_12_ ( .D(down_w[12]), .CK(net745), .RN(n27), .Q(
        \down_r[12] ) );
  DFFRX1 down_r_reg_17_ ( .D(down_w[17]), .CK(net740), .RN(n28), .Q(
        \down_r[17] ) );
  DFFRX1 down_r_reg_14_ ( .D(down_w[14]), .CK(net745), .RN(n27), .Q(
        \down_r[14] ) );
  DFFRX1 down_r_reg_23_ ( .D(down_w[23]), .CK(net735), .RN(n28), .Q(
        \down_r[23] ) );
  DFFRX1 up_r_reg_16_ ( .D(up_w[16]), .CK(net775), .RN(n29), .Q(\up_r[16] ) );
  DFFRX1 down_r_reg_4_ ( .D(down_w[4]), .CK(net755), .RN(n28), .Q(\down_r[4] )
         );
  DFFRX1 up_r_reg_25_ ( .D(up_w[25]), .CK(net765), .RN(n30), .Q(\up_r[25] ) );
  DFFRX1 down_r_reg_27_ ( .D(down_w[27]), .CK(net729), .RN(n28), .Q(
        \down_r[27] ) );
  DFFRX1 up_r_reg_19_ ( .D(up_w[19]), .CK(net775), .RN(n30), .Q(\up_r[19] ) );
  DFFRX1 down_r_reg_1_ ( .D(down_w[1]), .CK(net760), .RN(n28), .Q(\down_r[1] )
         );
  DFFRX1 up_r_reg_15_ ( .D(up_w[15]), .CK(net780), .RN(n31), .Q(\up_r[15] ) );
  DFFRX1 up_r_reg_9_ ( .D(up_w[9]), .CK(net785), .RN(n31), .Q(\up_r[9] ) );
  DFFRX1 up_r_reg_1_ ( .D(up_w[1]), .CK(net795), .RN(n30), .Q(\up_r[1] ) );
  DFFRX1 down_r_reg_8_ ( .D(down_w[8]), .CK(net750), .RN(n27), .Q(\down_r[8] )
         );
  XOR2X4 U2 ( .A(n1), .B(temp4[14]), .Y(R_xor[14]) );
  OA22X1 U3 ( .A0(temp2[46]), .A1(n61), .B0(\i_data[46] ), .B1(n52), .Y(n1) );
  XOR2X4 U4 ( .A(n2), .B(temp4[26]), .Y(R_xor[26]) );
  OA22X1 U5 ( .A0(temp2[58]), .A1(n59), .B0(\i_data[58] ), .B1(n51), .Y(n2) );
  XOR2X4 U6 ( .A(n3), .B(temp4[5]), .Y(R_xor[5]) );
  OA22XL U7 ( .A0(temp2[37]), .A1(n58), .B0(\i_data[37] ), .B1(n51), .Y(n3) );
  XNOR2X1 U8 ( .A(n296), .B(temp4[7]), .Y(n4) );
  XNOR2XL U9 ( .A(n296), .B(temp4[7]), .Y(R_xor[7]) );
  AO22X2 U10 ( .A0(n43), .A1(R_xor[2]), .B0(temp3[2]), .B1(n46), .Y(o_data[2])
         );
  AO22X2 U11 ( .A0(n43), .A1(R_xor[28]), .B0(temp3[28]), .B1(n46), .Y(
        o_data[28]) );
  XNOR2X4 U12 ( .A(n305), .B(temp4[28]), .Y(R_xor[28]) );
  AO22X2 U13 ( .A0(n42), .A1(R_xor[4]), .B0(temp3[4]), .B1(n48), .Y(o_data[4])
         );
  XNOR2X4 U14 ( .A(n325), .B(temp4[0]), .Y(R_xor[0]) );
  XNOR2X2 U15 ( .A(n310), .B(temp4[23]), .Y(R_xor[23]) );
  AO22X2 U16 ( .A0(temp2[6]), .A1(n52), .B0(\i_data[6] ), .B1(n62), .Y(R[6])
         );
  AO22X4 U17 ( .A0(n42), .A1(R[20]), .B0(temp3[52]), .B1(n49), .Y(o_data[52])
         );
  AO22X2 U18 ( .A0(n42), .A1(R_xor[22]), .B0(temp3[22]), .B1(n45), .Y(
        o_data[22]) );
  AO22X2 U19 ( .A0(n42), .A1(R[14]), .B0(temp3[46]), .B1(n48), .Y(o_data[46])
         );
  XNOR2X2 U20 ( .A(n315), .B(temp4[19]), .Y(R_xor[19]) );
  XNOR2X2 U21 ( .A(n304), .B(temp4[29]), .Y(R_xor[29]) );
  XNOR2X4 U22 ( .A(n297), .B(temp4[6]), .Y(R_xor[6]) );
  XNOR2X4 U23 ( .A(n312), .B(temp4[21]), .Y(R_xor[21]) );
  AO22X4 U24 ( .A0(n43), .A1(R_xor[5]), .B0(temp3[5]), .B1(n49), .Y(o_data[5])
         );
  XNOR2X2 U25 ( .A(n303), .B(temp4[2]), .Y(R_xor[2]) );
  XNOR2X4 U26 ( .A(n318), .B(temp4[16]), .Y(R_xor[16]) );
  XNOR2X4 U27 ( .A(n295), .B(temp4[8]), .Y(R_xor[8]) );
  XNOR2X2 U28 ( .A(n300), .B(temp4[3]), .Y(R_xor[3]) );
  OAI22XL U29 ( .A0(temp2[49]), .A1(n60), .B0(\i_data[49] ), .B1(n51), .Y(n317) );
  NAND2X1 U30 ( .A(n5), .B(n6), .Y(n8) );
  AO22X2 U31 ( .A0(temp2[16]), .A1(n53), .B0(\i_data[16] ), .B1(n63), .Y(R[16]) );
  XNOR2X2 U32 ( .A(n324), .B(temp4[10]), .Y(R_xor[10]) );
  OAI22XL U33 ( .A0(temp2[52]), .A1(n60), .B0(\i_data[52] ), .B1(n51), .Y(n313) );
  CLKINVX1 U34 ( .A(temp4[20]), .Y(n6) );
  OAI22XL U35 ( .A0(temp2[56]), .A1(n54), .B0(\i_data[56] ), .B1(n51), .Y(n309) );
  CLKINVX1 U36 ( .A(temp4[24]), .Y(n10) );
  AO22X2 U37 ( .A0(temp2[0]), .A1(n53), .B0(\i_data[0] ), .B1(n54), .Y(R[0])
         );
  AO22X1 U38 ( .A0(temp2[31]), .A1(n52), .B0(\i_data[31] ), .B1(n62), .Y(R[31]) );
  AO22X1 U39 ( .A0(temp2[2]), .A1(n52), .B0(\i_data[2] ), .B1(n62), .Y(R[2])
         );
  NAND2X1 U40 ( .A(n17), .B(n18), .Y(R_xor[17]) );
  NAND2X1 U41 ( .A(n317), .B(temp4[17]), .Y(n17) );
  NAND2X1 U42 ( .A(n15), .B(n16), .Y(n18) );
  AO22X1 U43 ( .A0(temp2[25]), .A1(n53), .B0(\i_data[25] ), .B1(n62), .Y(R[25]) );
  AO22X1 U44 ( .A0(temp2[24]), .A1(n53), .B0(\i_data[24] ), .B1(n62), .Y(R[24]) );
  AO22X1 U45 ( .A0(temp2[26]), .A1(n53), .B0(\i_data[26] ), .B1(n62), .Y(R[26]) );
  AO22X1 U46 ( .A0(temp2[23]), .A1(n53), .B0(\i_data[23] ), .B1(n62), .Y(R[23]) );
  AO22X1 U47 ( .A0(temp2[15]), .A1(n53), .B0(\i_data[15] ), .B1(n63), .Y(R[15]) );
  AO22X2 U48 ( .A0(temp2[27]), .A1(n53), .B0(\i_data[27] ), .B1(n62), .Y(R[27]) );
  AO22X2 U49 ( .A0(temp2[19]), .A1(n53), .B0(\i_data[19] ), .B1(n62), .Y(R[19]) );
  CLKBUFX2 U50 ( .A(n124), .Y(n37) );
  BUFX2 U51 ( .A(first), .Y(n50) );
  AO22X1 U52 ( .A0(n43), .A1(R_xor[18]), .B0(temp3[18]), .B1(n45), .Y(
        o_data[18]) );
  AO22X4 U53 ( .A0(n43), .A1(R[16]), .B0(temp3[48]), .B1(n48), .Y(o_data[48])
         );
  NAND2X1 U54 ( .A(n313), .B(temp4[20]), .Y(n7) );
  NAND2X2 U55 ( .A(n7), .B(n8), .Y(R_xor[20]) );
  INVX1 U56 ( .A(n313), .Y(n5) );
  NAND2X2 U57 ( .A(n309), .B(temp4[24]), .Y(n11) );
  NAND2X2 U58 ( .A(n9), .B(n10), .Y(n12) );
  NAND2X2 U59 ( .A(n11), .B(n12), .Y(R_xor[24]) );
  INVXL U60 ( .A(n309), .Y(n9) );
  AO22XL U61 ( .A0(n43), .A1(R_xor[24]), .B0(temp3[24]), .B1(n45), .Y(
        o_data[24]) );
  NAND2X1 U62 ( .A(n13), .B(n14), .Y(R[30]) );
  NAND2X1 U63 ( .A(temp2[30]), .B(n52), .Y(n13) );
  NAND2X1 U64 ( .A(\i_data[30] ), .B(n62), .Y(n14) );
  AO22XL U65 ( .A0(n43), .A1(R[30]), .B0(temp3[62]), .B1(n49), .Y(o_data[62])
         );
  CLKINVX1 U66 ( .A(n55), .Y(n52) );
  CLKBUFX3 U67 ( .A(n64), .Y(n62) );
  CLKBUFX3 U68 ( .A(n65), .Y(n54) );
  AO22X4 U69 ( .A0(n43), .A1(R_xor[0]), .B0(temp3[0]), .B1(n44), .Y(o_data[0])
         );
  AO22XL U70 ( .A0(n43), .A1(R[0]), .B0(temp3[32]), .B1(n46), .Y(o_data[32])
         );
  INVXL U71 ( .A(n317), .Y(n15) );
  INVX1 U72 ( .A(temp4[17]), .Y(n16) );
  AO22X1 U73 ( .A0(temp2[1]), .A1(n53), .B0(\i_data[1] ), .B1(n62), .Y(R[1])
         );
  AO22XL U74 ( .A0(n43), .A1(R[28]), .B0(temp3[60]), .B1(n49), .Y(o_data[60])
         );
  NAND2X1 U75 ( .A(fnsel), .B(prep_key1), .Y(n25) );
  NAND2X1 U76 ( .A(fnsel), .B(prep_key1), .Y(n132) );
  AO22XL U77 ( .A0(R_xor[1]), .A1(n43), .B0(temp3[1]), .B1(n45), .Y(o_data[1])
         );
  CLKBUFX2 U78 ( .A(n65), .Y(n55) );
  XNOR2X1 U79 ( .A(n19), .B(temp4[22]), .Y(R_xor[22]) );
  OAI22XL U80 ( .A0(temp2[54]), .A1(n60), .B0(\i_data[54] ), .B1(n51), .Y(n19)
         );
  CLKINVX1 U81 ( .A(n37), .Y(n39) );
  NAND2X1 U82 ( .A(prep_key1), .B(n380), .Y(n24) );
  NAND2X1 U83 ( .A(prep_key1), .B(n380), .Y(n131) );
  CLKINVX1 U84 ( .A(prep_key1), .Y(n382) );
  OAI22XL U85 ( .A0(temp2[61]), .A1(n58), .B0(\i_data[61] ), .B1(n51), .Y(n304) );
  NAND2XL U86 ( .A(shift), .B(fnsel), .Y(n20) );
  NOR2XL U87 ( .A(fnsel), .B(shift), .Y(n197) );
  INVXL U88 ( .A(fnsel), .Y(n380) );
  AO22X4 U89 ( .A0(n42), .A1(R[6]), .B0(temp3[38]), .B1(n47), .Y(o_data[38])
         );
  AO22X4 U90 ( .A0(n43), .A1(R_xor[16]), .B0(temp3[16]), .B1(n44), .Y(
        o_data[16]) );
  AO22X4 U91 ( .A0(n42), .A1(R_xor[10]), .B0(temp3[10]), .B1(n44), .Y(
        o_data[10]) );
  AO22X4 U92 ( .A0(n43), .A1(R_xor[6]), .B0(temp3[6]), .B1(n49), .Y(o_data[6])
         );
  AO22XL U93 ( .A0(n43), .A1(R[26]), .B0(temp3[58]), .B1(n49), .Y(o_data[58])
         );
  AO22XL U94 ( .A0(n42), .A1(R[22]), .B0(temp3[54]), .B1(n49), .Y(o_data[54])
         );
  OAI221XL U95 ( .A0(n24), .A1(n372), .B0(n379), .B1(n25), .C0(n200), .Y(n127)
         );
  OAI221XL U96 ( .A0(n24), .A1(n330), .B0(n25), .B1(n337), .C0(n136), .Y(n134)
         );
  OAI221XL U97 ( .A0(n131), .A1(n362), .B0(n25), .B1(n369), .C0(n290), .Y(n238) );
  OAI221XL U98 ( .A0(n131), .A1(n364), .B0(n132), .B1(n371), .C0(n182), .Y(
        n180) );
  OAI221XL U99 ( .A0(n131), .A1(n363), .B0(n132), .B1(n370), .C0(n154), .Y(
        n152) );
  OAI221XL U100 ( .A0(n24), .A1(n367), .B0(n132), .B1(n374), .C0(n288), .Y(
        n215) );
  OAI221XL U101 ( .A0(n24), .A1(n360), .B0(n132), .B1(n367), .C0(n283), .Y(
        n213) );
  OAI221XL U102 ( .A0(n24), .A1(n361), .B0(n132), .B1(n368), .C0(n266), .Y(
        n264) );
  OAI221XL U103 ( .A0(n24), .A1(n358), .B0(n25), .B1(n365), .C0(n195), .Y(n125) );
  OAI221XL U104 ( .A0(n24), .A1(n329), .B0(n25), .B1(n336), .C0(n191), .Y(n189) );
  OAI221XL U105 ( .A0(n24), .A1(n342), .B0(n25), .B1(n350), .C0(n173), .Y(n171) );
  OAI221XL U106 ( .A0(n24), .A1(n328), .B0(n25), .B1(n335), .C0(n163), .Y(n161) );
  OAI221XL U107 ( .A0(n24), .A1(n345), .B0(n25), .B1(n349), .C0(n168), .Y(n147) );
  OAI221XL U108 ( .A0(n131), .A1(n320), .B0(n25), .B1(n332), .C0(n220), .Y(
        n218) );
  OAI221XL U109 ( .A0(n131), .A1(n326), .B0(n25), .B1(n333), .C0(n275), .Y(
        n273) );
  OAI221XL U110 ( .A0(n131), .A1(n327), .B0(n25), .B1(n334), .C0(n247), .Y(
        n245) );
  OAI221XL U111 ( .A0(n24), .A1(n349), .B0(n132), .B1(n356), .C0(n209), .Y(
        n149) );
  OAI221XL U112 ( .A0(n24), .A1(n346), .B0(n132), .B1(n352), .C0(n229), .Y(
        n227) );
  OAI221XL U113 ( .A0(n24), .A1(n332), .B0(n132), .B1(n339), .C0(n223), .Y(
        n221) );
  OAI221XL U114 ( .A0(n24), .A1(n347), .B0(n132), .B1(n353), .C0(n286), .Y(
        n282) );
  OAI221XL U115 ( .A0(n24), .A1(n333), .B0(n132), .B1(n340), .C0(n278), .Y(
        n276) );
  OAI221XL U117 ( .A0(n24), .A1(n348), .B0(n132), .B1(n354), .C0(n260), .Y(
        n258) );
  OAI221XL U118 ( .A0(n24), .A1(n334), .B0(n132), .B1(n341), .C0(n250), .Y(
        n248) );
  OAI221XL U119 ( .A0(n24), .A1(n373), .B0(n132), .B1(n355), .C0(n255), .Y(
        n234) );
  OAI221XL U120 ( .A0(n24), .A1(n359), .B0(n132), .B1(n366), .C0(n291), .Y(
        n254) );
  OAI221XL U121 ( .A0(n24), .A1(n331), .B0(n132), .B1(n338), .C0(n207), .Y(
        n167) );
  OAI221XL U122 ( .A0(n24), .A1(n371), .B0(n25), .B1(n378), .C0(n185), .Y(n183) );
  OAI221XL U123 ( .A0(n24), .A1(n370), .B0(n25), .B1(n377), .C0(n157), .Y(n155) );
  OAI221XL U124 ( .A0(n131), .A1(n374), .B0(n25), .B1(n320), .C0(n285), .Y(
        n217) );
  OAI221XL U125 ( .A0(n131), .A1(n368), .B0(n25), .B1(n375), .C0(n269), .Y(
        n267) );
  OAI221XL U126 ( .A0(n131), .A1(n369), .B0(n25), .B1(n376), .C0(n241), .Y(
        n239) );
  OAI221XL U127 ( .A0(n24), .A1(n357), .B0(n25), .B1(n364), .C0(n179), .Y(n177) );
  OAI221XL U128 ( .A0(n131), .A1(n356), .B0(n25), .B1(n363), .C0(n206), .Y(
        n151) );
  OAI221XL U129 ( .A0(n131), .A1(n352), .B0(n25), .B1(n359), .C0(n253), .Y(
        n230) );
  OAI221XL U130 ( .A0(n131), .A1(n353), .B0(n25), .B1(n360), .C0(n287), .Y(
        n211) );
  OAI221XL U131 ( .A0(n131), .A1(n354), .B0(n25), .B1(n361), .C0(n263), .Y(
        n261) );
  OAI221XL U132 ( .A0(n131), .A1(n350), .B0(n132), .B1(n357), .C0(n176), .Y(
        n174) );
  OAI221XL U133 ( .A0(n24), .A1(n355), .B0(n132), .B1(n362), .C0(n293), .Y(
        n236) );
  OAI221XL U134 ( .A0(n131), .A1(n338), .B0(n25), .B1(n345), .C0(n208), .Y(
        n145) );
  OAI221XL U135 ( .A0(n131), .A1(n339), .B0(n25), .B1(n346), .C0(n226), .Y(
        n224) );
  OAI221XL U136 ( .A0(n131), .A1(n340), .B0(n25), .B1(n347), .C0(n281), .Y(
        n279) );
  OAI221XL U137 ( .A0(n131), .A1(n341), .B0(n25), .B1(n348), .C0(n257), .Y(
        n251) );
  OAI221XL U138 ( .A0(n131), .A1(n335), .B0(n132), .B1(n342), .C0(n170), .Y(
        n164) );
  OAI221XL U139 ( .A0(n131), .A1(n366), .B0(n25), .B1(n373), .C0(n292), .Y(
        n232) );
  OAI221XL U140 ( .A0(n131), .A1(n336), .B0(n132), .B1(n343), .C0(n194), .Y(
        n192) );
  OAI221XL U141 ( .A0(n131), .A1(n378), .B0(n132), .B1(n329), .C0(n188), .Y(
        n186) );
  OAI221XL U142 ( .A0(n131), .A1(n377), .B0(n132), .B1(n328), .C0(n160), .Y(
        n158) );
  OAI221XL U143 ( .A0(n24), .A1(n375), .B0(n132), .B1(n326), .C0(n272), .Y(
        n270) );
  OAI221XL U144 ( .A0(n24), .A1(n376), .B0(n132), .B1(n327), .C0(n244), .Y(
        n242) );
  OAI221XL U145 ( .A0(n131), .A1(n311), .B0(n132), .B1(n331), .C0(n166), .Y(
        n143) );
  OAI221XL U146 ( .A0(n24), .A1(n344), .B0(n25), .B1(n311), .C0(n142), .Y(n140) );
  OAI221XL U147 ( .A0(n131), .A1(n337), .B0(n132), .B1(n344), .C0(n139), .Y(
        n137) );
  OAI221XL U148 ( .A0(n131), .A1(n379), .B0(n132), .B1(n330), .C0(n133), .Y(
        n129) );
  CLKINVX1 U149 ( .A(i_rst), .Y(n307) );
  CLKINVX1 U150 ( .A(n54), .Y(n53) );
  CLKINVX1 U151 ( .A(n56), .Y(n51) );
  CLKINVX1 U152 ( .A(n44), .Y(n43) );
  CLKINVX1 U153 ( .A(n46), .Y(n42) );
  CLKBUFX3 U154 ( .A(n64), .Y(n63) );
  CLKBUFX3 U155 ( .A(n61), .Y(n57) );
  CLKBUFX3 U156 ( .A(n60), .Y(n56) );
  CLKBUFX3 U157 ( .A(n60), .Y(n59) );
  CLKINVX1 U158 ( .A(n39), .Y(n38) );
  CLKBUFX3 U159 ( .A(n64), .Y(n60) );
  CLKBUFX3 U160 ( .A(n64), .Y(n61) );
  CLKBUFX3 U161 ( .A(n60), .Y(n58) );
  CLKBUFX3 U162 ( .A(n40), .Y(n44) );
  CLKBUFX3 U163 ( .A(n382), .Y(n34) );
  CLKBUFX3 U164 ( .A(n41), .Y(n49) );
  CLKBUFX3 U165 ( .A(n41), .Y(n48) );
  CLKBUFX3 U166 ( .A(n382), .Y(n36) );
  CLKBUFX3 U167 ( .A(n382), .Y(n35) );
  CLKBUFX3 U168 ( .A(n382), .Y(n33) );
  CLKBUFX3 U169 ( .A(n382), .Y(n32) );
  CLKBUFX3 U170 ( .A(n40), .Y(n45) );
  CLKBUFX3 U171 ( .A(n40), .Y(n46) );
  CLKBUFX3 U172 ( .A(n41), .Y(n47) );
  OAI22XL U173 ( .A0(temp2[39]), .A1(n56), .B0(\i_data[39] ), .B1(n51), .Y(
        n296) );
  OAI22XL U174 ( .A0(temp2[38]), .A1(n57), .B0(\i_data[38] ), .B1(n51), .Y(
        n297) );
  AO22X1 U175 ( .A0(temp2[17]), .A1(n53), .B0(\i_data[17] ), .B1(n63), .Y(
        R[17]) );
  AO22X1 U176 ( .A0(temp2[14]), .A1(n53), .B0(\i_data[14] ), .B1(n63), .Y(
        R[14]) );
  AO22X1 U177 ( .A0(temp2[18]), .A1(n53), .B0(\i_data[18] ), .B1(n63), .Y(
        R[18]) );
  OAI22XL U178 ( .A0(temp2[35]), .A1(n58), .B0(\i_data[35] ), .B1(n51), .Y(
        n300) );
  OAI22XL U179 ( .A0(temp2[41]), .A1(n59), .B0(\i_data[41] ), .B1(n51), .Y(
        n294) );
  AO22X1 U180 ( .A0(temp2[13]), .A1(n53), .B0(\i_data[13] ), .B1(n63), .Y(
        R[13]) );
  OAI22XL U181 ( .A0(temp2[44]), .A1(n61), .B0(\i_data[44] ), .B1(n52), .Y(
        n322) );
  AO22X1 U182 ( .A0(temp2[29]), .A1(n53), .B0(\i_data[29] ), .B1(n62), .Y(
        R[29]) );
  AO22X1 U183 ( .A0(temp2[9]), .A1(n52), .B0(\i_data[9] ), .B1(n56), .Y(R[9])
         );
  OAI22XL U184 ( .A0(temp2[34]), .A1(n58), .B0(\i_data[34] ), .B1(n51), .Y(
        n303) );
  OAI22XL U185 ( .A0(temp2[42]), .A1(n61), .B0(\i_data[42] ), .B1(n52), .Y(
        n324) );
  OAI22XL U186 ( .A0(temp2[45]), .A1(n61), .B0(\i_data[45] ), .B1(n52), .Y(
        n321) );
  AO22X1 U187 ( .A0(temp2[10]), .A1(n53), .B0(\i_data[10] ), .B1(n63), .Y(
        R[10]) );
  XNOR2X1 U188 ( .A(n323), .B(temp4[11]), .Y(R_xor[11]) );
  OAI22XL U189 ( .A0(temp2[43]), .A1(n61), .B0(\i_data[43] ), .B1(n52), .Y(
        n323) );
  XNOR2X1 U190 ( .A(n299), .B(temp4[4]), .Y(R_xor[4]) );
  OAI22XL U191 ( .A0(temp2[36]), .A1(n58), .B0(\i_data[36] ), .B1(n51), .Y(
        n299) );
  AO22XL U192 ( .A0(temp2[5]), .A1(n52), .B0(\i_data[5] ), .B1(n62), .Y(R[5])
         );
  CLKINVX1 U193 ( .A(n50), .Y(n65) );
  OAI22XL U194 ( .A0(temp2[47]), .A1(n61), .B0(\i_data[47] ), .B1(n52), .Y(
        n319) );
  CLKINVX1 U195 ( .A(n50), .Y(n64) );
  AO22X1 U196 ( .A0(temp2[22]), .A1(n53), .B0(\i_data[22] ), .B1(n62), .Y(
        R[22]) );
  XNOR2X1 U197 ( .A(n314), .B(temp4[1]), .Y(R_xor[1]) );
  OAI22XL U198 ( .A0(temp2[33]), .A1(n60), .B0(\i_data[33] ), .B1(n51), .Y(
        n314) );
  OAI22XL U199 ( .A0(temp2[53]), .A1(n60), .B0(\i_data[53] ), .B1(n51), .Y(
        n312) );
  XNOR2X1 U200 ( .A(n316), .B(temp4[18]), .Y(R_xor[18]) );
  OAI22XL U201 ( .A0(temp2[50]), .A1(n60), .B0(\i_data[50] ), .B1(n51), .Y(
        n316) );
  OAI22XL U202 ( .A0(temp2[55]), .A1(n59), .B0(\i_data[55] ), .B1(n51), .Y(
        n310) );
  OAI22XL U203 ( .A0(temp2[51]), .A1(n60), .B0(\i_data[51] ), .B1(n51), .Y(
        n315) );
  INVX3 U204 ( .A(n197), .Y(n381) );
  CLKBUFX3 U205 ( .A(n20), .Y(n22) );
  CLKBUFX3 U206 ( .A(n20), .Y(n21) );
  CLKBUFX3 U207 ( .A(n20), .Y(n23) );
  CLKBUFX3 U208 ( .A(last), .Y(n40) );
  CLKBUFX3 U209 ( .A(last), .Y(n41) );
  AO22X1 U210 ( .A0(temp2[21]), .A1(n53), .B0(\i_data[21] ), .B1(n62), .Y(
        R[21]) );
  OAI22XL U211 ( .A0(temp2[40]), .A1(n55), .B0(\i_data[40] ), .B1(n51), .Y(
        n295) );
  OAI22XL U212 ( .A0(temp2[60]), .A1(n59), .B0(\i_data[60] ), .B1(n51), .Y(
        n305) );
  OAI22XL U213 ( .A0(temp2[59]), .A1(n59), .B0(\i_data[59] ), .B1(n51), .Y(
        n306) );
  OAI22XL U214 ( .A0(temp2[32]), .A1(n59), .B0(\i_data[32] ), .B1(n52), .Y(
        n325) );
  OAI22XL U215 ( .A0(temp2[63]), .A1(n58), .B0(\i_data[63] ), .B1(n51), .Y(
        n301) );
  XNOR2X1 U216 ( .A(n308), .B(temp4[25]), .Y(R_xor[25]) );
  OAI22XL U217 ( .A0(temp2[57]), .A1(n59), .B0(\i_data[57] ), .B1(n51), .Y(
        n308) );
  XNOR2X1 U218 ( .A(n302), .B(temp4[30]), .Y(R_xor[30]) );
  OAI22XL U219 ( .A0(temp2[62]), .A1(n58), .B0(\i_data[62] ), .B1(n51), .Y(
        n302) );
  OAI22XL U220 ( .A0(temp2[48]), .A1(n61), .B0(\i_data[48] ), .B1(n52), .Y(
        n318) );
  OAI221XL U221 ( .A0(n121), .A1(n381), .B0(n118), .B1(n39), .C0(n126), .Y(
        up_w[7]) );
  OA22X1 U222 ( .A0(n21), .A1(n104), .B0(n26), .B1(n105), .Y(n126) );
  CLKINVX1 U223 ( .A(n134), .Y(n105) );
  CLKINVX1 U224 ( .A(temp1[5]), .Y(n337) );
  OAI221XL U225 ( .A0(n119), .A1(n381), .B0(n117), .B1(n39), .C0(n120), .Y(
        up_w[9]) );
  OA22X1 U226 ( .A0(n21), .A1(n103), .B0(n122), .B1(n104), .Y(n120) );
  CLKINVX1 U227 ( .A(n127), .Y(n104) );
  CLKINVX1 U228 ( .A(temp1[7]), .Y(n379) );
  CLKINVX1 U229 ( .A(temp1[8]), .Y(n372) );
  OAI221XL U230 ( .A0(n115), .A1(n122), .B0(n114), .B1(n22), .C0(n178), .Y(
        up_w[16]) );
  AOI2BB2X1 U231 ( .B0(n124), .B1(n177), .A0N(n381), .A1N(n101), .Y(n178) );
  OAI221XL U232 ( .A0(n111), .A1(n26), .B0(n110), .B1(n22), .C0(n150), .Y(
        up_w[24]) );
  AOI2BB2X1 U233 ( .B0(n37), .B1(n151), .A0N(n381), .A1N(n97), .Y(n150) );
  OAI221XL U234 ( .A0(n76), .A1(n122), .B0(n75), .B1(n22), .C0(n210), .Y(
        down_w[9]) );
  AOI2BB2X1 U235 ( .B0(n124), .B1(n211), .A0N(n381), .A1N(n91), .Y(n210) );
  OAI221XL U236 ( .A0(n72), .A1(n26), .B0(n71), .B1(n21), .C0(n262), .Y(
        down_w[17]) );
  AOI2BB2X1 U237 ( .B0(n38), .B1(n261), .A0N(n381), .A1N(n87), .Y(n262) );
  OAI221XL U238 ( .A0(n68), .A1(n122), .B0(n67), .B1(n21), .C0(n235), .Y(
        down_w[25]) );
  AOI2BB2X1 U239 ( .B0(n38), .B1(n236), .A0N(n381), .A1N(n83), .Y(n235) );
  OAI221XL U240 ( .A0(n91), .A1(n26), .B0(n90), .B1(n22), .C0(n212), .Y(
        down_w[8]) );
  AOI2BB2X1 U241 ( .B0(n124), .B1(n213), .A0N(n381), .A1N(n77), .Y(n212) );
  CLKINVX1 U242 ( .A(n180), .Y(n114) );
  CLKINVX1 U243 ( .A(n152), .Y(n110) );
  CLKINVX1 U244 ( .A(n213), .Y(n75) );
  CLKINVX1 U245 ( .A(n264), .Y(n71) );
  CLKINVX1 U246 ( .A(n238), .Y(n67) );
  CLKINVX1 U247 ( .A(n215), .Y(n90) );
  CLKINVX1 U248 ( .A(temp1[16]), .Y(n371) );
  CLKINVX1 U249 ( .A(temp1[24]), .Y(n370) );
  CLKINVX1 U250 ( .A(temp1[36]), .Y(n374) );
  CLKINVX1 U251 ( .A(temp1[37]), .Y(n367) );
  CLKINVX1 U252 ( .A(temp1[45]), .Y(n368) );
  CLKINVX1 U253 ( .A(temp1[53]), .Y(n369) );
  OAI221XL U254 ( .A0(n99), .A1(n26), .B0(n98), .B1(n22), .C0(n169), .Y(
        up_w[19]) );
  AOI2BB2X1 U255 ( .B0(n124), .B1(n164), .A0N(n381), .A1N(n114), .Y(n169) );
  OAI221XL U256 ( .A0(n95), .A1(n122), .B0(n94), .B1(n22), .C0(n144), .Y(
        up_w[27]) );
  AOI2BB2X1 U257 ( .B0(n37), .B1(n145), .A0N(n381), .A1N(n110), .Y(n144) );
  OAI221XL U258 ( .A0(n75), .A1(n26), .B0(n74), .B1(n21), .C0(n280), .Y(
        down_w[11]) );
  AOI2BB2X1 U259 ( .B0(n38), .B1(n279), .A0N(n381), .A1N(n90), .Y(n280) );
  OAI221XL U260 ( .A0(n89), .A1(n122), .B0(n88), .B1(n21), .C0(n277), .Y(
        down_w[12]) );
  AOI2BB2X1 U261 ( .B0(n38), .B1(n276), .A0N(n381), .A1N(n75), .Y(n277) );
  OAI221XL U262 ( .A0(n85), .A1(n26), .B0(n84), .B1(n21), .C0(n249), .Y(
        down_w[20]) );
  AOI2BB2X1 U263 ( .B0(n38), .B1(n248), .A0N(n381), .A1N(n71), .Y(n249) );
  OAI221XL U264 ( .A0(n81), .A1(n26), .B0(n80), .B1(n22), .C0(n289), .Y(
        down_w[0]) );
  AOI2BB2X1 U265 ( .B0(n38), .B1(n254), .A0N(n381), .A1N(n67), .Y(n289) );
  OAI221XL U266 ( .A0(n106), .A1(n122), .B0(n105), .B1(n23), .C0(n130), .Y(
        up_w[5]) );
  AOI2BB2X1 U267 ( .B0(n37), .B1(n129), .A0N(n381), .A1N(n298), .Y(n130) );
  OAI221XL U268 ( .A0(n119), .A1(n122), .B0(n118), .B1(n21), .C0(n123), .Y(
        up_w[8]) );
  AOI2BB2X1 U269 ( .B0(n124), .B1(n125), .A0N(n381), .A1N(n105), .Y(n123) );
  CLKINVX1 U270 ( .A(n125), .Y(n103) );
  CLKINVX1 U271 ( .A(temp1[9]), .Y(n365) );
  OAI221XL U272 ( .A0(n102), .A1(n26), .B0(n101), .B1(n22), .C0(n187), .Y(
        up_w[13]) );
  AOI2BB2X1 U273 ( .B0(n124), .B1(n186), .A0N(n381), .A1N(n117), .Y(n187) );
  OAI221XL U274 ( .A0(n98), .A1(n122), .B0(n97), .B1(n22), .C0(n159), .Y(
        up_w[21]) );
  AOI2BB2X1 U275 ( .B0(n37), .B1(n158), .A0N(n381), .A1N(n113), .Y(n159) );
  OAI221XL U276 ( .A0(n94), .A1(n122), .B0(n107), .B1(n22), .C0(n165), .Y(
        up_w[1]) );
  AOI2BB2X1 U277 ( .B0(n124), .B1(n143), .A0N(n381), .A1N(n109), .Y(n165) );
  OAI221XL U278 ( .A0(n110), .A1(n26), .B0(n109), .B1(n22), .C0(n146), .Y(
        up_w[26]) );
  AOI2BB2X1 U279 ( .B0(n37), .B1(n147), .A0N(n381), .A1N(n96), .Y(n146) );
  OAI221XL U280 ( .A0(n79), .A1(n122), .B0(n78), .B1(n21), .C0(n225), .Y(
        down_w[3]) );
  AOI2BB2X1 U281 ( .B0(n38), .B1(n224), .A0N(n381), .A1N(n80), .Y(n225) );
  OAI221XL U282 ( .A0(n78), .A1(n122), .B0(n77), .B1(n22), .C0(n219), .Y(
        down_w[5]) );
  AOI2BB2X1 U283 ( .B0(n38), .B1(n218), .A0N(n381), .A1N(n93), .Y(n219) );
  OAI221XL U284 ( .A0(n74), .A1(n26), .B0(n73), .B1(n21), .C0(n274), .Y(
        down_w[13]) );
  AOI2BB2X1 U285 ( .B0(n38), .B1(n273), .A0N(n381), .A1N(n89), .Y(n274) );
  OAI221XL U286 ( .A0(n71), .A1(n26), .B0(n70), .B1(n21), .C0(n256), .Y(
        down_w[19]) );
  AOI2BB2X1 U287 ( .B0(n38), .B1(n251), .A0N(n381), .A1N(n86), .Y(n256) );
  OAI221XL U288 ( .A0(n70), .A1(n122), .B0(n69), .B1(n21), .C0(n246), .Y(
        down_w[21]) );
  AOI2BB2X1 U289 ( .B0(n38), .B1(n245), .A0N(n381), .A1N(n85), .Y(n246) );
  OAI221XL U290 ( .A0(n67), .A1(n122), .B0(n66), .B1(n21), .C0(n231), .Y(
        down_w[27]) );
  AOI2BB2X1 U291 ( .B0(n38), .B1(n232), .A0N(n381), .A1N(n82), .Y(n231) );
  OAI221XL U292 ( .A0(n66), .A1(n122), .B0(n79), .B1(n21), .C0(n252), .Y(
        down_w[1]) );
  AOI2BB2X1 U293 ( .B0(n38), .B1(n230), .A0N(n381), .A1N(n81), .Y(n252) );
  OAI221XL U294 ( .A0(n92), .A1(n26), .B0(n91), .B1(n22), .C0(n216), .Y(
        down_w[6]) );
  AOI2BB2X1 U295 ( .B0(n37), .B1(n217), .A0N(n381), .A1N(n78), .Y(n216) );
  OAI221XL U296 ( .A0(n88), .A1(n122), .B0(n87), .B1(n21), .C0(n271), .Y(
        down_w[14]) );
  AOI2BB2X1 U297 ( .B0(n38), .B1(n270), .A0N(n381), .A1N(n74), .Y(n271) );
  OAI221XL U298 ( .A0(n84), .A1(n26), .B0(n83), .B1(n21), .C0(n243), .Y(
        down_w[22]) );
  AOI2BB2X1 U299 ( .B0(n37), .B1(n242), .A0N(n381), .A1N(n70), .Y(n243) );
  CLKINVX1 U300 ( .A(n189), .Y(n101) );
  CLKINVX1 U301 ( .A(n171), .Y(n98) );
  CLKINVX1 U302 ( .A(n161), .Y(n97) );
  CLKINVX1 U303 ( .A(n167), .Y(n107) );
  CLKINVX1 U304 ( .A(n147), .Y(n94) );
  CLKINVX1 U305 ( .A(n149), .Y(n109) );
  CLKINVX1 U306 ( .A(n227), .Y(n78) );
  CLKINVX1 U307 ( .A(n221), .Y(n77) );
  CLKINVX1 U308 ( .A(n282), .Y(n74) );
  CLKINVX1 U309 ( .A(n276), .Y(n73) );
  CLKINVX1 U310 ( .A(n258), .Y(n70) );
  CLKINVX1 U311 ( .A(n248), .Y(n69) );
  CLKINVX1 U312 ( .A(n254), .Y(n79) );
  CLKINVX1 U313 ( .A(n234), .Y(n66) );
  CLKINVX1 U314 ( .A(n218), .Y(n91) );
  CLKINVX1 U315 ( .A(n273), .Y(n87) );
  CLKINVX1 U316 ( .A(n245), .Y(n83) );
  CLKINVX1 U317 ( .A(temp1[13]), .Y(n336) );
  CLKINVX1 U318 ( .A(temp1[19]), .Y(n350) );
  CLKINVX1 U319 ( .A(temp1[21]), .Y(n335) );
  CLKINVX1 U320 ( .A(temp1[26]), .Y(n356) );
  CLKINVX1 U321 ( .A(temp1[27]), .Y(n349) );
  CLKINVX1 U322 ( .A(temp1[1]), .Y(n338) );
  CLKINVX1 U323 ( .A(temp1[31]), .Y(n352) );
  CLKINVX1 U324 ( .A(temp1[33]), .Y(n339) );
  CLKINVX1 U325 ( .A(temp1[34]), .Y(n332) );
  CLKINVX1 U326 ( .A(temp1[39]), .Y(n353) );
  CLKINVX1 U327 ( .A(temp1[41]), .Y(n340) );
  CLKINVX1 U328 ( .A(temp1[42]), .Y(n333) );
  CLKINVX1 U329 ( .A(temp1[47]), .Y(n354) );
  CLKINVX1 U330 ( .A(temp1[49]), .Y(n341) );
  CLKINVX1 U331 ( .A(temp1[50]), .Y(n334) );
  CLKINVX1 U332 ( .A(temp1[55]), .Y(n355) );
  CLKINVX1 U333 ( .A(temp1[29]), .Y(n366) );
  OAI221XL U334 ( .A0(n108), .A1(n26), .B0(n298), .B1(n22), .C0(n141), .Y(
        up_w[2]) );
  AOI2BB2X1 U335 ( .B0(n124), .B1(n140), .A0N(n381), .A1N(n94), .Y(n141) );
  OAI221XL U336 ( .A0(n298), .A1(n26), .B0(n121), .B1(n23), .C0(n135), .Y(
        up_w[4]) );
  AOI2BB2X1 U337 ( .B0(n124), .B1(n134), .A0N(n381), .A1N(n107), .Y(n135) );
  OAI221XL U338 ( .A0(n112), .A1(n26), .B0(n111), .B1(n22), .C0(n156), .Y(
        up_w[22]) );
  AOI2BB2X1 U339 ( .B0(n124), .B1(n155), .A0N(n381), .A1N(n98), .Y(n156) );
  OAI221XL U340 ( .A0(n80), .A1(n26), .B0(n93), .B1(n21), .C0(n228), .Y(
        down_w[2]) );
  AOI2BB2X1 U341 ( .B0(n37), .B1(n227), .A0N(n381), .A1N(n66), .Y(n228) );
  OAI221XL U342 ( .A0(n93), .A1(n26), .B0(n92), .B1(n21), .C0(n222), .Y(
        down_w[4]) );
  AOI2BB2X1 U343 ( .B0(n124), .B1(n221), .A0N(n381), .A1N(n79), .Y(n222) );
  OAI221XL U344 ( .A0(n87), .A1(n122), .B0(n86), .B1(n21), .C0(n265), .Y(
        down_w[16]) );
  AOI2BB2X1 U345 ( .B0(n38), .B1(n264), .A0N(n381), .A1N(n73), .Y(n265) );
  OAI221XL U346 ( .A0(n83), .A1(n26), .B0(n82), .B1(n21), .C0(n237), .Y(
        down_w[24]) );
  AOI2BB2X1 U347 ( .B0(n124), .B1(n238), .A0N(n381), .A1N(n69), .Y(n237) );
  OAI221XL U348 ( .A0(n118), .A1(n122), .B0(n117), .B1(n22), .C0(n196), .Y(
        up_w[10]) );
  AOI2BB2X1 U349 ( .B0(n197), .B1(n127), .A0N(n39), .A1N(n102), .Y(n196) );
  CLKINVX1 U350 ( .A(temp1[11]), .Y(n351) );
  OAI221XL U351 ( .A0(n117), .A1(n122), .B0(n116), .B1(n22), .C0(n190), .Y(
        up_w[12]) );
  AOI2BB2X1 U352 ( .B0(n124), .B1(n189), .A0N(n381), .A1N(n103), .Y(n190) );
  OAI221XL U353 ( .A0(n100), .A1(n26), .B0(n99), .B1(n22), .C0(n175), .Y(
        up_w[17]) );
  AOI2BB2X1 U354 ( .B0(n124), .B1(n174), .A0N(n381), .A1N(n115), .Y(n175) );
  OAI221XL U355 ( .A0(n96), .A1(n122), .B0(n95), .B1(n22), .C0(n148), .Y(
        up_w[25]) );
  AOI2BB2X1 U356 ( .B0(n124), .B1(n149), .A0N(n381), .A1N(n111), .Y(n148) );
  OAI221XL U357 ( .A0(n114), .A1(n122), .B0(n113), .B1(n22), .C0(n172), .Y(
        up_w[18]) );
  AOI2BB2X1 U358 ( .B0(n124), .B1(n171), .A0N(n381), .A1N(n100), .Y(n172) );
  OAI221XL U359 ( .A0(n90), .A1(n122), .B0(n89), .B1(n21), .C0(n284), .Y(
        down_w[10]) );
  AOI2BB2X1 U360 ( .B0(n38), .B1(n282), .A0N(n381), .A1N(n76), .Y(n284) );
  OAI221XL U361 ( .A0(n86), .A1(n122), .B0(n85), .B1(n21), .C0(n259), .Y(
        down_w[18]) );
  AOI2BB2X1 U364 ( .B0(n38), .B1(n258), .A0N(n381), .A1N(n72), .Y(n259) );
  OAI221XL U365 ( .A0(n82), .A1(n26), .B0(n81), .B1(n21), .C0(n233), .Y(
        down_w[26]) );
  AOI2BB2X1 U368 ( .B0(n124), .B1(n234), .A0N(n381), .A1N(n68), .Y(n233) );
  CLKINVX1 U369 ( .A(n177), .Y(n99) );
  CLKINVX1 U370 ( .A(n151), .Y(n95) );
  CLKINVX1 U371 ( .A(n174), .Y(n113) );
  CLKINVX1 U373 ( .A(n230), .Y(n93) );
  CLKINVX1 U374 ( .A(n211), .Y(n89) );
  CLKINVX1 U375 ( .A(n261), .Y(n85) );
  CLKINVX1 U376 ( .A(n236), .Y(n81) );
  CLKINVX1 U377 ( .A(temp1[17]), .Y(n364) );
  CLKINVX1 U378 ( .A(temp1[18]), .Y(n357) );
  CLKINVX1 U379 ( .A(temp1[25]), .Y(n363) );
  CLKINVX1 U381 ( .A(temp1[38]), .Y(n360) );
  CLKINVX1 U382 ( .A(temp1[46]), .Y(n361) );
  CLKINVX1 U383 ( .A(temp1[54]), .Y(n362) );
  CLKINVX1 U384 ( .A(temp1[30]), .Y(n359) );
  OAI221XL U385 ( .A0(n113), .A1(n26), .B0(n112), .B1(n22), .C0(n162), .Y(
        up_w[20]) );
  AOI2BB2X1 U386 ( .B0(n124), .B1(n161), .A0N(n381), .A1N(n99), .Y(n162) );
  OAI221XL U387 ( .A0(n109), .A1(n26), .B0(n108), .B1(n22), .C0(n205), .Y(
        up_w[0]) );
  AOI2BB2X1 U388 ( .B0(n124), .B1(n167), .A0N(n381), .A1N(n95), .Y(n205) );
  CLKINVX1 U391 ( .A(temp1[12]), .Y(n343) );
  CLKINVX1 U392 ( .A(temp1[20]), .Y(n342) );
  CLKINVX1 U393 ( .A(temp1[0]), .Y(n345) );
  CLKINVX1 U394 ( .A(temp1[32]), .Y(n346) );
  CLKINVX1 U395 ( .A(temp1[40]), .Y(n347) );
  CLKINVX1 U396 ( .A(temp1[48]), .Y(n348) );
  CLKINVX1 U397 ( .A(n192), .Y(n116) );
  CLKINVX1 U398 ( .A(n164), .Y(n112) );
  CLKINVX1 U399 ( .A(n145), .Y(n108) );
  CLKINVX1 U400 ( .A(n224), .Y(n92) );
  CLKINVX1 U401 ( .A(n279), .Y(n88) );
  CLKINVX1 U402 ( .A(n251), .Y(n84) );
  OAI221XL U403 ( .A0(n107), .A1(n122), .B0(n106), .B1(n22), .C0(n138), .Y(
        up_w[3]) );
  AOI2BB2X1 U404 ( .B0(n124), .B1(n137), .A0N(n381), .A1N(n108), .Y(n138) );
  OAI221XL U405 ( .A0(n101), .A1(n26), .B0(n100), .B1(n22), .C0(n181), .Y(
        up_w[15]) );
  AOI2BB2X1 U406 ( .B0(n124), .B1(n180), .A0N(n381), .A1N(n116), .Y(n181) );
  OAI221XL U407 ( .A0(n97), .A1(n122), .B0(n96), .B1(n22), .C0(n153), .Y(
        up_w[23]) );
  AOI2BB2X1 U408 ( .B0(n124), .B1(n152), .A0N(n381), .A1N(n112), .Y(n153) );
  OAI221XL U409 ( .A0(n77), .A1(n122), .B0(n76), .B1(n22), .C0(n214), .Y(
        down_w[7]) );
  AOI2BB2X1 U410 ( .B0(n124), .B1(n215), .A0N(n381), .A1N(n92), .Y(n214) );
  OAI221XL U411 ( .A0(n73), .A1(n26), .B0(n72), .B1(n21), .C0(n268), .Y(
        down_w[15]) );
  AOI2BB2X1 U412 ( .B0(n38), .B1(n267), .A0N(n381), .A1N(n88), .Y(n268) );
  OAI221XL U413 ( .A0(n69), .A1(n122), .B0(n68), .B1(n21), .C0(n240), .Y(
        down_w[23]) );
  AOI2BB2X1 U414 ( .B0(n124), .B1(n239), .A0N(n381), .A1N(n84), .Y(n240) );
  CLKINVX1 U415 ( .A(temp1[4]), .Y(n344) );
  CLKINVX1 U416 ( .A(n267), .Y(n86) );
  CLKINVX1 U417 ( .A(n239), .Y(n82) );
  CLKINVX1 U418 ( .A(n232), .Y(n80) );
  CLKINVX1 U419 ( .A(n137), .Y(n121) );
  CLKINVX1 U420 ( .A(temp1[44]), .Y(n375) );
  CLKINVX1 U421 ( .A(temp1[52]), .Y(n376) );
  CLKINVX1 U422 ( .A(temp1[28]), .Y(n373) );
  OAI221XL U423 ( .A0(n103), .A1(n26), .B0(n102), .B1(n22), .C0(n193), .Y(
        up_w[11]) );
  AOI2BB2X1 U424 ( .B0(n37), .B1(n192), .A0N(n381), .A1N(n118), .Y(n193) );
  OAI221XL U425 ( .A0(n116), .A1(n122), .B0(n115), .B1(n22), .C0(n184), .Y(
        up_w[14]) );
  AOI2BB2X1 U426 ( .B0(n37), .B1(n183), .A0N(n381), .A1N(n102), .Y(n184) );
  OAI221XL U427 ( .A0(n121), .A1(n26), .B0(n119), .B1(n23), .C0(n128), .Y(
        up_w[6]) );
  AOI2BB2X1 U428 ( .B0(n37), .B1(n127), .A0N(n381), .A1N(n106), .Y(n128) );
  CLKINVX1 U429 ( .A(n140), .Y(n106) );
  CLKINVX1 U430 ( .A(temp1[3]), .Y(n311) );
  CLKINVX1 U431 ( .A(n183), .Y(n100) );
  CLKINVX1 U432 ( .A(n155), .Y(n96) );
  CLKINVX1 U433 ( .A(temp1[15]), .Y(n378) );
  CLKINVX1 U434 ( .A(temp1[23]), .Y(n377) );
  CLKINVX1 U435 ( .A(temp1[6]), .Y(n330) );
  CLKINVX1 U436 ( .A(temp1[10]), .Y(n358) );
  CLKINVX1 U437 ( .A(n143), .Y(n298) );
  CLKINVX1 U438 ( .A(n186), .Y(n115) );
  CLKINVX1 U439 ( .A(n158), .Y(n111) );
  CLKINVX1 U440 ( .A(n217), .Y(n76) );
  CLKINVX1 U441 ( .A(n270), .Y(n72) );
  CLKINVX1 U442 ( .A(n242), .Y(n68) );
  CLKINVX1 U443 ( .A(temp1[14]), .Y(n329) );
  CLKINVX1 U444 ( .A(temp1[22]), .Y(n328) );
  CLKINVX1 U445 ( .A(temp1[2]), .Y(n331) );
  CLKINVX1 U446 ( .A(temp1[35]), .Y(n320) );
  CLKINVX1 U447 ( .A(temp1[43]), .Y(n326) );
  CLKINVX1 U448 ( .A(temp1[51]), .Y(n327) );
  CLKINVX1 U449 ( .A(n129), .Y(n119) );
  NOR2X1 U450 ( .A(n380), .B(shift), .Y(n124) );
  NAND2X1 U451 ( .A(shift), .B(n380), .Y(n122) );
  NAND2X1 U452 ( .A(shift), .B(n380), .Y(n26) );
  CLKBUFX3 U453 ( .A(n307), .Y(n30) );
  CLKBUFX3 U454 ( .A(n307), .Y(n29) );
  CLKBUFX3 U455 ( .A(n307), .Y(n28) );
  CLKBUFX3 U456 ( .A(n307), .Y(n27) );
  CLKBUFX3 U457 ( .A(n307), .Y(n31) );
  AO22X1 U458 ( .A0(n42), .A1(R_xor[3]), .B0(temp3[3]), .B1(n47), .Y(o_data[3]) );
  AO22X1 U459 ( .A0(n43), .A1(R_xor[7]), .B0(temp3[7]), .B1(n49), .Y(o_data[7]) );
  AO22X1 U460 ( .A0(n42), .A1(R[8]), .B0(temp3[40]), .B1(n47), .Y(o_data[40])
         );
  AO22X1 U461 ( .A0(n42), .A1(R[10]), .B0(temp3[42]), .B1(n48), .Y(o_data[42])
         );
  AO22X1 U462 ( .A0(n42), .A1(R[2]), .B0(temp3[34]), .B1(n47), .Y(o_data[34])
         );
  AO22X1 U463 ( .A0(n43), .A1(R_xor[9]), .B0(temp3[9]), .B1(n49), .Y(o_data[9]) );
  AO22X1 U464 ( .A0(n42), .A1(R_xor[13]), .B0(temp3[13]), .B1(n44), .Y(
        o_data[13]) );
  AO22X1 U465 ( .A0(n42), .A1(R_xor[11]), .B0(temp3[11]), .B1(n44), .Y(
        o_data[11]) );
  AO22X1 U466 ( .A0(n43), .A1(R_xor[27]), .B0(temp3[27]), .B1(n46), .Y(
        o_data[27]) );
  AO22X1 U467 ( .A0(n42), .A1(R_xor[20]), .B0(temp3[20]), .B1(n45), .Y(
        o_data[20]) );
  AO22X1 U468 ( .A0(n42), .A1(R[24]), .B0(temp3[56]), .B1(n49), .Y(o_data[56])
         );
  AO22X1 U469 ( .A0(n42), .A1(R_xor[29]), .B0(temp3[29]), .B1(n46), .Y(
        o_data[29]) );
  AO22X1 U470 ( .A0(n42), .A1(R_xor[31]), .B0(temp3[31]), .B1(n46), .Y(
        o_data[31]) );
  AO22X1 U471 ( .A0(n42), .A1(R_xor[17]), .B0(temp3[17]), .B1(n44), .Y(
        o_data[17]) );
  AO22X1 U472 ( .A0(n42), .A1(R_xor[21]), .B0(temp3[21]), .B1(n45), .Y(
        o_data[21]) );
  AO22X1 U473 ( .A0(n42), .A1(R[12]), .B0(temp3[44]), .B1(n48), .Y(o_data[44])
         );
  AO22X1 U474 ( .A0(n43), .A1(R_xor[15]), .B0(temp3[15]), .B1(n44), .Y(
        o_data[15]) );
  AO22X1 U475 ( .A0(n42), .A1(R_xor[14]), .B0(temp3[14]), .B1(n44), .Y(
        o_data[14]) );
  AO22X1 U476 ( .A0(n42), .A1(R_xor[25]), .B0(temp3[25]), .B1(n45), .Y(
        o_data[25]) );
  AO22X1 U477 ( .A0(n42), .A1(R[4]), .B0(temp3[36]), .B1(n47), .Y(o_data[36])
         );
  AO22X1 U478 ( .A0(n42), .A1(R_xor[23]), .B0(temp3[23]), .B1(n45), .Y(
        o_data[23]) );
  AO22X1 U479 ( .A0(n42), .A1(R_xor[19]), .B0(temp3[19]), .B1(n45), .Y(
        o_data[19]) );
  AO22X1 U480 ( .A0(n42), .A1(R[1]), .B0(temp3[33]), .B1(n46), .Y(o_data[33])
         );
  AO22X1 U481 ( .A0(n42), .A1(R[5]), .B0(temp3[37]), .B1(n47), .Y(o_data[37])
         );
  AO22X1 U482 ( .A0(n42), .A1(R[3]), .B0(temp3[35]), .B1(n47), .Y(o_data[35])
         );
  AO22X1 U483 ( .A0(n42), .A1(R[7]), .B0(temp3[39]), .B1(n47), .Y(o_data[39])
         );
  AO22X1 U484 ( .A0(n43), .A1(R[25]), .B0(temp3[57]), .B1(n49), .Y(o_data[57])
         );
  AO22X1 U485 ( .A0(n43), .A1(R[31]), .B0(temp3[63]), .B1(n49), .Y(o_data[63])
         );
  AO22X1 U486 ( .A0(n43), .A1(R[29]), .B0(temp3[61]), .B1(n49), .Y(o_data[61])
         );
  AO22X1 U487 ( .A0(n43), .A1(R[27]), .B0(temp3[59]), .B1(n49), .Y(o_data[59])
         );
  NAND2X1 U488 ( .A(\up_r[6] ), .B(n36), .Y(n136) );
  NAND2X1 U489 ( .A(\up_r[8] ), .B(n34), .Y(n200) );
  AO22X1 U490 ( .A0(n42), .A1(R[15]), .B0(temp3[47]), .B1(n48), .Y(o_data[47])
         );
  NAND2X1 U491 ( .A(\up_r[17] ), .B(n35), .Y(n182) );
  NAND2X1 U492 ( .A(\up_r[25] ), .B(n36), .Y(n154) );
  NAND2X1 U493 ( .A(\down_r[9] ), .B(n32), .Y(n288) );
  NAND2X1 U494 ( .A(\down_r[10] ), .B(n32), .Y(n283) );
  NAND2X1 U495 ( .A(\down_r[18] ), .B(n33), .Y(n266) );
  NAND2X1 U496 ( .A(\down_r[26] ), .B(n32), .Y(n290) );
  NAND2X1 U497 ( .A(\up_r[10] ), .B(n35), .Y(n195) );
  NAND2X1 U498 ( .A(\up_r[14] ), .B(n35), .Y(n191) );
  NAND2X1 U499 ( .A(\up_r[20] ), .B(n35), .Y(n173) );
  NAND2X1 U500 ( .A(\up_r[22] ), .B(n36), .Y(n163) );
  NAND2X1 U501 ( .A(\up_r[27] ), .B(n34), .Y(n209) );
  NAND2X1 U502 ( .A(\up_r[0] ), .B(n35), .Y(n168) );
  NAND2X1 U503 ( .A(\up_r[2] ), .B(n34), .Y(n207) );
  NAND2X1 U504 ( .A(\down_r[4] ), .B(n34), .Y(n229) );
  NAND2X1 U505 ( .A(\down_r[6] ), .B(n34), .Y(n223) );
  NAND2X1 U506 ( .A(\down_r[7] ), .B(n34), .Y(n220) );
  NAND2X1 U507 ( .A(\down_r[12] ), .B(n32), .Y(n286) );
  NAND2X1 U508 ( .A(\down_r[14] ), .B(n32), .Y(n278) );
  NAND2X1 U509 ( .A(\down_r[15] ), .B(n32), .Y(n275) );
  NAND2X1 U510 ( .A(\down_r[20] ), .B(n33), .Y(n260) );
  NAND2X1 U511 ( .A(\down_r[22] ), .B(n33), .Y(n250) );
  NAND2X1 U512 ( .A(\down_r[23] ), .B(n33), .Y(n247) );
  NAND2X1 U513 ( .A(\down_r[0] ), .B(n33), .Y(n255) );
  NAND2X1 U514 ( .A(\down_r[2] ), .B(n32), .Y(n291) );
  CLKINVX1 U515 ( .A(n198), .Y(n102) );
  OAI221XL U516 ( .A0(n131), .A1(n343), .B0(n132), .B1(n351), .C0(n199), .Y(
        n198) );
  NAND2X1 U517 ( .A(\up_r[12] ), .B(n34), .Y(n199) );
  NAND2X1 U518 ( .A(\up_r[18] ), .B(n35), .Y(n179) );
  NAND2X1 U519 ( .A(\up_r[19] ), .B(n35), .Y(n176) );
  NAND2X1 U520 ( .A(\up_r[26] ), .B(n34), .Y(n206) );
  NAND2X1 U521 ( .A(\down_r[3] ), .B(n33), .Y(n253) );
  NAND2X1 U522 ( .A(\down_r[11] ), .B(n32), .Y(n287) );
  NAND2X1 U523 ( .A(\down_r[19] ), .B(n33), .Y(n263) );
  NAND2X1 U524 ( .A(\down_r[27] ), .B(n32), .Y(n293) );
  NAND2X1 U525 ( .A(\up_r[13] ), .B(n35), .Y(n194) );
  NAND2X1 U526 ( .A(\up_r[21] ), .B(n35), .Y(n170) );
  NAND2X1 U527 ( .A(\up_r[1] ), .B(n34), .Y(n208) );
  NAND2X1 U528 ( .A(\down_r[5] ), .B(n34), .Y(n226) );
  NAND2X1 U529 ( .A(\down_r[13] ), .B(n32), .Y(n281) );
  NAND2X1 U530 ( .A(\down_r[21] ), .B(n33), .Y(n257) );
  NAND2X1 U531 ( .A(\up_r[5] ), .B(n36), .Y(n139) );
  NAND2X1 U532 ( .A(\down_r[17] ), .B(n33), .Y(n269) );
  NAND2X1 U533 ( .A(\down_r[25] ), .B(n33), .Y(n241) );
  NAND2X1 U534 ( .A(\down_r[1] ), .B(n32), .Y(n292) );
  CLKINVX1 U535 ( .A(n203), .Y(n118) );
  OAI221XL U536 ( .A0(n24), .A1(n365), .B0(n132), .B1(n372), .C0(n204), .Y(
        n203) );
  NAND2X1 U537 ( .A(\up_r[9] ), .B(n34), .Y(n204) );
  AO22X1 U538 ( .A0(n42), .A1(R[17]), .B0(temp3[49]), .B1(n48), .Y(o_data[49])
         );
  AO22X1 U539 ( .A0(n42), .A1(R[11]), .B0(temp3[43]), .B1(n48), .Y(o_data[43])
         );
  AO22X1 U540 ( .A0(n42), .A1(R[9]), .B0(temp3[41]), .B1(n47), .Y(o_data[41])
         );
  AO22X1 U541 ( .A0(n42), .A1(R[19]), .B0(temp3[51]), .B1(n49), .Y(o_data[51])
         );
  AO22X1 U542 ( .A0(n43), .A1(R[23]), .B0(temp3[55]), .B1(n49), .Y(o_data[55])
         );
  NAND2X1 U543 ( .A(\up_r[4] ), .B(n36), .Y(n142) );
  NAND2X1 U544 ( .A(\up_r[16] ), .B(n35), .Y(n185) );
  NAND2X1 U545 ( .A(\up_r[24] ), .B(n36), .Y(n157) );
  CLKINVX1 U546 ( .A(n201), .Y(n117) );
  OAI221XL U547 ( .A0(n131), .A1(n351), .B0(n25), .B1(n358), .C0(n202), .Y(
        n201) );
  NAND2X1 U548 ( .A(\up_r[11] ), .B(n34), .Y(n202) );
  NAND2X1 U549 ( .A(\up_r[3] ), .B(n35), .Y(n166) );
  NAND2X1 U550 ( .A(\up_r[15] ), .B(n35), .Y(n188) );
  NAND2X1 U551 ( .A(\up_r[23] ), .B(n36), .Y(n160) );
  NAND2X1 U552 ( .A(\down_r[8] ), .B(n32), .Y(n285) );
  NAND2X1 U553 ( .A(\down_r[16] ), .B(n33), .Y(n272) );
  NAND2X1 U554 ( .A(\down_r[24] ), .B(n33), .Y(n244) );
  AO22X1 U555 ( .A0(n42), .A1(R[21]), .B0(temp3[53]), .B1(n49), .Y(o_data[53])
         );
  NAND2X1 U556 ( .A(\up_r[7] ), .B(n36), .Y(n133) );
  AO22X1 U557 ( .A0(n43), .A1(R_xor[26]), .B0(temp3[26]), .B1(n46), .Y(
        o_data[26]) );
  AO22X1 U558 ( .A0(n42), .A1(R_xor[12]), .B0(temp3[12]), .B1(n44), .Y(
        o_data[12]) );
  XNOR2X1 U559 ( .A(n322), .B(temp4[12]), .Y(R_xor[12]) );
  AO22X1 U560 ( .A0(n42), .A1(R_xor[30]), .B0(temp3[30]), .B1(n46), .Y(
        o_data[30]) );
  XNOR2X1 U561 ( .A(n301), .B(temp4[31]), .Y(R_xor[31]) );
  AO22X1 U562 ( .A0(n43), .A1(R[18]), .B0(temp3[50]), .B1(n49), .Y(o_data[50])
         );
  AO22X1 U563 ( .A0(n42), .A1(R[13]), .B0(temp3[45]), .B1(n48), .Y(o_data[45])
         );
  XNOR2X1 U564 ( .A(n321), .B(temp4[13]), .Y(R_xor[13]) );
  XNOR2X1 U565 ( .A(n319), .B(temp4[15]), .Y(R_xor[15]) );
  XNOR2X1 U566 ( .A(n294), .B(temp4[9]), .Y(R_xor[9]) );
  XNOR2X1 U567 ( .A(n306), .B(temp4[27]), .Y(R_xor[27]) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_8 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_9 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_10 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_11 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_12 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_13 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DES_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  TLATNTSCAX2 latch ( .E(EN), .SE(TE), .CK(CLK), .ECK(ENCLK) );
endmodule


module f_function ( in, key, out );
  input [31:0] in;
  input [47:0] key;
  output [31:0] out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
  wire   [47:0] exp_out;
  wire   [47:0] temp;
  wire   [3:0] s1;
  wire   [3:0] s2;
  wire   [3:0] s3;
  wire   [3:0] s4;
  wire   [3:0] s5;
  wire   [3:0] s6;
  wire   [3:0] s7;
  wire   [3:0] s8;

  Expansion expansion ( .in(in), .out(exp_out) );
  S1 S1 ( .in(temp[47:42]), .out(s1) );
  S2 S2 ( .in(temp[41:36]), .out(s2) );
  S3 S3 ( .in(temp[35:30]), .out(s3) );
  S4 S4 ( .in(temp[29:24]), .out(s4) );
  S5 S5 ( .in(temp[23:18]), .out(s5) );
  S6 S6 ( .in({temp[17:14], n13, temp[12]}), .out(s6) );
  S7 S7 ( .in(temp[11:6]), .out(s7) );
  S8 S8 ( .in(temp[5:0]), .out(s8) );
  P_permutation P ( .in({s1, s2, s3, s4, s5, s6, s7, s8}), .out(out) );
  NAND2X4 U1 ( .A(n20), .B(n21), .Y(temp[14]) );
  XOR2X4 U2 ( .A(key[41]), .B(exp_out[41]), .Y(temp[41]) );
  XOR2X4 U3 ( .A(key[27]), .B(exp_out[27]), .Y(temp[27]) );
  XOR2X4 U4 ( .A(key[42]), .B(exp_out[42]), .Y(temp[42]) );
  XOR2X4 U5 ( .A(key[12]), .B(exp_out[12]), .Y(temp[12]) );
  XOR2X4 U6 ( .A(key[4]), .B(exp_out[4]), .Y(temp[4]) );
  NAND2X2 U7 ( .A(n3), .B(n4), .Y(temp[30]) );
  XOR2X4 U8 ( .A(key[47]), .B(exp_out[47]), .Y(temp[47]) );
  NAND2X4 U9 ( .A(n24), .B(n25), .Y(temp[2]) );
  XOR2X4 U10 ( .A(key[32]), .B(exp_out[32]), .Y(temp[32]) );
  XOR2X4 U11 ( .A(key[15]), .B(exp_out[15]), .Y(temp[15]) );
  XOR2X4 U12 ( .A(key[11]), .B(exp_out[11]), .Y(temp[11]) );
  XOR2X4 U13 ( .A(key[23]), .B(exp_out[23]), .Y(temp[23]) );
  XOR2X4 U14 ( .A(key[0]), .B(exp_out[0]), .Y(temp[0]) );
  NAND2X2 U15 ( .A(n30), .B(exp_out[45]), .Y(n33) );
  NAND2X2 U16 ( .A(key[45]), .B(n31), .Y(n32) );
  XOR2X2 U17 ( .A(key[28]), .B(exp_out[28]), .Y(temp[28]) );
  NAND2X2 U18 ( .A(n7), .B(n8), .Y(temp[37]) );
  NAND2X2 U19 ( .A(n1), .B(exp_out[30]), .Y(n4) );
  NAND2X1 U20 ( .A(key[30]), .B(n2), .Y(n3) );
  CLKINVX1 U21 ( .A(exp_out[2]), .Y(n23) );
  XOR2X2 U22 ( .A(key[43]), .B(exp_out[43]), .Y(temp[43]) );
  XOR2X2 U23 ( .A(key[35]), .B(exp_out[35]), .Y(temp[35]) );
  XOR2X2 U24 ( .A(key[31]), .B(exp_out[31]), .Y(temp[31]) );
  XOR2X1 U25 ( .A(key[19]), .B(exp_out[19]), .Y(temp[19]) );
  CLKINVX1 U26 ( .A(exp_out[30]), .Y(n2) );
  CLKINVX1 U27 ( .A(exp_out[5]), .Y(n10) );
  CLKINVX1 U28 ( .A(exp_out[45]), .Y(n31) );
  XOR2X1 U29 ( .A(key[8]), .B(exp_out[8]), .Y(temp[8]) );
  INVX3 U30 ( .A(exp_out[44]), .Y(n15) );
  XOR2X1 U31 ( .A(key[26]), .B(exp_out[26]), .Y(temp[26]) );
  CLKINVX1 U32 ( .A(exp_out[14]), .Y(n19) );
  XOR2X1 U33 ( .A(key[10]), .B(exp_out[10]), .Y(temp[10]) );
  NAND2X2 U34 ( .A(n28), .B(n29), .Y(temp[17]) );
  NAND2X1 U35 ( .A(key[17]), .B(n27), .Y(n28) );
  NAND2X1 U36 ( .A(n18), .B(exp_out[14]), .Y(n21) );
  NAND2X1 U37 ( .A(key[14]), .B(n19), .Y(n20) );
  CLKINVX1 U38 ( .A(key[14]), .Y(n18) );
  CLKBUFX3 U39 ( .A(temp[13]), .Y(n13) );
  NAND2X1 U40 ( .A(n22), .B(exp_out[2]), .Y(n25) );
  NAND2X1 U41 ( .A(key[2]), .B(n23), .Y(n24) );
  XOR2X1 U42 ( .A(key[46]), .B(exp_out[46]), .Y(temp[46]) );
  XOR2X2 U43 ( .A(key[18]), .B(exp_out[18]), .Y(temp[18]) );
  CLKINVX1 U44 ( .A(key[30]), .Y(n1) );
  NAND2X1 U45 ( .A(key[37]), .B(n6), .Y(n7) );
  NAND2X1 U46 ( .A(n5), .B(exp_out[37]), .Y(n8) );
  CLKINVX1 U47 ( .A(key[37]), .Y(n5) );
  CLKINVX1 U48 ( .A(exp_out[37]), .Y(n6) );
  NAND2X4 U49 ( .A(key[5]), .B(n10), .Y(n11) );
  NAND2X2 U50 ( .A(n9), .B(exp_out[5]), .Y(n12) );
  NAND2X4 U51 ( .A(n11), .B(n12), .Y(temp[5]) );
  CLKINVX1 U52 ( .A(key[5]), .Y(n9) );
  XOR2X1 U53 ( .A(key[13]), .B(exp_out[13]), .Y(temp[13]) );
  NAND2X1 U54 ( .A(n26), .B(exp_out[17]), .Y(n29) );
  NAND2X6 U55 ( .A(key[44]), .B(n15), .Y(n16) );
  NAND2X4 U56 ( .A(n14), .B(exp_out[44]), .Y(n17) );
  NAND2X8 U57 ( .A(n16), .B(n17), .Y(temp[44]) );
  CLKINVX2 U58 ( .A(key[44]), .Y(n14) );
  INVX1 U59 ( .A(exp_out[17]), .Y(n27) );
  INVXL U60 ( .A(key[2]), .Y(n22) );
  CLKINVX1 U61 ( .A(key[17]), .Y(n26) );
  CLKINVX1 U62 ( .A(exp_out[36]), .Y(n35) );
  NAND2X1 U63 ( .A(key[36]), .B(n35), .Y(n36) );
  CLKINVX1 U64 ( .A(key[45]), .Y(n30) );
  NAND2X6 U65 ( .A(n32), .B(n33), .Y(temp[45]) );
  NAND2X2 U66 ( .A(n36), .B(n37), .Y(temp[36]) );
  XOR2X1 U67 ( .A(key[34]), .B(exp_out[34]), .Y(temp[34]) );
  NAND2X1 U68 ( .A(n34), .B(exp_out[36]), .Y(n37) );
  INVXL U69 ( .A(key[36]), .Y(n34) );
  XOR2X1 U70 ( .A(key[40]), .B(exp_out[40]), .Y(temp[40]) );
  XOR2X2 U71 ( .A(key[22]), .B(exp_out[22]), .Y(temp[22]) );
  XOR2X1 U72 ( .A(key[1]), .B(exp_out[1]), .Y(temp[1]) );
  XOR2X1 U73 ( .A(key[25]), .B(exp_out[25]), .Y(temp[25]) );
  XOR2X4 U74 ( .A(key[21]), .B(exp_out[21]), .Y(temp[21]) );
  XOR2X4 U75 ( .A(key[20]), .B(exp_out[20]), .Y(temp[20]) );
  XOR2X4 U76 ( .A(key[29]), .B(exp_out[29]), .Y(temp[29]) );
  XOR2X4 U77 ( .A(key[24]), .B(exp_out[24]), .Y(temp[24]) );
  XOR2X4 U78 ( .A(key[9]), .B(exp_out[9]), .Y(temp[9]) );
  XOR2X4 U79 ( .A(key[39]), .B(exp_out[39]), .Y(temp[39]) );
  XOR2X4 U80 ( .A(key[3]), .B(exp_out[3]), .Y(temp[3]) );
  XOR2X4 U81 ( .A(key[6]), .B(exp_out[6]), .Y(temp[6]) );
  XOR2X4 U82 ( .A(key[33]), .B(exp_out[33]), .Y(temp[33]) );
  XOR2X1 U83 ( .A(key[38]), .B(exp_out[38]), .Y(temp[38]) );
  XOR2X2 U84 ( .A(key[7]), .B(exp_out[7]), .Y(temp[7]) );
  XOR2X1 U85 ( .A(key[16]), .B(exp_out[16]), .Y(temp[16]) );
endmodule


module P_permutation ( in, out );
  input [31:0] in;
  output [31:0] out;


  BUFX3 U1 ( .A(in[13]), .Y(out[7]) );
  BUFX3 U2 ( .A(in[19]), .Y(out[6]) );
  BUFX3 U3 ( .A(in[11]), .Y(out[28]) );
  BUFX3 U4 ( .A(in[31]), .Y(out[23]) );
  BUFX3 U5 ( .A(in[25]), .Y(out[30]) );
  BUFX3 U6 ( .A(in[16]), .Y(out[31]) );
  BUFX3 U7 ( .A(in[7]), .Y(out[0]) );
  BUFX3 U8 ( .A(in[8]), .Y(out[13]) );
  BUFX3 U9 ( .A(in[27]), .Y(out[19]) );
  BUFX3 U10 ( .A(in[12]), .Y(out[29]) );
  BUFX3 U11 ( .A(in[24]), .Y(out[14]) );
  CLKBUFX2 U12 ( .A(in[0]), .Y(out[11]) );
  BUFX4 U13 ( .A(in[9]), .Y(out[21]) );
  BUFX3 U14 ( .A(in[21]), .Y(out[2]) );
  BUFX3 U15 ( .A(in[23]), .Y(out[8]) );
  BUFX3 U16 ( .A(in[15]), .Y(out[24]) );
  BUFX3 U17 ( .A(in[2]), .Y(out[5]) );
  BUFX3 U18 ( .A(in[18]), .Y(out[12]) );
  BUFX3 U19 ( .A(in[22]), .Y(out[16]) );
  BUFX3 U20 ( .A(in[10]), .Y(out[3]) );
  CLKBUFX2 U21 ( .A(in[29]), .Y(out[9]) );
  BUFX2 U22 ( .A(in[28]), .Y(out[1]) );
  CLKBUFX3 U23 ( .A(in[6]), .Y(out[20]) );
  CLKBUFX3 U24 ( .A(in[17]), .Y(out[22]) );
  BUFX3 U25 ( .A(in[1]), .Y(out[17]) );
  BUFX2 U26 ( .A(in[4]), .Y(out[25]) );
  BUFX3 U27 ( .A(in[20]), .Y(out[26]) );
  BUFX3 U28 ( .A(in[5]), .Y(out[10]) );
  CLKBUFX2 U29 ( .A(in[26]), .Y(out[4]) );
  BUFX2 U30 ( .A(in[30]), .Y(out[15]) );
  CLKBUFX2 U31 ( .A(in[14]), .Y(out[18]) );
  BUFX2 U32 ( .A(in[3]), .Y(out[27]) );
endmodule


module S8 ( in, out );
  input [5:0] in;
  output [3:0] out;
  wire   N74, N77, N78, N79, N80, N81, N82, N83, N85, N86, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68;

  AOI221X1 U3 ( .A0(N78), .A1(n63), .B0(n11), .B1(in[2]), .C0(n10), .Y(n12) );
  INVX4 U4 ( .A(in[2]), .Y(n62) );
  CLKINVX1 U5 ( .A(N74), .Y(n1) );
  INVX3 U6 ( .A(n1), .Y(n2) );
  OAI211XL U7 ( .A0(n62), .A1(n50), .B0(n49), .C0(n48), .Y(out[3]) );
  AO22X1 U8 ( .A0(n62), .A1(N78), .B0(in[2]), .B1(n67), .Y(n31) );
  NAND2XL U9 ( .A(n9), .B(n62), .Y(n34) );
  AOI32XL U10 ( .A0(in[4]), .A1(in[3]), .A2(n4), .B0(N79), .B1(n41), .Y(n6) );
  NOR2XL U11 ( .A(in[4]), .B(in[3]), .Y(n41) );
  AO22XL U12 ( .A0(n61), .A1(N82), .B0(n17), .B1(n43), .Y(n18) );
  OAI221X1 U13 ( .A0(n21), .A1(n58), .B0(in[1]), .B1(n20), .C0(n19), .Y(out[1]) );
  CLKINVX1 U14 ( .A(N80), .Y(n66) );
  AOI222X1 U15 ( .A0(N79), .A1(n47), .B0(n63), .B1(N80), .C0(n46), .C1(n51), 
        .Y(n48) );
  NAND2X2 U16 ( .A(N86), .B(N82), .Y(N80) );
  OAI22X1 U17 ( .A0(N81), .A1(n26), .B0(n56), .B1(n2), .Y(n16) );
  INVX1 U18 ( .A(n26), .Y(n56) );
  OAI21X1 U19 ( .A0(n52), .A1(n45), .B0(n44), .Y(n46) );
  AOI22X1 U20 ( .A0(n16), .A1(in[2]), .B0(n15), .B1(n62), .Y(n20) );
  NAND2X2 U21 ( .A(in[5]), .B(n67), .Y(N82) );
  AOI221X1 U22 ( .A0(in[4]), .A1(n65), .B0(n4), .B1(n3), .C0(n39), .Y(n45) );
  NAND2X2 U23 ( .A(N86), .B(N82), .Y(n4) );
  NAND3XL U24 ( .A(in[4]), .B(in[3]), .C(N86), .Y(n22) );
  NAND2X2 U25 ( .A(in[0]), .B(n68), .Y(N86) );
  INVX4 U26 ( .A(in[0]), .Y(n67) );
  AOI21X1 U27 ( .A0(in[2]), .A1(in[4]), .B0(n40), .Y(n43) );
  AOI222XL U28 ( .A0(n67), .A1(n26), .B0(n25), .B1(N83), .C0(in[0]), .C1(n24), 
        .Y(n27) );
  NOR2X1 U29 ( .A(n24), .B(n25), .Y(n26) );
  AND2X2 U30 ( .A(in[5]), .B(n67), .Y(n5) );
  CLKINVX1 U31 ( .A(in[3]), .Y(n52) );
  AOI222X1 U32 ( .A0(n63), .A1(n2), .B0(n18), .B1(n38), .C0(N81), .C1(n59), 
        .Y(n19) );
  AOI222X1 U33 ( .A0(n32), .A1(n51), .B0(n31), .B1(n37), .C0(n30), .C1(n38), 
        .Y(n33) );
  NAND2XL U34 ( .A(in[0]), .B(in[5]), .Y(N74) );
  AO22XL U35 ( .A0(in[4]), .A1(N80), .B0(n55), .B1(n5), .Y(n17) );
  INVX1 U36 ( .A(in[5]), .Y(n68) );
  NOR2X1 U37 ( .A(in[4]), .B(in[2]), .Y(n40) );
  CLKBUFX2 U38 ( .A(n40), .Y(n3) );
  AOI22XL U39 ( .A0(N77), .A1(in[2]), .B0(n62), .B1(n67), .Y(n29) );
  NOR4XL U40 ( .A(in[2]), .B(n51), .C(n26), .D(in[5]), .Y(n10) );
  AND3XL U41 ( .A(N86), .B(n55), .C(in[2]), .Y(n39) );
  CLKINVX1 U42 ( .A(n24), .Y(n57) );
  INVXL U43 ( .A(n4), .Y(N83) );
  INVX1 U44 ( .A(n34), .Y(n63) );
  INVX1 U45 ( .A(n43), .Y(n61) );
  INVX3 U46 ( .A(in[4]), .Y(n55) );
  INVXL U47 ( .A(n37), .Y(n58) );
  NAND2X1 U48 ( .A(n66), .B(n2), .Y(N78) );
  INVX1 U49 ( .A(n21), .Y(n65) );
  NOR2BXL U50 ( .AN(n2), .B(n4), .Y(N77) );
  CLKINVX1 U51 ( .A(n2), .Y(N81) );
  CLKINVX1 U52 ( .A(N86), .Y(N79) );
  INVXL U53 ( .A(n35), .Y(n59) );
  INVXL U54 ( .A(n47), .Y(n60) );
  INVX1 U55 ( .A(n38), .Y(n53) );
  NOR2X1 U56 ( .A(n55), .B(in[3]), .Y(n24) );
  INVX1 U57 ( .A(n22), .Y(n64) );
  CLKINVX1 U58 ( .A(in[1]), .Y(n51) );
  INVXL U59 ( .A(in[5]), .Y(N85) );
  OAI21XL U60 ( .A0(n57), .A1(n4), .B0(n6), .Y(n8) );
  NOR2X1 U61 ( .A(n52), .B(in[4]), .Y(n25) );
  OAI221XL U62 ( .A0(n54), .A1(N81), .B0(n57), .B1(n2), .C0(n22), .Y(n7) );
  AOI222XL U63 ( .A0(n8), .A1(in[2]), .B0(n25), .B1(n65), .C0(n7), .C1(n62), 
        .Y(n13) );
  NOR2X1 U64 ( .A(n51), .B(n52), .Y(n38) );
  NOR2X1 U65 ( .A(n54), .B(n51), .Y(n9) );
  NAND2X1 U66 ( .A(in[2]), .B(n9), .Y(n35) );
  NOR2X1 U67 ( .A(n57), .B(n51), .Y(n37) );
  OAI221XL U68 ( .A0(in[1]), .A1(n13), .B0(n60), .B1(N85), .C0(n12), .Y(out[0]) );
  OAI22XL U69 ( .A0(n52), .A1(in[5]), .B0(in[3]), .B1(n4), .Y(n14) );
  AO22X1 U70 ( .A0(n26), .A1(in[5]), .B0(n14), .B1(n56), .Y(n15) );
  AO22X1 U71 ( .A0(n4), .A1(n25), .B0(n41), .B1(N78), .Y(n23) );
  AOI211X1 U72 ( .A0(N79), .A1(n24), .B0(n23), .C0(n64), .Y(n28) );
  OAI22XL U73 ( .A0(n62), .A1(n28), .B0(in[2]), .B1(n27), .Y(n32) );
  OAI2BB2XL U74 ( .B0(n43), .B1(n29), .A0N(n43), .A1N(in[0]), .Y(n30) );
  OAI221XL U75 ( .A0(n35), .A1(n4), .B0(n34), .B1(N86), .C0(n33), .Y(out[2])
         );
  OAI22XL U76 ( .A0(n55), .A1(N85), .B0(in[4]), .B1(n2), .Y(n36) );
  OAI2BB2XL U77 ( .B0(n57), .B1(N85), .A0N(n41), .A1N(N77), .Y(n42) );
  AOI32X1 U78 ( .A0(n43), .A1(n52), .A2(N82), .B0(n42), .B1(n61), .Y(n44) );
  AO22XL U79 ( .A0(n38), .A1(N83), .B0(n4), .B1(n37), .Y(n11) );
  AOI2BB2XL U80 ( .B0(n36), .B1(n38), .A0N(N81), .A1N(n58), .Y(n50) );
  AOI33XL U81 ( .A0(n3), .A1(n38), .A2(N86), .B0(n37), .B1(n62), .B2(N83), .Y(
        n49) );
  OAI22X1 U82 ( .A0(N85), .A1(n62), .B0(n5), .B1(in[2]), .Y(n21) );
  CLKINVX1 U83 ( .A(n41), .Y(n54) );
  OAI31X1 U84 ( .A0(n55), .A1(in[2]), .A2(n53), .B0(n35), .Y(n47) );
endmodule


module S7 ( in, out );
  input [5:0] in;
  output [3:0] out;
  wire   N74, N75, N76, N77, N78, N79, N80, N81, N83, N84, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59;

  AO22X4 U3 ( .A0(n7), .A1(in[3]), .B0(n6), .B1(n48), .Y(n2) );
  OAI221X2 U4 ( .A0(n5), .A1(in[5]), .B0(n4), .B1(n51), .C0(n3), .Y(n6) );
  OAI211X1 U5 ( .A0(N77), .A1(n41), .B0(n22), .C0(n21), .Y(n26) );
  AOI222X2 U6 ( .A0(n15), .A1(n54), .B0(n14), .B1(n55), .C0(n13), .C1(n57), 
        .Y(n16) );
  OAI221X1 U7 ( .A0(N81), .A1(n43), .B0(n50), .B1(n41), .C0(n22), .Y(n13) );
  OAI221X1 U8 ( .A0(n44), .A1(n43), .B0(n42), .B1(n41), .C0(n40), .Y(out[3])
         );
  OAI221X1 U9 ( .A0(n37), .A1(n30), .B0(n41), .B1(n29), .C0(n28), .Y(out[2])
         );
  NAND2BX1 U10 ( .AN(N74), .B(N81), .Y(N80) );
  OAI221X1 U11 ( .A0(n37), .A1(n17), .B0(n24), .B1(n29), .C0(n16), .Y(out[1])
         );
  CLKINVX2 U12 ( .A(N80), .Y(n51) );
  AOI222X1 U13 ( .A0(n27), .A1(n54), .B0(n26), .B1(n55), .C0(n25), .C1(n57), 
        .Y(n28) );
  OAI222X1 U14 ( .A0(N81), .A1(n43), .B0(n50), .B1(n20), .C0(N78), .C1(n24), 
        .Y(n27) );
  NAND2X2 U15 ( .A(in[5]), .B(in[0]), .Y(N81) );
  NAND2X2 U16 ( .A(in[5]), .B(n59), .Y(N76) );
  INVX3 U17 ( .A(in[5]), .Y(n1) );
  INVX1 U18 ( .A(in[0]), .Y(n59) );
  NAND2X1 U19 ( .A(in[0]), .B(n1), .Y(N83) );
  CLKINVX1 U20 ( .A(in[3]), .Y(n48) );
  NAND2X2 U21 ( .A(N83), .B(N76), .Y(N74) );
  OA22XL U22 ( .A0(N74), .A1(n24), .B0(n43), .B1(in[5]), .Y(n12) );
  AOI22XL U23 ( .A0(n47), .A1(n39), .B0(n49), .B1(n38), .Y(n40) );
  INVX1 U24 ( .A(N74), .Y(N78) );
  INVXL U25 ( .A(n36), .Y(n54) );
  INVX1 U26 ( .A(in[1]), .Y(n53) );
  NOR2XL U27 ( .A(N75), .B(N74), .Y(N84) );
  INVX1 U28 ( .A(n33), .Y(n57) );
  INVX1 U29 ( .A(N84), .Y(n50) );
  NAND2X2 U30 ( .A(n45), .B(n48), .Y(n43) );
  INVXL U31 ( .A(n18), .Y(n52) );
  INVX1 U32 ( .A(n20), .Y(n47) );
  INVXL U33 ( .A(n24), .Y(n49) );
  INVXL U34 ( .A(n41), .Y(n46) );
  INVXL U35 ( .A(N76), .Y(N79) );
  CLKINVX1 U36 ( .A(N81), .Y(N75) );
  CLKINVX1 U37 ( .A(N83), .Y(N77) );
  INVXL U38 ( .A(n37), .Y(n58) );
  INVXL U39 ( .A(n32), .Y(n55) );
  CLKINVX1 U40 ( .A(in[4]), .Y(n45) );
  OAI2BB2XL U41 ( .B0(n35), .B1(n10), .A0N(n35), .A1N(n2), .Y(out[0]) );
  NAND2X1 U42 ( .A(in[1]), .B(n56), .Y(n37) );
  NAND2X1 U43 ( .A(in[2]), .B(n53), .Y(n36) );
  NAND2X1 U44 ( .A(n37), .B(n36), .Y(n35) );
  XOR2X1 U45 ( .A(in[4]), .B(in[1]), .Y(n4) );
  NAND2X1 U46 ( .A(n53), .B(n4), .Y(n5) );
  OAI2BB2XL U47 ( .B0(n5), .B1(n1), .A0N(N74), .A1N(n5), .Y(n7) );
  NAND3X1 U48 ( .A(N78), .B(in[1]), .C(n4), .Y(n3) );
  OAI22XL U49 ( .A0(n45), .A1(n50), .B0(in[4]), .B1(N78), .Y(n9) );
  NAND2X1 U50 ( .A(in[3]), .B(n45), .Y(n41) );
  NAND2X1 U51 ( .A(in[4]), .B(n48), .Y(n24) );
  NOR2X1 U52 ( .A(n46), .B(n49), .Y(n8) );
  AOI2BB2X1 U53 ( .B0(n9), .B1(n8), .A0N(n8), .A1N(N74), .Y(n10) );
  NAND2X1 U54 ( .A(in[4]), .B(in[3]), .Y(n20) );
  OAI22XL U55 ( .A0(N74), .A1(n43), .B0(n20), .B1(N79), .Y(n11) );
  AOI221XL U56 ( .A0(n49), .A1(N74), .B0(N79), .B1(n46), .C0(n11), .Y(n17) );
  NAND2X1 U57 ( .A(n56), .B(n53), .Y(n33) );
  AOI2BB2X1 U58 ( .B0(n54), .B1(N79), .A0N(N75), .A1N(n33), .Y(n29) );
  NAND2X1 U59 ( .A(n47), .B(N78), .Y(n23) );
  OAI221XL U60 ( .A0(N75), .A1(n43), .B0(n41), .B1(n1), .C0(n23), .Y(n15) );
  NAND2X1 U61 ( .A(n47), .B(N74), .Y(n18) );
  OAI211X1 U62 ( .A0(n51), .A1(n41), .B0(n18), .C0(n12), .Y(n14) );
  NAND2X1 U63 ( .A(in[2]), .B(in[1]), .Y(n32) );
  NAND2X1 U64 ( .A(in[0]), .B(n47), .Y(n22) );
  OAI22XL U65 ( .A0(N77), .A1(n24), .B0(n43), .B1(N76), .Y(n19) );
  AOI211X1 U66 ( .A0(n46), .A1(N75), .B0(n19), .C0(n52), .Y(n30) );
  OA22X1 U67 ( .A0(n24), .A1(N79), .B0(n43), .B1(N75), .Y(n21) );
  OAI221XL U68 ( .A0(n43), .A1(N79), .B0(N83), .B1(n24), .C0(n23), .Y(n25) );
  OAI22XL U69 ( .A0(n33), .A1(N83), .B0(n32), .B1(N77), .Y(n31) );
  AOI221XL U70 ( .A0(N80), .A1(n54), .B0(N78), .B1(n58), .C0(n31), .Y(n44) );
  OAI22XL U71 ( .A0(n33), .A1(in[0]), .B0(n32), .B1(N75), .Y(n34) );
  AOI221XL U72 ( .A0(N78), .A1(n54), .B0(N77), .B1(n58), .C0(n34), .Y(n42) );
  OAI222XL U73 ( .A0(n37), .A1(in[5]), .B0(n36), .B1(N78), .C0(n35), .C1(N81), 
        .Y(n39) );
  OAI222XL U74 ( .A0(n37), .A1(in[0]), .B0(n36), .B1(n50), .C0(n35), .C1(n51), 
        .Y(n38) );
  CLKINVX1 U75 ( .A(in[2]), .Y(n56) );
endmodule


module S6 ( in, out );
  input [5:0] in;
  output [3:0] out;
  wire   N74, N75, N76, N77, N78, N79, N80, N81, N83, N84, N85, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63;

  CLKAND2X2 U3 ( .A(n27), .B(N84), .Y(n13) );
  NAND2XL U4 ( .A(N83), .B(n27), .Y(n20) );
  OAI222X1 U5 ( .A0(n50), .A1(n53), .B0(n49), .B1(n48), .C0(n47), .C1(n55), 
        .Y(out[3]) );
  OAI22X1 U6 ( .A0(N80), .A1(n53), .B0(N76), .B1(n48), .Y(n17) );
  AO22X4 U7 ( .A0(n16), .A1(in[2]), .B0(n15), .B1(n52), .Y(n19) );
  AOI22XL U8 ( .A0(n5), .A1(n14), .B0(n56), .B1(N77), .Y(n11) );
  AOI221X1 U9 ( .A0(n62), .A1(in[3]), .B0(n9), .B1(n51), .C0(n8), .Y(n10) );
  AOI221X1 U10 ( .A0(n31), .A1(in[3]), .B0(n30), .B1(n51), .C0(n29), .Y(n37)
         );
  NAND2BX1 U11 ( .AN(N80), .B(N77), .Y(N79) );
  NAND2X6 U12 ( .A(N81), .B(N78), .Y(N80) );
  OAI221X1 U13 ( .A0(n60), .A1(n25), .B0(n24), .B1(in[4]), .C0(n23), .Y(out[1]) );
  NAND2XL U14 ( .A(in[0]), .B(in[5]), .Y(N77) );
  CLKINVX2 U15 ( .A(in[0]), .Y(n3) );
  INVX3 U16 ( .A(in[3]), .Y(n51) );
  AOI222X1 U17 ( .A0(n19), .A1(in[1]), .B0(n18), .B1(n51), .C0(n17), .C1(in[3]), .Y(n24) );
  INVX3 U18 ( .A(in[0]), .Y(n63) );
  CLKINVX6 U19 ( .A(in[2]), .Y(n52) );
  AO21X2 U20 ( .A0(N80), .A1(n56), .B0(n28), .Y(n30) );
  AOI31XL U21 ( .A0(N85), .A1(n42), .A2(n35), .B0(n34), .Y(n36) );
  NOR2X2 U22 ( .A(n35), .B(n27), .Y(n14) );
  AOI211XL U23 ( .A0(n35), .A1(N78), .B0(n4), .C0(n61), .Y(n12) );
  INVX1 U24 ( .A(n35), .Y(n53) );
  NOR2X2 U25 ( .A(n52), .B(in[1]), .Y(n35) );
  OR2X4 U26 ( .A(n3), .B(in[5]), .Y(N81) );
  CLKINVX3 U27 ( .A(in[1]), .Y(n55) );
  NOR2X1 U28 ( .A(n55), .B(in[2]), .Y(n27) );
  NAND2X2 U29 ( .A(in[5]), .B(n63), .Y(N78) );
  NAND2XL U30 ( .A(in[3]), .B(N85), .Y(n1) );
  NAND2XL U31 ( .A(n51), .B(N79), .Y(n2) );
  NAND2X1 U32 ( .A(n1), .B(n2), .Y(n15) );
  NOR2BX1 U33 ( .AN(N77), .B(N80), .Y(N85) );
  XNOR2X1 U34 ( .A(in[2]), .B(n51), .Y(n43) );
  AOI32XL U35 ( .A0(n42), .A1(n52), .A2(n3), .B0(n26), .B1(in[2]), .Y(n38) );
  NOR3XL U36 ( .A(n54), .B(in[2]), .C(N74), .Y(n8) );
  AOI222X1 U37 ( .A0(in[5]), .A1(n42), .B0(n39), .B1(n58), .C0(N75), .C1(n40), 
        .Y(n50) );
  CLKINVX1 U38 ( .A(n20), .Y(n61) );
  INVXL U39 ( .A(N77), .Y(N84) );
  INVXL U40 ( .A(n6), .Y(n62) );
  INVXL U41 ( .A(in[5]), .Y(N83) );
  INVX1 U42 ( .A(n42), .Y(n59) );
  INVX1 U43 ( .A(n14), .Y(n56) );
  INVXL U44 ( .A(N80), .Y(N76) );
  INVXL U45 ( .A(n21), .Y(n57) );
  INVX1 U46 ( .A(n40), .Y(n60) );
  INVX1 U47 ( .A(n32), .Y(n54) );
  INVXL U48 ( .A(N78), .Y(N74) );
  CLKINVX1 U49 ( .A(N81), .Y(N75) );
  AOI221XL U50 ( .A0(N80), .A1(n7), .B0(n35), .B1(in[0]), .C0(n13), .Y(n6) );
  NOR2X1 U51 ( .A(n58), .B(in[3]), .Y(n40) );
  NAND2X1 U52 ( .A(n52), .B(n55), .Y(n48) );
  NOR2X1 U53 ( .A(n55), .B(n52), .Y(n7) );
  OAI2BB2XL U54 ( .B0(N83), .B1(n48), .A0N(N84), .A1N(n7), .Y(n4) );
  NOR2X1 U55 ( .A(n51), .B(n58), .Y(n42) );
  OAI22XL U56 ( .A0(n52), .A1(N80), .B0(in[2]), .B1(N78), .Y(n5) );
  NAND2X1 U57 ( .A(n7), .B(n63), .Y(n21) );
  OAI21XL U58 ( .A0(in[1]), .A1(N78), .B0(n21), .Y(n9) );
  XNOR2X1 U59 ( .A(in[1]), .B(n51), .Y(n32) );
  OAI222XL U60 ( .A0(n60), .A1(n12), .B0(n59), .B1(n11), .C0(in[4]), .C1(n10), 
        .Y(out[0]) );
  AOI221XL U61 ( .A0(n35), .A1(N85), .B0(N79), .B1(n14), .C0(n13), .Y(n25) );
  OAI2BB2XL U62 ( .B0(n51), .B1(N83), .A0N(n51), .A1N(N83), .Y(n16) );
  OAI22XL U63 ( .A0(n53), .A1(N75), .B0(N81), .B1(n48), .Y(n18) );
  OAI21XL U64 ( .A0(N76), .A1(n53), .B0(n20), .Y(n22) );
  NOR2X1 U65 ( .A(n48), .B(N80), .Y(n28) );
  OAI31XL U66 ( .A0(n22), .A1(n28), .A2(n57), .B0(n42), .Y(n23) );
  OAI22XL U67 ( .A0(n59), .A1(N83), .B0(n60), .B1(N74), .Y(n26) );
  OAI2BB2XL U68 ( .B0(n56), .B1(N81), .A0N(n27), .A1N(in[0]), .Y(n31) );
  NOR3X1 U69 ( .A(N75), .B(n52), .C(n54), .Y(n29) );
  NAND4X1 U70 ( .A(n32), .B(N76), .C(in[4]), .D(n52), .Y(n33) );
  OAI31XL U71 ( .A0(N76), .A1(in[1]), .A2(n60), .B0(n33), .Y(n34) );
  OAI221XL U72 ( .A0(n55), .A1(n38), .B0(in[4]), .B1(n37), .C0(n36), .Y(out[2]) );
  AO22X1 U73 ( .A0(in[3]), .A1(N79), .B0(n51), .B1(n63), .Y(n39) );
  OAI2BB2XL U74 ( .B0(n51), .B1(N80), .A0N(n51), .A1N(N77), .Y(n41) );
  AOI222XL U75 ( .A0(N85), .A1(n42), .B0(n41), .B1(n58), .C0(N84), .C1(n40), 
        .Y(n49) );
  OAI2BB2XL U76 ( .B0(in[2]), .B1(in[4]), .A0N(in[4]), .A1N(n43), .Y(n46) );
  OAI22XL U77 ( .A0(in[4]), .A1(n52), .B0(n43), .B1(n60), .Y(n45) );
  NOR3X1 U78 ( .A(N74), .B(n59), .C(n43), .Y(n44) );
  AOI221XL U79 ( .A0(N80), .A1(n46), .B0(n45), .B1(N76), .C0(n44), .Y(n47) );
  CLKINVX1 U80 ( .A(in[4]), .Y(n58) );
endmodule


module S5 ( in, out );
  input [5:0] in;
  output [3:0] out;
  wire   N75, N76, N78, N80, N81, N82, N85, N87, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63;

  CLKAND2X2 U3 ( .A(n25), .B(in[1]), .Y(n4) );
  INVX2 U4 ( .A(N87), .Y(n1) );
  INVX3 U5 ( .A(n1), .Y(n2) );
  NAND2X1 U6 ( .A(in[0]), .B(in[5]), .Y(N87) );
  INVX3 U7 ( .A(in[0]), .Y(n62) );
  INVX3 U8 ( .A(n18), .Y(n57) );
  INVX4 U9 ( .A(in[5]), .Y(n63) );
  OAI221X2 U10 ( .A0(n61), .A1(n54), .B0(n50), .B1(n51), .C0(n49), .Y(out[3])
         );
  OAI22X1 U11 ( .A0(n29), .A1(n7), .B0(N85), .B1(n30), .Y(n16) );
  AOI222X1 U12 ( .A0(N85), .A1(n52), .B0(n48), .B1(n60), .C0(n47), .C1(in[4]), 
        .Y(n49) );
  AOI211XL U13 ( .A0(n2), .A1(n52), .B0(n12), .C0(n11), .Y(n13) );
  INVX3 U14 ( .A(n2), .Y(n6) );
  AOI32XL U15 ( .A0(in[4]), .A1(n51), .A2(n36), .B0(n35), .B1(n34), .Y(n37) );
  AOI222X1 U16 ( .A0(in[2]), .A1(n45), .B0(n44), .B1(n60), .C0(n43), .C1(in[4]), .Y(n50) );
  INVX3 U17 ( .A(in[4]), .Y(n60) );
  CLKINVX2 U18 ( .A(N76), .Y(N81) );
  XNOR2XL U19 ( .A(in[3]), .B(n60), .Y(n33) );
  NAND2XL U20 ( .A(n34), .B(in[3]), .Y(n23) );
  NOR3XL U21 ( .A(n3), .B(n4), .C(n24), .Y(n27) );
  OAI222X1 U22 ( .A0(n57), .A1(N75), .B0(n29), .B1(n5), .C0(n53), .C1(n2), .Y(
        n25) );
  INVX3 U23 ( .A(in[1]), .Y(n51) );
  OR2X4 U24 ( .A(n6), .B(N76), .Y(n7) );
  AO22X4 U25 ( .A0(in[3]), .A1(n42), .B0(n41), .B1(n55), .Y(n45) );
  OAI22X1 U26 ( .A0(n60), .A1(N80), .B0(in[4]), .B1(N81), .Y(n41) );
  OAI222X1 U27 ( .A0(n60), .A1(n15), .B0(n51), .B1(n14), .C0(in[4]), .C1(n13), 
        .Y(out[0]) );
  NOR2X1 U28 ( .A(N76), .B(n6), .Y(n5) );
  AOI222X1 U29 ( .A0(n32), .A1(in[4]), .B0(n31), .B1(n60), .C0(n56), .C1(n40), 
        .Y(n39) );
  INVX1 U30 ( .A(n22), .Y(n58) );
  INVX1 U31 ( .A(n17), .Y(n53) );
  NAND2X4 U32 ( .A(N82), .B(N75), .Y(N76) );
  NAND2X2 U33 ( .A(in[0]), .B(n63), .Y(N82) );
  NOR2X1 U34 ( .A(n57), .B(in[1]), .Y(n22) );
  OAI32XL U35 ( .A0(n51), .A1(n53), .A2(N78), .B0(n46), .B1(in[5]), .Y(n9) );
  NAND2X2 U36 ( .A(in[5]), .B(n62), .Y(N75) );
  AND2XL U37 ( .A(n26), .B(in[5]), .Y(n3) );
  AOI211XL U38 ( .A0(n22), .A1(n62), .B0(n21), .C0(n20), .Y(n28) );
  NOR2X1 U39 ( .A(n53), .B(in[1]), .Y(n26) );
  INVX4 U40 ( .A(in[3]), .Y(n55) );
  NOR2X2 U41 ( .A(n55), .B(in[2]), .Y(n18) );
  INVX1 U42 ( .A(n26), .Y(n54) );
  INVXL U43 ( .A(N75), .Y(N80) );
  CLKINVX1 U44 ( .A(N82), .Y(N78) );
  CLKINVX1 U45 ( .A(n38), .Y(n59) );
  INVXL U46 ( .A(n23), .Y(n52) );
  INVXL U47 ( .A(n30), .Y(n56) );
  CLKINVX1 U48 ( .A(n40), .Y(n61) );
  OAI22XL U49 ( .A0(n60), .A1(in[0]), .B0(in[4]), .B1(n62), .Y(n40) );
  AND2X1 U50 ( .A(in[2]), .B(n51), .Y(n34) );
  NOR2X1 U51 ( .A(in[3]), .B(in[2]), .Y(n17) );
  NAND2X1 U52 ( .A(n34), .B(n55), .Y(n46) );
  NAND2X1 U53 ( .A(in[2]), .B(in[3]), .Y(n29) );
  AOI21X1 U54 ( .A0(N76), .A1(n26), .B0(n8), .Y(n38) );
  AOI211X1 U55 ( .A0(n52), .A1(n6), .B0(n9), .C0(n59), .Y(n15) );
  NAND2X1 U56 ( .A(in[2]), .B(n55), .Y(n30) );
  AOI2BB2X1 U57 ( .B0(N76), .B1(n18), .A0N(n30), .A1N(N78), .Y(n14) );
  OAI22XL U58 ( .A0(n2), .A1(n54), .B0(n58), .B1(N76), .Y(n12) );
  OA22X1 U59 ( .A0(n53), .A1(N82), .B0(n62), .B1(n29), .Y(n10) );
  OAI22XL U60 ( .A0(n46), .A1(N75), .B0(n51), .B1(n10), .Y(n11) );
  AOI221XL U61 ( .A0(n18), .A1(N75), .B0(n17), .B1(N76), .C0(n16), .Y(n19) );
  OAI22XL U62 ( .A0(n51), .A1(n19), .B0(N80), .B1(n54), .Y(n21) );
  OAI22XL U63 ( .A0(N78), .A1(n23), .B0(N82), .B1(n46), .Y(n20) );
  OAI222XL U64 ( .A0(n23), .A1(n7), .B0(in[5]), .B1(n30), .C0(n58), .C1(n5), 
        .Y(n24) );
  OAI22XL U65 ( .A0(in[4]), .A1(n28), .B0(n60), .B1(n27), .Y(out[1]) );
  OAI222XL U66 ( .A0(n57), .A1(n2), .B0(N81), .B1(n29), .C0(n53), .C1(N76), 
        .Y(n32) );
  OAI22XL U67 ( .A0(n53), .A1(n7), .B0(n57), .B1(n5), .Y(n31) );
  OAI22XL U68 ( .A0(n53), .A1(n5), .B0(in[0]), .B1(n57), .Y(n36) );
  OAI2BB2XL U69 ( .B0(n33), .B1(N76), .A0N(N76), .A1N(n33), .Y(n35) );
  OAI221XL U70 ( .A0(n51), .A1(n39), .B0(in[4]), .B1(n38), .C0(n37), .Y(out[2]) );
  OAI22XL U71 ( .A0(n60), .A1(in[0]), .B0(in[4]), .B1(N85), .Y(n42) );
  OAI22XL U72 ( .A0(N80), .A1(n53), .B0(n57), .B1(N78), .Y(n44) );
  OAI22XL U73 ( .A0(N85), .A1(n53), .B0(n57), .B1(N82), .Y(n43) );
  OAI22XL U74 ( .A0(n58), .A1(N75), .B0(n46), .B1(n2), .Y(n48) );
  OAI22XL U75 ( .A0(n58), .A1(N76), .B0(N81), .B1(n46), .Y(n47) );
  OAI32XL U76 ( .A0(n51), .A1(N76), .A2(n29), .B0(in[5]), .B1(n58), .Y(n8) );
  INVXL U77 ( .A(in[5]), .Y(N85) );
endmodule


module S4 ( in, out );
  input [5:0] in;
  output [3:0] out;
  wire   N66, N67, N68, N70, N80, N82, N83, N84, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55;

  AOI221XL U3 ( .A0(in[0]), .A1(n36), .B0(N67), .B1(n35), .C0(n25), .Y(n27) );
  OAI22X1 U4 ( .A0(in[5]), .A1(n15), .B0(n29), .B1(N84), .Y(n18) );
  NAND2X2 U5 ( .A(in[0]), .B(n55), .Y(N67) );
  OR2X4 U6 ( .A(in[1]), .B(n21), .Y(n2) );
  NAND2BX1 U7 ( .AN(in[2]), .B(n44), .Y(n11) );
  INVX3 U8 ( .A(in[3]), .Y(n44) );
  NOR2X2 U9 ( .A(n36), .B(n32), .Y(n15) );
  NAND2BX1 U10 ( .AN(N80), .B(N70), .Y(N82) );
  OR2X4 U11 ( .A(N84), .B(N80), .Y(n1) );
  AO22XL U12 ( .A0(in[5]), .A1(n36), .B0(n35), .B1(N80), .Y(n37) );
  NAND2BX2 U13 ( .AN(N83), .B(N67), .Y(N80) );
  OAI222X1 U14 ( .A0(N84), .A1(n51), .B0(n24), .B1(n54), .C0(n45), .C1(N66), 
        .Y(n25) );
  OR2X2 U15 ( .A(n33), .B(in[4]), .Y(n24) );
  OAI222X1 U16 ( .A0(n9), .A1(n42), .B0(in[1]), .B1(n8), .C0(n26), .C1(n33), 
        .Y(out[0]) );
  OAI222X1 U17 ( .A0(n42), .A1(n41), .B0(in[1]), .B1(n40), .C0(n39), .C1(n51), 
        .Y(out[3]) );
  AOI221X1 U18 ( .A0(N68), .A1(n49), .B0(n38), .B1(n43), .C0(n37), .Y(n40) );
  OAI222X1 U19 ( .A0(n51), .A1(N70), .B0(n1), .B1(n24), .C0(n45), .C1(n55), 
        .Y(n23) );
  INVXL U20 ( .A(N70), .Y(N84) );
  NAND2X1 U21 ( .A(in[0]), .B(in[5]), .Y(N70) );
  OAI222X1 U22 ( .A0(in[1]), .A1(n28), .B0(n42), .B1(n27), .C0(n26), .C1(n50), 
        .Y(out[2]) );
  CLKINVX1 U23 ( .A(n12), .Y(n46) );
  INVX3 U24 ( .A(in[4]), .Y(n43) );
  CLKINVX1 U25 ( .A(in[1]), .Y(n42) );
  OR2X4 U26 ( .A(n39), .B(n30), .Y(n3) );
  OR2X4 U27 ( .A(n42), .B(n20), .Y(n4) );
  NAND3X2 U28 ( .A(n2), .B(n3), .C(n4), .Y(out[1]) );
  AOI2BB2XL U29 ( .B0(in[1]), .B1(N82), .A0N(in[1]), .A1N(n1), .Y(n39) );
  NOR2X2 U30 ( .A(n55), .B(in[0]), .Y(N83) );
  INVXL U31 ( .A(N80), .Y(N68) );
  INVX1 U32 ( .A(n10), .Y(n50) );
  INVX1 U33 ( .A(N82), .Y(n53) );
  CLKINVX2 U34 ( .A(n16), .Y(n47) );
  INVXL U35 ( .A(n32), .Y(n45) );
  INVX1 U36 ( .A(n15), .Y(n48) );
  INVX3 U37 ( .A(in[5]), .Y(n55) );
  INVXL U38 ( .A(in[0]), .Y(n54) );
  INVX1 U39 ( .A(n22), .Y(n51) );
  CLKINVX1 U40 ( .A(N83), .Y(N66) );
  OAI222XL U41 ( .A0(n30), .A1(N70), .B0(n53), .B1(n29), .C0(n47), .C1(N80), 
        .Y(n5) );
  INVXL U42 ( .A(N67), .Y(n52) );
  NAND2X1 U43 ( .A(in[3]), .B(in[2]), .Y(n34) );
  NOR2X1 U44 ( .A(n34), .B(n43), .Y(n12) );
  NOR2X1 U45 ( .A(n11), .B(n43), .Y(n36) );
  NOR2X1 U46 ( .A(n34), .B(in[4]), .Y(n32) );
  NOR2X1 U47 ( .A(n44), .B(in[2]), .Y(n10) );
  NOR2X1 U48 ( .A(n11), .B(in[4]), .Y(n16) );
  AOI221XL U49 ( .A0(n55), .A1(n12), .B0(n48), .B1(N80), .C0(n5), .Y(n9) );
  AOI222XL U50 ( .A0(n48), .A1(N67), .B0(N70), .B1(n49), .C0(N66), .C1(n16), 
        .Y(n8) );
  OAI22XL U51 ( .A0(N68), .A1(n43), .B0(n55), .B1(in[4]), .Y(n7) );
  OAI22XL U52 ( .A0(in[5]), .A1(n43), .B0(N80), .B1(in[4]), .Y(n6) );
  AO22X1 U53 ( .A0(n7), .A1(in[1]), .B0(n6), .B1(n42), .Y(n26) );
  NAND2X1 U54 ( .A(in[2]), .B(n44), .Y(n33) );
  NOR2X1 U55 ( .A(n43), .B(n33), .Y(n22) );
  OAI222XL U56 ( .A0(n50), .A1(n54), .B0(n11), .B1(n52), .C0(n33), .C1(in[5]), 
        .Y(n14) );
  OAI22XL U57 ( .A0(N66), .A1(n15), .B0(n46), .B1(n54), .Y(n13) );
  AOI221XL U58 ( .A0(n22), .A1(N80), .B0(n14), .B1(n43), .C0(n13), .Y(n21) );
  NAND2X1 U59 ( .A(n46), .B(n24), .Y(n19) );
  AOI2BB1X1 U60 ( .A0N(n16), .A1N(n22), .B0(n55), .Y(n17) );
  AOI211X1 U61 ( .A0(n19), .A1(N68), .B0(n18), .C0(n17), .Y(n20) );
  NAND2X1 U62 ( .A(n46), .B(n47), .Y(n35) );
  AOI221XL U63 ( .A0(n36), .A1(N80), .B0(n55), .B1(n35), .C0(n23), .Y(n28) );
  OAI22XL U64 ( .A0(n30), .A1(in[5]), .B0(n29), .B1(N68), .Y(n31) );
  AOI221XL U65 ( .A0(N67), .A1(n32), .B0(N66), .B1(n35), .C0(n31), .Y(n41) );
  OAI222XL U66 ( .A0(n50), .A1(n55), .B0(n34), .B1(N80), .C0(n33), .C1(N84), 
        .Y(n38) );
  NAND2XL U67 ( .A(n10), .B(in[4]), .Y(n30) );
  NAND2XL U68 ( .A(n10), .B(n43), .Y(n29) );
  CLKINVX1 U69 ( .A(n30), .Y(n49) );
endmodule


module S3 ( in, out );
  input [5:0] in;
  output [3:0] out;
  wire   N74, N75, N76, N77, N78, N79, N80, N82, N83, N84, N86, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55;

  NAND2X1 U3 ( .A(in[1]), .B(in[2]), .Y(n32) );
  AOI222X1 U4 ( .A0(N82), .A1(n35), .B0(n34), .B1(n45), .C0(N76), .C1(n33), 
        .Y(n43) );
  AOI2BB2XL U5 ( .B0(n51), .B1(n30), .A0N(n29), .A1N(n32), .Y(n44) );
  OA21X4 U6 ( .A0(in[3]), .A1(N80), .B0(n23), .Y(n29) );
  CLKINVX3 U7 ( .A(in[5]), .Y(n55) );
  OAI31X1 U8 ( .A0(N79), .A1(in[3]), .A2(n37), .B0(n36), .Y(n41) );
  OAI22X1 U9 ( .A0(n31), .A1(N80), .B0(n32), .B1(n23), .Y(n19) );
  NOR3XL U10 ( .A(N80), .B(n32), .C(n38), .Y(n5) );
  NOR3XL U11 ( .A(n32), .B(n46), .C(N86), .Y(n18) );
  NOR2XL U12 ( .A(n32), .B(in[3]), .Y(n20) );
  INVX3 U13 ( .A(in[0]), .Y(n54) );
  CLKINVX2 U14 ( .A(N76), .Y(N80) );
  NAND2X4 U15 ( .A(N84), .B(N82), .Y(N76) );
  NOR2XL U16 ( .A(in[2]), .B(in[1]), .Y(n13) );
  INVX3 U17 ( .A(in[2]), .Y(n50) );
  NAND2X2 U18 ( .A(N80), .B(in[3]), .Y(n23) );
  AOI222X1 U19 ( .A0(N77), .A1(n21), .B0(n12), .B1(n45), .C0(in[4]), .C1(n11), 
        .Y(n16) );
  OAI221X1 U20 ( .A0(n45), .A1(n17), .B0(n16), .B1(n46), .C0(n15), .Y(out[1])
         );
  OAI221X1 U21 ( .A0(n45), .A1(n28), .B0(in[4]), .B1(n27), .C0(n26), .Y(out[2]) );
  INVXL U22 ( .A(n31), .Y(n51) );
  OAI222XL U23 ( .A0(n49), .A1(N83), .B0(n31), .B1(in[0]), .C0(n32), .C1(n54), 
        .Y(n12) );
  CLKINVX1 U24 ( .A(N74), .Y(n48) );
  NAND2X2 U25 ( .A(in[0]), .B(n55), .Y(N84) );
  OAI221X1 U26 ( .A0(n45), .A1(n44), .B0(n46), .B1(n43), .C0(n42), .Y(out[3])
         );
  NAND2BXL U27 ( .AN(N76), .B(N77), .Y(N74) );
  NOR2BXL U28 ( .AN(N77), .B(N76), .Y(N75) );
  NAND2X2 U29 ( .A(in[5]), .B(n54), .Y(N82) );
  CLKINVX1 U30 ( .A(N82), .Y(N83) );
  OAI2BB2XL U31 ( .B0(n49), .B1(n29), .A0N(N82), .A1N(n20), .Y(n10) );
  INVXL U32 ( .A(n36), .Y(n52) );
  INVX6 U33 ( .A(in[3]), .Y(n46) );
  NAND2XL U34 ( .A(in[0]), .B(in[5]), .Y(N77) );
  INVXL U35 ( .A(in[5]), .Y(N86) );
  INVX1 U36 ( .A(n13), .Y(n49) );
  CLKINVX1 U37 ( .A(N75), .Y(n47) );
  INVX1 U38 ( .A(n21), .Y(n53) );
  CLKINVX1 U39 ( .A(N77), .Y(N79) );
  CLKINVX1 U40 ( .A(N84), .Y(N78) );
  CLKINVX1 U41 ( .A(in[4]), .Y(n45) );
  NOR2X1 U42 ( .A(n49), .B(n45), .Y(n35) );
  NOR2X1 U43 ( .A(n50), .B(in[1]), .Y(n21) );
  OAI22XL U44 ( .A0(n49), .A1(n48), .B0(n53), .B1(N76), .Y(n2) );
  NAND2X1 U45 ( .A(in[1]), .B(n50), .Y(n31) );
  XNOR2X1 U46 ( .A(in[4]), .B(n46), .Y(n38) );
  NOR3X1 U47 ( .A(N84), .B(n31), .C(n38), .Y(n1) );
  AOI221XL U48 ( .A0(n54), .A1(n35), .B0(n2), .B1(n45), .C0(n1), .Y(n9) );
  OAI22XL U49 ( .A0(n49), .A1(N84), .B0(n53), .B1(in[0]), .Y(n4) );
  NOR3X1 U50 ( .A(n54), .B(n31), .C(n38), .Y(n3) );
  AOI221XL U51 ( .A0(N84), .A1(n35), .B0(n4), .B1(n45), .C0(n3), .Y(n8) );
  NOR2X1 U52 ( .A(n53), .B(n45), .Y(n33) );
  OAI2BB2XL U53 ( .B0(n32), .B1(N76), .A0N(n51), .A1N(N84), .Y(n6) );
  AOI221XL U54 ( .A0(n33), .A1(N78), .B0(n6), .B1(n38), .C0(n5), .Y(n7) );
  OAI221XL U55 ( .A0(in[3]), .A1(n9), .B0(n46), .B1(n8), .C0(n7), .Y(out[0])
         );
  NAND3X1 U56 ( .A(n51), .B(n46), .C(N79), .Y(n36) );
  OAI221XL U57 ( .A0(n31), .A1(N80), .B0(n32), .B1(N82), .C0(n53), .Y(n11) );
  NOR2BX1 U58 ( .AN(n32), .B(n13), .Y(n37) );
  OAI22XL U59 ( .A0(n31), .A1(n48), .B0(n37), .B1(n47), .Y(n14) );
  NAND3X1 U60 ( .A(n45), .B(n46), .C(n14), .Y(n15) );
  AOI221XL U61 ( .A0(N80), .A1(n51), .B0(n20), .B1(N77), .C0(n18), .Y(n28) );
  AO22X1 U62 ( .A0(n46), .A1(in[5]), .B0(N86), .B1(in[3]), .Y(n22) );
  AOI221XL U63 ( .A0(n22), .A1(n21), .B0(N75), .B1(n20), .C0(n19), .Y(n27) );
  OAI22XL U64 ( .A0(n46), .A1(N80), .B0(in[3]), .B1(N83), .Y(n30) );
  OAI2BB1X1 U65 ( .A0N(n46), .A1N(N79), .B0(n23), .Y(n24) );
  AOI2BB2X1 U66 ( .B0(n24), .B1(n38), .A0N(n38), .A1N(N80), .Y(n25) );
  AOI2BB2X1 U67 ( .B0(n30), .B1(n33), .A0N(n49), .A1N(n25), .Y(n26) );
  OAI22XL U68 ( .A0(n32), .A1(N84), .B0(n31), .B1(N86), .Y(n34) );
  NOR3BXL U69 ( .AN(n38), .B(N82), .C(n49), .Y(n39) );
  AOI211X1 U70 ( .A0(n41), .A1(n45), .B0(n40), .C0(n39), .Y(n42) );
  AOI211XL U71 ( .A0(in[5]), .A1(n21), .B0(n10), .C0(n52), .Y(n17) );
  AOI211XL U72 ( .A0(in[3]), .A1(in[4]), .B0(N76), .C0(n53), .Y(n40) );
endmodule


module S2 ( in, out );
  input [5:0] in;
  output [3:0] out;
  wire   N74, N75, N76, N77, N78, N79, N81, N84, N85, N86, N87, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66;

  NOR3X1 U3 ( .A(n3), .B(n4), .C(n8), .Y(n10) );
  INVX2 U4 ( .A(N86), .Y(n1) );
  CLKINVX4 U5 ( .A(n1), .Y(n2) );
  AOI222X1 U6 ( .A0(n13), .A1(N79), .B0(n12), .B1(n58), .C0(n11), .C1(N77), 
        .Y(n14) );
  INVX1 U7 ( .A(n30), .Y(n61) );
  CLKINVX1 U8 ( .A(n19), .Y(n60) );
  NAND2X2 U9 ( .A(n2), .B(N74), .Y(N78) );
  NAND2X2 U10 ( .A(in[5]), .B(n65), .Y(N74) );
  INVXL U11 ( .A(in[5]), .Y(n66) );
  INVXL U12 ( .A(in[5]), .Y(N75) );
  CLKINVX3 U13 ( .A(in[0]), .Y(n65) );
  OAI2BB2X1 U14 ( .B0(in[4]), .B1(n10), .A0N(n2), .A1N(n19), .Y(n12) );
  INVX3 U15 ( .A(in[1]), .Y(n54) );
  OAI222X1 U16 ( .A0(N76), .A1(n60), .B0(N78), .B1(n61), .C0(n27), .C1(in[5]), 
        .Y(n29) );
  AOI221X1 U17 ( .A0(N87), .A1(n19), .B0(n18), .B1(n63), .C0(n17), .Y(n26) );
  OAI211XL U18 ( .A0(in[1]), .A1(in[5]), .B0(n27), .C0(n16), .Y(n18) );
  NAND2BX1 U19 ( .AN(N78), .B(N81), .Y(N79) );
  AOI211XL U20 ( .A0(N87), .A1(n62), .B0(n29), .C0(n48), .Y(n36) );
  NAND4X1 U21 ( .A(in[1]), .B(n40), .C(n63), .D(n58), .Y(n52) );
  NAND3XL U22 ( .A(in[3]), .B(in[4]), .C(in[1]), .Y(n43) );
  AOI32XL U23 ( .A0(in[1]), .A1(n56), .A2(N77), .B0(n5), .B1(in[3]), .Y(n16)
         );
  AND2XL U24 ( .A(in[0]), .B(n55), .Y(n3) );
  CLKAND2X3 U25 ( .A(in[1]), .B(n9), .Y(n4) );
  INVXL U26 ( .A(n27), .Y(n55) );
  NOR3XL U27 ( .A(N77), .B(in[1]), .C(in[3]), .Y(n8) );
  NAND2XL U28 ( .A(in[5]), .B(n65), .Y(n5) );
  NAND2XL U29 ( .A(in[5]), .B(n65), .Y(n6) );
  AO22X1 U30 ( .A0(n62), .A1(n2), .B0(n41), .B1(in[0]), .Y(n45) );
  AOI21XL U31 ( .A0(n46), .A1(n64), .B0(in[0]), .Y(n47) );
  NAND2XL U32 ( .A(in[5]), .B(in[0]), .Y(N81) );
  INVXL U33 ( .A(N84), .Y(n57) );
  INVXL U34 ( .A(n6), .Y(N77) );
  INVX1 U35 ( .A(n43), .Y(n62) );
  INVXL U36 ( .A(n2), .Y(N85) );
  INVXL U37 ( .A(N81), .Y(N87) );
  INVX1 U38 ( .A(in[2]), .Y(n58) );
  CLKINVX1 U39 ( .A(N78), .Y(N76) );
  CLKINVX1 U40 ( .A(n23), .Y(n64) );
  NOR2BXL U41 ( .AN(N81), .B(N78), .Y(N84) );
  CLKINVX1 U42 ( .A(n37), .Y(n59) );
  NAND2X1 U43 ( .A(in[0]), .B(n66), .Y(N86) );
  CLKINVX1 U44 ( .A(in[4]), .Y(n63) );
  NAND2X1 U45 ( .A(in[4]), .B(n56), .Y(n39) );
  NOR2X1 U46 ( .A(n39), .B(n54), .Y(n30) );
  NAND2X1 U47 ( .A(in[3]), .B(n54), .Y(n27) );
  NOR2X1 U48 ( .A(n27), .B(in[4]), .Y(n49) );
  NOR2X1 U49 ( .A(n27), .B(n63), .Y(n41) );
  NAND3X1 U50 ( .A(n56), .B(n54), .C(n63), .Y(n28) );
  NOR2X1 U51 ( .A(n39), .B(in[1]), .Y(n19) );
  OAI22XL U52 ( .A0(n28), .A1(n6), .B0(n65), .B1(n60), .Y(n7) );
  AOI221XL U53 ( .A0(n49), .A1(n65), .B0(N75), .B1(n41), .C0(n7), .Y(n15) );
  NAND3X1 U54 ( .A(in[2]), .B(n63), .C(in[1]), .Y(n35) );
  NOR2X1 U55 ( .A(n35), .B(in[3]), .Y(n23) );
  NAND2X1 U56 ( .A(n43), .B(n64), .Y(n13) );
  OAI22XL U57 ( .A0(n56), .A1(N78), .B0(in[3]), .B1(in[5]), .Y(n9) );
  NAND2X1 U58 ( .A(n41), .B(n58), .Y(n46) );
  NAND2BX1 U59 ( .AN(n35), .B(in[3]), .Y(n42) );
  NAND2X1 U60 ( .A(n46), .B(n42), .Y(n11) );
  OAI221XL U61 ( .A0(n61), .A1(n57), .B0(n58), .B1(n15), .C0(n14), .Y(out[0])
         );
  AO22X1 U62 ( .A0(n62), .A1(N77), .B0(n55), .B1(N85), .Y(n17) );
  OAI22XL U63 ( .A0(n43), .A1(in[0]), .B0(n28), .B1(N75), .Y(n20) );
  AOI221XL U64 ( .A0(n30), .A1(N78), .B0(n41), .B1(N79), .C0(n20), .Y(n21) );
  OA22X1 U65 ( .A0(n65), .A1(n42), .B0(n58), .B1(n21), .Y(n25) );
  XNOR2X1 U66 ( .A(n58), .B(in[1]), .Y(n37) );
  NOR3X1 U67 ( .A(n39), .B(N78), .C(n59), .Y(n22) );
  AOI221XL U68 ( .A0(N81), .A1(n23), .B0(N84), .B1(n49), .C0(n22), .Y(n24) );
  OAI211X1 U69 ( .A0(in[2]), .A1(n26), .B0(n25), .C0(n24), .Y(out[1]) );
  NOR2X1 U70 ( .A(n28), .B(N78), .Y(n48) );
  AOI2BB2X1 U71 ( .B0(in[3]), .B1(N75), .A0N(N78), .A1N(in[3]), .Y(n33) );
  AOI22X1 U72 ( .A0(n41), .A1(N76), .B0(n30), .B1(n2), .Y(n31) );
  OAI221XL U73 ( .A0(n60), .A1(N75), .B0(n43), .B1(N76), .C0(n31), .Y(n32) );
  AOI32X1 U74 ( .A0(n37), .A1(n63), .A2(n33), .B0(n32), .B1(in[2]), .Y(n34) );
  OAI221XL U75 ( .A0(in[2]), .A1(n36), .B0(n35), .B1(in[5]), .C0(n34), .Y(
        out[2]) );
  OAI22XL U76 ( .A0(n59), .A1(n5), .B0(n37), .B1(N77), .Y(n38) );
  NAND2BX1 U77 ( .AN(n39), .B(n38), .Y(n53) );
  AO22X1 U78 ( .A0(in[3]), .A1(N76), .B0(n56), .B1(N79), .Y(n40) );
  OAI21XL U79 ( .A0(in[2]), .A1(n43), .B0(n42), .Y(n44) );
  AOI22X1 U80 ( .A0(n45), .A1(in[2]), .B0(N85), .B1(n44), .Y(n51) );
  AOI211X1 U81 ( .A0(N78), .A1(n49), .B0(n48), .C0(n47), .Y(n50) );
  NAND4X1 U82 ( .A(n53), .B(n52), .C(n51), .D(n50), .Y(out[3]) );
  CLKINVX1 U83 ( .A(in[3]), .Y(n56) );
endmodule


module S1 ( in, out );
  input [5:0] in;
  output [3:0] out;
  wire   N74, N75, N76, N77, N78, N79, N82, N84, N86, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73;

  INVX8 U3 ( .A(in[5]), .Y(n72) );
  NAND2X2 U4 ( .A(in[5]), .B(in[0]), .Y(N82) );
  NOR3XL U5 ( .A(in[4]), .B(in[1]), .C(n61), .Y(n53) );
  INVX3 U6 ( .A(in[1]), .Y(n59) );
  XNOR2X2 U7 ( .A(in[3]), .B(n61), .Y(n29) );
  INVX8 U8 ( .A(in[2]), .Y(n61) );
  OAI221X1 U9 ( .A0(in[4]), .A1(n15), .B0(n57), .B1(n14), .C0(n13), .Y(out[0])
         );
  AOI211X1 U10 ( .A0(N78), .A1(n32), .B0(n31), .C0(n30), .Y(n40) );
  INVXL U11 ( .A(n43), .Y(n68) );
  INVX2 U12 ( .A(N77), .Y(N75) );
  CLKINVX3 U13 ( .A(in[0]), .Y(n73) );
  AOI22XL U14 ( .A0(N82), .A1(n37), .B0(N78), .B1(n51), .Y(n38) );
  INVX3 U15 ( .A(N82), .Y(N74) );
  OAI21X1 U16 ( .A0(n67), .A1(n36), .B0(n57), .Y(n39) );
  OAI222X1 U17 ( .A0(in[2]), .A1(n35), .B0(n65), .B1(n7), .C0(n1), .C1(n50), 
        .Y(n36) );
  NAND2XL U18 ( .A(N76), .B(n58), .Y(n50) );
  NAND2X4 U19 ( .A(in[0]), .B(n72), .Y(N76) );
  OAI222X1 U20 ( .A0(n18), .A1(n6), .B0(N86), .B1(n17), .C0(n60), .C1(n7), .Y(
        n20) );
  OR2X4 U21 ( .A(N74), .B(N77), .Y(n6) );
  NOR2X2 U22 ( .A(N77), .B(N74), .Y(n7) );
  CLKINVX1 U23 ( .A(n27), .Y(n60) );
  NAND2X4 U24 ( .A(N79), .B(N76), .Y(N77) );
  NOR2X1 U25 ( .A(n60), .B(in[2]), .Y(n49) );
  CLKBUFX2 U26 ( .A(n34), .Y(n1) );
  AND2XL U27 ( .A(n12), .B(n63), .Y(n3) );
  NOR2X1 U28 ( .A(n34), .B(in[3]), .Y(n41) );
  AND2XL U29 ( .A(n53), .B(in[3]), .Y(n51) );
  AND2XL U30 ( .A(n51), .B(N79), .Y(n2) );
  AND2XL U31 ( .A(n37), .B(n72), .Y(n4) );
  NOR3X1 U32 ( .A(n2), .B(n3), .C(n4), .Y(n13) );
  AOI211XL U33 ( .A0(n72), .A1(n52), .B0(n11), .C0(n10), .Y(n14) );
  AO21XL U34 ( .A0(n5), .A1(N77), .B0(n44), .Y(n12) );
  INVXL U35 ( .A(n33), .Y(n67) );
  NAND2XL U36 ( .A(in[3]), .B(n59), .Y(n17) );
  NOR4XL U37 ( .A(in[1]), .B(in[3]), .C(N77), .D(n21), .Y(n22) );
  NOR2XL U38 ( .A(n59), .B(in[3]), .Y(n5) );
  CLKINVX1 U39 ( .A(n16), .Y(n70) );
  CLKINVX1 U40 ( .A(n52), .Y(n64) );
  INVXL U41 ( .A(n35), .Y(n66) );
  CLKINVX1 U42 ( .A(n21), .Y(n63) );
  AOI222X1 U43 ( .A0(n42), .A1(N78), .B0(n46), .B1(N74), .C0(N86), .C1(n32), 
        .Y(n33) );
  NOR2XL U44 ( .A(n60), .B(n61), .Y(n42) );
  INVXL U45 ( .A(n19), .Y(n71) );
  NAND2X2 U46 ( .A(in[5]), .B(n73), .Y(N79) );
  INVXL U47 ( .A(n50), .Y(n69) );
  NOR2X1 U48 ( .A(n58), .B(n34), .Y(n45) );
  NAND2X1 U49 ( .A(n61), .B(n59), .Y(n34) );
  CLKINVX1 U50 ( .A(N79), .Y(N84) );
  INVXL U51 ( .A(N76), .Y(N78) );
  AOI222XL U52 ( .A0(n42), .A1(N74), .B0(n46), .B1(in[5]), .C0(n32), .C1(N82), 
        .Y(n16) );
  AOI222XL U53 ( .A0(N84), .A1(n32), .B0(n41), .B1(N82), .C0(n45), .C1(in[5]), 
        .Y(n19) );
  INVXL U54 ( .A(in[3]), .Y(n58) );
  INVXL U55 ( .A(in[0]), .Y(N86) );
  INVXL U56 ( .A(n45), .Y(n65) );
  INVXL U57 ( .A(n29), .Y(n62) );
  CLKINVX1 U58 ( .A(in[4]), .Y(n57) );
  NOR2X1 U59 ( .A(n59), .B(in[3]), .Y(n27) );
  XNOR2X1 U60 ( .A(in[4]), .B(n61), .Y(n21) );
  NAND2X1 U61 ( .A(in[3]), .B(in[1]), .Y(n18) );
  NOR2X1 U62 ( .A(n63), .B(n18), .Y(n52) );
  OAI32X1 U63 ( .A0(n6), .A1(n60), .A2(n63), .B0(n64), .B1(n7), .Y(n8) );
  AOI221XL U64 ( .A0(N74), .A1(n41), .B0(N84), .B1(n45), .C0(n8), .Y(n15) );
  OAI2BB2XL U65 ( .B0(n1), .B1(n50), .A0N(n45), .A1N(N82), .Y(n11) );
  OAI33X1 U66 ( .A0(N82), .A1(n60), .A2(n63), .B0(n9), .B1(in[1]), .B2(n61), 
        .Y(n10) );
  NOR2X1 U67 ( .A(N77), .B(n18), .Y(n44) );
  AND2X1 U68 ( .A(n53), .B(n58), .Y(n37) );
  NOR2X1 U69 ( .A(n18), .B(n61), .Y(n46) );
  AOI221XL U70 ( .A0(N78), .A1(n49), .B0(n72), .B1(n45), .C0(n70), .Y(n25) );
  NAND2X1 U71 ( .A(N79), .B(n5), .Y(n35) );
  AOI221XL U72 ( .A0(n20), .A1(in[2]), .B0(n66), .B1(n61), .C0(n71), .Y(n24)
         );
  AOI221XL U73 ( .A0(n51), .A1(N86), .B0(n37), .B1(N77), .C0(n22), .Y(n23) );
  OAI221XL U74 ( .A0(in[4]), .A1(n25), .B0(n57), .B1(n24), .C0(n23), .Y(out[1]) );
  AND3X1 U75 ( .A(n72), .B(n29), .C(n59), .Y(n26) );
  AOI211X1 U76 ( .A0(N76), .A1(n5), .B0(n44), .C0(n26), .Y(n28) );
  OAI2BB2XL U77 ( .B0(n61), .B1(n28), .A0N(N77), .A1N(n49), .Y(n31) );
  OAI33X1 U78 ( .A0(n72), .A1(in[1]), .A2(n29), .B0(n6), .B1(n1), .B2(n62), 
        .Y(n30) );
  OAI211X1 U79 ( .A0(n57), .A1(n40), .B0(n39), .C0(n38), .Y(out[2]) );
  AOI221XL U80 ( .A0(N77), .A1(n45), .B0(n44), .B1(n61), .C0(n68), .Y(n56) );
  OAI21XL U81 ( .A0(n46), .A1(n45), .B0(in[0]), .Y(n47) );
  OAI31XL U82 ( .A0(N75), .A1(in[1]), .A2(in[3]), .B0(n47), .Y(n48) );
  AOI221XL U83 ( .A0(N76), .A1(n49), .B0(n66), .B1(in[2]), .C0(n48), .Y(n55)
         );
  AOI222XL U84 ( .A0(n69), .A1(n53), .B0(N86), .B1(n52), .C0(n72), .C1(n51), 
        .Y(n54) );
  OAI221XL U85 ( .A0(in[4]), .A1(n56), .B0(n55), .B1(n57), .C0(n54), .Y(out[3]) );
  NOR2XL U86 ( .A(n18), .B(in[2]), .Y(n32) );
  AOI2BB2XL U87 ( .B0(n58), .B1(in[5]), .A0N(N75), .A1N(n58), .Y(n9) );
  AOI222XL U88 ( .A0(n42), .A1(N84), .B0(N75), .B1(n41), .C0(in[0]), .C1(n49), 
        .Y(n43) );
endmodule


module Expansion ( in, out );
  input [31:0] in;
  output [47:0] out;
  wire   n2, n5, n8, n11, n22, n25, n28, n31, n34, n37, n42, n53, n56, n58,
         n61;

  INVX2 U1 ( .A(n5), .Y(out[24]) );
  INVX1 U2 ( .A(n61), .Y(out[35]) );
  INVX1 U3 ( .A(n34), .Y(out[6]) );
  INVX3 U4 ( .A(n2), .Y(out[12]) );
  BUFX4 U5 ( .A(in[10]), .Y(out[15]) );
  INVX2 U6 ( .A(n56), .Y(out[11]) );
  INVX2 U7 ( .A(n11), .Y(out[0]) );
  CLKINVX1 U8 ( .A(in[27]), .Y(n42) );
  CLKINVX2 U9 ( .A(in[7]), .Y(n2) );
  CLKINVX1 U10 ( .A(n25), .Y(out[17]) );
  CLKINVX4 U11 ( .A(in[20]), .Y(n28) );
  CLKINVX1 U12 ( .A(n58), .Y(out[23]) );
  CLKINVX1 U13 ( .A(in[0]), .Y(n53) );
  CLKINVX1 U14 ( .A(in[31]), .Y(n11) );
  INVXL U15 ( .A(n28), .Y(out[31]) );
  INVX1 U16 ( .A(n37), .Y(out[18]) );
  CLKBUFX3 U17 ( .A(in[19]), .Y(out[30]) );
  CLKINVX1 U18 ( .A(n22), .Y(out[5]) );
  CLKBUFX3 U19 ( .A(in[30]), .Y(out[45]) );
  CLKINVX1 U20 ( .A(in[24]), .Y(n61) );
  INVX3 U21 ( .A(in[4]), .Y(n22) );
  CLKBUFX3 U22 ( .A(in[5]), .Y(out[8]) );
  CLKBUFX3 U23 ( .A(in[17]), .Y(out[26]) );
  CLKINVX1 U24 ( .A(n42), .Y(out[42]) );
  CLKBUFX3 U25 ( .A(in[9]), .Y(out[14]) );
  CLKINVX1 U26 ( .A(in[11]), .Y(n37) );
  CLKINVX1 U27 ( .A(n53), .Y(out[47]) );
  CLKINVX1 U28 ( .A(in[15]), .Y(n5) );
  CLKINVX1 U29 ( .A(in[8]), .Y(n56) );
  CLKBUFX2 U30 ( .A(in[8]), .Y(out[13]) );
  INVX1 U31 ( .A(n34), .Y(out[4]) );
  INVX1 U32 ( .A(n8), .Y(out[36]) );
  INVX1 U33 ( .A(n61), .Y(out[37]) );
  INVX1 U34 ( .A(n31), .Y(out[41]) );
  INVXL U35 ( .A(n8), .Y(out[34]) );
  CLKINVX1 U36 ( .A(in[23]), .Y(n8) );
  BUFX4 U37 ( .A(in[29]), .Y(out[44]) );
  BUFX4 U38 ( .A(in[14]), .Y(out[21]) );
  INVXL U39 ( .A(n25), .Y(out[19]) );
  BUFX4 U40 ( .A(in[13]), .Y(out[20]) );
  BUFX3 U41 ( .A(in[6]), .Y(out[9]) );
  BUFX4 U42 ( .A(in[18]), .Y(out[27]) );
  BUFX4 U43 ( .A(in[22]), .Y(out[33]) );
  BUFX4 U44 ( .A(in[21]), .Y(out[32]) );
  INVXL U45 ( .A(n31), .Y(out[43]) );
  CLKBUFX2 U46 ( .A(in[19]), .Y(out[28]) );
  CLKINVX1 U47 ( .A(in[12]), .Y(n25) );
  CLKINVX1 U48 ( .A(in[28]), .Y(n31) );
  CLKINVX1 U49 ( .A(in[3]), .Y(n34) );
  CLKINVX1 U50 ( .A(in[16]), .Y(n58) );
  INVXL U51 ( .A(n37), .Y(out[16]) );
  INVX8 U52 ( .A(n28), .Y(out[29]) );
  BUFX4 U53 ( .A(in[26]), .Y(out[39]) );
  BUFX4 U54 ( .A(in[2]), .Y(out[3]) );
  INVXL U55 ( .A(n42), .Y(out[40]) );
  INVXL U56 ( .A(n53), .Y(out[1]) );
  BUFX4 U57 ( .A(in[1]), .Y(out[2]) );
  INVXL U58 ( .A(n22), .Y(out[7]) );
  INVXL U59 ( .A(n11), .Y(out[46]) );
  INVXL U60 ( .A(n2), .Y(out[10]) );
  INVXL U61 ( .A(n58), .Y(out[25]) );
  INVXL U62 ( .A(n5), .Y(out[22]) );
  BUFX2 U63 ( .A(in[25]), .Y(out[38]) );
endmodule


module PC2 ( out, \in[55] , \in[54] , \in[53] , \in[52] , \in[51] , \in[50] , 
        \in[49] , \in[48] , \in[46] , \in[45] , \in[44] , \in[43] , \in[42] , 
        \in[41] , \in[40] , \in[39] , \in[37] , \in[36] , \in[35] , \in[33] , 
        \in[32] , \in[30] , \in[29] , \in[28] , \in[27] , \in[26] , \in[25] , 
        \in[24] , \in[23] , \in[22] , \in[20] , \in[19] , \in[17] , \in[16] , 
        \in[15] , \in[14] , \in[12] , \in[11] , \in[10] , \in[9] , \in[8] , 
        \in[7] , \in[6] , \in[5] , \in[4] , \in[3] , \in[1] , \in[0]  );
  output [47:0] out;
  input \in[55] , \in[54] , \in[53] , \in[52] , \in[51] , \in[50] , \in[49] ,
         \in[48] , \in[46] , \in[45] , \in[44] , \in[43] , \in[42] , \in[41] ,
         \in[40] , \in[39] , \in[37] , \in[36] , \in[35] , \in[33] , \in[32] ,
         \in[30] , \in[29] , \in[28] , \in[27] , \in[26] , \in[25] , \in[24] ,
         \in[23] , \in[22] , \in[20] , \in[19] , \in[17] , \in[16] , \in[15] ,
         \in[14] , \in[12] , \in[11] , \in[10] , \in[9] , \in[8] , \in[7] ,
         \in[6] , \in[5] , \in[4] , \in[3] , \in[1] , \in[0] ;

  wire   [55:0] in;
  assign in[55] = \in[55] ;
  assign in[54] = \in[54] ;
  assign in[53] = \in[53] ;
  assign in[52] = \in[52] ;
  assign in[51] = \in[51] ;
  assign in[50] = \in[50] ;
  assign in[49] = \in[49] ;
  assign in[48] = \in[48] ;
  assign in[46] = \in[46] ;
  assign in[45] = \in[45] ;
  assign in[44] = \in[44] ;
  assign in[43] = \in[43] ;
  assign in[42] = \in[42] ;
  assign in[41] = \in[41] ;
  assign in[40] = \in[40] ;
  assign in[39] = \in[39] ;
  assign in[37] = \in[37] ;
  assign in[36] = \in[36] ;
  assign in[35] = \in[35] ;
  assign in[33] = \in[33] ;
  assign in[32] = \in[32] ;
  assign in[30] = \in[30] ;
  assign in[29] = \in[29] ;
  assign in[28] = \in[28] ;
  assign in[27] = \in[27] ;
  assign in[26] = \in[26] ;
  assign in[25] = \in[25] ;
  assign in[24] = \in[24] ;
  assign in[23] = \in[23] ;
  assign in[22] = \in[22] ;
  assign in[20] = \in[20] ;
  assign in[19] = \in[19] ;
  assign in[17] = \in[17] ;
  assign in[16] = \in[16] ;
  assign in[15] = \in[15] ;
  assign in[14] = \in[14] ;
  assign in[12] = \in[12] ;
  assign in[11] = \in[11] ;
  assign in[10] = \in[10] ;
  assign in[9] = \in[9] ;
  assign in[8] = \in[8] ;
  assign in[7] = \in[7] ;
  assign in[6] = \in[6] ;
  assign in[5] = \in[5] ;
  assign in[4] = \in[4] ;
  assign in[3] = \in[3] ;
  assign in[1] = \in[1] ;
  assign in[0] = \in[0] ;

  CLKBUFX3 U1 ( .A(in[30]), .Y(out[31]) );
  CLKBUFX3 U2 ( .A(in[48]), .Y(out[30]) );
  CLKBUFX3 U3 ( .A(in[10]), .Y(out[5]) );
  CLKBUFX3 U4 ( .A(in[32]), .Y(out[44]) );
  CLKBUFX3 U5 ( .A(in[11]), .Y(out[14]) );
  CLKBUFX3 U6 ( .A(in[20]), .Y(out[2]) );
  CLKBUFX3 U7 ( .A(in[26]), .Y(out[17]) );
  CLKBUFX3 U8 ( .A(in[45]), .Y(out[45]) );
  CLKBUFX3 U9 ( .A(in[1]), .Y(out[18]) );
  CLKBUFX3 U10 ( .A(in[15]), .Y(out[23]) );
  CLKBUFX3 U11 ( .A(in[36]), .Y(out[26]) );
  CLKBUFX3 U12 ( .A(in[9]), .Y(out[19]) );
  CLKBUFX3 U13 ( .A(in[25]), .Y(out[21]) );
  CLKBUFX3 U14 ( .A(in[29]), .Y(out[27]) );
  CLKBUFX3 U15 ( .A(in[16]), .Y(out[16]) );
  CLKBUFX3 U16 ( .A(in[51]), .Y(out[42]) );
  CLKBUFX3 U17 ( .A(in[42]), .Y(out[47]) );
  CLKBUFX3 U18 ( .A(in[19]), .Y(out[20]) );
  CLKBUFX3 U19 ( .A(in[55]), .Y(out[43]) );
  CLKBUFX3 U20 ( .A(in[49]), .Y(out[28]) );
  CLKBUFX3 U21 ( .A(in[23]), .Y(out[13]) );
  CLKBUFX3 U22 ( .A(in[40]), .Y(out[29]) );
  CLKBUFX3 U23 ( .A(in[54]), .Y(out[24]) );
  CLKBUFX3 U24 ( .A(in[33]), .Y(out[35]) );
  CLKBUFX3 U25 ( .A(in[17]), .Y(out[9]) );
  CLKBUFX3 U26 ( .A(in[5]), .Y(out[15]) );
  CLKBUFX3 U27 ( .A(in[52]), .Y(out[32]) );
  CLKBUFX3 U28 ( .A(in[14]), .Y(out[4]) );
  CLKBUFX3 U29 ( .A(in[41]), .Y(out[39]) );
  CLKBUFX3 U30 ( .A(in[24]), .Y(out[0]) );
  CLKBUFX3 U31 ( .A(in[8]), .Y(out[12]) );
  CLKBUFX3 U32 ( .A(in[6]), .Y(out[3]) );
  CLKBUFX3 U33 ( .A(in[28]), .Y(out[40]) );
  CLKBUFX3 U34 ( .A(in[27]), .Y(out[1]) );
  CLKBUFX3 U35 ( .A(in[35]), .Y(out[37]) );
  CLKBUFX3 U36 ( .A(in[22]), .Y(out[7]) );
  CLKBUFX3 U37 ( .A(in[3]), .Y(out[6]) );
  CLKBUFX3 U38 ( .A(in[0]), .Y(out[8]) );
  CLKBUFX3 U39 ( .A(in[39]), .Y(out[46]) );
  CLKBUFX3 U40 ( .A(in[46]), .Y(out[36]) );
  CLKBUFX3 U41 ( .A(in[7]), .Y(out[10]) );
  CLKBUFX3 U42 ( .A(in[12]), .Y(out[11]) );
  CLKBUFX3 U43 ( .A(in[53]), .Y(out[41]) );
  CLKBUFX3 U44 ( .A(in[44]), .Y(out[33]) );
  CLKBUFX3 U45 ( .A(in[43]), .Y(out[25]) );
  CLKBUFX3 U46 ( .A(in[4]), .Y(out[22]) );
  CLKBUFX3 U47 ( .A(in[37]), .Y(out[34]) );
  CLKBUFX3 U48 ( .A(in[50]), .Y(out[38]) );
endmodule


module final_permutation ( in, out );
  input [63:0] in;
  output [63:0] out;


  BUFX8 U1 ( .A(in[37]), .Y(out[16]) );
  BUFX4 U2 ( .A(in[42]), .Y(out[42]) );
  BUFX3 U3 ( .A(in[43]), .Y(out[34]) );
  BUFX4 U4 ( .A(in[60]), .Y(out[30]) );
  BUFX3 U5 ( .A(in[36]), .Y(out[24]) );
  BUFX3 U6 ( .A(in[50]), .Y(out[44]) );
  BUFX4 U7 ( .A(in[32]), .Y(out[56]) );
  BUFX4 U8 ( .A(in[55]), .Y(out[4]) );
  BUFX4 U9 ( .A(in[51]), .Y(out[36]) );
  BUFX4 U10 ( .A(in[61]), .Y(out[22]) );
  BUFX4 U11 ( .A(in[46]), .Y(out[10]) );
  BUFX4 U12 ( .A(in[58]), .Y(out[46]) );
  BUFX4 U13 ( .A(in[34]), .Y(out[40]) );
  BUFX4 U14 ( .A(in[48]), .Y(out[60]) );
  BUFX4 U15 ( .A(in[40]), .Y(out[58]) );
  BUFX4 U16 ( .A(in[53]), .Y(out[20]) );
  BUFX4 U17 ( .A(in[35]), .Y(out[32]) );
  CLKBUFX3 U18 ( .A(in[47]), .Y(out[2]) );
  CLKBUFX3 U19 ( .A(in[44]), .Y(out[26]) );
  CLKBUFX3 U20 ( .A(in[41]), .Y(out[50]) );
  CLKBUFX3 U21 ( .A(in[52]), .Y(out[28]) );
  CLKBUFX3 U22 ( .A(in[56]), .Y(out[62]) );
  CLKBUFX2 U23 ( .A(in[30]), .Y(out[15]) );
  BUFX2 U24 ( .A(in[49]), .Y(out[52]) );
  BUFX4 U25 ( .A(in[39]), .Y(out[0]) );
  BUFX2 U26 ( .A(in[45]), .Y(out[18]) );
  BUFX2 U27 ( .A(in[59]), .Y(out[38]) );
  BUFX2 U28 ( .A(in[57]), .Y(out[54]) );
  BUFX2 U29 ( .A(in[63]), .Y(out[6]) );
  CLKBUFX2 U30 ( .A(in[33]), .Y(out[48]) );
  BUFX2 U31 ( .A(in[62]), .Y(out[14]) );
  BUFX4 U32 ( .A(in[38]), .Y(out[8]) );
  CLKBUFX3 U33 ( .A(in[54]), .Y(out[12]) );
  CLKBUFX2 U34 ( .A(in[7]), .Y(out[1]) );
  CLKBUFX3 U35 ( .A(in[6]), .Y(out[9]) );
  CLKBUFX3 U36 ( .A(in[18]), .Y(out[45]) );
  CLKBUFX2 U37 ( .A(in[3]), .Y(out[33]) );
  CLKBUFX2 U38 ( .A(in[28]), .Y(out[31]) );
  CLKBUFX3 U39 ( .A(in[19]), .Y(out[37]) );
  CLKBUFX2 U40 ( .A(in[11]), .Y(out[35]) );
  CLKBUFX2 U41 ( .A(in[27]), .Y(out[39]) );
  CLKBUFX2 U42 ( .A(in[12]), .Y(out[27]) );
  CLKBUFX2 U43 ( .A(in[31]), .Y(out[7]) );
  CLKBUFX2 U44 ( .A(in[23]), .Y(out[5]) );
  CLKBUFX2 U45 ( .A(in[15]), .Y(out[3]) );
  CLKBUFX3 U46 ( .A(in[26]), .Y(out[47]) );
  CLKBUFX3 U47 ( .A(in[14]), .Y(out[11]) );
  CLKBUFX2 U48 ( .A(in[4]), .Y(out[25]) );
  CLKBUFX3 U49 ( .A(in[1]), .Y(out[49]) );
  CLKBUFX3 U50 ( .A(in[10]), .Y(out[43]) );
  CLKBUFX3 U51 ( .A(in[2]), .Y(out[41]) );
  CLKBUFX3 U52 ( .A(in[25]), .Y(out[55]) );
  CLKBUFX3 U53 ( .A(in[9]), .Y(out[51]) );
  CLKBUFX2 U54 ( .A(in[20]), .Y(out[29]) );
  CLKBUFX3 U55 ( .A(in[17]), .Y(out[53]) );
  CLKBUFX3 U56 ( .A(in[13]), .Y(out[19]) );
  CLKBUFX3 U57 ( .A(in[22]), .Y(out[13]) );
  CLKBUFX3 U58 ( .A(in[5]), .Y(out[17]) );
  CLKBUFX3 U59 ( .A(in[29]), .Y(out[23]) );
  CLKBUFX3 U60 ( .A(in[21]), .Y(out[21]) );
  CLKBUFX2 U61 ( .A(in[0]), .Y(out[57]) );
  CLKBUFX2 U62 ( .A(in[24]), .Y(out[63]) );
  CLKBUFX2 U63 ( .A(in[16]), .Y(out[61]) );
  CLKBUFX2 U64 ( .A(in[8]), .Y(out[59]) );
endmodule


module initial_permutation ( in, out );
  input [63:0] in;
  output [63:0] out;
  wire   n54;

  BUFX3 U1 ( .A(in[57]), .Y(out[0]) );
  BUFX3 U2 ( .A(in[41]), .Y(out[2]) );
  BUFX3 U3 ( .A(in[37]), .Y(out[19]) );
  CLKBUFX2 U4 ( .A(in[15]), .Y(out[30]) );
  CLKBUFX3 U5 ( .A(in[1]), .Y(out[7]) );
  CLKBUFX3 U6 ( .A(in[23]), .Y(out[29]) );
  CLKBUFX3 U7 ( .A(in[12]), .Y(out[54]) );
  CLKBUFX3 U8 ( .A(in[33]), .Y(out[3]) );
  CLKBUFX3 U9 ( .A(in[49]), .Y(out[1]) );
  CLKBUFX3 U10 ( .A(in[29]), .Y(out[20]) );
  BUFX3 U11 ( .A(in[7]), .Y(out[31]) );
  BUFX3 U12 ( .A(in[9]), .Y(out[6]) );
  CLKBUFX2 U13 ( .A(in[31]), .Y(out[28]) );
  CLKBUFX2 U14 ( .A(in[3]), .Y(out[15]) );
  CLKBUFX2 U15 ( .A(in[20]), .Y(out[53]) );
  CLKBUFX2 U16 ( .A(in[16]), .Y(out[37]) );
  CLKBUFX2 U17 ( .A(in[28]), .Y(out[52]) );
  CLKBUFX2 U18 ( .A(in[24]), .Y(out[36]) );
  BUFX3 U19 ( .A(in[39]), .Y(out[27]) );
  CLKBUFX2 U20 ( .A(in[18]), .Y(out[45]) );
  CLKBUFX2 U21 ( .A(in[26]), .Y(out[44]) );
  CLKBUFX2 U22 ( .A(in[19]), .Y(out[13]) );
  CLKBUFX2 U23 ( .A(in[13]), .Y(out[22]) );
  CLKBUFX2 U24 ( .A(in[8]), .Y(out[38]) );
  CLKBUFX2 U25 ( .A(in[17]), .Y(out[5]) );
  CLKBUFX2 U26 ( .A(in[22]), .Y(out[61]) );
  BUFX8 U27 ( .A(in[35]), .Y(out[11]) );
  CLKINVX1 U28 ( .A(n54), .Y(out[17]) );
  CLKINVX1 U29 ( .A(in[53]), .Y(n54) );
  CLKBUFX3 U30 ( .A(in[27]), .Y(out[12]) );
  CLKBUFX3 U31 ( .A(in[11]), .Y(out[14]) );
  CLKBUFX3 U32 ( .A(in[45]), .Y(out[18]) );
  CLKBUFX3 U33 ( .A(in[32]), .Y(out[35]) );
  CLKBUFX3 U34 ( .A(in[50]), .Y(out[41]) );
  CLKBUFX3 U35 ( .A(in[51]), .Y(out[9]) );
  CLKBUFX3 U36 ( .A(in[40]), .Y(out[34]) );
  CLKBUFX3 U37 ( .A(in[42]), .Y(out[42]) );
  CLKBUFX3 U38 ( .A(in[43]), .Y(out[10]) );
  CLKBUFX3 U39 ( .A(in[34]), .Y(out[43]) );
  CLKBUFX3 U40 ( .A(in[47]), .Y(out[26]) );
  CLKBUFX3 U41 ( .A(in[25]), .Y(out[4]) );
  CLKBUFX3 U42 ( .A(in[5]), .Y(out[23]) );
  CLKBUFX3 U43 ( .A(in[52]), .Y(out[49]) );
  CLKBUFX3 U44 ( .A(in[48]), .Y(out[33]) );
  CLKBUFX3 U45 ( .A(in[10]), .Y(out[46]) );
  CLKBUFX3 U46 ( .A(in[44]), .Y(out[50]) );
  CLKBUFX3 U47 ( .A(in[36]), .Y(out[51]) );
  CLKBUFX3 U48 ( .A(in[55]), .Y(out[25]) );
  CLKBUFX3 U49 ( .A(in[61]), .Y(out[16]) );
  CLKBUFX3 U50 ( .A(in[59]), .Y(out[8]) );
  CLKBUFX3 U51 ( .A(in[63]), .Y(out[24]) );
  CLKBUFX3 U52 ( .A(in[21]), .Y(out[21]) );
  CLKBUFX3 U53 ( .A(in[58]), .Y(out[40]) );
  CLKBUFX2 U54 ( .A(in[30]), .Y(out[60]) );
  CLKBUFX3 U55 ( .A(in[38]), .Y(out[59]) );
  CLKBUFX3 U56 ( .A(in[56]), .Y(out[32]) );
  CLKBUFX2 U57 ( .A(in[6]), .Y(out[63]) );
  CLKBUFX3 U58 ( .A(in[54]), .Y(out[57]) );
  CLKBUFX3 U59 ( .A(in[62]), .Y(out[56]) );
  CLKBUFX2 U60 ( .A(in[14]), .Y(out[62]) );
  CLKBUFX3 U61 ( .A(in[60]), .Y(out[48]) );
  CLKBUFX3 U62 ( .A(in[46]), .Y(out[58]) );
  CLKBUFX2 U63 ( .A(in[4]), .Y(out[55]) );
  CLKBUFX2 U64 ( .A(in[2]), .Y(out[47]) );
  CLKBUFX2 U65 ( .A(in[0]), .Y(out[39]) );
endmodule


module PC1 ( out, \in[63] , \in[62] , \in[61] , \in[60] , \in[59] , \in[58] , 
        \in[57] , \in[55] , \in[54] , \in[53] , \in[52] , \in[51] , \in[50] , 
        \in[49] , \in[47] , \in[46] , \in[45] , \in[44] , \in[43] , \in[42] , 
        \in[41] , \in[39] , \in[38] , \in[37] , \in[36] , \in[35] , \in[34] , 
        \in[33] , \in[31] , \in[30] , \in[29] , \in[28] , \in[27] , \in[26] , 
        \in[25] , \in[23] , \in[22] , \in[21] , \in[20] , \in[19] , \in[18] , 
        \in[17] , \in[15] , \in[14] , \in[13] , \in[12] , \in[11] , \in[10] , 
        \in[9] , \in[7] , \in[6] , \in[5] , \in[4] , \in[3] , \in[2] , \in[1] 
 );
  output [55:0] out;
  input \in[63] , \in[62] , \in[61] , \in[60] , \in[59] , \in[58] , \in[57] ,
         \in[55] , \in[54] , \in[53] , \in[52] , \in[51] , \in[50] , \in[49] ,
         \in[47] , \in[46] , \in[45] , \in[44] , \in[43] , \in[42] , \in[41] ,
         \in[39] , \in[38] , \in[37] , \in[36] , \in[35] , \in[34] , \in[33] ,
         \in[31] , \in[30] , \in[29] , \in[28] , \in[27] , \in[26] , \in[25] ,
         \in[23] , \in[22] , \in[21] , \in[20] , \in[19] , \in[18] , \in[17] ,
         \in[15] , \in[14] , \in[13] , \in[12] , \in[11] , \in[10] , \in[9] ,
         \in[7] , \in[6] , \in[5] , \in[4] , \in[3] , \in[2] , \in[1] ;

  wire   [63:1] in;
  assign in[63] = \in[63] ;
  assign in[62] = \in[62] ;
  assign in[61] = \in[61] ;
  assign in[60] = \in[60] ;
  assign in[59] = \in[59] ;
  assign in[58] = \in[58] ;
  assign in[57] = \in[57] ;
  assign in[55] = \in[55] ;
  assign in[54] = \in[54] ;
  assign in[53] = \in[53] ;
  assign in[52] = \in[52] ;
  assign in[51] = \in[51] ;
  assign in[50] = \in[50] ;
  assign in[49] = \in[49] ;
  assign in[47] = \in[47] ;
  assign in[46] = \in[46] ;
  assign in[45] = \in[45] ;
  assign in[44] = \in[44] ;
  assign in[43] = \in[43] ;
  assign in[42] = \in[42] ;
  assign in[41] = \in[41] ;
  assign in[39] = \in[39] ;
  assign in[38] = \in[38] ;
  assign in[37] = \in[37] ;
  assign in[36] = \in[36] ;
  assign in[35] = \in[35] ;
  assign in[34] = \in[34] ;
  assign in[33] = \in[33] ;
  assign in[31] = \in[31] ;
  assign in[30] = \in[30] ;
  assign in[29] = \in[29] ;
  assign in[28] = \in[28] ;
  assign in[27] = \in[27] ;
  assign in[26] = \in[26] ;
  assign in[25] = \in[25] ;
  assign in[23] = \in[23] ;
  assign in[22] = \in[22] ;
  assign in[21] = \in[21] ;
  assign in[20] = \in[20] ;
  assign in[19] = \in[19] ;
  assign in[18] = \in[18] ;
  assign in[17] = \in[17] ;
  assign in[15] = \in[15] ;
  assign in[14] = \in[14] ;
  assign in[13] = \in[13] ;
  assign in[12] = \in[12] ;
  assign in[11] = \in[11] ;
  assign in[10] = \in[10] ;
  assign in[9] = \in[9] ;
  assign in[7] = \in[7] ;
  assign in[6] = \in[6] ;
  assign in[5] = \in[5] ;
  assign in[4] = \in[4] ;
  assign in[3] = \in[3] ;
  assign in[2] = \in[2] ;
  assign in[1] = \in[1] ;

  CLKBUFX3 U1 ( .A(in[51]), .Y(out[5]) );
  CLKBUFX3 U2 ( .A(in[35]), .Y(out[7]) );
  CLKBUFX3 U3 ( .A(in[27]), .Y(out[8]) );
  CLKBUFX3 U4 ( .A(in[26]), .Y(out[16]) );
  CLKBUFX3 U5 ( .A(in[25]), .Y(out[24]) );
  CLKBUFX3 U6 ( .A(in[29]), .Y(out[36]) );
  CLKBUFX3 U7 ( .A(in[21]), .Y(out[37]) );
  CLKBUFX3 U8 ( .A(in[22]), .Y(out[45]) );
  CLKBUFX3 U9 ( .A(in[23]), .Y(out[53]) );
  CLKBUFX3 U10 ( .A(in[19]), .Y(out[9]) );
  CLKBUFX3 U11 ( .A(in[50]), .Y(out[13]) );
  CLKBUFX3 U12 ( .A(in[2]), .Y(out[19]) );
  CLKBUFX3 U13 ( .A(in[49]), .Y(out[21]) );
  CLKBUFX3 U14 ( .A(in[9]), .Y(out[26]) );
  CLKBUFX3 U15 ( .A(in[1]), .Y(out[27]) );
  CLKBUFX3 U16 ( .A(in[52]), .Y(out[1]) );
  CLKBUFX3 U17 ( .A(in[4]), .Y(out[31]) );
  CLKBUFX3 U18 ( .A(in[53]), .Y(out[33]) );
  CLKBUFX3 U19 ( .A(in[45]), .Y(out[34]) );
  CLKBUFX3 U20 ( .A(in[5]), .Y(out[39]) );
  CLKBUFX3 U21 ( .A(in[54]), .Y(out[41]) );
  CLKBUFX3 U22 ( .A(in[46]), .Y(out[42]) );
  CLKBUFX3 U23 ( .A(in[6]), .Y(out[47]) );
  CLKBUFX3 U24 ( .A(in[55]), .Y(out[49]) );
  CLKBUFX3 U25 ( .A(in[47]), .Y(out[50]) );
  CLKBUFX3 U26 ( .A(in[7]), .Y(out[55]) );
  CLKBUFX3 U27 ( .A(in[20]), .Y(out[29]) );
  CLKBUFX3 U28 ( .A(in[3]), .Y(out[11]) );
  CLKBUFX3 U29 ( .A(in[18]), .Y(out[17]) );
  CLKBUFX3 U30 ( .A(in[10]), .Y(out[18]) );
  CLKBUFX3 U31 ( .A(in[17]), .Y(out[25]) );
  CLKBUFX3 U32 ( .A(in[13]), .Y(out[38]) );
  CLKBUFX3 U33 ( .A(in[14]), .Y(out[46]) );
  CLKBUFX3 U34 ( .A(in[15]), .Y(out[54]) );
  CLKBUFX3 U35 ( .A(in[12]), .Y(out[30]) );
  CLKBUFX3 U36 ( .A(in[58]), .Y(out[12]) );
  CLKBUFX3 U37 ( .A(in[57]), .Y(out[20]) );
  CLKBUFX3 U38 ( .A(in[60]), .Y(out[0]) );
  CLKBUFX3 U39 ( .A(in[61]), .Y(out[32]) );
  CLKBUFX3 U40 ( .A(in[62]), .Y(out[40]) );
  CLKBUFX3 U41 ( .A(in[63]), .Y(out[48]) );
  CLKBUFX3 U42 ( .A(in[59]), .Y(out[4]) );
  CLKBUFX3 U43 ( .A(in[30]), .Y(out[44]) );
  CLKBUFX3 U44 ( .A(in[31]), .Y(out[52]) );
  CLKBUFX3 U45 ( .A(in[28]), .Y(out[28]) );
  CLKBUFX3 U46 ( .A(in[36]), .Y(out[3]) );
  CLKBUFX3 U47 ( .A(in[34]), .Y(out[15]) );
  CLKBUFX3 U48 ( .A(in[33]), .Y(out[23]) );
  CLKBUFX3 U49 ( .A(in[43]), .Y(out[6]) );
  CLKBUFX3 U50 ( .A(in[11]), .Y(out[10]) );
  CLKBUFX3 U51 ( .A(in[42]), .Y(out[14]) );
  CLKBUFX3 U52 ( .A(in[41]), .Y(out[22]) );
  CLKBUFX3 U53 ( .A(in[44]), .Y(out[2]) );
  CLKBUFX3 U54 ( .A(in[37]), .Y(out[35]) );
  CLKBUFX3 U55 ( .A(in[38]), .Y(out[43]) );
  CLKBUFX3 U56 ( .A(in[39]), .Y(out[51]) );
endmodule

