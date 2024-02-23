/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Tue Nov  7 03:00:18 2023
/////////////////////////////////////////////////////////////


module core ( i_clk, i_rst_n, i_op_valid, i_op_mode, o_op_ready, i_in_valid, 
        i_in_data, o_in_ready, o_out_valid, o_out_data );
  input [3:0] i_op_mode;
  input [7:0] i_in_data;
  output [13:0] o_out_data;
  input i_clk, i_rst_n, i_op_valid, i_in_valid;
  output o_op_ready, o_in_ready, o_out_valid;
  wire   n2268, n2269, n2270, n2271, n2272, n2273, n2274, n2275, n2276, n2277,
         n2278, n2279, n2280, n2281, n2282, n2283, n2284, state_w_0_,
         SRAM_CEN_1_r, SRAM_CEN_2_r, SRAM_CEN_3_r, SRAM_CEN_4_r, SRAM_WEN_4_r,
         SRAM_WEN_2_w, \a5[7] , \a5[6] , \a5[5] , \a5[4] , \a5[3] , \a5[2] ,
         \a5[1] , \a5[0] , o_median_finish, o_sobel_finish,
         zero_padding_buffer_r, N222, N223, N224, N225, N226, N229, N230, N231,
         N232, N233, N234, N240, N241, N242, N248, N249, N250, N282, N283,
         N284, N336, N337, N338, N339, N340, N350, N351, N352, N354, N355,
         N366, N367, N368, N369, N370, N407, N408, N409, N410, N411, N456,
         N457, N458, N459, N476, N477, N478, N479, N508, N509, N510, N511,
         N512, N586, N587, N588, N589, N616, N617, N618, N619, N620, N625,
         N627, N661, N662, N663, N664, N665, N700, N701, N702, N703, N858,
         N859, N860, N861, N862, N863, N864, N865, N866, N868, N869, N870,
         N871, N872, N873, N874, N875, N877, N879, N880, N881, N882, N883,
         N885, N895, N898, N899, N900, N901, N902, N903, N904, N905, N906,
         N907, N908, N915, read_access_16_5_, N1521, N1522, N1523, N1524,
         N1525, N1526, N1527, N1528, N1529, N1530, N1531, N1532, N1533, N1534,
         N1535, N1536, N1537, N1539, N1540, N1541, N1542, N1543, N1544, N1545,
         N1546, N1547, N1548, N1549, N1550, N1551, N1552, N1553, N1554, N1555,
         N1557, N1558, N1559, N1560, N1561, N1562, N1563, N1564, N1565, N1566,
         N1567, N1568, N1569, N1570, N1571, N1572, N1573, N1575, N1576, N1577,
         N1578, N1579, N1580, N1581, N1582, N1583, N1584, N1585, N1586, N1587,
         N1588, N1589, N1590, N1591, N1622, N1638, N1654, N1685, N1690, N1707,
         N1738, N1743, N1760, N1794, N1810, N1826, N1882, N1885, N1888, N1890,
         N3697, N3702, n206, n855, sub_1772_carry_5_, add_727_carry_2_,
         add_727_carry_3_, add_727_carry_4_, add_727_carry_5_,
         sub_503_carry_2_, sub_503_carry_3_, sub_503_carry_4_,
         sub_503_carry_5_, sub_410_aco_B_0_, r707_carry_2_, r707_carry_3_,
         r707_carry_4_, r707_carry_5_, r703_carry_2_, r703_carry_3_,
         r703_carry_4_, r703_carry_5_, r699_carry_2_, r699_carry_3_,
         r699_carry_4_, r699_carry_5_, r696_carry_5_, r693_carry_2_,
         r693_carry_3_, r693_carry_4_, r693_carry_5_, n856, n857, n8580, n8590,
         n8600, n8610, n8620, n8630, n8640, n8650, n8660, n867, n8680, n8690,
         n8700, n8710, n8720, n8730, n8740, n8750, n876, n8770, n878, n8790,
         n8800, n8810, n8820, n8830, n884, n8850, n886, n887, n888, n889, n890,
         n891, n892, n893, n894, n8950, n896, n897, n8980, n8990, n9000, n9010,
         n9020, n9030, n9040, n9050, n9060, n9070, n9080, n909, n910, n911,
         n912, n913, n914, n9150, n916, n917, n918, n919, n920, n921, n922,
         n923, n924, n925, n926, n927, n928, n929, n930, n931, n932, n933,
         n934, n935, n936, n937, n938, n939, n940, n941, n942, n943, n944,
         n945, n946, n947, n948, n949, n950, n951, n952, n953, n954, n955,
         n956, n957, n958, n959, n960, n961, n962, n963, n964, n965, n966,
         n967, n968, n969, n970, n971, n972, n973, n974, n975, n976, n977,
         n978, n979, n980, n981, n982, n983, n984, n985, n986, n987, n988,
         n989, n990, n991, n992, n993, n994, n995, n996, n997, n998, n999,
         n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009,
         n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019,
         n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029,
         n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039,
         n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049,
         n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059,
         n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069,
         n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079,
         n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089,
         n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099,
         n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109,
         n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119,
         n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129,
         n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139,
         n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149,
         n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159,
         n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169,
         n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179,
         n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189,
         n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199,
         n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209,
         n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219,
         n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229,
         n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239,
         n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249,
         n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259,
         n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269,
         n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279,
         n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289,
         n1290, n1291, n1292, n1293, n1294, n1295, n1305, n1306, n1307, n1308,
         n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318,
         n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328,
         n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338,
         n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348,
         n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358,
         n1359, n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368,
         n1369, n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378,
         n1379, n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388,
         n1389, n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398,
         n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408,
         n1409, n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418,
         n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428,
         n1429, n1430, n1431, n1432, n1433, n1434, n1435, n1436, n1437, n1438,
         n1439, n1440, n1449, n1450, n1451, n1452, n1453, n1454, n1455, n1456,
         n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1466,
         n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475, n1476,
         n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485, n1486,
         n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495, n1496,
         n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505, n1506,
         n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514, n1515, n1516,
         n1517, n1518, n1519, n1520, n15210, n15220, n15230, n15240, n15250,
         n15260, n15270, n15280, n15290, n15300, n15310, n15320, n15330,
         n15340, n15350, n15360, n15370, n1538, n15390, n15400, n15410, n15420,
         n15430, n15440, n15450, n15460, n15470, n15480, n15490, n15500,
         n15510, n15520, n15530, n15540, n15550, n1556, n15570, n15580, n15590,
         n15600, n15610, n15620, n15630, n15640, n15650, n15660, n15670,
         n15680, n15690, n15700, n15710, n15720, n15730, n1574, n15750, n15760,
         n15770, n15780, n15790, n15800, n15810, n15820, n15830, n15840,
         n15850, n15860, n15870, n15880, n15890, n15900, n15910, n1592, n1593,
         n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603,
         n1604, n1605, n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613,
         n1614, n1615, n1616, n1617, n1618, n1619, n1620, n1621, n16220, n1623,
         n1624, n1625, n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633,
         n1634, n1635, n1636, n1637, n16380, n1639, n1640, n1641, n1642, n1643,
         n1644, n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653,
         n16540, n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663,
         n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673,
         n1674, n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683,
         n1684, n16850, n1686, n1687, n1688, n1689, n16900, n1691, n1692,
         n1693, n1694, n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702,
         n1703, n1704, n1705, n1706, n17070, n1708, n1709, n1710, n1711, n1712,
         n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722,
         n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730, n1731, n1732,
         n1733, n1734, n1735, n1736, n1737, n17380, n1739, n1740, n1741, n1742,
         n17430, n1744, n1745, n1746, n1747, n1748, n1749, n1750, n1751, n1752,
         n1753, n1754, n1755, n1756, n1757, n1758, n1759, n17600, n1761, n1762,
         n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770, n1771, n1772,
         n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780, n1781, n1782,
         n1783, n1784, n1785, n1786, n1787, n1788, n1789, n1790, n1791, n1792,
         n1793, n17940, n1795, n1796, n1797, n1798, n1799, n1800, n1801, n1802,
         n1803, n1804, n1805, n1806, n1807, n1808, n1809, n18100, n1811, n1812,
         n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820, n1821, n1822,
         n1823, n1824, n1825, n18260, n1827, n1828, n1829, n1830, n1831, n1832,
         n1833, n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1841, n1842,
         n1843, n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1851, n1852,
         n1853, n1854, n1855, n1856, n1857, n1858, n1859, n1860, n1861, n1862,
         n1863, n1864, n1865, n1866, n1867, n1868, n1869, n1870, n1871, n1872,
         n1873, n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881, n18820,
         n1883, n1884, n18850, n1886, n1887, n18880, n1889, n18900, n1891,
         n1892, n1893, n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901,
         n1902, n1903, n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911,
         n1912, n1913, n1914, n1915, n1916, n1917, n1918, n1919, n1920, n1921,
         n1922, n1923, n1924, n1925, n1926, n1927, n1928, n1929, n1930, n1931,
         n1932, n1933, n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941,
         n1942, n1943, n1944, n1945, n1946, n1947, n1948, n1949, n1950, n1951,
         n1952, n1953, n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961,
         n1962, n1963, n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971,
         n1972, n1973, n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981,
         n1982, n1983, n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991,
         n1992, n1993, n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001,
         n2002, n2003, n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011,
         n2012, n2013, n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021,
         n2022, n2023, n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031,
         n2032, n2033, n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041,
         n2042, n2043, n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051,
         n2052, n2053, n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061,
         n2062, n2063, n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071,
         n2072, n2073, n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081,
         n2082, n2083, n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091,
         n2092, n2093, n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101,
         n2102, n2103, n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111,
         n2112, n2113, n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121,
         n2122, n2123, n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131,
         n2132, n2133, n2134, n2135, n2136, n2137, n2138, n2139, n2140, n2141,
         n2142, n2143, n2144, n2145, n2146, n2147, n2148, n2149, n2150, n2151,
         n2152, n2153, n2154, n2155, n2156, n2157, n2158, n2159, n2160, n2161,
         n2162, n2163, n2164, n2165, n2166, n2167, n2168, n2169, n2170, n2171,
         n2172, n2173, n2174, n2175, n2176, n2177, n2178, n2179, n2180, n2181,
         n2182, n2183, n2184, n2185, n2186, n2187, n2188, n2189, n2190, n2191,
         n2192, n2193, n2194, n2195, n2196, n2197, n2198, n2199, n2200, n2201,
         n2202, n2203, n2204, n2205, n2206, n2207, n2208, n2209, n2210, n2211,
         n2212, n2213, n2214, n2215, n2216, n2217, n2218, n2219, n2220, n2221,
         n2222, n2223, n2224, n2225, n2226, n2227, n2228, n2229, n2230, n2231,
         n2232, n2233, n2234, n2235, n2236, n2237, n2238, n2239, n2240, n2241,
         n2242, n2243, n2244, n2245, n2246, n2247, n2248, n2249, n2250, n2251,
         n2252, n2253, n2254, n2255, n2256, n2257, n2258, n2259, n2260, n2261,
         n2262, n2263, n2264, n2265, n2266, n2267, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7;
  wire   [4:0] state_r;
  wire   [10:0] SRAM_load_data_r;
  wire   [7:0] SRAM_INPUT_DATA_1_r;
  wire   [7:0] SRAM_INPUT_DATA_2_r;
  wire   [7:0] SRAM_INPUT_DATA_3_r;
  wire   [7:0] SRAM_INPUT_DATA_4_r;
  wire   [8:0] SRAM_ADDRESS_1_r;
  wire   [8:0] SRAM_ADDRESS_2_r;
  wire   [8:0] SRAM_ADDRESS_3_r;
  wire   [8:0] SRAM_ADDRESS_4_r;
  wire   [7:0] read_data_r;
  wire   [7:0] SRAM_READ_DATA_1;
  wire   [7:0] SRAM_READ_DATA_2;
  wire   [7:0] SRAM_READ_DATA_3;
  wire   [7:0] SRAM_READ_DATA_4;
  wire   [7:0] a1;
  wire   [7:0] a2;
  wire   [7:0] a3;
  wire   [7:0] a4;
  wire   [7:0] a6;
  wire   [7:0] a7;
  wire   [7:0] a8;
  wire   [7:0] a9;
  wire   [7:0] median_result;
  wire   [13:0] sobel_result;
  wire   [1:0] NMS_direction;
  wire   [55:0] sobel_answers_r;
  wire   [7:0] NMS_direction_r;
  wire   [43:0] conv_r;
  wire   [11:0] conv_calc;
  wire   [5:4] origin_r;
  wire   [3:0] SRAM_load_count_r;
  wire   [1:0] scale_r;
  wire   [7:0] conv_channels_32_r;
  wire   [6:0] conv_channels_16_r;
  wire   [5:0] conv_channels_8_r;
  wire   [2:0] conv_output_r;
  wire   [3:1] median_output_r;
  wire   [1:0] sobel_count_r;
  wire   [2:0] NMS_output_count_r;
  wire   [1:0] NMS_output_r;
  wire   [13:0] conv_temp_2;
  wire   [16:3] conv_temp;
  wire   [6:5] read_access_32;
  wire   [5:2] add_1046_carry;
  wire   [5:3] add_804_carry;
  wire   [5:3] sub_580_carry;
  wire   [5:4] add_430_aco_carry;
  wire   [5:4] sub_420_aco_carry;
  wire   [4:1] sub_410_aco_carry;
  wire   [4:3] r704_carry;
  wire   [5:3] r702_carry;
  wire   [5:2] r688_carry;

  sram_512x8 sram_1 ( .Q(SRAM_READ_DATA_1), .A(SRAM_ADDRESS_1_r), .D(
        SRAM_INPUT_DATA_1_r), .CLK(i_clk), .CEN(SRAM_CEN_1_r), .WEN(n947) );
  sram_512x8 sram_2 ( .Q(SRAM_READ_DATA_2), .A(SRAM_ADDRESS_2_r), .D(
        SRAM_INPUT_DATA_2_r), .CLK(i_clk), .CEN(SRAM_CEN_2_r), .WEN(n1375) );
  sram_512x8 sram_3 ( .Q(SRAM_READ_DATA_3), .A(SRAM_ADDRESS_3_r), .D(
        SRAM_INPUT_DATA_3_r), .CLK(i_clk), .CEN(SRAM_CEN_3_r), .WEN(n946) );
  sram_512x8 sram_4 ( .Q(SRAM_READ_DATA_4), .A(SRAM_ADDRESS_4_r), .D(
        SRAM_INPUT_DATA_4_r), .CLK(i_clk), .CEN(SRAM_CEN_4_r), .WEN(
        SRAM_WEN_4_r) );
  convolution CONV ( .a1(a1), .a2(a2), .a3(a3), .a4({a4[7:2], n867, a4[0]}), 
        .a5({\a5[7] , \a5[6] , \a5[5] , \a5[4] , \a5[3] , \a5[2] , \a5[1] , 
        \a5[0] }), .a6({a6[7:3], n8660, a6[1:0]}), .a7(a7), .a8(a8), .a9({
        a9[7:3], n8650, a9[1:0]}), .conv_result(conv_calc), .i_rst_n_INV(n1613), .i_clk(i_clk) );
  median_filter MEDIAN ( .i_clk(i_clk), .i_rst_n(n958), .i_start(n206), .a1({
        a1[7:2], n966, a1[0]}), .a2(a2), .a3(a3), .a4({a4[7:2], n867, a4[0]}), 
        .a5({\a5[7] , \a5[6] , \a5[5] , \a5[4] , \a5[3] , \a5[2] , \a5[1] , 
        \a5[0] }), .a6({a6[7:3], n8660, a6[1:0]}), .a7({a7[7:2], n980, a7[0]}), 
        .a8(a8), .a9({a9[7:3], n8650, n977, a9[0]}), .o_median_finish(
        o_median_finish), .median_result({SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, median_result}) );
  Sobel_gradient sobel ( .i_clk(i_clk), .i_rst_n(n958), .i_start(n855), .a1({
        a1[7:2], n965, a1[0]}), .a2(a2), .a3(a3), .a4({a4[7:2], n867, a4[0]}), 
        .a6({a6[7:3], n8660, a6[1:0]}), .a7({a7[7:2], n979, a7[0]}), .a8(a8), 
        .a9({a9[7:3], n8650, n976, a9[0]}), .o_sobel_finish(o_sobel_finish), 
        .sobel_result(sobel_result), .NMS_direction(NMS_direction), 
        .sobel1U80_Y_INV(n15790) );
  core_DW01_add_0 add_1895 ( .A({n1314, n1315, n1316, n1317, n1318, n1319, 
        n1320, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, 
        n1321}), .SUM({N1591, N1590, N1589, N1588, N1587, N1586, N1585, N1584, 
        N1583, N1582, N1581, N1580, N1579, N1578, N1577, N1576, N1575}), 
        .\B[11] (conv_calc[11]), .\B[10] (conv_calc[10]), .\B[9] (conv_calc[9]), .\B[8] (conv_calc[8]), .\B[7] (n15900), .\B[6] (n961), .\B[5] (n15880), 
        .\B[4] (n15870), .\B[3] (n15860), .\B[2] (n15850), .\B[1] (n15840), 
        .\B[0] (n15830) );
  core_DW01_add_1 add_1886 ( .A({n1331, n1332, n1333, n1334, n1335, n1336, 
        n1337, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330, 
        n1338}), .SUM({N1573, N1572, N1571, N1570, N1569, N1568, N1567, N1566, 
        N1565, N1564, N1563, N1562, N1561, N1560, N1559, N1558, N1557}), 
        .\B[11] (conv_calc[11]), .\B[10] (conv_calc[10]), .\B[9] (conv_calc[9]), .\B[8] (conv_calc[8]), .\B[7] (n15900), .\B[6] (n15890), .\B[5] (n15880), 
        .\B[4] (n15870), .\B[3] (n15860), .\B[2] (n15850), .\B[1] (n15840), 
        .\B[0] (n15830) );
  core_DW01_add_2 add_1877 ( .A({n1348, n1349, n1350, n1351, n1352, n1353, 
        n1354, n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, 
        n1355}), .SUM({N1555, N1554, N1553, N1552, N1551, N1550, N1549, N1548, 
        N1547, N1546, N1545, N1544, N1543, N1542, N1541, N1540, N1539}), 
        .\B[11] (conv_calc[11]), .\B[10] (conv_calc[10]), .\B[9] (conv_calc[9]), .\B[8] (conv_calc[8]), .\B[7] (n15900), .\B[6] (n961), .\B[5] (n15880), 
        .\B[4] (n15870), .\B[3] (n15860), .\B[2] (n15850), .\B[1] (n15840), 
        .\B[0] (n15830) );
  core_DW01_add_3 add_1868 ( .A({n1365, n1366, n1367, n1368, n1369, n1370, 
        n1371, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364, 
        n1372}), .SUM({N1537, N1536, N1535, N1534, N1533, N1532, N1531, N1530, 
        N1529, N1528, N1527, N1526, N1525, N1524, N1523, N1522, N1521}), 
        .\B[11] (conv_calc[11]), .\B[10] (conv_calc[10]), .\B[9] (conv_calc[9]), .\B[8] (conv_calc[8]), .\B[7] (n15900), .\B[6] (n15890), .\B[5] (n15880), 
        .\B[4] (n15870), .\B[3] (n15860), .\B[2] (n15850), .\B[1] (n15840), 
        .\B[0] (n15830) );
  core_DW01_inc_0 add_1489_round ( .\A[13] (conv_temp[16]), .\A[12] (
        conv_temp[15]), .\A[11] (conv_temp[14]), .\A[10] (conv_temp[13]), 
        .\A[9] (conv_temp[12]), .\A[8] (conv_temp[11]), .\A[7] (conv_temp[10]), 
        .\A[6] (conv_temp[9]), .\A[5] (conv_temp[8]), .\A[4] (conv_temp[7]), 
        .\A[3] (conv_temp[6]), .\A[2] (conv_temp[5]), .\A[1] (conv_temp[4]), 
        .\A[0] (conv_temp[3]), .\SUM[14] (conv_temp_2[13]), .\SUM[13] (
        conv_temp_2[12]), .\SUM[12] (conv_temp_2[11]), .\SUM[11] (
        conv_temp_2[10]), .\SUM[10] (conv_temp_2[9]), .\SUM[9] (conv_temp_2[8]), .\SUM[8] (conv_temp_2[7]), .\SUM[7] (conv_temp_2[6]), .\SUM[6] (
        conv_temp_2[5]), .\SUM[5] (conv_temp_2[4]), .\SUM[4] (conv_temp_2[3]), 
        .\SUM[3] (conv_temp_2[2]), .\SUM[2] (conv_temp_2[1]), .\SUM[1] (
        conv_temp_2[0]) );
  core_DW01_inc_1_DW01_inc_4 add_1091 ( .A({n1497, n1487, n1488, n1489, n1490, 
        n1491, n1492, n1493, n1494, n1495, n1498}), .SUM({N908, N907, N906, 
        N905, N904, N903, N902, N901, N900, N899, N898}) );
  core_DW01_inc_3_DW01_inc_9 add_1034 ( .A({n1480, n1481, n1482, n1483, n1484, 
        n1485, n1486}), .SUM({N875, N874, N873, N872, N871, N870, N869}) );
  core_DW01_inc_4_DW01_inc_10 add_1022 ( .A({n1472, n1473, n1474, n1475, n1476, 
        n1477, n1478, n1479}), .SUM({N866, N865, N864, N863, N862, N861, N860, 
        N859}) );
  core_DW01_cmp6_0 r738 ( .A({n1408, n1409, n1410, n1411, n1399, n1400, n1401, 
        n1402, n1403, n1404, n1405, n1406, n1407, n1412}), .B({n1394, n1395, 
        n1396, n1397, n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, 
        n1393, n1398}), .LT(N1743), .GT(N1794) );
  core_DW01_cmp6_1 r737 ( .A({n1422, sobel_answers_r[40:28]}), .B({n1394, 
        sobel_answers_r[12:0]}), .LT(N1707), .GT(N1826), .i_rst_n_INV(n958), 
        .i_clk(i_clk) );
  core_DW01_cmp6_2 r736 ( .A({n1422, sobel_answers_r[40:28]}), .B({n1408, 
        sobel_answers_r[26:14]}), .LT(N1685), .GT(N1738), .i_rst_n_INV(n958), 
        .i_clk(i_clk) );
  core_DW01_cmp6_3 r735 ( .A({n1436, sobel_answers_r[54:42]}), .B({n1408, 
        sobel_answers_r[26:14]}), .LT(N1654), .GT(N1760), .i_rst_n_INV(n958), 
        .i_clk(i_clk) );
  core_DW01_cmp6_4 r734 ( .A({n1436, sobel_answers_r[54:42]}), .B({n1394, 
        sobel_answers_r[12:0]}), .LT(N1638), .GT(N1810), .i_rst_n_INV(n958), 
        .i_clk(i_clk) );
  core_DW01_cmp6_5 r733 ( .A({n1436, n1437, n1438, n1439, n1427, n1428, n1429, 
        n1430, n1431, n1432, n1433, n1434, n1435, n1440}), .B({n1422, n1423, 
        n1424, n1425, n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420, 
        n1421, n1426}), .LT(N1622), .GT(N1690) );
  DFFSX1 i_clk_r_REG663_S1 ( .D(n2091), .CK(i_clk), .SN(n1085), .Q(n1611) );
  DFFSX1 i_clk_r_REG662_S1 ( .D(n2090), .CK(i_clk), .SN(n1085), .Q(n1610) );
  DFFSX1 i_clk_r_REG661_S1 ( .D(n2089), .CK(i_clk), .SN(n1085), .Q(n1609) );
  DFFSX1 i_clk_r_REG660_S1 ( .D(n2088), .CK(i_clk), .SN(n1084), .Q(n1608) );
  DFFSX1 i_clk_r_REG659_S1 ( .D(n2087), .CK(i_clk), .SN(n1084), .Q(n1607) );
  DFFSX1 i_clk_r_REG658_S1 ( .D(n2086), .CK(i_clk), .SN(n1084), .Q(n1606) );
  DFFSX1 i_clk_r_REG657_S1 ( .D(n2085), .CK(i_clk), .SN(n1084), .Q(n1605) );
  DFFSX1 i_clk_r_REG656_S1 ( .D(n2084), .CK(i_clk), .SN(n1084), .Q(n1604) );
  DFFSX1 i_clk_r_REG653_S1 ( .D(n1277), .CK(i_clk), .SN(n1084), .Q(n1597) );
  DFFSX1 i_clk_r_REG582_S3 ( .D(n2095), .CK(i_clk), .SN(n1083), .Q(n15770) );
  DFFSX1 i_clk_r_REG8_S2 ( .D(n2096), .CK(i_clk), .SN(n1083), .Q(n1574), .QN(
        n918) );
  DFFSX1 i_clk_r_REG596_S2 ( .D(n2100), .CK(i_clk), .SN(n1083), .Q(n15710) );
  DFFSX1 i_clk_r_REG562_S3 ( .D(SRAM_load_data_r[0]), .CK(i_clk), .SN(n1084), 
        .Q(n1498) );
  DFFSX1 i_clk_r_REG564_S3 ( .D(SRAM_load_data_r[1]), .CK(i_clk), .SN(n1084), 
        .Q(n1495) );
  DFFSX1 i_clk_r_REG566_S3 ( .D(SRAM_load_data_r[2]), .CK(i_clk), .SN(n1083), 
        .Q(n1494) );
  DFFSX1 i_clk_r_REG568_S3 ( .D(SRAM_load_data_r[3]), .CK(i_clk), .SN(n1083), 
        .Q(n1493) );
  DFFSX1 i_clk_r_REG570_S3 ( .D(SRAM_load_data_r[4]), .CK(i_clk), .SN(n1083), 
        .Q(n1492) );
  DFFSX1 i_clk_r_REG572_S3 ( .D(SRAM_load_data_r[5]), .CK(i_clk), .SN(n1083), 
        .Q(n1491) );
  DFFSX1 i_clk_r_REG578_S3 ( .D(SRAM_load_data_r[8]), .CK(i_clk), .SN(n1083), 
        .Q(n1488) );
  DFFRX4 i_clk_r_REG650_S1 ( .D(n1179), .CK(i_clk), .RN(n1060), .Q(n1465), 
        .QN(n1017) );
  DFFRX4 i_clk_r_REG4_S1 ( .D(state_r[1]), .CK(i_clk), .RN(n1082), .Q(n1382), 
        .QN(n985) );
  DFFSX1 i_clk_r_REG588_S3 ( .D(n2117), .CK(i_clk), .SN(n1083), .Q(n1378) );
  DFFSX1 i_clk_r_REG590_S3 ( .D(n2116), .CK(i_clk), .SN(n1083), .Q(n1377) );
  DFFSX1 i_clk_r_REG587_S3 ( .D(n2114), .CK(i_clk), .SN(n1083), .Q(n1376) );
  DFFRX4 i_clk_r_REG0_S1 ( .D(state_r[4]), .CK(i_clk), .RN(n1071), .Q(n1295), 
        .QN(n998) );
  DFFRX4 i_clk_r_REG592_S4 ( .D(state_r[2]), .CK(i_clk), .RN(n1071), .Q(n1294), 
        .QN(n973) );
  DFFSX1 i_clk_r_REG589_S3 ( .D(n2115), .CK(i_clk), .SN(n1083), .Q(n1292) );
  DFFSX1 i_clk_r_REG586_S3 ( .D(n2113), .CK(i_clk), .SN(n1084), .Q(n1291) );
  DFFSX1 i_clk_r_REG585_S3 ( .D(n2112), .CK(i_clk), .SN(n1084), .Q(n1290) );
  DFFSX1 i_clk_r_REG595_S2 ( .D(n2111), .CK(i_clk), .SN(n1084), .Q(n1288) );
  DFFSX1 i_clk_r_REG594_S2 ( .D(n2110), .CK(i_clk), .SN(n1084), .Q(n1287) );
  DFFSX1 i_clk_r_REG593_S2 ( .D(n2109), .CK(i_clk), .SN(n1085), .Q(n1283) );
  DFFRX4 i_clk_r_REG6_S2 ( .D(state_r[0]), .CK(i_clk), .RN(n1070), .Q(n15910), 
        .QN(n968) );
  DFFRX4 i_clk_r_REG5_S2 ( .D(state_r[3]), .CK(i_clk), .RN(n1070), .Q(n1284), 
        .QN(n986) );
  DFFRX1 i_clk_r_REG557_S12 ( .D(n1201), .CK(i_clk), .RN(n1063), .Q(n1499) );
  DFFRX1 i_clk_r_REG554_S11 ( .D(n1202), .CK(i_clk), .RN(n1063), .Q(n1500) );
  DFFRX1 i_clk_r_REG551_S10 ( .D(n1203), .CK(i_clk), .RN(n1063), .Q(n1501) );
  DFFRX1 i_clk_r_REG549_S9 ( .D(n1204), .CK(i_clk), .RN(n1063), .Q(n1502) );
  DFFRX1 i_clk_r_REG546_S8 ( .D(n1205), .CK(i_clk), .RN(n1063), .Q(n1503) );
  DFFRX1 i_clk_r_REG543_S7 ( .D(n1206), .CK(i_clk), .RN(n1063), .Q(n1504) );
  DFFRX1 i_clk_r_REG540_S6 ( .D(n1207), .CK(i_clk), .RN(n1063), .Q(n1505) );
  DFFRX1 i_clk_r_REG537_S5 ( .D(n1208), .CK(i_clk), .RN(n1063), .Q(n1506) );
  DFFRX1 i_clk_r_REG536_S4 ( .D(n1209), .CK(i_clk), .RN(n1063), .Q(n1507) );
  DFFRX1 i_clk_r_REG531_S12 ( .D(n1210), .CK(i_clk), .RN(n1063), .Q(n1508) );
  DFFRX1 i_clk_r_REG528_S11 ( .D(n1211), .CK(i_clk), .RN(n1063), .Q(n1509) );
  DFFRX1 i_clk_r_REG525_S10 ( .D(n1212), .CK(i_clk), .RN(n1063), .Q(n1510) );
  DFFRX1 i_clk_r_REG523_S9 ( .D(n1213), .CK(i_clk), .RN(n1064), .Q(n1511) );
  DFFRX1 i_clk_r_REG520_S8 ( .D(n1214), .CK(i_clk), .RN(n1064), .Q(n1512) );
  DFFRX1 i_clk_r_REG517_S7 ( .D(n1215), .CK(i_clk), .RN(n1064), .Q(n1513) );
  DFFRX1 i_clk_r_REG514_S6 ( .D(n1216), .CK(i_clk), .RN(n1064), .Q(n1514) );
  DFFRX1 i_clk_r_REG511_S5 ( .D(n1217), .CK(i_clk), .RN(n1064), .Q(n1515) );
  DFFRX1 i_clk_r_REG510_S4 ( .D(n1218), .CK(i_clk), .RN(n1064), .Q(n1516) );
  DFFRX1 i_clk_r_REG505_S12 ( .D(n1219), .CK(i_clk), .RN(n1064), .Q(n1517) );
  DFFRX1 i_clk_r_REG502_S11 ( .D(n1220), .CK(i_clk), .RN(n1064), .Q(n1518) );
  DFFRX1 i_clk_r_REG499_S10 ( .D(n1221), .CK(i_clk), .RN(n1064), .Q(n1519) );
  DFFRX1 i_clk_r_REG497_S9 ( .D(n1222), .CK(i_clk), .RN(n1064), .Q(n1520) );
  DFFRX1 i_clk_r_REG494_S8 ( .D(n1223), .CK(i_clk), .RN(n1064), .Q(n15210) );
  DFFRX1 i_clk_r_REG491_S7 ( .D(n1224), .CK(i_clk), .RN(n1065), .Q(n15220) );
  DFFRX1 i_clk_r_REG488_S6 ( .D(n1225), .CK(i_clk), .RN(n1065), .Q(n15230) );
  DFFRX1 i_clk_r_REG485_S5 ( .D(n1226), .CK(i_clk), .RN(n1065), .Q(n15240) );
  DFFRX1 i_clk_r_REG484_S4 ( .D(n1227), .CK(i_clk), .RN(n1065), .Q(n15250) );
  DFFRX1 i_clk_r_REG479_S12 ( .D(n1228), .CK(i_clk), .RN(n1065), .Q(n15260) );
  DFFRX1 i_clk_r_REG476_S11 ( .D(n1229), .CK(i_clk), .RN(n1065), .Q(n15270) );
  DFFRX1 i_clk_r_REG473_S10 ( .D(n1230), .CK(i_clk), .RN(n1065), .Q(n15280) );
  DFFRX1 i_clk_r_REG471_S9 ( .D(n1231), .CK(i_clk), .RN(n1065), .Q(n15290) );
  DFFRX1 i_clk_r_REG468_S8 ( .D(n1232), .CK(i_clk), .RN(n1065), .Q(n15300) );
  DFFRX1 i_clk_r_REG465_S7 ( .D(n1233), .CK(i_clk), .RN(n1065), .Q(n15310) );
  DFFRX1 i_clk_r_REG462_S6 ( .D(n1234), .CK(i_clk), .RN(n1065), .Q(n15320) );
  DFFRX1 i_clk_r_REG459_S5 ( .D(n1235), .CK(i_clk), .RN(n1065), .Q(n15330) );
  DFFRX1 i_clk_r_REG458_S4 ( .D(n1236), .CK(i_clk), .RN(n1066), .Q(n15340) );
  DFFRX1 i_clk_r_REG453_S12 ( .D(n1237), .CK(i_clk), .RN(n1066), .Q(n15350) );
  DFFRX1 i_clk_r_REG450_S11 ( .D(n1238), .CK(i_clk), .RN(n1066), .Q(n15360) );
  DFFRX1 i_clk_r_REG447_S10 ( .D(n1239), .CK(i_clk), .RN(n1066), .Q(n15370) );
  DFFRX1 i_clk_r_REG445_S9 ( .D(n1240), .CK(i_clk), .RN(n1066), .Q(n1538) );
  DFFRX1 i_clk_r_REG442_S8 ( .D(n1241), .CK(i_clk), .RN(n1066), .Q(n15390) );
  DFFRX1 i_clk_r_REG439_S7 ( .D(n1242), .CK(i_clk), .RN(n1066), .Q(n15400) );
  DFFRX1 i_clk_r_REG436_S6 ( .D(n1243), .CK(i_clk), .RN(n1066), .Q(n15410) );
  DFFRX1 i_clk_r_REG433_S5 ( .D(n1244), .CK(i_clk), .RN(n1066), .Q(n15420) );
  DFFRX1 i_clk_r_REG432_S4 ( .D(n1245), .CK(i_clk), .RN(n1066), .Q(n15430) );
  DFFRX1 i_clk_r_REG427_S12 ( .D(n1246), .CK(i_clk), .RN(n1066), .Q(n15440) );
  DFFRX1 i_clk_r_REG424_S11 ( .D(n1247), .CK(i_clk), .RN(n1066), .Q(n15450) );
  DFFRX1 i_clk_r_REG421_S10 ( .D(n1248), .CK(i_clk), .RN(n1067), .Q(n15460) );
  DFFRX1 i_clk_r_REG419_S9 ( .D(n1249), .CK(i_clk), .RN(n1067), .Q(n15470) );
  DFFRX1 i_clk_r_REG416_S8 ( .D(n1250), .CK(i_clk), .RN(n1067), .Q(n15480) );
  DFFRX1 i_clk_r_REG413_S7 ( .D(n1251), .CK(i_clk), .RN(n1067), .Q(n15490) );
  DFFRX1 i_clk_r_REG410_S6 ( .D(n1252), .CK(i_clk), .RN(n1067), .Q(n15500) );
  DFFRX1 i_clk_r_REG407_S5 ( .D(n1253), .CK(i_clk), .RN(n1067), .Q(n15510) );
  DFFRX1 i_clk_r_REG406_S4 ( .D(n1254), .CK(i_clk), .RN(n1067), .Q(n15520) );
  DFFRX1 i_clk_r_REG401_S12 ( .D(n1255), .CK(i_clk), .RN(n1067), .Q(n15530) );
  DFFRX1 i_clk_r_REG398_S11 ( .D(n1256), .CK(i_clk), .RN(n1067), .Q(n15540) );
  DFFRX1 i_clk_r_REG395_S10 ( .D(n1257), .CK(i_clk), .RN(n1067), .Q(n15550) );
  DFFRX1 i_clk_r_REG393_S9 ( .D(n1258), .CK(i_clk), .RN(n1067), .Q(n1556) );
  DFFRX1 i_clk_r_REG390_S8 ( .D(n1259), .CK(i_clk), .RN(n1067), .Q(n15570) );
  DFFRX1 i_clk_r_REG387_S7 ( .D(n1260), .CK(i_clk), .RN(n1068), .Q(n15580) );
  DFFRX1 i_clk_r_REG384_S6 ( .D(n1261), .CK(i_clk), .RN(n1068), .Q(n15590) );
  DFFRX1 i_clk_r_REG381_S5 ( .D(n1262), .CK(i_clk), .RN(n1068), .Q(n15600) );
  DFFRX1 i_clk_r_REG380_S4 ( .D(n1263), .CK(i_clk), .RN(n1068), .Q(n15610) );
  DFFRX1 i_clk_r_REG375_S12 ( .D(n1264), .CK(i_clk), .RN(n1068), .Q(n15620) );
  DFFRX1 i_clk_r_REG372_S11 ( .D(n1265), .CK(i_clk), .RN(n1068), .Q(n15630) );
  DFFRX1 i_clk_r_REG369_S10 ( .D(n1266), .CK(i_clk), .RN(n1068), .Q(n15640) );
  DFFRX1 i_clk_r_REG367_S9 ( .D(n1267), .CK(i_clk), .RN(n1068), .Q(n15650) );
  DFFRX1 i_clk_r_REG358_S7 ( .D(n1269), .CK(i_clk), .RN(n1068), .Q(n15670) );
  DFFRX1 i_clk_r_REG355_S6 ( .D(n1270), .CK(i_clk), .RN(n1068), .Q(n15680) );
  DFFRX1 i_clk_r_REG12_S5 ( .D(n1271), .CK(i_clk), .RN(n1068), .Q(n15690) );
  DFFRX1 i_clk_r_REG10_S4 ( .D(n1272), .CK(i_clk), .RN(n1069), .Q(n15700) );
  DFFRX1 i_clk_r_REG205_S9 ( .D(n1275), .CK(i_clk), .RN(n1069), .Q(n15800) );
  DFFRX1 i_clk_r_REG210_S9 ( .D(n1274), .CK(i_clk), .RN(n1069), .Q(n15780) );
  DFFRX1 i_clk_r_REG600_S4 ( .D(n2103), .CK(i_clk), .RN(n1069), .Q(n15730) );
  DFFRX1 i_clk_r_REG208_S12 ( .D(NMS_direction_r[5]), .CK(i_clk), .RN(n1059), 
        .Q(n1461) );
  DFFRX1 i_clk_r_REG602_S4 ( .D(SRAM_WEN_2_w), .CK(i_clk), .RN(n1082), .Q(
        n1375), .QN(n896) );
  DFFRX1 i_clk_r_REG206_S10 ( .D(NMS_direction_r[1]), .CK(i_clk), .RN(n1059), 
        .Q(n1457) );
  DFFRX1 i_clk_r_REG213_S12 ( .D(NMS_direction_r[4]), .CK(i_clk), .RN(n1060), 
        .Q(n1462), .QN(n938) );
  DFFRX1 i_clk_r_REG207_S11 ( .D(NMS_direction_r[3]), .CK(i_clk), .RN(n1059), 
        .Q(n1459) );
  DFFRX1 i_clk_r_REG43_S6 ( .D(n1113), .CK(i_clk), .RN(n1072), .Q(n1314), .QN(
        n1007) );
  DFFRX1 i_clk_r_REG60_S6 ( .D(n1130), .CK(i_clk), .RN(n1074), .Q(n1331), .QN(
        n1003) );
  DFFRX1 i_clk_r_REG565_S3 ( .D(SRAM_load_data_r[1]), .CK(i_clk), .RN(n1062), 
        .QN(n943) );
  DFFRX1 i_clk_r_REG569_S3 ( .D(SRAM_load_data_r[3]), .CK(i_clk), .RN(n1062), 
        .QN(n942) );
  DFFRX1 i_clk_r_REG571_S3 ( .D(SRAM_load_data_r[4]), .CK(i_clk), .RN(n1062), 
        .QN(n941) );
  DFFRX1 i_clk_r_REG563_S3 ( .D(SRAM_load_data_r[0]), .CK(i_clk), .RN(n1062), 
        .QN(n939) );
  DFFRX1 i_clk_r_REG567_S3 ( .D(SRAM_load_data_r[2]), .CK(i_clk), .RN(n1062), 
        .QN(n940) );
  DFFRX1 i_clk_r_REG211_S10 ( .D(NMS_direction_r[0]), .CK(i_clk), .RN(n1059), 
        .Q(n1458) );
  DFFRX1 i_clk_r_REG601_S4 ( .D(n2072), .CK(i_clk), .RN(n1069), .Q(n15720) );
  DFFRX1 i_clk_r_REG9_S2 ( .D(n2096), .CK(i_clk), .RN(n1069), .Q(n15750) );
  DFFRX1 i_clk_r_REG642_S2 ( .D(n962), .CK(i_clk), .RN(n1070), .Q(n1592) );
  DFFRX1 i_clk_r_REG42_S6 ( .D(n1114), .CK(i_clk), .RN(n1073), .Q(n1315), .QN(
        n1013) );
  DFFRX1 i_clk_r_REG77_S6 ( .D(n1147), .CK(i_clk), .RN(n1075), .Q(n1348), .QN(
        n1005) );
  DFFRX1 i_clk_r_REG212_S11 ( .D(NMS_direction_r[2]), .CK(i_clk), .RN(n1059), 
        .Q(n1460), .QN(n897) );
  DFFRX1 i_clk_r_REG94_S6 ( .D(n1164), .CK(i_clk), .RN(n1077), .Q(n1365), .QN(
        n1009) );
  DFFRX1 i_clk_r_REG76_S6 ( .D(n1148), .CK(i_clk), .RN(n1075), .Q(n1349), .QN(
        n1011) );
  DFFRX1 i_clk_r_REG664_S1 ( .D(o_median_finish), .CK(i_clk), .RN(n1069), .Q(
        n15820), .QN(n931) );
  DFFRX1 i_clk_r_REG631_S2 ( .D(n1175), .CK(i_clk), .RN(n1059), .Q(n1450) );
  DFFRX1 i_clk_r_REG41_S6 ( .D(n1115), .CK(i_clk), .RN(n1073), .Q(n1316), .QN(
        n1025) );
  DFFRX1 i_clk_r_REG58_S6 ( .D(n1132), .CK(i_clk), .RN(n1074), .Q(n1333), .QN(
        n1021) );
  DFFRX1 i_clk_r_REG630_S2 ( .D(n1174), .CK(i_clk), .RN(n1058), .Q(n1449) );
  DFFRX1 i_clk_r_REG93_S6 ( .D(n1165), .CK(i_clk), .RN(n1077), .Q(n1366), .QN(
        n1015) );
  DFFRX1 i_clk_r_REG598_S3 ( .D(n1186), .CK(i_clk), .RN(n1060), .Q(n1472), 
        .QN(n937) );
  DFFRX1 i_clk_r_REG75_S6 ( .D(n1149), .CK(i_clk), .RN(n1075), .Q(n1350), .QN(
        n1023) );
  DFFRX1 i_clk_r_REG40_S6 ( .D(n1116), .CK(i_clk), .RN(n1073), .Q(n1317), .QN(
        n1035) );
  DFFRX1 i_clk_r_REG57_S6 ( .D(n1133), .CK(i_clk), .RN(n1074), .Q(n1334), .QN(
        n1031) );
  DFFRX1 i_clk_r_REG92_S6 ( .D(n1166), .CK(i_clk), .RN(n1077), .Q(n1367), .QN(
        n1027) );
  DFFRX1 i_clk_r_REG612_S2 ( .D(n1194), .CK(i_clk), .RN(n1061), .Q(n1480), 
        .QN(n944) );
  DFFRX1 i_clk_r_REG39_S6 ( .D(n1117), .CK(i_clk), .RN(n1073), .Q(n1318), .QN(
        n1045) );
  DFFRX1 i_clk_r_REG74_S6 ( .D(n1150), .CK(i_clk), .RN(n1076), .Q(n1351), .QN(
        n1033) );
  DFFRX1 i_clk_r_REG209_S13 ( .D(NMS_direction_r[7]), .CK(i_clk), .RN(n1060), 
        .Q(n1463) );
  DFFRX1 i_clk_r_REG56_S6 ( .D(n1134), .CK(i_clk), .RN(n1074), .Q(n1335), .QN(
        n1041) );
  DFFRX1 i_clk_r_REG91_S6 ( .D(n1167), .CK(i_clk), .RN(n1077), .Q(n1368), .QN(
        n1037) );
  DFFRX1 i_clk_r_REG214_S13 ( .D(NMS_direction_r[6]), .CK(i_clk), .RN(n1060), 
        .Q(n1464), .QN(n8950) );
  DFFRX1 i_clk_r_REG73_S6 ( .D(n1151), .CK(i_clk), .RN(n1076), .Q(n1352), .QN(
        n1043) );
  DFFRX2 i_clk_r_REG311_S9 ( .D(sobel_answers_r[13]), .CK(i_clk), .RN(n1081), 
        .Q(n1394) );
  DFFRX1 i_clk_r_REG90_S6 ( .D(n1168), .CK(i_clk), .RN(n1082), .Q(n1369), .QN(
        n1047) );
  DFFRX1 i_clk_r_REG38_S6 ( .D(n1118), .CK(i_clk), .RN(n1073), .Q(n1319) );
  DFFRX1 i_clk_r_REG55_S6 ( .D(n1135), .CK(i_clk), .RN(n1074), .Q(n1336) );
  DFFRX2 i_clk_r_REG313_S11 ( .D(sobel_answers_r[41]), .CK(i_clk), .RN(n1078), 
        .Q(n1422), .QN(n952) );
  DFFRX2 i_clk_r_REG312_S10 ( .D(sobel_answers_r[27]), .CK(i_clk), .RN(n1079), 
        .Q(n1408) );
  DFFRX1 i_clk_r_REG72_S6 ( .D(n1152), .CK(i_clk), .RN(n1076), .Q(n1353), .QN(
        n926) );
  DFFRX1 i_clk_r_REG89_S6 ( .D(n1169), .CK(i_clk), .RN(n1082), .Q(n1370), .QN(
        n894) );
  DFFRX1 i_clk_r_REG37_S6 ( .D(n1119), .CK(i_clk), .RN(n1073), .Q(n1320) );
  DFFRX1 i_clk_r_REG54_S6 ( .D(n1136), .CK(i_clk), .RN(n1074), .Q(n1337) );
  DFFRX1 i_clk_r_REG71_S6 ( .D(n1153), .CK(i_clk), .RN(n1076), .Q(n1354), .QN(
        n924) );
  DFFRX1 i_clk_r_REG610_S5 ( .D(n1286), .CK(i_clk), .RN(n1070), .Q(n1285), 
        .QN(n923) );
  DFFRX1 i_clk_r_REG88_S6 ( .D(n1170), .CK(i_clk), .RN(n1082), .Q(n1371), .QN(
        n893) );
  DFFRX1 i_clk_r_REG623_S4 ( .D(n1178), .CK(i_clk), .RN(n1059), .Q(n1455) );
  DFFRX1 i_clk_r_REG622_S4 ( .D(n1273), .CK(i_clk), .RN(n1069), .Q(n15760) );
  DFFRX1 i_clk_r_REG649_S2 ( .D(scale_r[1]), .CK(i_clk), .RN(n1071), .Q(n1293), 
        .QN(n912) );
  DFFRX1 i_clk_r_REG36_S6 ( .D(n1104), .CK(i_clk), .RN(n1072), .Q(n1305) );
  DFFRX1 i_clk_r_REG53_S6 ( .D(n1121), .CK(i_clk), .RN(n1073), .Q(n1322) );
  DFFRX1 i_clk_r_REG301_S9 ( .D(sobel_answers_r[11]), .CK(i_clk), .RN(n1081), 
        .Q(n1396) );
  DFFRX1 i_clk_r_REG648_S1 ( .D(scale_r[0]), .CK(i_clk), .RN(n1082), .Q(n1380), 
        .QN(n8830) );
  DFFRX1 i_clk_r_REG70_S6 ( .D(n1138), .CK(i_clk), .RN(n1075), .Q(n1339), .QN(
        n922) );
  DFFRX1 i_clk_r_REG306_S9 ( .D(sobel_answers_r[12]), .CK(i_clk), .RN(n1081), 
        .Q(n1395) );
  DFFRX1 i_clk_r_REG307_S10 ( .D(sobel_answers_r[26]), .CK(i_clk), .RN(n1079), 
        .Q(n1409) );
  DFFRX1 i_clk_r_REG303_S11 ( .D(sobel_answers_r[39]), .CK(i_clk), .RN(n1078), 
        .Q(n1424), .QN(n949) );
  DFFRX1 i_clk_r_REG87_S6 ( .D(n1155), .CK(i_clk), .RN(n1076), .Q(n1356), .QN(
        n892) );
  DFFRX1 i_clk_r_REG309_S12 ( .D(sobel_answers_r[54]), .CK(i_clk), .RN(n1077), 
        .Q(n1437) );
  DFFRX1 i_clk_r_REG308_S11 ( .D(sobel_answers_r[40]), .CK(i_clk), .RN(n1078), 
        .Q(n1423), .QN(n945) );
  DFFRX1 i_clk_r_REG35_S6 ( .D(n1105), .CK(i_clk), .RN(n1072), .Q(n1306) );
  DFFRX1 i_clk_r_REG52_S6 ( .D(n1122), .CK(i_clk), .RN(n1073), .Q(n1323) );
  DFFRX1 i_clk_r_REG69_S6 ( .D(n1139), .CK(i_clk), .RN(n1075), .Q(n1340), .QN(
        n890) );
  DFFRX1 i_clk_r_REG302_S10 ( .D(sobel_answers_r[25]), .CK(i_clk), .RN(n1079), 
        .Q(n1410) );
  DFFRX1 i_clk_r_REG304_S12 ( .D(sobel_answers_r[53]), .CK(i_clk), .RN(n1064), 
        .Q(n1438) );
  DFFRX1 i_clk_r_REG86_S6 ( .D(n1156), .CK(i_clk), .RN(n1076), .Q(n1357), .QN(
        n917) );
  DFFRX1 i_clk_r_REG621_S3 ( .D(NMS_output_count_r[2]), .CK(i_clk), .RN(n1071), 
        .Q(n1289), .QN(n8720) );
  DFFRX1 i_clk_r_REG68_S6 ( .D(n1140), .CK(i_clk), .RN(n1075), .Q(n1341), .QN(
        n9150) );
  DFFRX1 i_clk_r_REG34_S6 ( .D(n1106), .CK(i_clk), .RN(n1072), .Q(n1307) );
  DFFRX1 i_clk_r_REG51_S6 ( .D(n1123), .CK(i_clk), .RN(n1073), .Q(n1324) );
  DFFRX1 i_clk_r_REG85_S6 ( .D(n1157), .CK(i_clk), .RN(n1076), .Q(n1358), .QN(
        n888) );
  DFFRX1 i_clk_r_REG296_S9 ( .D(sobel_answers_r[10]), .CK(i_clk), .RN(n1080), 
        .Q(n1397) );
  DFFRX1 i_clk_r_REG297_S10 ( .D(sobel_answers_r[24]), .CK(i_clk), .RN(n1079), 
        .Q(n1411) );
  DFFRX1 i_clk_r_REG299_S12 ( .D(sobel_answers_r[52]), .CK(i_clk), .RN(n1058), 
        .Q(n1439) );
  DFFRX1 i_clk_r_REG298_S11 ( .D(sobel_answers_r[38]), .CK(i_clk), .RN(n1078), 
        .Q(n1425), .QN(n950) );
  DFFRX1 i_clk_r_REG291_S9 ( .D(sobel_answers_r[9]), .CK(i_clk), .RN(n1081), 
        .Q(n1385) );
  DFFRX1 i_clk_r_REG33_S6 ( .D(n1107), .CK(i_clk), .RN(n1072), .Q(n1308) );
  DFFRX1 i_clk_r_REG84_S6 ( .D(n1158), .CK(i_clk), .RN(n1076), .Q(n1359), .QN(
        n884) );
  DFFRX1 i_clk_r_REG292_S10 ( .D(sobel_answers_r[23]), .CK(i_clk), .RN(n1080), 
        .Q(n1399) );
  DFFRX1 i_clk_r_REG293_S11 ( .D(sobel_answers_r[37]), .CK(i_clk), .RN(n1079), 
        .Q(n1413), .QN(n948) );
  DFFRX1 i_clk_r_REG294_S12 ( .D(sobel_answers_r[51]), .CK(i_clk), .RN(n1078), 
        .Q(n1427) );
  DFFRX2 i_clk_r_REG613_S2 ( .D(n1195), .CK(i_clk), .RN(n1061), .Q(n1481), 
        .QN(n919) );
  DFFRX1 i_clk_r_REG282_S10 ( .D(sobel_answers_r[21]), .CK(i_clk), .RN(n1080), 
        .Q(n1401) );
  DFFRX1 i_clk_r_REG283_S11 ( .D(sobel_answers_r[35]), .CK(i_clk), .RN(n1079), 
        .Q(n1415) );
  DFFRX1 i_clk_r_REG284_S12 ( .D(sobel_answers_r[49]), .CK(i_clk), .RN(n1078), 
        .Q(n1429) );
  DFFRX1 i_clk_r_REG281_S9 ( .D(sobel_answers_r[7]), .CK(i_clk), .RN(n1081), 
        .Q(n1387) );
  DFFRX1 i_clk_r_REG271_S9 ( .D(sobel_answers_r[5]), .CK(i_clk), .RN(n1081), 
        .Q(n1389) );
  DFFRX1 i_clk_r_REG288_S11 ( .D(sobel_answers_r[36]), .CK(i_clk), .RN(n1079), 
        .Q(n1414), .QN(n951) );
  DFFRX2 i_clk_r_REG614_S2 ( .D(n1196), .CK(i_clk), .RN(n1061), .Q(n1482), 
        .QN(n920) );
  DFFRX1 i_clk_r_REG80_S6 ( .D(n1162), .CK(i_clk), .RN(n1077), .Q(n1363) );
  DFFRX1 i_clk_r_REG16_S6 ( .D(n1111), .CK(i_clk), .RN(n1072), .Q(n1312) );
  DFFRX1 i_clk_r_REG63_S6 ( .D(n1145), .CK(i_clk), .RN(n1075), .Q(n1346) );
  DFFRX1 i_clk_r_REG46_S6 ( .D(n1128), .CK(i_clk), .RN(n1074), .Q(n1329) );
  DFFRX1 i_clk_r_REG272_S10 ( .D(sobel_answers_r[19]), .CK(i_clk), .RN(n1080), 
        .Q(n1403) );
  DFFRX1 i_clk_r_REG274_S12 ( .D(sobel_answers_r[47]), .CK(i_clk), .RN(n1078), 
        .Q(n1431) );
  DFFRX1 i_clk_r_REG273_S11 ( .D(sobel_answers_r[33]), .CK(i_clk), .RN(n1079), 
        .Q(n1417) );
  DFFRX2 i_clk_r_REG604_S3 ( .D(n1188), .CK(i_clk), .RN(n1061), .Q(n1474) );
  DFFRX1 i_clk_r_REG277_S10 ( .D(sobel_answers_r[20]), .CK(i_clk), .RN(n1080), 
        .Q(n1402) );
  DFFRX1 i_clk_r_REG276_S9 ( .D(sobel_answers_r[6]), .CK(i_clk), .RN(n1081), 
        .Q(n1388) );
  DFFRX1 i_clk_r_REG279_S12 ( .D(sobel_answers_r[48]), .CK(i_clk), .RN(n1078), 
        .Q(n1430) );
  DFFRX1 i_clk_r_REG278_S11 ( .D(sobel_answers_r[34]), .CK(i_clk), .RN(n1079), 
        .Q(n1416) );
  DFFRX1 i_clk_r_REG266_S9 ( .D(sobel_answers_r[4]), .CK(i_clk), .RN(n1081), 
        .Q(n1390) );
  DFFRX1 i_clk_r_REG267_S10 ( .D(sobel_answers_r[18]), .CK(i_clk), .RN(n1080), 
        .Q(n1404) );
  DFFRX1 i_clk_r_REG262_S10 ( .D(sobel_answers_r[17]), .CK(i_clk), .RN(n1080), 
        .Q(n1405) );
  DFFRX1 i_clk_r_REG269_S12 ( .D(sobel_answers_r[46]), .CK(i_clk), .RN(n1077), 
        .Q(n1432) );
  DFFRX1 i_clk_r_REG268_S11 ( .D(sobel_answers_r[32]), .CK(i_clk), .RN(n1079), 
        .Q(n1418) );
  DFFRX1 i_clk_r_REG264_S12 ( .D(sobel_answers_r[45]), .CK(i_clk), .RN(n1077), 
        .Q(n1433) );
  DFFRX2 i_clk_r_REG618_S2 ( .D(n1200), .CK(i_clk), .RN(n1062), .Q(n1486), 
        .QN(n911) );
  DFFRX2 i_clk_r_REG611_S3 ( .D(n1193), .CK(i_clk), .RN(n1061), .Q(n1479), 
        .QN(n8810) );
  DFFRX2 i_clk_r_REG617_S2 ( .D(n1199), .CK(i_clk), .RN(n1061), .Q(n1485), 
        .QN(n8980) );
  DFFRX1 i_clk_r_REG263_S11 ( .D(sobel_answers_r[31]), .CK(i_clk), .RN(n1079), 
        .Q(n1419) );
  DFFRX2 i_clk_r_REG608_S3 ( .D(n1192), .CK(i_clk), .RN(n1061), .Q(n1478), 
        .QN(n909) );
  DFFRX1 i_clk_r_REG245_S11 ( .D(sobel_answers_r[29]), .CK(i_clk), .RN(n1078), 
        .Q(n1421) );
  DFFRX1 i_clk_r_REG243_S9 ( .D(sobel_answers_r[1]), .CK(i_clk), .RN(n1081), 
        .Q(n1393) );
  DFFRX1 i_clk_r_REG259_S12 ( .D(sobel_answers_r[44]), .CK(i_clk), .RN(n1077), 
        .Q(n1434) );
  ADDHXL add_1046_U1_1_4 ( .A(n1467), .B(add_1046_carry[4]), .CO(
        add_1046_carry[5]), .S(N882) );
  ADDHXL add_1046_U1_1_2 ( .A(n1469), .B(add_1046_carry[2]), .CO(
        add_1046_carry[3]), .S(N880) );
  ADDHXL add_1046_U1_1_3 ( .A(n1468), .B(add_1046_carry[3]), .CO(
        add_1046_carry[4]), .S(N881) );
  ADDHXL add_1046_U1_1_1 ( .A(n1470), .B(n1471), .CO(add_1046_carry[2]), .S(
        N879) );
  DFFRX1 i_clk_r_REG314_S12 ( .D(sobel_answers_r[55]), .CK(i_clk), .RN(n1077), 
        .Q(n1436) );
  DFFRX1 i_clk_r_REG11_S4 ( .D(n2284), .CK(i_clk), .RN(n1058), .Q(
        o_out_data[0]) );
  DFFRX1 i_clk_r_REG18_S7 ( .D(n2283), .CK(i_clk), .RN(n1058), .Q(
        o_out_data[1]) );
  DFFRX1 i_clk_r_REG19_S7 ( .D(n2282), .CK(i_clk), .RN(n1058), .Q(
        o_out_data[2]) );
  DFFRX1 i_clk_r_REG20_S7 ( .D(n2281), .CK(i_clk), .RN(n1058), .Q(
        o_out_data[3]) );
  DFFRX1 i_clk_r_REG21_S7 ( .D(n2280), .CK(i_clk), .RN(n1058), .Q(
        o_out_data[4]) );
  DFFRX1 i_clk_r_REG22_S7 ( .D(n2279), .CK(i_clk), .RN(n1058), .Q(
        o_out_data[5]) );
  DFFRX1 i_clk_r_REG23_S7 ( .D(n2278), .CK(i_clk), .RN(n1058), .Q(
        o_out_data[6]) );
  DFFRX1 i_clk_r_REG24_S7 ( .D(n2277), .CK(i_clk), .RN(n1058), .Q(
        o_out_data[7]) );
  DFFRX1 i_clk_r_REG27_S7 ( .D(n2274), .CK(i_clk), .RN(n1072), .Q(
        o_out_data[10]) );
  DFFRX1 i_clk_r_REG28_S7 ( .D(n2273), .CK(i_clk), .RN(n1072), .Q(
        o_out_data[11]) );
  DFFRX1 i_clk_r_REG29_S7 ( .D(n2272), .CK(i_clk), .RN(n1071), .Q(
        o_out_data[12]) );
  ADDHX1 r688_U1_1_2 ( .A(n1651), .B(r688_carry[2]), .CO(r688_carry[3]), .S(
        N223) );
  ADDHX1 r688_U1_1_1 ( .A(n1652), .B(n1653), .CO(r688_carry[2]), .S(N222) );
  DFFRX1 i_clk_r_REG616_S2 ( .D(n1198), .CK(i_clk), .RN(n1061), .Q(n1484), 
        .QN(n876) );
  DFFRX1 i_clk_r_REG615_S2 ( .D(n1197), .CK(i_clk), .RN(n1061), .Q(n1483), 
        .QN(n887) );
  ADDHXL r688_U1_1_4 ( .A(n1656), .B(r688_carry[4]), .CO(r688_carry[5]), .S(
        N225) );
  ADDHX1 r688_U1_1_3 ( .A(n1650), .B(r688_carry[3]), .CO(r688_carry[4]), .S(
        N224) );
  DFFRX1 i_clk_r_REG607_S3 ( .D(n1191), .CK(i_clk), .RN(n1061), .Q(n1477), 
        .QN(n913) );
  DFFRX1 i_clk_r_REG605_S3 ( .D(n1189), .CK(i_clk), .RN(n1061), .Q(n1475) );
  DFFRX1 i_clk_r_REG606_S3 ( .D(n1190), .CK(i_clk), .RN(n1061), .Q(n1476), 
        .QN(n8850) );
  DFFRX1 i_clk_r_REG609_S4 ( .D(zero_padding_buffer_r), .CK(i_clk), .RN(n1071), 
        .Q(n1286) );
  DFFRX1 i_clk_r_REG1_S1 ( .D(n2270), .CK(i_clk), .RN(n1071), .Q(o_out_valid)
         );
  DFFRX1 i_clk_r_REG3_S1 ( .D(n2269), .CK(i_clk), .RN(n1071), .Q(o_in_ready)
         );
  DFFRX1 i_clk_r_REG102_S5 ( .D(conv_calc[7]), .CK(i_clk), .RN(n1070), .Q(
        n15900) );
  DFFRX1 i_clk_r_REG100_S5 ( .D(conv_calc[6]), .CK(i_clk), .RN(n1070), .Q(
        n15890), .QN(n8700) );
  DFFRX1 i_clk_r_REG98_S5 ( .D(conv_calc[4]), .CK(i_clk), .RN(n1070), .Q(
        n15870) );
  DFFRX1 i_clk_r_REG97_S5 ( .D(conv_calc[3]), .CK(i_clk), .RN(n1070), .Q(
        n15860) );
  DFFSXL i_clk_r_REG576_S3 ( .D(SRAM_load_data_r[7]), .CK(i_clk), .SN(n1083), 
        .Q(n1489) );
  DFFSXL i_clk_r_REG641_S2 ( .D(n963), .CK(i_clk), .SN(n1083), .Q(n1379) );
  DFFSXL i_clk_r_REG583_S3 ( .D(SRAM_load_data_r[10]), .CK(i_clk), .SN(n1083), 
        .Q(n1496) );
  DFFSXL i_clk_r_REG580_S3 ( .D(SRAM_load_data_r[9]), .CK(i_clk), .SN(n1083), 
        .Q(n1487) );
  DFFRX2 i_clk_r_REG361_S8 ( .D(n1268), .CK(i_clk), .RN(n1068), .Q(n15660) );
  DFFSX1 i_clk_r_REG574_S3 ( .D(SRAM_load_data_r[6]), .CK(i_clk), .SN(n1083), 
        .Q(n1490) );
  DFFRX1 i_clk_r_REG67_S6 ( .D(n1141), .CK(i_clk), .RN(n1075), .Q(n1342), .QN(
        n914) );
  DFFRX1 i_clk_r_REG50_S6 ( .D(n1124), .CK(i_clk), .RN(n1073), .Q(n1325) );
  DFFRX1 i_clk_r_REG624_S3 ( .D(NMS_output_count_r[1]), .CK(i_clk), .RN(n1059), 
        .Q(n1456), .QN(n982) );
  DFFRX1 i_clk_r_REG32_S6 ( .D(n1108), .CK(i_clk), .RN(n1072), .Q(n1309) );
  DFFRXL i_clk_r_REG581_S3 ( .D(SRAM_load_data_r[9]), .CK(i_clk), .RN(n1062), 
        .QN(n891) );
  DFFRX1 i_clk_r_REG591_S3 ( .D(n1180), .CK(i_clk), .RN(n1060), .Q(n1466), 
        .QN(n927) );
  DFFRX1 i_clk_r_REG645_S3 ( .D(n1183), .CK(i_clk), .RN(n1060), .Q(n1469) );
  DFFRX1 i_clk_r_REG644_S3 ( .D(n1182), .CK(i_clk), .RN(n1060), .Q(n1468) );
  DFFRX1 i_clk_r_REG643_S3 ( .D(n1181), .CK(i_clk), .RN(n1060), .Q(n1467) );
  DFFRX1 i_clk_r_REG632_S2 ( .D(n1176), .CK(i_clk), .RN(n1059), .Q(n1451) );
  DFFRX1 i_clk_r_REG83_S6 ( .D(n1159), .CK(i_clk), .RN(n1076), .Q(n1360), .QN(
        n878) );
  DFFRX1 i_clk_r_REG66_S6 ( .D(n1142), .CK(i_clk), .RN(n1075), .Q(n1343), .QN(
        n9060) );
  DFFRX1 i_clk_r_REG49_S6 ( .D(n1125), .CK(i_clk), .RN(n1073), .Q(n1326) );
  DFFRX1 i_clk_r_REG654_S2 ( .D(n1173), .CK(i_clk), .RN(n1082), .Q(n1381), 
        .QN(n9050) );
  DFFRX1 i_clk_r_REG82_S6 ( .D(n1160), .CK(i_clk), .RN(n1076), .Q(n1361), .QN(
        n8790) );
  DFFRX1 i_clk_r_REG646_S3 ( .D(n1184), .CK(i_clk), .RN(n1060), .Q(n1470), 
        .QN(n8990) );
  DFFRX1 i_clk_r_REG647_S3 ( .D(n1185), .CK(i_clk), .RN(n1060), .Q(n1471), 
        .QN(n8680) );
  DFFRX1 i_clk_r_REG65_S6 ( .D(n1143), .CK(i_clk), .RN(n1075), .Q(n1344), .QN(
        n9080) );
  DFFRX1 i_clk_r_REG48_S6 ( .D(n1126), .CK(i_clk), .RN(n1074), .Q(n1327) );
  DFFRX1 i_clk_r_REG31_S6 ( .D(n1109), .CK(i_clk), .RN(n1072), .Q(n1310) );
  DFFRX1 i_clk_r_REG81_S6 ( .D(n1161), .CK(i_clk), .RN(n1076), .Q(n1362), .QN(
        n8800) );
  DFFRX1 i_clk_r_REG64_S6 ( .D(n1144), .CK(i_clk), .RN(n1075), .Q(n1345), .QN(
        n910) );
  DFFRX1 i_clk_r_REG47_S6 ( .D(n1127), .CK(i_clk), .RN(n1074), .Q(n1328) );
  DFFRX1 i_clk_r_REG17_S6 ( .D(n1110), .CK(i_clk), .RN(n1072), .Q(n1311) );
  DFFSX2 i_clk_r_REG603_S4 ( .D(n2046), .CK(i_clk), .SN(n1084), .Q(n1594), 
        .QN(n946) );
  DFFSX2 i_clk_r_REG597_S2 ( .D(n2047), .CK(i_clk), .SN(n1084), .Q(n1595), 
        .QN(n947) );
  DFFSX2 i_clk_r_REG651_S2 ( .D(n1276), .CK(i_clk), .SN(n1084), .Q(n1596), 
        .QN(n929) );
  DFFRX4 i_clk_r_REG13_S5 ( .D(conv_calc[0]), .CK(i_clk), .RN(n1069), .Q(
        n15830) );
  DFFRX2 i_clk_r_REG78_S6 ( .D(n1171), .CK(i_clk), .RN(n1082), .Q(n1372), .QN(
        n1053) );
  DFFRX2 i_clk_r_REG61_S6 ( .D(n1154), .CK(i_clk), .RN(n1076), .Q(n1355), .QN(
        n1051) );
  DFFRX4 i_clk_r_REG339_S11 ( .D(sobel_answers_r[28]), .CK(i_clk), .RN(n1078), 
        .Q(n1426) );
  DFFRX2 i_clk_r_REG59_S6 ( .D(n1131), .CK(i_clk), .RN(n1074), .Q(n1332) );
  DFFRX2 i_clk_r_REG44_S6 ( .D(n1137), .CK(i_clk), .RN(n1074), .Q(n1338), .QN(
        n1049) );
  DFFRX4 i_clk_r_REG257_S10 ( .D(sobel_answers_r[16]), .CK(i_clk), .RN(n1080), 
        .Q(n1406) );
  DFFRX2 i_clk_r_REG7_S2 ( .D(n1859), .CK(i_clk), .RN(n1070), .Q(n1593) );
  DFFSX2 i_clk_r_REG655_S1 ( .D(n1278), .CK(i_clk), .SN(n1084), .Q(n1598) );
  DFFRX2 i_clk_r_REG599_S3 ( .D(n1187), .CK(i_clk), .RN(n1060), .Q(n1473) );
  DFFRX4 i_clk_r_REG256_S9 ( .D(sobel_answers_r[2]), .CK(i_clk), .RN(n1081), 
        .Q(n1392) );
  DFFRX2 i_clk_r_REG258_S11 ( .D(sobel_answers_r[30]), .CK(i_clk), .RN(n1078), 
        .Q(n1420) );
  DFFRX2 i_clk_r_REG79_S6 ( .D(n1163), .CK(i_clk), .RN(n1077), .Q(n1364) );
  DFFRX4 i_clk_r_REG337_S9 ( .D(sobel_answers_r[0]), .CK(i_clk), .RN(n1080), 
        .Q(n1398) );
  DFFRX2 i_clk_r_REG261_S9 ( .D(sobel_answers_r[3]), .CK(i_clk), .RN(n1081), 
        .Q(n1391) );
  DFFRX4 i_clk_r_REG340_S12 ( .D(sobel_answers_r[42]), .CK(i_clk), .RN(n1058), 
        .Q(n1440) );
  DFFRX2 i_clk_r_REG99_S5 ( .D(conv_calc[5]), .CK(i_clk), .RN(n1070), .Q(
        n15880) );
  DFFRX2 i_clk_r_REG30_S7 ( .D(n2271), .CK(i_clk), .RN(n1071), .Q(
        o_out_data[13]) );
  DFFRX2 i_clk_r_REG25_S7 ( .D(n2276), .CK(i_clk), .RN(n1071), .Q(
        o_out_data[8]) );
  DFFRX2 i_clk_r_REG26_S7 ( .D(n2275), .CK(i_clk), .RN(n1071), .Q(
        o_out_data[9]) );
  DFFRX1 i_clk_r_REG573_S3 ( .D(SRAM_load_data_r[5]), .CK(i_clk), .RN(n1062), 
        .QN(n935) );
  DFFRX1 i_clk_r_REG575_S3 ( .D(SRAM_load_data_r[6]), .CK(i_clk), .RN(n1062), 
        .QN(n934) );
  DFFRX1 i_clk_r_REG577_S3 ( .D(SRAM_load_data_r[7]), .CK(i_clk), .RN(n1062), 
        .QN(n933) );
  DFFRX1 i_clk_r_REG579_S3 ( .D(SRAM_load_data_r[8]), .CK(i_clk), .RN(n1062), 
        .QN(n932) );
  DFFRX2 i_clk_r_REG625_S3 ( .D(NMS_output_count_r[0]), .CK(i_clk), .RN(n1080), 
        .Q(n1612), .QN(n930) );
  DFFRX2 i_clk_r_REG628_S3 ( .D(SRAM_load_count_r[1]), .CK(i_clk), .RN(n1059), 
        .Q(n1454), .QN(n925) );
  DFFRX2 i_clk_r_REG633_S2 ( .D(n1280), .CK(i_clk), .RN(n1070), .Q(n1601), 
        .QN(n889) );
  DFFRX2 i_clk_r_REG629_S3 ( .D(SRAM_load_count_r[0]), .CK(i_clk), .RN(n1058), 
        .Q(n1603), .QN(n8820) );
  DFFRX2 i_clk_r_REG626_S3 ( .D(SRAM_load_count_r[2]), .CK(i_clk), .RN(n1059), 
        .Q(n1453) );
  DFFRX1 i_clk_r_REG620_S3 ( .D(sobel_count_r[0]), .CK(i_clk), .RN(n1082), .Q(
        n1384), .QN(n916) );
  DFFRX1 i_clk_r_REG619_S3 ( .D(sobel_count_r[1]), .CK(i_clk), .RN(n1082), .Q(
        n1383) );
  DFFRX2 i_clk_r_REG14_S6 ( .D(n1120), .CK(i_clk), .RN(n1073), .Q(n1321), .QN(
        n1055) );
  DFFRX2 i_clk_r_REG640_S2 ( .D(n1281), .CK(i_clk), .RN(n1070), .Q(n1602), 
        .QN(n978) );
  DFFRX2 i_clk_r_REG244_S10 ( .D(sobel_answers_r[15]), .CK(i_clk), .RN(n1080), 
        .Q(n1407) );
  DFFRX2 i_clk_r_REG15_S6 ( .D(n1112), .CK(i_clk), .RN(n1072), .Q(n1313) );
  DFFRX2 i_clk_r_REG338_S10 ( .D(sobel_answers_r[14]), .CK(i_clk), .RN(n1079), 
        .Q(n1412) );
  DFFSX2 i_clk_r_REG652_S1 ( .D(n1279), .CK(i_clk), .SN(n1084), .Q(n1600), 
        .QN(n936) );
  DFFRX2 i_clk_r_REG246_S12 ( .D(sobel_answers_r[43]), .CK(i_clk), .RN(n1077), 
        .Q(n1435) );
  DFFRX1 i_clk_r_REG627_S4 ( .D(SRAM_load_count_r[3]), .CK(i_clk), .RN(n1082), 
        .Q(n1374), .QN(n1029) );
  DFFRX4 i_clk_r_REG95_S5 ( .D(conv_calc[1]), .CK(i_clk), .RN(n1069), .Q(
        n15840) );
  DFFRX2 i_clk_r_REG45_S6 ( .D(n1129), .CK(i_clk), .RN(n1074), .Q(n1330) );
  DFFRX2 i_clk_r_REG96_S5 ( .D(conv_calc[2]), .CK(i_clk), .RN(n1069), .Q(
        n15850) );
  DFFRX2 i_clk_r_REG62_S6 ( .D(n1146), .CK(i_clk), .RN(n1075), .Q(n1347) );
  DFFRX4 i_clk_r_REG638_S2 ( .D(n1172), .CK(i_clk), .RN(n1082), .Q(n1373), 
        .QN(n9040) );
  DFFRX4 i_clk_r_REG639_S2 ( .D(n1177), .CK(i_clk), .RN(n1059), .Q(n1452), 
        .QN(n1039) );
  DFFRX2 i_clk_r_REG635_S3 ( .D(o_sobel_finish), .CK(i_clk), .RN(n1069), .Q(
        n15810) );
  DFFRX2 i_clk_r_REG287_S10 ( .D(sobel_answers_r[22]), .CK(i_clk), .RN(n1080), 
        .Q(n1400) );
  DFFRX2 i_clk_r_REG286_S9 ( .D(sobel_answers_r[8]), .CK(i_clk), .RN(n1081), 
        .Q(n1386) );
  DFFRX2 i_clk_r_REG289_S12 ( .D(sobel_answers_r[50]), .CK(i_clk), .RN(n1078), 
        .Q(n1428) );
  DFFRX2 i_clk_r_REG584_S3 ( .D(SRAM_load_data_r[10]), .CK(i_clk), .RN(n1062), 
        .Q(n1497) );
  DFFRX2 i_clk_r_REG2_S1 ( .D(n2268), .CK(i_clk), .RN(n1071), .Q(o_op_ready)
         );
  NOR2X4 U1150 ( .A(n1627), .B(n2005), .Y(n856) );
  NAND3X1 U1151 ( .A(n1946), .B(n1947), .C(n1948), .Y(n2278) );
  MX2X1 U1152 ( .A(n1475), .B(conv_channels_32_r[4]), .S0(N858), .Y(n1189) );
  AOI32XL U1153 ( .A0(read_access_32[6]), .A1(n1862), .A2(read_access_32[5]), 
        .B0(n1869), .B1(n2072), .Y(n2071) );
  OAI32XL U1154 ( .A0(n2069), .A1(read_access_32[6]), .A2(n1976), .B0(n1893), 
        .B1(n2082), .Y(n2080) );
  CLKINVX8 U1155 ( .A(n1723), .Y(n855) );
  INVX3 U1156 ( .A(state_r[1]), .Y(n1843) );
  OAI221X1 U1157 ( .A0(n910), .A1(n8690), .B0(n8800), .B1(n1619), .C0(n2018), 
        .Y(conv_temp[3]) );
  INVX8 U1158 ( .A(scale_r[0]), .Y(n1696) );
  AND2X4 U1159 ( .A(n15550), .B(n1644), .Y(a3[1]) );
  CLKINVX1 U1160 ( .A(n2003), .Y(n1630) );
  BUFX4 U1161 ( .A(n2004), .Y(n1618) );
  NAND3BX4 U1162 ( .AN(n1791), .B(n1790), .C(n1789), .Y(n1792) );
  NAND2X4 U1163 ( .A(n9010), .B(scale_r[1]), .Y(n1789) );
  AND4X4 U1164 ( .A(n1976), .B(n17940), .C(n1793), .D(n1818), .Y(n1813) );
  NAND3BX1 U1165 ( .AN(n1823), .B(n1822), .C(n1821), .Y(n1825) );
  OAI222XL U1166 ( .A0(n2036), .A1(n931), .B0(n1780), .B1(n1821), .C0(
        i_op_valid), .C1(n2259), .Y(n1781) );
  AOI32XL U1167 ( .A0(n1821), .A1(n1787), .A2(n1788), .B0(n2259), .B1(n1795), 
        .Y(n1784) );
  NAND2X4 U1168 ( .A(n1737), .B(i_op_mode[3]), .Y(n1821) );
  AOI222X2 U1169 ( .A0(n2165), .A1(N282), .B0(n2189), .B1(n1652), .C0(n2164), 
        .C1(N222), .Y(n2199) );
  NAND2X4 U1170 ( .A(n2151), .B(n2150), .Y(n2189) );
  OAI222X1 U1171 ( .A0(n2226), .A1(n1893), .B0(n2227), .B1(n1896), .C0(n2228), 
        .C1(n1615), .Y(n2246) );
  NAND2X4 U1172 ( .A(n969), .B(n962), .Y(n1893) );
  CLKAND2X8 U1173 ( .A(N908), .B(n1593), .Y(SRAM_load_data_r[10]) );
  NAND2X1 U1174 ( .A(n1617), .B(n1428), .Y(n857) );
  NAND2X1 U1175 ( .A(n1937), .B(n1386), .Y(n8580) );
  NAND2X1 U1176 ( .A(n1938), .B(n1400), .Y(n8590) );
  AND3X2 U1177 ( .A(n857), .B(n8580), .C(n8590), .Y(n1940) );
  BUFX8 U1178 ( .A(n1936), .Y(n1617) );
  INVX6 U1179 ( .A(n999), .Y(n1937) );
  AND4X6 U1180 ( .A(n1981), .B(n1456), .C(n1982), .D(n930), .Y(n1938) );
  OAI211XL U1181 ( .A0(n951), .A1(n1933), .B0(n1939), .C0(n1940), .Y(n2276) );
  OR2X1 U1182 ( .A(n2027), .B(n1724), .Y(n8600) );
  OR2XL U1183 ( .A(n15810), .B(n1723), .Y(n8610) );
  NAND3X1 U1184 ( .A(n8600), .B(n8610), .C(n1722), .Y(n1725) );
  NAND2X8 U1185 ( .A(n995), .B(n1870), .Y(n1723) );
  NAND2X1 U1186 ( .A(N617), .B(n2134), .Y(n8620) );
  NAND2X1 U1187 ( .A(n1651), .B(n2133), .Y(n8630) );
  NAND2X1 U1188 ( .A(N408), .B(n2131), .Y(n8640) );
  AND3X2 U1189 ( .A(n8620), .B(n8630), .C(n8640), .Y(n2186) );
  NOR2X2 U1190 ( .A(n2209), .B(n2210), .Y(n2134) );
  AND2X2 U1191 ( .A(n2214), .B(n2215), .Y(n2131) );
  AOI22X2 U1192 ( .A0(SRAM_READ_DATA_4[4]), .A1(n2050), .B0(
        SRAM_READ_DATA_3[4]), .B1(n2051), .Y(n2059) );
  AOI222X1 U1193 ( .A0(N411), .A1(n2131), .B0(N370), .B1(n2132), .C0(N355), 
        .C1(n2133), .Y(n2130) );
  NOR2X4 U1194 ( .A(n988), .B(n1922), .Y(n2132) );
  OAI211X2 U1195 ( .A0(n952), .A1(n1933), .B0(n1964), .C0(n1965), .Y(n2271) );
  AOI222X4 U1196 ( .A0(n1617), .A1(n1436), .B0(n1937), .B1(n1394), .C0(n1938), 
        .C1(n1408), .Y(n1965) );
  MX2X8 U1197 ( .A(n1407), .B(n1421), .S0(n1635), .Y(sobel_answers_r[29]) );
  AND2X6 U1198 ( .A(n15350), .B(n1643), .Y(a1[3]) );
  BUFX12 U1199 ( .A(n1649), .Y(n1643) );
  MX2X6 U1200 ( .A(n1420), .B(n1434), .S0(n1634), .Y(sobel_answers_r[44]) );
  NOR3X8 U1201 ( .A(n978), .B(n1373), .C(n1039), .Y(n8750) );
  NOR3X8 U1202 ( .A(n1602), .B(n1373), .C(n1039), .Y(n9030) );
  NAND3X4 U1203 ( .A(n1039), .B(n9040), .C(n978), .Y(n2011) );
  OAI221X1 U1204 ( .A0(n9080), .A1(n8690), .B0(n8790), .B1(n1619), .C0(n2017), 
        .Y(conv_temp[4]) );
  BUFX6 U1205 ( .A(a9[2]), .Y(n8650) );
  AND2XL U1206 ( .A(n15520), .B(n1647), .Y(a9[2]) );
  CLKMX2X6 U1207 ( .A(n1421), .B(n1435), .S0(n1634), .Y(sobel_answers_r[43])
         );
  INVX16 U1208 ( .A(n1640), .Y(n1634) );
  CLKMX2X8 U1209 ( .A(n1426), .B(n1440), .S0(n1634), .Y(sobel_answers_r[42])
         );
  MX2X6 U1210 ( .A(n1398), .B(n1412), .S0(n1636), .Y(sobel_answers_r[14]) );
  AOI22XL U1211 ( .A0(n1314), .A1(n8750), .B0(n1331), .B1(n9030), .Y(n2019) );
  AOI22XL U1212 ( .A0(n1316), .A1(n8750), .B0(n1333), .B1(n9030), .Y(n2021) );
  AOI22XL U1213 ( .A0(n1317), .A1(n8750), .B0(n1334), .B1(n9030), .Y(n2022) );
  AOI22XL U1214 ( .A0(n1318), .A1(n8750), .B0(n1335), .B1(n9030), .Y(n2023) );
  AOI22XL U1215 ( .A0(n1319), .A1(n8750), .B0(n1336), .B1(n9030), .Y(n2024) );
  AOI22XL U1216 ( .A0(n1320), .A1(n8750), .B0(n1337), .B1(n9030), .Y(n2025) );
  AOI22XL U1217 ( .A0(n1305), .A1(n8750), .B0(n1322), .B1(n9030), .Y(n2012) );
  AOI22XL U1218 ( .A0(n1306), .A1(n8750), .B0(n1323), .B1(n9030), .Y(n2013) );
  AOI22XL U1219 ( .A0(n1307), .A1(n8750), .B0(n1324), .B1(n9030), .Y(n2014) );
  AOI22XL U1220 ( .A0(n1308), .A1(n8750), .B0(n1325), .B1(n9030), .Y(n2015) );
  AOI22XL U1221 ( .A0(n1309), .A1(n8750), .B0(n1326), .B1(n9030), .Y(n2016) );
  AOI22X2 U1222 ( .A0(n1311), .A1(n8750), .B0(n1328), .B1(n9030), .Y(n2018) );
  OAI32X2 U1223 ( .A0(n1802), .A1(n1801), .A2(n1800), .B0(n2257), .B1(n1799), 
        .Y(n1803) );
  NAND2X6 U1224 ( .A(n2095), .B(n1859), .Y(n1801) );
  BUFX6 U1225 ( .A(a6[2]), .Y(n8660) );
  BUFX12 U1226 ( .A(a4[1]), .Y(n867) );
  NAND4X2 U1227 ( .A(n1852), .B(n1818), .C(n2036), .D(n1897), .Y(n1820) );
  NAND2X4 U1228 ( .A(n995), .B(n9020), .Y(n2036) );
  MXI2X4 U1229 ( .A(n1023), .B(n1024), .S0(N1885), .Y(n1149) );
  AOI22X2 U1230 ( .A0(N1553), .A1(n1633), .B0(n1350), .B1(n2009), .Y(n1024) );
  AOI22X2 U1231 ( .A0(N1590), .A1(n1631), .B0(n1315), .B1(n1618), .Y(n1014) );
  MXI2X4 U1232 ( .A(n1007), .B(n1008), .S0(N1890), .Y(n1113) );
  AOI22X4 U1233 ( .A0(N1591), .A1(n1631), .B0(n1314), .B1(n1618), .Y(n1008) );
  NAND4X4 U1234 ( .A(n2034), .B(n2035), .C(n2036), .D(n2037), .Y(n2033) );
  OR2X2 U1235 ( .A(n17070), .B(n1708), .Y(n2034) );
  CLKAND2X2 U1236 ( .A(n15470), .B(n1645), .Y(a4[2]) );
  BUFX20 U1237 ( .A(n1646), .Y(n1645) );
  CLKAND2X2 U1238 ( .A(n15580), .B(n1644), .Y(a6[1]) );
  BUFX20 U1239 ( .A(n1649), .Y(n1644) );
  CLKAND2X2 U1240 ( .A(n1556), .B(n1645), .Y(a4[1]) );
  NOR2X2 U1241 ( .A(n2071), .B(n1285), .Y(n2050) );
  AOI2BB1X2 U1242 ( .A0N(n2080), .A1N(n2081), .B0(n1285), .Y(n2052) );
  INVX3 U1243 ( .A(n1921), .Y(n2213) );
  OR2X1 U1244 ( .A(n1650), .B(sub_410_aco_carry[3]), .Y(sub_410_aco_carry[4])
         );
  NOR2X4 U1245 ( .A(n1629), .B(n2005), .Y(n2007) );
  NOR3X4 U1246 ( .A(n1627), .B(n1631), .C(n1633), .Y(N1888) );
  INVX12 U1247 ( .A(n1630), .Y(n1631) );
  CLKINVX1 U1248 ( .A(n1692), .Y(n1714) );
  AND2X2 U1249 ( .A(n15610), .B(n1647), .Y(a9[1]) );
  NAND4X1 U1250 ( .A(n1454), .B(n1374), .C(n1603), .D(n1871), .Y(n1776) );
  CLKINVX1 U1251 ( .A(n2238), .Y(n1857) );
  INVX6 U1252 ( .A(n1976), .Y(n1862) );
  INVX4 U1253 ( .A(n1729), .Y(n17430) );
  INVX1 U1254 ( .A(n2178), .Y(n2142) );
  OAI22XL U1255 ( .A0(n2212), .A1(n1919), .B0(n1625), .B1(n1914), .Y(n2211) );
  OAI222X1 U1256 ( .A0(n2229), .A1(n1976), .B0(n2230), .B1(n1977), .C0(n2231), 
        .C1(n1975), .Y(n2177) );
  NOR2BX1 U1257 ( .AN(n1772), .B(n2241), .Y(n990) );
  INVX12 U1258 ( .A(n969), .Y(n17380) );
  CLKAND2X8 U1259 ( .A(n15670), .B(n1644), .Y(a6[0]) );
  CLKINVX1 U1260 ( .A(n1975), .Y(n1863) );
  INVX1 U1261 ( .A(n1988), .Y(n1936) );
  INVX12 U1262 ( .A(n16380), .Y(n1636) );
  INVX12 U1263 ( .A(n1639), .Y(n1635) );
  NOR2X4 U1264 ( .A(n1633), .B(n2005), .Y(n2009) );
  AOI22X1 U1265 ( .A0(SRAM_READ_DATA_2[4]), .A1(n2052), .B0(
        SRAM_READ_DATA_1[4]), .B1(n2053), .Y(n2058) );
  NAND2X1 U1266 ( .A(n1731), .B(n1742), .Y(n1734) );
  INVX3 U1267 ( .A(n1792), .Y(n1818) );
  AOI222XL U1268 ( .A0(N478), .A1(n2136), .B0(N458), .B1(n2137), .C0(N339), 
        .C1(n2138), .Y(n2158) );
  AOI221X1 U1269 ( .A0(n1858), .A1(n1862), .B0(n1857), .B1(n1863), .C0(n990), 
        .Y(n2151) );
  NAND3BX1 U1270 ( .AN(n17070), .B(n1295), .C(n1834), .Y(n1998) );
  NOR2X2 U1271 ( .A(n1911), .B(n1918), .Y(n2135) );
  INVX4 U1272 ( .A(n9050), .Y(n1653) );
  MX2X2 U1273 ( .A(n1739), .B(n1730), .S0(i_op_mode[3]), .Y(n1785) );
  AND2XL U1274 ( .A(n1729), .B(n1728), .Y(n1730) );
  NAND2X1 U1275 ( .A(n1615), .B(n1975), .Y(n2108) );
  MXI2X1 U1276 ( .A(n1656), .B(origin_r[4]), .S0(n1599), .Y(n1279) );
  AOI22XL U1277 ( .A0(N249), .A1(n1689), .B0(N233), .B1(n1737), .Y(n981) );
  CLKMX2X4 U1278 ( .A(n971), .B(n1332), .S0(n970), .Y(n1131) );
  CLKINVX1 U1279 ( .A(N1888), .Y(n970) );
  INVX3 U1280 ( .A(n967), .Y(n1849) );
  CLKINVX1 U1281 ( .A(n972), .Y(n2037) );
  XOR2X1 U1282 ( .A(n1473), .B(n1002), .Y(read_access_32[6]) );
  BUFX6 U1283 ( .A(n2033), .Y(n1648) );
  BUFX6 U1284 ( .A(n2033), .Y(n1649) );
  AND2X2 U1285 ( .A(n15810), .B(n855), .Y(n8740) );
  INVX4 U1286 ( .A(n968), .Y(n969) );
  INVX1 U1287 ( .A(n1725), .Y(n1790) );
  NAND3BX2 U1288 ( .AN(n912), .B(n1380), .C(n1804), .Y(n1722) );
  CLKINVX1 U1289 ( .A(n1977), .Y(n1772) );
  AND2X6 U1290 ( .A(n1295), .B(n2038), .Y(n995) );
  CLKINVX6 U1291 ( .A(n1711), .Y(n1779) );
  OR2X6 U1292 ( .A(n998), .B(n2200), .Y(n1897) );
  CLKINVX1 U1293 ( .A(n959), .Y(n960) );
  CLKINVX1 U1294 ( .A(n989), .Y(n959) );
  NAND3BX1 U1295 ( .AN(n1612), .B(n1289), .C(n982), .Y(n1703) );
  NAND2X4 U1296 ( .A(i_op_mode[0]), .B(i_op_mode[1]), .Y(n1729) );
  CLKINVX1 U1297 ( .A(n1824), .Y(n1852) );
  CLKBUFX3 U1298 ( .A(n1895), .Y(n1615) );
  AND2X2 U1299 ( .A(n15440), .B(n1643), .Y(a1[2]) );
  AND2X2 U1300 ( .A(n15460), .B(n1644), .Y(a3[2]) );
  CLKAND2X8 U1301 ( .A(n15620), .B(n1643), .Y(a1[0]) );
  CLKAND2X4 U1302 ( .A(n15680), .B(n1646), .Y(a7[0]) );
  AND2X4 U1303 ( .A(n15700), .B(n1647), .Y(a9[0]) );
  CLKINVX1 U1304 ( .A(n2042), .Y(n2039) );
  INVX6 U1305 ( .A(n1600), .Y(n1656) );
  INVX6 U1306 ( .A(n1596), .Y(n1650) );
  AND2X2 U1307 ( .A(n2257), .B(n1977), .Y(n2030) );
  CLKINVX1 U1308 ( .A(n1931), .Y(n1866) );
  CLKINVX6 U1309 ( .A(state_r[4]), .Y(n1846) );
  CLKINVX1 U1310 ( .A(n1453), .Y(n1871) );
  AOI22X1 U1311 ( .A0(n1310), .A1(n8750), .B0(n1327), .B1(n9030), .Y(n2017) );
  BUFX4 U1312 ( .A(n1639), .Y(n1641) );
  NAND3X1 U1313 ( .A(n1451), .B(n1601), .C(n1864), .Y(n2000) );
  AND2X2 U1314 ( .A(n1284), .B(n998), .Y(n994) );
  AOI22X1 U1315 ( .A0(SRAM_READ_DATA_2[0]), .A1(n2052), .B0(
        SRAM_READ_DATA_1[0]), .B1(n2053), .Y(n2066) );
  AOI22X1 U1316 ( .A0(SRAM_READ_DATA_2[1]), .A1(n2052), .B0(
        SRAM_READ_DATA_1[1]), .B1(n2053), .Y(n2064) );
  AOI22X1 U1317 ( .A0(SRAM_READ_DATA_2[2]), .A1(n2052), .B0(
        SRAM_READ_DATA_1[2]), .B1(n2053), .Y(n2062) );
  AOI22X1 U1318 ( .A0(SRAM_READ_DATA_2[3]), .A1(n2052), .B0(
        SRAM_READ_DATA_1[3]), .B1(n2053), .Y(n2060) );
  AOI22X1 U1319 ( .A0(SRAM_READ_DATA_2[5]), .A1(n2052), .B0(
        SRAM_READ_DATA_1[5]), .B1(n2053), .Y(n2056) );
  CLKINVX1 U1320 ( .A(n1658), .Y(n1861) );
  AOI222XL U1321 ( .A0(N479), .A1(n2136), .B0(N459), .B1(n2137), .C0(N340), 
        .C1(n2138), .Y(n2128) );
  NOR2X1 U1322 ( .A(n1641), .B(n1704), .Y(n992) );
  AOI2BB1X1 U1323 ( .A0N(n1703), .A1N(n1702), .B0(n1931), .Y(n1704) );
  AO22X1 U1324 ( .A0(N510), .A1(n2140), .B0(N587), .B1(n2139), .Y(n2174) );
  AOI22X1 U1325 ( .A0(n1650), .A1(n2146), .B0(N224), .B1(n2144), .Y(n2172) );
  INVX6 U1326 ( .A(n1598), .Y(n1652) );
  AOI221X1 U1327 ( .A0(n1652), .A1(n2177), .B0(N661), .B1(n2145), .C0(n2198), 
        .Y(n2192) );
  AO22X1 U1328 ( .A0(n1655), .A1(n2132), .B0(n9050), .B1(n2144), .Y(n2206) );
  NOR2X1 U1329 ( .A(n936), .B(sub_410_aco_carry[4]), .Y(n1000) );
  NAND2X1 U1330 ( .A(conv_temp_2[13]), .B(n1616), .Y(n1964) );
  CLKMX2X2 U1331 ( .A(n1406), .B(n1420), .S0(n1635), .Y(sobel_answers_r[30])
         );
  CLKMX2X4 U1332 ( .A(n1392), .B(sobel_result[2]), .S0(n1641), .Y(
        sobel_answers_r[2]) );
  OAI221XL U1333 ( .A0(n1681), .A1(n1598), .B0(n2262), .B1(n1684), .C0(n1679), 
        .Y(N351) );
  CLKMX2X2 U1334 ( .A(n1313), .B(conv_r[0]), .S0(N1890), .Y(n1112) );
  CLKMX2X2 U1335 ( .A(n1393), .B(n1407), .S0(n1636), .Y(sobel_answers_r[15])
         );
  AO22X1 U1336 ( .A0(N248), .A1(n1689), .B0(N232), .B1(n1737), .Y(n1686) );
  AND2X2 U1337 ( .A(N907), .B(n1593), .Y(SRAM_load_data_r[9]) );
  NAND2X1 U1338 ( .A(conv_temp_2[11]), .B(n1616), .Y(n1968) );
  AOI222X1 U1339 ( .A0(n1617), .A1(n1439), .B0(n1937), .B1(n1397), .C0(n1938), 
        .C1(n1411), .Y(n1971) );
  AOI222XL U1340 ( .A0(median_result[4]), .A1(n1864), .B0(read_data_r[4]), 
        .B1(n1944), .C0(conv_temp_2[4]), .C1(n1616), .Y(n1954) );
  MXI2X1 U1341 ( .A(n1021), .B(n1022), .S0(N1888), .Y(n1132) );
  MXI2X2 U1342 ( .A(n1005), .B(n1006), .S0(N1885), .Y(n1147) );
  MXI2X2 U1343 ( .A(n1003), .B(n1004), .S0(N1888), .Y(n1130) );
  AOI22X2 U1344 ( .A0(N1573), .A1(n1629), .B0(n1331), .B1(n2007), .Y(n1004) );
  AND3X2 U1345 ( .A(n1788), .B(n1787), .C(n1786), .Y(n1814) );
  OAI222XL U1346 ( .A0(n2150), .A1(n1600), .B0(n2151), .B1(n991), .C0(n2152), 
        .C1(n9070), .Y(n2153) );
  AND4X1 U1347 ( .A(n2179), .B(n2180), .C(n2181), .D(n2182), .Y(n2115) );
  AND4X1 U1348 ( .A(n2183), .B(n2184), .C(n2185), .D(n2186), .Y(n2182) );
  OAI221XL U1349 ( .A0(n1976), .A1(n1756), .B0(n1755), .B1(n1785), .C0(n1754), 
        .Y(n1769) );
  AND2X8 U1350 ( .A(SRAM_load_data_r[10]), .B(SRAM_load_data_r[9]), .Y(n2095)
         );
  OAI221XL U1351 ( .A0(n1681), .A1(n1597), .B0(n2261), .B1(n1684), .C0(n1680), 
        .Y(N352) );
  CLKINVX1 U1352 ( .A(n962), .Y(n963) );
  NAND3X4 U1353 ( .A(n1039), .B(n9040), .C(n1602), .Y(n8690) );
  XNOR2X1 U1354 ( .A(n1465), .B(r693_carry_5_), .Y(n8710) );
  CLKBUFX6 U1355 ( .A(n8740), .Y(n1642) );
  AND2X4 U1356 ( .A(n1695), .B(n1694), .Y(n8730) );
  OR2X1 U1357 ( .A(n2039), .B(n921), .Y(n8770) );
  AND2X2 U1358 ( .A(n1384), .B(n1383), .Y(n886) );
  AND2X1 U1359 ( .A(n1294), .B(n969), .Y(n9000) );
  AND2X2 U1360 ( .A(n984), .B(n1726), .Y(n9010) );
  CLKINVX6 U1361 ( .A(state_w_0_), .Y(n1614) );
  AND2X4 U1362 ( .A(n15910), .B(n973), .Y(n9020) );
  NOR3X2 U1363 ( .A(n1652), .B(n1651), .C(n1653), .Y(n1887) );
  XNOR2X1 U1364 ( .A(n1656), .B(r693_carry_4_), .Y(n9070) );
  OR2X1 U1365 ( .A(n1853), .B(n2225), .Y(n921) );
  XNOR2X1 U1366 ( .A(n1017), .B(n1018), .Y(n928) );
  INVX8 U1367 ( .A(scale_r[1]), .Y(n1697) );
  OAI31X2 U1368 ( .A0(n1732), .A1(n1737), .A2(n1823), .B0(n17600), .Y(n1733)
         );
  INVX4 U1369 ( .A(n18100), .Y(n1822) );
  MX2XL U1370 ( .A(n1347), .B(conv_r[22]), .S0(N1885), .Y(n1146) );
  NAND2X4 U1371 ( .A(i_op_mode[3]), .B(n1740), .Y(n1788) );
  OR4X2 U1372 ( .A(n1477), .B(n1478), .C(n1475), .D(n1476), .Y(
        sub_1772_carry_5_) );
  AOI22X1 U1373 ( .A0(SRAM_READ_DATA_4[5]), .A1(n2050), .B0(
        SRAM_READ_DATA_3[5]), .B1(n2051), .Y(n2057) );
  AOI22X1 U1374 ( .A0(SRAM_READ_DATA_4[3]), .A1(n2050), .B0(
        SRAM_READ_DATA_3[3]), .B1(n2051), .Y(n2061) );
  AOI22X1 U1375 ( .A0(SRAM_READ_DATA_4[2]), .A1(n2050), .B0(
        SRAM_READ_DATA_3[2]), .B1(n2051), .Y(n2063) );
  AOI22X1 U1376 ( .A0(SRAM_READ_DATA_4[1]), .A1(n2050), .B0(
        SRAM_READ_DATA_3[1]), .B1(n2051), .Y(n2065) );
  AOI22X1 U1377 ( .A0(SRAM_READ_DATA_4[0]), .A1(n2050), .B0(
        SRAM_READ_DATA_3[0]), .B1(n2051), .Y(n2067) );
  NAND2XL U1378 ( .A(n1471), .B(n8990), .Y(n2233) );
  AOI222X4 U1379 ( .A0(N410), .A1(n2131), .B0(N369), .B1(n2132), .C0(N354), 
        .C1(n2133), .Y(n2160) );
  AND2X2 U1380 ( .A(n2211), .B(N3697), .Y(n2133) );
  OAI211XL U1381 ( .A0(n948), .A1(n1933), .B0(n1934), .C0(n1935), .Y(n2275) );
  AOI222X1 U1382 ( .A0(n1617), .A1(n1427), .B0(n1937), .B1(n1385), .C0(n1938), 
        .C1(n1399), .Y(n1935) );
  OAI211X2 U1383 ( .A0(n17380), .A1(n1785), .B0(n1822), .C0(n1821), .Y(n953)
         );
  INVX3 U1384 ( .A(n1803), .Y(n1816) );
  NAND2X1 U1385 ( .A(n984), .B(scale_r[0]), .Y(n1805) );
  OR4X4 U1386 ( .A(n1728), .B(n1666), .C(i_op_mode[0]), .D(i_op_mode[3]), .Y(
        n1735) );
  CLKINVX20 U1387 ( .A(i_op_mode[1]), .Y(n1666) );
  NAND3BX1 U1388 ( .AN(n1931), .B(state_r[1]), .C(state_r[4]), .Y(n1841) );
  NAND4BX4 U1389 ( .AN(n1751), .B(n1750), .C(n1779), .D(n8730), .Y(state_w_0_)
         );
  AND3X6 U1390 ( .A(n1666), .B(n17600), .C(i_op_mode[2]), .Y(n1659) );
  AOI2BB1X4 U1391 ( .A0N(state_r[2]), .A1N(n1614), .B0(state_r[3]), .Y(n1850)
         );
  INVX3 U1392 ( .A(n1735), .Y(n1663) );
  CLKINVX4 U1393 ( .A(n1745), .Y(n1741) );
  NAND2X6 U1394 ( .A(i_op_mode[2]), .B(n17600), .Y(n954) );
  NAND2X6 U1395 ( .A(n1293), .B(n1670), .Y(n955) );
  NAND2X4 U1396 ( .A(n1669), .B(n1380), .Y(n956) );
  NAND2X8 U1397 ( .A(n955), .B(n956), .Y(scale_r[1]) );
  NAND3BX4 U1398 ( .AN(n1727), .B(n1790), .C(n1789), .Y(n1753) );
  NAND2X2 U1399 ( .A(n1666), .B(n1664), .Y(n1673) );
  AOI2BB1X4 U1400 ( .A0N(n1746), .A1N(n953), .B0(n1780), .Y(n1747) );
  AND3X1 U1401 ( .A(n1822), .B(i_op_valid), .C(n1785), .Y(n1786) );
  NAND4X4 U1402 ( .A(n912), .B(n8830), .C(n1659), .D(i_op_mode[0]), .Y(n1660)
         );
  AO21X4 U1403 ( .A0(n1293), .A1(n1663), .B0(n1726), .Y(scale_r[0]) );
  AO21X2 U1404 ( .A0(n1771), .A1(n1776), .B0(n1753), .Y(n1749) );
  CLKINVX1 U1405 ( .A(n1753), .Y(n1754) );
  AND3X1 U1406 ( .A(n985), .B(n9020), .C(n1714), .Y(n984) );
  AOI222XL U1407 ( .A0(N225), .A1(n2144), .B0(N664), .B1(n2145), .C0(n1600), 
        .C1(n2146), .Y(n2161) );
  AOI221X2 U1408 ( .A0(n1651), .A1(n2177), .B0(N662), .B1(n2145), .C0(n2187), 
        .Y(n2181) );
  AOI222XL U1409 ( .A0(N226), .A1(n2144), .B0(N665), .B1(n2145), .C0(N627), 
        .C1(n2146), .Y(n2143) );
  OAI22X2 U1410 ( .A0(n1918), .A1(n1920), .B0(n2210), .B1(n1911), .Y(n2145) );
  NAND4X4 U1411 ( .A(n1736), .B(n1735), .C(n1734), .D(n1733), .Y(n18100) );
  AOI222X1 U1412 ( .A0(n1617), .A1(n1438), .B0(n1937), .B1(n1396), .C0(n1938), 
        .C1(n1410), .Y(n1969) );
  NAND3BX2 U1413 ( .AN(n2005), .B(n1847), .C(n1846), .Y(n1848) );
  NAND4BX2 U1414 ( .AN(n1807), .B(n1816), .C(n1806), .D(n1805), .Y(n1808) );
  INVX8 U1415 ( .A(n1665), .Y(n1742) );
  AOI2BB1X2 U1416 ( .A0N(n1293), .A1N(n954), .B0(n8830), .Y(n1662) );
  AOI222X1 U1417 ( .A0(n2248), .A1(n1868), .B0(n1384), .B1(n1927), .C0(n1601), 
        .C1(n1928), .Y(n2247) );
  INVX3 U1418 ( .A(n1896), .Y(n1868) );
  CLKAND2X3 U1419 ( .A(n17380), .B(n987), .Y(n996) );
  OAI222X4 U1420 ( .A0(n2251), .A1(n1702), .B0(n1693), .B1(n1692), .C0(n2027), 
        .C1(n1721), .Y(n1804) );
  AOI32X2 U1421 ( .A0(n1825), .A1(n2005), .A2(i_op_valid), .B0(n1853), .B1(
        n1824), .Y(n18260) );
  NAND2X2 U1422 ( .A(n1672), .B(n1742), .Y(n1736) );
  AND3X2 U1423 ( .A(n1742), .B(n1668), .C(n8830), .Y(n1667) );
  INVX8 U1424 ( .A(n1668), .Y(n1672) );
  OA22X4 U1425 ( .A0(n1844), .A1(n1843), .B0(state_r[0]), .B1(n1845), .Y(n1851) );
  CLKINVX20 U1426 ( .A(i_op_mode[0]), .Y(n1664) );
  INVX1 U1427 ( .A(n1739), .Y(n1740) );
  NAND2X6 U1428 ( .A(n1731), .B(n1728), .Y(n1739) );
  NAND2X2 U1429 ( .A(n1779), .B(n2035), .Y(n1782) );
  NAND2X8 U1430 ( .A(i_op_mode[0]), .B(n1666), .Y(n1668) );
  INVX12 U1431 ( .A(n1684), .Y(n1823) );
  AOI32X2 U1432 ( .A0(n1741), .A1(i_op_valid), .A2(n1788), .B0(n2259), .B1(
        n2256), .Y(n1748) );
  OR4X8 U1433 ( .A(n1784), .B(n1783), .C(n1782), .D(n1781), .Y(state_r[2]) );
  AOI2BB1X1 U1434 ( .A0N(n1778), .A1N(n1777), .B0(n973), .Y(n1783) );
  AOI22X4 U1435 ( .A0(N1555), .A1(n1633), .B0(n1348), .B1(n2009), .Y(n1006) );
  NAND4BX2 U1436 ( .AN(n1842), .B(n1841), .C(n1840), .D(n1839), .Y(n2270) );
  MX2X1 U1437 ( .A(n1836), .B(n1835), .S0(n1843), .Y(n1842) );
  NAND3BX4 U1438 ( .AN(n1809), .B(n992), .C(n1710), .Y(n1711) );
  NAND2X4 U1439 ( .A(n1700), .B(n1701), .Y(n1809) );
  NAND3BX4 U1440 ( .AN(i_op_mode[0]), .B(i_op_mode[1]), .C(n1728), .Y(n1671)
         );
  CLKINVX20 U1441 ( .A(i_op_mode[2]), .Y(n1728) );
  NAND2X6 U1442 ( .A(n17430), .B(n1728), .Y(n1683) );
  NAND2X8 U1443 ( .A(n1672), .B(n1728), .Y(n1684) );
  OAI211X1 U1444 ( .A0(n1838), .A1(n1837), .B0(state_r[0]), .C0(n1863), .Y(
        n1839) );
  NOR4BX4 U1445 ( .AN(n1851), .B(n1850), .C(n1849), .D(n1848), .Y(n2268) );
  INVX20 U1446 ( .A(n1933), .Y(n1945) );
  OAI22X2 U1447 ( .A0(N1654), .A1(n1992), .B0(N1622), .B1(n1993), .Y(n1990) );
  AOI2BB1X2 U1448 ( .A0N(n2027), .A1N(n1846), .B0(n1864), .Y(n1840) );
  AND3X2 U1449 ( .A(n992), .B(n1816), .C(n1998), .Y(n1829) );
  CLKINVX20 U1450 ( .A(i_op_mode[3]), .Y(n17600) );
  NAND3BX4 U1451 ( .AN(n17430), .B(n1667), .C(n1673), .Y(n1670) );
  NOR2X4 U1452 ( .A(n985), .B(n1284), .Y(n2038) );
  INVX8 U1453 ( .A(n1614), .Y(state_r[0]) );
  OAI211X2 U1454 ( .A0(n17380), .A1(n1785), .B0(n1822), .C0(n1821), .Y(n1745)
         );
  INVXL U1455 ( .A(i_rst_n), .Y(n957) );
  INVX8 U1456 ( .A(n957), .Y(n958) );
  OAI221X4 U1457 ( .A0(n1011), .A1(n8690), .B0(n1015), .B1(n1619), .C0(n2020), 
        .Y(conv_temp[15]) );
  AOI22XL U1458 ( .A0(n1315), .A1(n8750), .B0(n1332), .B1(n9030), .Y(n2020) );
  INVXL U1459 ( .A(n8700), .Y(n961) );
  INVX3 U1460 ( .A(n2099), .Y(n962) );
  OR4X4 U1461 ( .A(n1978), .B(n982), .C(n930), .D(n1979), .Y(n999) );
  OAI22X4 U1462 ( .A0(n2212), .A1(n1914), .B0(n1625), .B1(n2216), .Y(n2215) );
  OA22XL U1463 ( .A0(n2212), .A1(n1913), .B0(n1914), .B1(n1918), .Y(n2218) );
  NAND2X1 U1464 ( .A(n2225), .B(n1603), .Y(n1914) );
  OAI32XL U1465 ( .A0(n18880), .A1(n1889), .A2(n18900), .B0(n1891), .B1(n1892), 
        .Y(n1886) );
  NOR3XL U1466 ( .A(n1918), .B(n1889), .C(n18900), .Y(n1915) );
  INVX16 U1467 ( .A(n8770), .Y(n964) );
  AOI211X4 U1468 ( .A0(n1811), .A1(n18100), .B0(n1809), .C0(n1808), .Y(n1812)
         );
  CLKINVX8 U1469 ( .A(n1671), .Y(n1737) );
  AND2XL U1470 ( .A(n15530), .B(n1643), .Y(n965) );
  AND2XL U1471 ( .A(n15530), .B(n1643), .Y(n966) );
  AND2X4 U1472 ( .A(n15530), .B(n1643), .Y(a1[1]) );
  AND2X4 U1473 ( .A(n15640), .B(n1644), .Y(a3[0]) );
  INVX3 U1474 ( .A(n1683), .Y(n1732) );
  INVX1 U1475 ( .A(n2200), .Y(n1657) );
  NAND2X2 U1476 ( .A(n1834), .B(n9000), .Y(n2200) );
  CLKMX2X6 U1477 ( .A(n1412), .B(n1426), .S0(n1635), .Y(sobel_answers_r[28])
         );
  CLKMX2X4 U1478 ( .A(n1392), .B(n1406), .S0(n1636), .Y(sobel_answers_r[16])
         );
  AOI22XL U1479 ( .A0(n1406), .A1(n1938), .B0(n1392), .B1(n1937), .Y(n1959) );
  OR3X4 U1480 ( .A(n1614), .B(state_r[2]), .C(n1844), .Y(n967) );
  INVX3 U1481 ( .A(state_r[2]), .Y(n1845) );
  CLKINVX8 U1482 ( .A(state_r[3]), .Y(n1844) );
  MX2X6 U1483 ( .A(n1398), .B(sobel_result[0]), .S0(n1642), .Y(
        sobel_answers_r[0]) );
  AOI22XL U1484 ( .A0(n1412), .A1(n1938), .B0(n1398), .B1(n1937), .Y(n1973) );
  MX2XL U1485 ( .A(n1330), .B(conv_r[11]), .S0(N1888), .Y(n1129) );
  MX2XL U1486 ( .A(n1373), .B(conv_output_r[2]), .S0(N915), .Y(n1172) );
  INVX6 U1487 ( .A(n17070), .Y(n1870) );
  NAND2X4 U1488 ( .A(n1294), .B(n17380), .Y(n17070) );
  CLKINVX2 U1489 ( .A(n2038), .Y(n1708) );
  CLKINVX6 U1490 ( .A(n1673), .Y(n1731) );
  MX2X1 U1491 ( .A(n1823), .B(n1678), .S0(n1653), .Y(n1674) );
  OAI211X2 U1492 ( .A0(n945), .A1(n1933), .B0(n1966), .C0(n1967), .Y(n2272) );
  AOI222X4 U1493 ( .A0(n1617), .A1(n1437), .B0(n1937), .B1(n1395), .C0(n1938), 
        .C1(n1409), .Y(n1967) );
  AOI22XL U1494 ( .A0(n1407), .A1(n1938), .B0(n1393), .B1(n1937), .Y(n1962) );
  AO22X4 U1495 ( .A0(N1572), .A1(n1629), .B0(n1332), .B1(n2007), .Y(n971) );
  AND3X4 U1496 ( .A(n973), .B(n17380), .C(n997), .Y(n972) );
  OAI221X4 U1497 ( .A0(n2210), .A1(n1914), .B0(n2212), .B1(n2219), .C0(n975), 
        .Y(n974) );
  CLKINVX20 U1498 ( .A(n974), .Y(n2150) );
  OA22X1 U1499 ( .A0(n1625), .A1(n1913), .B0(n1919), .B1(n1918), .Y(n975) );
  OAI211X4 U1500 ( .A0(n1615), .A1(n2238), .B0(n2239), .C0(n2240), .Y(n1916)
         );
  INVX16 U1501 ( .A(n1916), .Y(n2210) );
  AND2XL U1502 ( .A(n15610), .B(n1647), .Y(n976) );
  AND2XL U1503 ( .A(n15610), .B(n1647), .Y(n977) );
  BUFX12 U1504 ( .A(n1648), .Y(n1647) );
  OAI221X1 U1505 ( .A0(n2259), .A1(n1787), .B0(n1815), .B1(n1788), .C0(n1847), 
        .Y(n1758) );
  AND2X1 U1506 ( .A(n15590), .B(n1646), .Y(n979) );
  AND2X1 U1507 ( .A(n15590), .B(n1646), .Y(n980) );
  NAND4X8 U1508 ( .A(n1985), .B(n1612), .C(n1982), .D(n982), .Y(n1933) );
  CLKMX2X6 U1509 ( .A(n1986), .B(n1987), .S0(n1461), .Y(n1985) );
  AOI211X2 U1510 ( .A0(n969), .A1(n1749), .B0(n1748), .C0(n1747), .Y(n1750) );
  NAND2X2 U1511 ( .A(n9020), .B(n1382), .Y(n1693) );
  OAI221X4 U1512 ( .A0(n1815), .A1(n1814), .B0(n1813), .B1(n986), .C0(n1812), 
        .Y(state_r[3]) );
  BUFX8 U1513 ( .A(n2011), .Y(n1619) );
  NAND3BX4 U1514 ( .AN(n1662), .B(n1661), .C(n1660), .Y(n1726) );
  AOI33X2 U1515 ( .A0(n1380), .A1(n1666), .A2(n1664), .B0(n1380), .B1(
        i_op_mode[1]), .B2(i_op_mode[0]), .Y(n1661) );
  AO21X4 U1516 ( .A0(n1769), .A1(n1382), .B0(n1768), .Y(state_r[1]) );
  NAND4BX4 U1517 ( .AN(n1767), .B(n1766), .C(n1765), .D(n8730), .Y(n1768) );
  AOI33X2 U1518 ( .A0(n1466), .A1(n990), .A2(n1832), .B0(n984), .B1(n1696), 
        .B2(scale_r[1]), .Y(n1695) );
  NAND2X8 U1519 ( .A(i_op_mode[2]), .B(n17600), .Y(n1665) );
  NAND4X4 U1520 ( .A(n18260), .B(n1828), .C(n1827), .D(n1829), .Y(state_r[4])
         );
  AOI2BB2X2 U1521 ( .B0(n1295), .B1(n1820), .A0N(n2264), .A1N(n1819), .Y(n1827) );
  BUFX12 U1522 ( .A(n8740), .Y(n1639) );
  MXI2X4 U1523 ( .A(n1009), .B(n1010), .S0(N1882), .Y(n1164) );
  AOI22X2 U1524 ( .A0(N1537), .A1(n1627), .B0(n1365), .B1(n856), .Y(n1010) );
  BUFX4 U1525 ( .A(n8740), .Y(n1640) );
  CLKBUFX4 U1526 ( .A(n8740), .Y(n16380) );
  AND2XL U1527 ( .A(n994), .B(n985), .Y(n989) );
  NAND3BXL U1528 ( .AN(n985), .B(n1294), .C(n994), .Y(n2099) );
  NAND2BX4 U1529 ( .AN(n1693), .B(n994), .Y(n2035) );
  CLKAND2X12 U1530 ( .A(n15650), .B(n1645), .Y(a4[0]) );
  BUFX20 U1531 ( .A(n1648), .Y(n1646) );
  NOR2BX4 U1532 ( .AN(n1834), .B(n998), .Y(n997) );
  INVX12 U1533 ( .A(n1757), .Y(n1834) );
  AOI22X1 U1534 ( .A0(N367), .A1(n2132), .B0(n1651), .B1(n2178), .Y(n2179) );
  AOI22X1 U1535 ( .A0(N366), .A1(n2132), .B0(n1652), .B1(n2178), .Y(n2190) );
  NAND3X2 U1536 ( .A(n1975), .B(n1976), .C(n1977), .Y(n1944) );
  OAI221X4 U1537 ( .A0(n2212), .A1(n2209), .B0(n1625), .B1(n1920), .C0(n2235), 
        .Y(n2178) );
  NOR2X2 U1538 ( .A(n2068), .B(n1285), .Y(n2051) );
  AOI32XL U1539 ( .A0(read_access_32[6]), .A1(n2069), .A2(n1862), .B0(n1869), 
        .B1(n2070), .Y(n2068) );
  OAI211XL U1540 ( .A0(n1887), .A1(n1596), .B0(n1600), .C0(n1017), .Y(n2243)
         );
  AOI22X1 U1541 ( .A0(N589), .A1(n2139), .B0(N512), .B1(n2140), .Y(n2127) );
  AOI22X1 U1542 ( .A0(N588), .A1(n2139), .B0(N511), .B1(n2140), .Y(n2157) );
  OAI22X2 U1543 ( .A0(n2210), .A1(n2219), .B0(n1625), .B1(n2209), .Y(n2140) );
  OAI221X4 U1544 ( .A0(n2210), .A1(n1912), .B0(n1625), .B1(n1911), .C0(n2236), 
        .Y(n2162) );
  NAND4X2 U1545 ( .A(n1374), .B(n8820), .C(n925), .D(n1871), .Y(n1911) );
  INVX3 U1546 ( .A(n2073), .Y(n2053) );
  MXI2XL U1547 ( .A(n2164), .B(n2177), .S0(n1653), .Y(n2221) );
  AOI222X1 U1548 ( .A0(n2165), .A1(N283), .B0(n2189), .B1(n1651), .C0(n2164), 
        .C1(N223), .Y(n2188) );
  OAI222X4 U1549 ( .A0(n1976), .A1(n2232), .B0(n1977), .B1(n2233), .C0(n1975), 
        .C1(n2234), .Y(n2164) );
  OAI221X4 U1550 ( .A0(n2210), .A1(n2216), .B0(n1625), .B1(n1912), .C0(n2218), 
        .Y(n2144) );
  NAND2X2 U1551 ( .A(n2030), .B(n2256), .Y(N877) );
  NOR3X1 U1552 ( .A(n1453), .B(n1374), .C(n1454), .Y(n2225) );
  AOI22XL U1553 ( .A0(N700), .A1(n2135), .B0(N456), .B1(n2137), .Y(n2185) );
  AOI22XL U1554 ( .A0(n1598), .A1(n2135), .B0(n1598), .B1(n2137), .Y(n2196) );
  AOI22XL U1555 ( .A0(n1653), .A1(n2137), .B0(n1655), .B1(n2138), .Y(n2202) );
  NOR3X2 U1556 ( .A(n2212), .B(n1923), .C(n2216), .Y(n2137) );
  NAND2X2 U1557 ( .A(n2032), .B(n2258), .Y(N868) );
  NOR2X2 U1558 ( .A(n1855), .B(n1863), .Y(n2032) );
  OAI222X4 U1559 ( .A0(n2226), .A1(n1976), .B0(n2227), .B1(n1977), .C0(n2228), 
        .C1(n1975), .Y(n2165) );
  AOI22XL U1560 ( .A0(N586), .A1(n2139), .B0(N509), .B1(n2140), .Y(n2183) );
  AOI22XL U1561 ( .A0(n1598), .A1(n2139), .B0(N508), .B1(n2140), .Y(n2194) );
  AOI22XL U1562 ( .A0(n1653), .A1(n2136), .B0(n1653), .B1(n2139), .Y(n2201) );
  OAI22X2 U1563 ( .A0(n2212), .A1(n1911), .B0(n1918), .B1(n1912), .Y(n2139) );
  CLKINVX12 U1564 ( .A(n2224), .Y(n2212) );
  INVXL U1565 ( .A(n2005), .Y(n2255) );
  INVXL U1566 ( .A(n2264), .Y(n1855) );
  INVX1 U1567 ( .A(n1752), .Y(n1815) );
  MX2XL U1568 ( .A(n1482), .B(conv_channels_16_r[4]), .S0(N868), .Y(n1196) );
  NOR2BXL U1569 ( .AN(N873), .B(n2032), .Y(conv_channels_16_r[4]) );
  AND3XL U1570 ( .A(n16220), .B(n1594), .C(n2101), .Y(n2106) );
  MX2XL U1571 ( .A(n1484), .B(conv_channels_16_r[2]), .S0(N868), .Y(n1198) );
  NOR2BXL U1572 ( .AN(N871), .B(n2032), .Y(conv_channels_16_r[2]) );
  MX2XL U1573 ( .A(n1325), .B(conv_r[16]), .S0(N1888), .Y(n1124) );
  MX2XL U1574 ( .A(n1342), .B(conv_r[27]), .S0(N1885), .Y(n1141) );
  OA21XL U1575 ( .A0(n1453), .A1(n2039), .B0(n2040), .Y(n1030) );
  BUFX12 U1576 ( .A(n2213), .Y(n1625) );
  NAND2X4 U1577 ( .A(n1712), .B(n1866), .Y(n2251) );
  NAND2X8 U1578 ( .A(n985), .B(n986), .Y(n1757) );
  NOR2X1 U1579 ( .A(n1897), .B(n1383), .Y(n1927) );
  CLKMX2X2 U1580 ( .A(n1309), .B(conv_r[4]), .S0(N1890), .Y(n1108) );
  AO22X1 U1581 ( .A0(N1580), .A1(n1631), .B0(n1309), .B1(n1618), .Y(conv_r[4])
         );
  NAND2X1 U1582 ( .A(N1743), .B(n897), .Y(n1983) );
  AO22X1 U1583 ( .A0(N1526), .A1(n1627), .B0(n1360), .B1(n856), .Y(conv_r[37])
         );
  AO22X1 U1584 ( .A0(N1525), .A1(n1627), .B0(n1361), .B1(n856), .Y(conv_r[36])
         );
  AO22X1 U1585 ( .A0(N1524), .A1(n1627), .B0(n1362), .B1(n856), .Y(conv_r[35])
         );
  MX2XL U1586 ( .A(n1480), .B(conv_channels_16_r[6]), .S0(N868), .Y(n1194) );
  NOR2BXL U1587 ( .AN(N875), .B(n2032), .Y(conv_channels_16_r[6]) );
  MX2XL U1588 ( .A(n1481), .B(conv_channels_16_r[5]), .S0(N868), .Y(n1195) );
  NOR2BXL U1589 ( .AN(N874), .B(n2032), .Y(conv_channels_16_r[5]) );
  NAND2XL U1590 ( .A(n1731), .B(i_op_mode[2]), .Y(n1682) );
  NAND3XL U1591 ( .A(n1624), .B(n1595), .C(n2106), .Y(SRAM_CEN_2_r) );
  INVX1 U1592 ( .A(n1787), .Y(n1746) );
  INVX1 U1593 ( .A(n2177), .Y(n2147) );
  INVXL U1594 ( .A(n2036), .Y(n206) );
  NAND2X2 U1595 ( .A(n2031), .B(n2259), .Y(N858) );
  INVX1 U1596 ( .A(n1678), .Y(n1681) );
  INVXL U1597 ( .A(n1919), .Y(n18900) );
  NAND3BXL U1598 ( .AN(n985), .B(n996), .C(n998), .Y(n1895) );
  INVX1 U1599 ( .A(n2188), .Y(n2187) );
  NAND2XL U1600 ( .A(n1804), .B(n912), .Y(n1806) );
  OAI211XL U1601 ( .A0(n2259), .A1(n1785), .B0(n1790), .C0(n1793), .Y(n1777)
         );
  AO22XL U1602 ( .A0(n1653), .A1(n2135), .B0(n9050), .B1(n2134), .Y(n2208) );
  AOI22XL U1603 ( .A0(N619), .A1(n2134), .B0(N702), .B1(n2135), .Y(n2159) );
  NAND4BXL U1604 ( .AN(n1771), .B(n1775), .C(n1774), .D(n1976), .Y(n1778) );
  INVX1 U1605 ( .A(n1774), .Y(n1791) );
  NAND2XL U1606 ( .A(n1896), .B(n1897), .Y(n1771) );
  OAI211XL U1607 ( .A0(n2264), .A1(n1762), .B0(n1998), .C0(n1761), .Y(n1763)
         );
  NAND2BX1 U1608 ( .AN(n1688), .B(n981), .Y(origin_r[4]) );
  NAND2XL U1609 ( .A(n1866), .B(n8720), .Y(n1979) );
  MXI2XL U1610 ( .A(n8950), .B(n938), .S0(n1639), .Y(NMS_direction_r[6]) );
  MXI2XL U1611 ( .A(n938), .B(n897), .S0(n1642), .Y(NMS_direction_r[4]) );
  NAND2XL U1612 ( .A(n1866), .B(n930), .Y(n2254) );
  INVX1 U1613 ( .A(n1716), .Y(n1718) );
  AOI2BB1XL U1614 ( .A0N(n2263), .A1N(n1817), .B0(n972), .Y(n1828) );
  INVX3 U1615 ( .A(n2233), .Y(n2248) );
  NAND3BXL U1616 ( .AN(n1484), .B(n919), .C(n887), .Y(n1837) );
  AOI32XL U1617 ( .A0(n1295), .A1(n1382), .A2(n996), .B0(n1756), .B1(n1862), 
        .Y(n1700) );
  AND2X2 U1618 ( .A(N906), .B(n1593), .Y(SRAM_load_data_r[8]) );
  MX2XL U1619 ( .A(n1310), .B(conv_r[3]), .S0(N1890), .Y(n1109) );
  AO22XL U1620 ( .A0(N1579), .A1(n1631), .B0(n1310), .B1(n1618), .Y(conv_r[3])
         );
  MX2XL U1621 ( .A(n1311), .B(conv_r[2]), .S0(N1890), .Y(n1110) );
  AO22XL U1622 ( .A0(N1578), .A1(n1631), .B0(n1311), .B1(n1618), .Y(conv_r[2])
         );
  MX2XL U1623 ( .A(n1360), .B(conv_r[37]), .S0(N1882), .Y(n1159) );
  MX2XL U1624 ( .A(n1361), .B(conv_r[36]), .S0(N1882), .Y(n1160) );
  MX2XL U1625 ( .A(n1362), .B(conv_r[35]), .S0(N1882), .Y(n1161) );
  AOI22XL U1626 ( .A0(N620), .A1(n2134), .B0(N703), .B1(n2135), .Y(n2129) );
  AND2X2 U1627 ( .A(N905), .B(n1593), .Y(SRAM_load_data_r[7]) );
  NAND2X1 U1628 ( .A(n1478), .B(n8810), .Y(n2265) );
  MX2XL U1629 ( .A(n1343), .B(conv_r[26]), .S0(N1885), .Y(n1142) );
  MX2XL U1630 ( .A(n1344), .B(conv_r[25]), .S0(N1885), .Y(n1143) );
  MX2XL U1631 ( .A(n1345), .B(conv_r[24]), .S0(N1885), .Y(n1144) );
  MX2XL U1632 ( .A(n1326), .B(conv_r[15]), .S0(N1888), .Y(n1125) );
  MX2XL U1633 ( .A(n1327), .B(conv_r[14]), .S0(N1888), .Y(n1126) );
  MX2XL U1634 ( .A(n1328), .B(conv_r[13]), .S0(N1888), .Y(n1127) );
  AND2X2 U1635 ( .A(N904), .B(n1593), .Y(SRAM_load_data_r[6]) );
  AND2X2 U1636 ( .A(N903), .B(n1593), .Y(SRAM_load_data_r[5]) );
  NAND2BX1 U1637 ( .AN(n16900), .B(n983), .Y(origin_r[5]) );
  AOI22XL U1638 ( .A0(N250), .A1(n1689), .B0(N234), .B1(n1737), .Y(n983) );
  NAND3BXL U1639 ( .AN(n1602), .B(n1373), .C(n1039), .Y(n1721) );
  AND2X2 U1640 ( .A(N902), .B(n1593), .Y(SRAM_load_data_r[4]) );
  MX2XL U1641 ( .A(n1483), .B(conv_channels_16_r[3]), .S0(N868), .Y(n1197) );
  NOR2BXL U1642 ( .AN(N872), .B(n2032), .Y(conv_channels_16_r[3]) );
  NOR4XL U1643 ( .A(n1484), .B(n1485), .C(n1482), .D(n1483), .Y(n1019) );
  INVXL U1644 ( .A(n2227), .Y(n1705) );
  OA21XL U1645 ( .A0(n1451), .A1(n1998), .B0(n2002), .Y(n1999) );
  NAND2XL U1646 ( .A(n1450), .B(n1860), .Y(n1996) );
  NAND4XL U1647 ( .A(n1482), .B(n1481), .C(n2266), .D(n1483), .Y(n1819) );
  INVX1 U1648 ( .A(n1381), .Y(n1655) );
  MXI2XL U1649 ( .A(n2000), .B(n1999), .S0(n1450), .Y(median_output_r[2]) );
  MX2XL U1650 ( .A(n2028), .B(n2029), .S0(n1452), .Y(n1040) );
  MX2XL U1651 ( .A(n15760), .B(NMS_output_r[0]), .S0(N895), .Y(n1273) );
  MX2XL U1652 ( .A(n1455), .B(NMS_output_r[1]), .S0(N895), .Y(n1178) );
  MXI2XL U1653 ( .A(n2249), .B(n2250), .S0(n1455), .Y(NMS_output_r[1]) );
  NAND2XL U1654 ( .A(n1856), .B(n15760), .Y(n2249) );
  NOR2XL U1655 ( .A(n2251), .B(n15760), .Y(NMS_output_r[0]) );
  MX2XL U1656 ( .A(n1458), .B(n15780), .S0(n1639), .Y(NMS_direction_r[0]) );
  AOI2BB1XL U1657 ( .A0N(n1456), .A1N(n1931), .B0(NMS_output_count_r[0]), .Y(
        n2252) );
  MXI2XL U1658 ( .A(n2253), .B(n2254), .S0(n1456), .Y(NMS_output_count_r[1])
         );
  NAND2XL U1659 ( .A(n1612), .B(n1866), .Y(n2253) );
  NAND3BX1 U1660 ( .AN(n1382), .B(n1295), .C(n996), .Y(n2027) );
  NOR2XL U1661 ( .A(n986), .B(n1294), .Y(n987) );
  NAND3BXL U1662 ( .AN(n1382), .B(n996), .C(n998), .Y(n2258) );
  CLKINVX1 U1663 ( .A(n1776), .Y(n1853) );
  CLKBUFX3 U1664 ( .A(n1101), .Y(n1083) );
  CLKBUFX3 U1665 ( .A(i_rst_n), .Y(n1084) );
  CLKBUFX3 U1666 ( .A(n1091), .Y(n1071) );
  CLKBUFX3 U1667 ( .A(n1090), .Y(n1072) );
  CLKBUFX3 U1668 ( .A(n1090), .Y(n1073) );
  CLKBUFX3 U1669 ( .A(n1089), .Y(n1074) );
  CLKBUFX3 U1670 ( .A(n1089), .Y(n1075) );
  CLKBUFX3 U1671 ( .A(n1088), .Y(n1076) );
  CLKBUFX3 U1672 ( .A(n1282), .Y(n1082) );
  CLKBUFX3 U1673 ( .A(n1086), .Y(n1081) );
  CLKBUFX3 U1674 ( .A(n1087), .Y(n1079) );
  CLKBUFX3 U1675 ( .A(n1087), .Y(n1078) );
  CLKBUFX3 U1676 ( .A(n1088), .Y(n1077) );
  CLKBUFX3 U1677 ( .A(n1091), .Y(n1070) );
  CLKBUFX3 U1678 ( .A(n1086), .Y(n1080) );
  CLKBUFX3 U1679 ( .A(n1092), .Y(n1069) );
  CLKBUFX3 U1680 ( .A(n1094), .Y(n1064) );
  CLKBUFX3 U1681 ( .A(n1092), .Y(n1068) );
  CLKBUFX3 U1682 ( .A(n1093), .Y(n1067) );
  CLKBUFX3 U1683 ( .A(n1093), .Y(n1066) );
  CLKBUFX3 U1684 ( .A(n1094), .Y(n1065) );
  CLKBUFX3 U1685 ( .A(n1103), .Y(n1085) );
  CLKBUFX3 U1686 ( .A(i_rst_n), .Y(n1059) );
  CLKBUFX3 U1687 ( .A(n1096), .Y(n1060) );
  CLKBUFX3 U1688 ( .A(n1096), .Y(n1061) );
  CLKBUFX3 U1689 ( .A(n1095), .Y(n1062) );
  CLKBUFX3 U1690 ( .A(n1097), .Y(n1058) );
  CLKBUFX3 U1691 ( .A(n1095), .Y(n1063) );
  CLKBUFX3 U1692 ( .A(n1098), .Y(n1093) );
  CLKBUFX3 U1693 ( .A(n1099), .Y(n1090) );
  CLKBUFX3 U1694 ( .A(n1099), .Y(n1089) );
  CLKBUFX3 U1695 ( .A(n1100), .Y(n1087) );
  CLKBUFX3 U1696 ( .A(n1100), .Y(n1088) );
  CLKBUFX3 U1697 ( .A(n1098), .Y(n1094) );
  CLKBUFX3 U1698 ( .A(n1098), .Y(n1092) );
  CLKBUFX3 U1699 ( .A(n1099), .Y(n1091) );
  CLKBUFX3 U1700 ( .A(n1100), .Y(n1086) );
  INVX3 U1701 ( .A(n1640), .Y(n1637) );
  CLKINVX1 U1702 ( .A(n2163), .Y(n1687) );
  CLKINVX1 U1703 ( .A(n2108), .Y(n17940) );
  CLKINVX1 U1704 ( .A(n2251), .Y(n1856) );
  CLKBUFX3 U1705 ( .A(n1097), .Y(n1096) );
  CLKBUFX3 U1706 ( .A(n1097), .Y(n1095) );
  CLKBUFX3 U1707 ( .A(n1102), .Y(n1098) );
  CLKBUFX3 U1708 ( .A(n1102), .Y(n1099) );
  CLKBUFX3 U1709 ( .A(n1101), .Y(n1100) );
  AND4X1 U1710 ( .A(n1844), .B(n1846), .C(n1614), .D(n1845), .Y(n2269) );
  OA22XL U1711 ( .A0(n2210), .A1(n1919), .B0(n1625), .B1(n2219), .Y(n988) );
  NAND2X1 U1712 ( .A(n17430), .B(n1742), .Y(n1787) );
  NOR2X2 U1713 ( .A(n1854), .B(n1862), .Y(n2031) );
  CLKINVX1 U1714 ( .A(n2263), .Y(n1854) );
  NOR3X4 U1715 ( .A(n1627), .B(n1631), .C(n1629), .Y(N1885) );
  NOR3X4 U1716 ( .A(n1633), .B(n1631), .C(n1629), .Y(N1882) );
  NOR2X1 U1717 ( .A(n2005), .B(n1631), .Y(n2004) );
  NOR3X4 U1718 ( .A(n1627), .B(n1629), .C(n1633), .Y(N1890) );
  INVX4 U1719 ( .A(n1626), .Y(n1627) );
  CLKINVX1 U1720 ( .A(n2010), .Y(n1626) );
  OAI222XL U1721 ( .A0(n2229), .A1(n2263), .B0(n2230), .B1(n2257), .C0(n2231), 
        .C1(n2264), .Y(n2010) );
  CLKINVX1 U1722 ( .A(n2256), .Y(n1770) );
  CLKINVX1 U1723 ( .A(n1761), .Y(n1859) );
  CLKBUFX3 U1724 ( .A(n1057), .Y(n1102) );
  CLKBUFX3 U1725 ( .A(n1057), .Y(n1101) );
  CLKBUFX3 U1726 ( .A(n1103), .Y(n1097) );
  CLKBUFX3 U1727 ( .A(n1057), .Y(n1103) );
  NOR4X1 U1728 ( .A(n2123), .B(n2124), .C(n2125), .D(n2126), .Y(n2112) );
  NAND2X2 U1729 ( .A(n962), .B(n17380), .Y(n1976) );
  NAND2X1 U1730 ( .A(n1861), .B(n17380), .Y(n1977) );
  NAND3BXL U1731 ( .AN(n973), .B(n1834), .C(n998), .Y(n1658) );
  INVX1 U1732 ( .A(n1893), .Y(n1869) );
  AO22XL U1733 ( .A0(n1823), .A1(n1687), .B0(N241), .B1(n1732), .Y(n1688) );
  AOI2BB1X1 U1734 ( .A0N(n2257), .A1N(n1709), .B0(n1764), .Y(n1710) );
  CLKINVX1 U1735 ( .A(n1799), .Y(n1709) );
  INVX1 U1736 ( .A(n2199), .Y(n2198) );
  CLKINVX1 U1737 ( .A(n1897), .Y(n1867) );
  NAND4XL U1738 ( .A(n2035), .B(n2263), .C(n2264), .D(n1796), .Y(n1807) );
  NAND2BX1 U1739 ( .AN(n1686), .B(n16850), .Y(N625) );
  AOI2BB2XL U1740 ( .B0(N240), .B1(n1732), .A0N(n2260), .A1N(n1684), .Y(n16850) );
  NAND3BX1 U1741 ( .AN(n1798), .B(SRAM_load_data_r[1]), .C(SRAM_load_data_r[0]), .Y(n1800) );
  NAND4X1 U1742 ( .A(SRAM_load_data_r[7]), .B(SRAM_load_data_r[8]), .C(
        SRAM_load_data_r[6]), .D(n1797), .Y(n1802) );
  INVXL U1743 ( .A(N3697), .Y(n1876) );
  CLKINVX1 U1744 ( .A(n2265), .Y(n1858) );
  NAND3BXL U1745 ( .AN(n17600), .B(n1823), .C(n1759), .Y(n1766) );
  XNOR2X1 U1746 ( .A(n1656), .B(n1650), .Y(n991) );
  NAND2X1 U1747 ( .A(n2258), .B(n2259), .Y(n1752) );
  CLKINVX1 U1748 ( .A(n1682), .Y(n1689) );
  CLKINVX1 U1749 ( .A(n1795), .Y(n1811) );
  NAND2XL U1750 ( .A(n1682), .B(n1683), .Y(n1678) );
  INVX3 U1751 ( .A(n1998), .Y(n1864) );
  CLKINVX1 U1752 ( .A(n2000), .Y(n1860) );
  AND3X2 U1753 ( .A(SRAM_load_data_r[4]), .B(SRAM_load_data_r[5]), .C(
        SRAM_load_data_r[3]), .Y(n1797) );
  NAND2XL U1754 ( .A(n1640), .B(n886), .Y(n1717) );
  CLKINVX1 U1755 ( .A(n1703), .Y(n1712) );
  NAND3BX1 U1756 ( .AN(n1708), .B(n9020), .C(n998), .Y(n2256) );
  NAND2XL U1757 ( .A(n1824), .B(n1776), .Y(n1793) );
  INVX4 U1758 ( .A(n1628), .Y(n1629) );
  CLKINVX1 U1759 ( .A(n2006), .Y(n1628) );
  OAI222XL U1760 ( .A0(n2265), .A1(n2263), .B0(n2241), .B1(n2257), .C0(n2238), 
        .C1(n2264), .Y(n2006) );
  OAI222XL U1761 ( .A0(n2226), .A1(n2263), .B0(n2228), .B1(n2264), .C0(n2227), 
        .C1(n2257), .Y(n2003) );
  INVX4 U1762 ( .A(n1632), .Y(n1633) );
  CLKINVX1 U1763 ( .A(n2008), .Y(n1632) );
  OAI222XL U1764 ( .A0(n2263), .A1(n2232), .B0(n2257), .B1(n2233), .C0(n2264), 
        .C1(n2234), .Y(n2008) );
  CLKINVX1 U1765 ( .A(n1655), .Y(n16540) );
  CLKINVX1 U1766 ( .A(SRAM_load_data_r[2]), .Y(n1798) );
  NAND2XL U1767 ( .A(n1615), .B(n1894), .Y(n1716) );
  OAI31XL U1768 ( .A0(n2241), .A1(n927), .A2(n1773), .B0(n1772), .Y(n1775) );
  AOI211XL U1769 ( .A0(n1853), .A1(n1771), .B0(n1764), .C0(n1763), .Y(n1765)
         );
  CLKINVX1 U1770 ( .A(n1819), .Y(n1762) );
  CLKBUFX3 U1771 ( .A(n1865), .Y(n1616) );
  CLKINVX1 U1772 ( .A(n2027), .Y(n1865) );
  NAND4XL U1773 ( .A(n2038), .B(n973), .C(n17380), .D(n998), .Y(n1761) );
  CLKBUFX3 U1774 ( .A(n2093), .Y(n1623) );
  CLKINVX1 U1775 ( .A(n2104), .Y(n2093) );
  CLKBUFX3 U1776 ( .A(n2094), .Y(n1624) );
  CLKINVX1 U1777 ( .A(n2105), .Y(n2094) );
  AOI221XL U1778 ( .A0(n962), .A1(n1020), .B0(n919), .B1(n2108), .C0(n2079), 
        .Y(n2047) );
  NAND3BXL U1779 ( .AN(n1757), .B(n9020), .C(n998), .Y(n1847) );
  CLKINVX1 U1780 ( .A(n1773), .Y(n1832) );
  AND2XL U1781 ( .A(n2070), .B(n962), .Y(n993) );
  CLKINVX1 U1782 ( .A(n993), .Y(n2046) );
  CLKBUFX3 U1783 ( .A(n1282), .Y(n1057) );
  NAND3BX2 U1784 ( .AN(n1294), .B(n995), .C(n17380), .Y(n1894) );
  NOR4X1 U1785 ( .A(n2153), .B(n2154), .C(n2155), .D(n2156), .Y(n2113) );
  OAI31XL U1786 ( .A0(n1691), .A1(n1294), .A2(n1757), .B0(n1796), .Y(n1751) );
  OAI221XL U1787 ( .A0(n2141), .A1(n8710), .B0(n2142), .B1(n928), .C0(n2143), 
        .Y(n2125) );
  XOR2X1 U1788 ( .A(n1465), .B(n1000), .Y(N234) );
  AO22XL U1789 ( .A0(n1823), .A1(N226), .B0(N242), .B1(n1732), .Y(n16900) );
  XOR2X1 U1790 ( .A(n1017), .B(n1001), .Y(N589) );
  NAND2X1 U1791 ( .A(r704_carry[4]), .B(n1656), .Y(n1001) );
  NAND3BX1 U1792 ( .AN(n1482), .B(n8980), .C(n944), .Y(n1838) );
  CLKINVX1 U1793 ( .A(n1736), .Y(n1669) );
  NOR2X1 U1794 ( .A(n1894), .B(n1451), .Y(n1928) );
  NAND4X1 U1795 ( .A(n1720), .B(n1719), .C(n1718), .D(n1717), .Y(n1727) );
  OA22XL U1796 ( .A0(n15820), .A1(n2036), .B0(n1931), .B1(n1712), .Y(n1720) );
  NOR2X1 U1797 ( .A(n1474), .B(sub_1772_carry_5_), .Y(n1002) );
  AOI32XL U1798 ( .A0(n1293), .A1(n1804), .A2(n8830), .B0(n1853), .B1(n1716), 
        .Y(n1694) );
  CLKINVX1 U1799 ( .A(n1759), .Y(n1755) );
  INVX6 U1800 ( .A(n1597), .Y(n1651) );
  CLKMX2X2 U1801 ( .A(n1770), .B(n1758), .S0(i_op_valid), .Y(n1767) );
  NAND2X1 U1802 ( .A(n1470), .B(n8680), .Y(n2241) );
  NAND2X1 U1803 ( .A(n1470), .B(n1471), .Y(n2227) );
  MXI2X1 U1804 ( .A(n1011), .B(n1012), .S0(N1885), .Y(n1148) );
  AOI22X1 U1805 ( .A0(N1554), .A1(n1633), .B0(n1349), .B1(n2009), .Y(n1012) );
  MXI2X1 U1806 ( .A(n1013), .B(n1014), .S0(N1890), .Y(n1114) );
  MXI2X1 U1807 ( .A(n1015), .B(n1016), .S0(N1882), .Y(n1165) );
  AOI22X1 U1808 ( .A0(N1536), .A1(n1627), .B0(n1366), .B1(n856), .Y(n1016) );
  NAND2XL U1809 ( .A(N231), .B(n1737), .Y(n1680) );
  NAND2XL U1810 ( .A(n1650), .B(n1656), .Y(n1018) );
  NAND2X1 U1811 ( .A(n1485), .B(n911), .Y(n2238) );
  XOR2X1 U1812 ( .A(n1481), .B(n1019), .Y(read_access_16_5_) );
  NOR2X1 U1813 ( .A(n1474), .B(n1473), .Y(n1020) );
  CLKINVX1 U1814 ( .A(n1721), .Y(n1724) );
  AOI22X1 U1815 ( .A0(N1571), .A1(n1629), .B0(n1333), .B1(n2007), .Y(n1022) );
  MXI2X1 U1816 ( .A(n1025), .B(n1026), .S0(N1890), .Y(n1115) );
  AOI22X1 U1817 ( .A0(N1589), .A1(n1631), .B0(n1316), .B1(n1618), .Y(n1026) );
  MXI2X1 U1818 ( .A(n1027), .B(n1028), .S0(N1882), .Y(n1166) );
  AOI22X1 U1819 ( .A0(N1535), .A1(n1627), .B0(n1367), .B1(n856), .Y(n1028) );
  NAND2XL U1820 ( .A(N230), .B(n1737), .Y(n1679) );
  OAI22XL U1821 ( .A0(n2039), .A1(n1920), .B0(n1029), .B1(n1030), .Y(
        SRAM_load_count_r[3]) );
  INVX3 U1822 ( .A(n1677), .Y(n1599) );
  NAND3BXL U1823 ( .AN(i_op_mode[3]), .B(n1739), .C(n1676), .Y(n1677) );
  OA22XL U1824 ( .A0(n1684), .A1(n1675), .B0(n1731), .B1(n1728), .Y(n1676) );
  CLKINVX1 U1825 ( .A(n18820), .Y(n1675) );
  AO21XL U1826 ( .A0(N229), .A1(n1737), .B0(n1674), .Y(N350) );
  MXI2X1 U1827 ( .A(n1031), .B(n1032), .S0(N1888), .Y(n1133) );
  AOI22X1 U1828 ( .A0(N1570), .A1(n1629), .B0(n1334), .B1(n2007), .Y(n1032) );
  MXI2X1 U1829 ( .A(n1033), .B(n1034), .S0(N1885), .Y(n1150) );
  AOI22X1 U1830 ( .A0(N1552), .A1(n1633), .B0(n1351), .B1(n2009), .Y(n1034) );
  MXI2X1 U1831 ( .A(n1035), .B(n1036), .S0(N1890), .Y(n1116) );
  AOI22X1 U1832 ( .A0(N1588), .A1(n1631), .B0(n1317), .B1(n1618), .Y(n1036) );
  MXI2X1 U1833 ( .A(n1037), .B(n1038), .S0(N1882), .Y(n1167) );
  AOI22X1 U1834 ( .A0(N1534), .A1(n1627), .B0(n1368), .B1(n856), .Y(n1038) );
  AOI2BB1XL U1835 ( .A0N(i_op_valid), .A1N(n1295), .B0(n17380), .Y(n1691) );
  NAND2X1 U1836 ( .A(i_op_valid), .B(n1744), .Y(n1780) );
  CLKINVX1 U1837 ( .A(n2258), .Y(n1744) );
  AOI221XL U1838 ( .A0(n1776), .A1(n1869), .B0(n1715), .B1(n1863), .C0(n1791), 
        .Y(n1719) );
  NAND4X1 U1839 ( .A(n1480), .B(n876), .C(n919), .D(n1713), .Y(n1715) );
  AND3X2 U1840 ( .A(n1857), .B(n887), .C(n920), .Y(n1713) );
  NAND2X1 U1841 ( .A(i_op_valid), .B(n1770), .Y(n1795) );
  NAND3X1 U1842 ( .A(n1449), .B(n1450), .C(n1860), .Y(n1796) );
  AO21X1 U1843 ( .A0(i_op_valid), .A1(n1752), .B0(n1770), .Y(n1759) );
  MXI2X1 U1844 ( .A(n1039), .B(n1040), .S0(N915), .Y(n1177) );
  MXI2X1 U1845 ( .A(n1041), .B(n1042), .S0(N1888), .Y(n1134) );
  AOI22X1 U1846 ( .A0(N1569), .A1(n1629), .B0(n1335), .B1(n2007), .Y(n1042) );
  MXI2X1 U1847 ( .A(n1043), .B(n1044), .S0(N1885), .Y(n1151) );
  AOI22X1 U1848 ( .A0(N1551), .A1(n1633), .B0(n1352), .B1(n2009), .Y(n1044) );
  MXI2X1 U1849 ( .A(n1045), .B(n1046), .S0(N1890), .Y(n1117) );
  AOI22X1 U1850 ( .A0(N1587), .A1(n1631), .B0(n1318), .B1(n1618), .Y(n1046) );
  MXI2X1 U1851 ( .A(n1047), .B(n1048), .S0(N1882), .Y(n1168) );
  AOI22X1 U1852 ( .A0(N1533), .A1(n1627), .B0(n1369), .B1(n856), .Y(n1048) );
  MXI2X1 U1853 ( .A(n1049), .B(n1050), .S0(N1888), .Y(n1137) );
  AOI22XL U1854 ( .A0(N1557), .A1(n1629), .B0(n1338), .B1(n2007), .Y(n1050) );
  MXI2X1 U1855 ( .A(n1051), .B(n1052), .S0(N1885), .Y(n1154) );
  AOI22XL U1856 ( .A0(N1539), .A1(n1633), .B0(n1355), .B1(n2009), .Y(n1052) );
  NAND2XL U1857 ( .A(n1284), .B(n1295), .Y(n1692) );
  OAI32X1 U1858 ( .A0(n1295), .A1(n1708), .A2(n17070), .B0(n2263), .B1(n1706), 
        .Y(n1764) );
  CLKINVX1 U1859 ( .A(n1817), .Y(n1706) );
  MXI2X1 U1860 ( .A(n1053), .B(n1054), .S0(N1882), .Y(n1171) );
  AOI22XL U1861 ( .A0(N1521), .A1(n1627), .B0(n1372), .B1(n856), .Y(n1054) );
  MXI2X1 U1862 ( .A(n1055), .B(n1056), .S0(N1890), .Y(n1120) );
  AOI22XL U1863 ( .A0(N1575), .A1(n1631), .B0(n1321), .B1(n1618), .Y(n1056) );
  NAND4BXL U1864 ( .AN(n2267), .B(n1475), .C(n1473), .D(n1474), .Y(n1817) );
  NAND2XL U1865 ( .A(n1714), .B(n1294), .Y(n1774) );
  NAND2X1 U1866 ( .A(n15760), .B(n1455), .Y(n1702) );
  CLKBUFX3 U1867 ( .A(n2083), .Y(n1620) );
  NAND2X1 U1868 ( .A(n918), .B(n15770), .Y(n2083) );
  NOR2X1 U1869 ( .A(n1699), .B(n1698), .Y(n1756) );
  NAND2X1 U1870 ( .A(n1472), .B(n1020), .Y(n1698) );
  NAND4BXL U1871 ( .AN(n1475), .B(n8850), .C(n913), .D(n1858), .Y(n1699) );
  NAND4X1 U1872 ( .A(n1468), .B(n1467), .C(n1469), .D(n1705), .Y(n1799) );
  CLKBUFX3 U1873 ( .A(n2092), .Y(n16220) );
  NAND3X1 U1874 ( .A(n1497), .B(n891), .C(n918), .Y(n2092) );
  OAI22XL U1875 ( .A0(n940), .A1(n1624), .B0(n1292), .B1(n1595), .Y(
        SRAM_ADDRESS_1_r[2]) );
  OR3X2 U1876 ( .A(n1469), .B(n1468), .C(n1467), .Y(n1773) );
  AOI2BB1XL U1877 ( .A0N(n1831), .A1N(n1830), .B0(n1976), .Y(n1836) );
  NAND3BXL U1878 ( .AN(n1475), .B(n8850), .C(n937), .Y(n1831) );
  NAND3BXL U1879 ( .AN(n1478), .B(n1020), .C(n913), .Y(n1830) );
  CLKBUFX3 U1880 ( .A(n2045), .Y(n1621) );
  NAND2X1 U1881 ( .A(n15720), .B(n1592), .Y(n2045) );
  CLKINVX1 U1882 ( .A(n1375), .Y(n2107) );
  AND3XL U1883 ( .A(n1834), .B(n1870), .C(n1833), .Y(n1835) );
  NAND3BXL U1884 ( .AN(n1470), .B(n1832), .C(n927), .Y(n1833) );
  CLKINVX1 U1885 ( .A(n958), .Y(n1613) );
  CLKMX2X2 U1886 ( .A(n1305), .B(conv_r[8]), .S0(N1890), .Y(n1104) );
  CLKMX2X2 U1887 ( .A(n1306), .B(conv_r[7]), .S0(N1890), .Y(n1105) );
  CLKMX2X2 U1888 ( .A(n1307), .B(conv_r[6]), .S0(N1890), .Y(n1106) );
  CLKMX2X2 U1889 ( .A(n1308), .B(conv_r[5]), .S0(N1890), .Y(n1107) );
  CLKMX2X2 U1890 ( .A(n1312), .B(conv_r[1]), .S0(N1890), .Y(n1111) );
  CLKMX2X2 U1891 ( .A(n1319), .B(conv_r[10]), .S0(N1890), .Y(n1118) );
  CLKMX2X2 U1892 ( .A(n1320), .B(conv_r[9]), .S0(N1890), .Y(n1119) );
  CLKMX2X2 U1893 ( .A(n1322), .B(conv_r[19]), .S0(N1888), .Y(n1121) );
  CLKMX2X2 U1894 ( .A(n1323), .B(conv_r[18]), .S0(N1888), .Y(n1122) );
  CLKMX2X2 U1895 ( .A(n1324), .B(conv_r[17]), .S0(N1888), .Y(n1123) );
  CLKMX2X2 U1896 ( .A(n1329), .B(conv_r[12]), .S0(N1888), .Y(n1128) );
  CLKMX2X2 U1897 ( .A(n1336), .B(conv_r[21]), .S0(N1888), .Y(n1135) );
  CLKMX2X2 U1898 ( .A(n1337), .B(conv_r[20]), .S0(N1888), .Y(n1136) );
  CLKMX2X2 U1899 ( .A(n1339), .B(conv_r[30]), .S0(N1885), .Y(n1138) );
  CLKMX2X2 U1900 ( .A(n1340), .B(conv_r[29]), .S0(N1885), .Y(n1139) );
  CLKMX2X2 U1901 ( .A(n1341), .B(conv_r[28]), .S0(N1885), .Y(n1140) );
  CLKMX2X2 U1902 ( .A(n1346), .B(conv_r[23]), .S0(N1885), .Y(n1145) );
  CLKMX2X2 U1903 ( .A(n1353), .B(conv_r[32]), .S0(N1885), .Y(n1152) );
  CLKMX2X2 U1904 ( .A(n1354), .B(conv_r[31]), .S0(N1885), .Y(n1153) );
  CLKMX2X2 U1905 ( .A(n1356), .B(conv_r[41]), .S0(N1882), .Y(n1155) );
  CLKMX2X2 U1906 ( .A(n1357), .B(conv_r[40]), .S0(N1882), .Y(n1156) );
  CLKMX2X2 U1907 ( .A(n1358), .B(conv_r[39]), .S0(N1882), .Y(n1157) );
  CLKMX2X2 U1908 ( .A(n1359), .B(conv_r[38]), .S0(N1882), .Y(n1158) );
  CLKMX2X2 U1909 ( .A(n1363), .B(conv_r[34]), .S0(N1882), .Y(n1162) );
  CLKMX2X2 U1910 ( .A(n1364), .B(conv_r[33]), .S0(N1882), .Y(n1163) );
  CLKMX2X2 U1911 ( .A(n1370), .B(conv_r[43]), .S0(N1882), .Y(n1169) );
  CLKMX2X2 U1912 ( .A(n1371), .B(conv_r[42]), .S0(N1882), .Y(n1170) );
  CLKMX2X2 U1913 ( .A(n1381), .B(N350), .S0(n1599), .Y(n1173) );
  CLKMX2X2 U1914 ( .A(n1449), .B(median_output_r[3]), .S0(N885), .Y(n1174) );
  CLKMX2X2 U1915 ( .A(n1450), .B(median_output_r[2]), .S0(N885), .Y(n1175) );
  CLKMX2X2 U1916 ( .A(n1451), .B(median_output_r[1]), .S0(N885), .Y(n1176) );
  CLKMX2X2 U1917 ( .A(n1465), .B(origin_r[5]), .S0(n1599), .Y(n1179) );
  CLKMX2X2 U1918 ( .A(n1466), .B(conv_channels_8_r[5]), .S0(N877), .Y(n1180)
         );
  CLKMX2X2 U1919 ( .A(n1467), .B(conv_channels_8_r[4]), .S0(N877), .Y(n1181)
         );
  CLKMX2X2 U1920 ( .A(n1468), .B(conv_channels_8_r[3]), .S0(N877), .Y(n1182)
         );
  CLKMX2X2 U1921 ( .A(n1469), .B(conv_channels_8_r[2]), .S0(N877), .Y(n1183)
         );
  CLKMX2X2 U1922 ( .A(n1470), .B(conv_channels_8_r[1]), .S0(N877), .Y(n1184)
         );
  CLKMX2X2 U1923 ( .A(n1471), .B(conv_channels_8_r[0]), .S0(N877), .Y(n1185)
         );
  CLKMX2X2 U1924 ( .A(n1472), .B(conv_channels_32_r[7]), .S0(N858), .Y(n1186)
         );
  CLKMX2X2 U1925 ( .A(n1473), .B(conv_channels_32_r[6]), .S0(N858), .Y(n1187)
         );
  CLKMX2X2 U1926 ( .A(n1474), .B(conv_channels_32_r[5]), .S0(N858), .Y(n1188)
         );
  CLKMX2X2 U1927 ( .A(n1476), .B(conv_channels_32_r[3]), .S0(N858), .Y(n1190)
         );
  CLKMX2X2 U1928 ( .A(n1477), .B(conv_channels_32_r[2]), .S0(N858), .Y(n1191)
         );
  CLKMX2X2 U1929 ( .A(n1478), .B(conv_channels_32_r[1]), .S0(N858), .Y(n1192)
         );
  CLKMX2X2 U1930 ( .A(n1479), .B(conv_channels_32_r[0]), .S0(N858), .Y(n1193)
         );
  CLKMX2X2 U1931 ( .A(n1485), .B(conv_channels_16_r[1]), .S0(N868), .Y(n1199)
         );
  CLKMX2X2 U1932 ( .A(n1486), .B(conv_channels_16_r[0]), .S0(N868), .Y(n1200)
         );
  CLKMX2X2 U1933 ( .A(n1499), .B(n1500), .S0(n964), .Y(n1201) );
  CLKMX2X2 U1934 ( .A(n1500), .B(n1501), .S0(n964), .Y(n1202) );
  CLKMX2X2 U1935 ( .A(n1501), .B(n1502), .S0(n964), .Y(n1203) );
  CLKMX2X2 U1936 ( .A(n1502), .B(n1503), .S0(n964), .Y(n1204) );
  CLKMX2X2 U1937 ( .A(n1503), .B(n1504), .S0(n964), .Y(n1205) );
  CLKMX2X2 U1938 ( .A(n1504), .B(n1505), .S0(n964), .Y(n1206) );
  CLKMX2X2 U1939 ( .A(n1505), .B(n1506), .S0(n964), .Y(n1207) );
  CLKMX2X2 U1940 ( .A(n1506), .B(n1507), .S0(n964), .Y(n1208) );
  CLKMX2X2 U1941 ( .A(n1507), .B(read_data_r[7]), .S0(n964), .Y(n1209) );
  CLKMX2X2 U1942 ( .A(n1508), .B(n1509), .S0(n964), .Y(n1210) );
  CLKMX2X2 U1943 ( .A(n1509), .B(n1510), .S0(n964), .Y(n1211) );
  CLKMX2X2 U1944 ( .A(n1510), .B(n1511), .S0(n964), .Y(n1212) );
  CLKMX2X2 U1945 ( .A(n1511), .B(n1512), .S0(n964), .Y(n1213) );
  CLKMX2X2 U1946 ( .A(n1512), .B(n1513), .S0(n964), .Y(n1214) );
  CLKMX2X2 U1947 ( .A(n1513), .B(n1514), .S0(n964), .Y(n1215) );
  CLKMX2X2 U1948 ( .A(n1514), .B(n1515), .S0(n964), .Y(n1216) );
  CLKMX2X2 U1949 ( .A(n1515), .B(n1516), .S0(n964), .Y(n1217) );
  CLKMX2X2 U1950 ( .A(n1516), .B(read_data_r[6]), .S0(n964), .Y(n1218) );
  CLKMX2X2 U1951 ( .A(n1517), .B(n1518), .S0(n964), .Y(n1219) );
  CLKMX2X2 U1952 ( .A(n1518), .B(n1519), .S0(n964), .Y(n1220) );
  CLKMX2X2 U1953 ( .A(n1519), .B(n1520), .S0(n964), .Y(n1221) );
  CLKMX2X2 U1954 ( .A(n1520), .B(n15210), .S0(n964), .Y(n1222) );
  CLKMX2X2 U1955 ( .A(n15210), .B(n15220), .S0(n964), .Y(n1223) );
  CLKMX2X2 U1956 ( .A(n15220), .B(n15230), .S0(n964), .Y(n1224) );
  CLKMX2X2 U1957 ( .A(n15230), .B(n15240), .S0(n964), .Y(n1225) );
  CLKMX2X2 U1958 ( .A(n15240), .B(n15250), .S0(n964), .Y(n1226) );
  CLKMX2X2 U1959 ( .A(n15250), .B(read_data_r[5]), .S0(n964), .Y(n1227) );
  CLKMX2X2 U1960 ( .A(n15260), .B(n15270), .S0(n964), .Y(n1228) );
  CLKMX2X2 U1961 ( .A(n15270), .B(n15280), .S0(n964), .Y(n1229) );
  CLKMX2X2 U1962 ( .A(n15280), .B(n15290), .S0(n964), .Y(n1230) );
  CLKMX2X2 U1963 ( .A(n15290), .B(n15300), .S0(n964), .Y(n1231) );
  CLKMX2X2 U1964 ( .A(n15300), .B(n15310), .S0(n964), .Y(n1232) );
  CLKMX2X2 U1965 ( .A(n15310), .B(n15320), .S0(n964), .Y(n1233) );
  CLKMX2X2 U1966 ( .A(n15320), .B(n15330), .S0(n964), .Y(n1234) );
  CLKMX2X2 U1967 ( .A(n15330), .B(n15340), .S0(n964), .Y(n1235) );
  CLKMX2X2 U1968 ( .A(n15340), .B(read_data_r[4]), .S0(n964), .Y(n1236) );
  CLKMX2X2 U1969 ( .A(n15350), .B(n15360), .S0(n964), .Y(n1237) );
  CLKMX2X2 U1970 ( .A(n15360), .B(n15370), .S0(n964), .Y(n1238) );
  CLKMX2X2 U1971 ( .A(n15370), .B(n1538), .S0(n964), .Y(n1239) );
  CLKMX2X2 U1972 ( .A(n1538), .B(n15390), .S0(n964), .Y(n1240) );
  CLKMX2X2 U1973 ( .A(n15390), .B(n15400), .S0(n964), .Y(n1241) );
  CLKMX2X2 U1974 ( .A(n15400), .B(n15410), .S0(n964), .Y(n1242) );
  CLKMX2X2 U1975 ( .A(n15410), .B(n15420), .S0(n964), .Y(n1243) );
  CLKMX2X2 U1976 ( .A(n15420), .B(n15430), .S0(n964), .Y(n1244) );
  CLKMX2X2 U1977 ( .A(n15430), .B(read_data_r[3]), .S0(n964), .Y(n1245) );
  CLKMX2X2 U1978 ( .A(n15440), .B(n15450), .S0(n964), .Y(n1246) );
  CLKMX2X2 U1979 ( .A(n15450), .B(n15460), .S0(n964), .Y(n1247) );
  CLKMX2X2 U1980 ( .A(n15460), .B(n15470), .S0(n964), .Y(n1248) );
  CLKMX2X2 U1981 ( .A(n15470), .B(n15480), .S0(n964), .Y(n1249) );
  CLKMX2X2 U1982 ( .A(n15480), .B(n15490), .S0(n964), .Y(n1250) );
  CLKMX2X2 U1983 ( .A(n15490), .B(n15500), .S0(n964), .Y(n1251) );
  CLKMX2X2 U1984 ( .A(n15500), .B(n15510), .S0(n964), .Y(n1252) );
  CLKMX2X2 U1985 ( .A(n15510), .B(n15520), .S0(n964), .Y(n1253) );
  CLKMX2X2 U1986 ( .A(n15520), .B(read_data_r[2]), .S0(n964), .Y(n1254) );
  CLKMX2X2 U1987 ( .A(n15530), .B(n15540), .S0(n964), .Y(n1255) );
  CLKMX2X2 U1988 ( .A(n15540), .B(n15550), .S0(n964), .Y(n1256) );
  CLKMX2X2 U1989 ( .A(n15550), .B(n1556), .S0(n964), .Y(n1257) );
  CLKMX2X2 U1990 ( .A(n1556), .B(n15570), .S0(n964), .Y(n1258) );
  CLKMX2X2 U1991 ( .A(n15570), .B(n15580), .S0(n964), .Y(n1259) );
  CLKMX2X2 U1992 ( .A(n15580), .B(n15590), .S0(n964), .Y(n1260) );
  CLKMX2X2 U1993 ( .A(n15590), .B(n15600), .S0(n964), .Y(n1261) );
  CLKMX2X2 U1994 ( .A(n15600), .B(n15610), .S0(n964), .Y(n1262) );
  CLKMX2X2 U1995 ( .A(n15610), .B(read_data_r[1]), .S0(n964), .Y(n1263) );
  CLKMX2X2 U1996 ( .A(n15620), .B(n15630), .S0(n964), .Y(n1264) );
  CLKMX2X2 U1997 ( .A(n15630), .B(n15640), .S0(n964), .Y(n1265) );
  CLKMX2X2 U1998 ( .A(n15640), .B(n15650), .S0(n964), .Y(n1266) );
  CLKMX2X2 U1999 ( .A(n15650), .B(n15660), .S0(n964), .Y(n1267) );
  CLKMX2X2 U2000 ( .A(n15660), .B(n15670), .S0(n964), .Y(n1268) );
  CLKMX2X2 U2001 ( .A(n15670), .B(n15680), .S0(n964), .Y(n1269) );
  CLKMX2X2 U2002 ( .A(n15680), .B(n15690), .S0(n964), .Y(n1270) );
  CLKMX2X2 U2003 ( .A(n15690), .B(n15700), .S0(n964), .Y(n1271) );
  CLKMX2X2 U2004 ( .A(n15700), .B(read_data_r[0]), .S0(n964), .Y(n1272) );
  CLKMX2X2 U2005 ( .A(n15780), .B(NMS_direction[0]), .S0(n15790), .Y(n1274) );
  CLKMX2X2 U2006 ( .A(n15800), .B(NMS_direction[1]), .S0(n15790), .Y(n1275) );
  MXI2X1 U2007 ( .A(n1650), .B(N625), .S0(n1599), .Y(n1276) );
  MXI2X1 U2008 ( .A(n1651), .B(N352), .S0(n1599), .Y(n1277) );
  MXI2X1 U2009 ( .A(n1652), .B(N351), .S0(n1599), .Y(n1278) );
  MXI2X1 U2010 ( .A(n889), .B(n2002), .S0(N885), .Y(n1280) );
  MXI2X1 U2011 ( .A(n978), .B(n2029), .S0(N915), .Y(n1281) );
  CLKINVX1 U2012 ( .A(n1613), .Y(n1282) );
  MX3X4 U2013 ( .A(N1794), .B(N1810), .C(n1980), .S0(n1458), .S1(n1457), .Y(
        n1978) );
  AOI32XL U2014 ( .A0(n1913), .A1(n1914), .A2(n1915), .B0(n1902), .B1(n1916), 
        .Y(n1904) );
  AOI222X1 U2015 ( .A0(n2245), .A1(n1868), .B0(n1927), .B1(n916), .C0(n1928), 
        .C1(n889), .Y(n2244) );
  NOR3BX2 U2016 ( .AN(n2243), .B(n1625), .C(n1919), .Y(n2138) );
  OAI22X2 U2017 ( .A0(n2210), .A1(n1920), .B0(n1918), .B1(n2209), .Y(n2146) );
  OAI221X4 U2018 ( .A0(n1615), .A1(n2234), .B0(n1893), .B1(n2232), .C0(n2247), 
        .Y(n2224) );
  OAI22X2 U2019 ( .A0(n2212), .A1(n1912), .B0(n1918), .B1(n2216), .Y(n2136) );
  OAI221X4 U2020 ( .A0(n1615), .A1(n2231), .B0(n1893), .B1(n2229), .C0(n2244), 
        .Y(n1921) );
  AOI221X4 U2021 ( .A0(n2242), .A1(n1601), .B0(n1867), .B1(n886), .C0(n2246), 
        .Y(n1918) );
  NAND2X2 U2022 ( .A(n1657), .B(n998), .Y(n1896) );
  NAND2X2 U2023 ( .A(n995), .B(n9000), .Y(n1931) );
  NAND2X2 U2024 ( .A(n9020), .B(n960), .Y(n1975) );
  NAND2X2 U2025 ( .A(n960), .B(n9000), .Y(n2259) );
  NAND2X2 U2026 ( .A(n1815), .B(n2256), .Y(n2005) );
  NAND3BX2 U2027 ( .AN(n1708), .B(n9000), .C(n998), .Y(n2257) );
  NAND2X2 U2028 ( .A(n960), .B(n1870), .Y(n2264) );
  NAND2X2 U2029 ( .A(n997), .B(n9020), .Y(n2263) );
  NAND2X2 U2030 ( .A(n1893), .B(n1894), .Y(n1824) );
  AOI33X2 U2031 ( .A0(n984), .A1(n1697), .A2(n1696), .B0(n1804), .B1(n8830), 
        .B2(n912), .Y(n1701) );
  XNOR2X1 U2032 ( .A(sub_410_aco_carry[4]), .B(n1656), .Y(N233) );
  XNOR2X1 U2033 ( .A(sub_410_aco_carry[3]), .B(n1650), .Y(N232) );
  OR2X1 U2034 ( .A(n1651), .B(sub_410_aco_carry[2]), .Y(sub_410_aco_carry[3])
         );
  XNOR2X1 U2035 ( .A(sub_410_aco_carry[2]), .B(n1651), .Y(N231) );
  OR2X1 U2036 ( .A(n1652), .B(sub_410_aco_carry[1]), .Y(sub_410_aco_carry[2])
         );
  XNOR2X1 U2037 ( .A(sub_410_aco_carry[1]), .B(n1652), .Y(N230) );
  OR2X1 U2038 ( .A(n1887), .B(n1653), .Y(sub_410_aco_carry[1]) );
  XNOR2X1 U2039 ( .A(n1653), .B(n1887), .Y(N229) );
  XOR2X1 U2040 ( .A(n1465), .B(add_430_aco_carry[5]), .Y(N250) );
  AND2X1 U2041 ( .A(add_430_aco_carry[4]), .B(n1656), .Y(add_430_aco_carry[5])
         );
  XOR2X1 U2042 ( .A(n1656), .B(add_430_aco_carry[4]), .Y(N249) );
  AND2X1 U2043 ( .A(n929), .B(N3702), .Y(add_430_aco_carry[4]) );
  XOR2X1 U2044 ( .A(N3702), .B(n1650), .Y(N248) );
  XNOR2X1 U2045 ( .A(n1465), .B(sub_420_aco_carry[5]), .Y(N242) );
  OR2X1 U2046 ( .A(n936), .B(sub_420_aco_carry[4]), .Y(sub_420_aco_carry[5])
         );
  XNOR2X1 U2047 ( .A(sub_420_aco_carry[4]), .B(n1656), .Y(N241) );
  OR2X1 U2048 ( .A(n1876), .B(n1650), .Y(sub_420_aco_carry[4]) );
  XNOR2X1 U2049 ( .A(n1650), .B(n1876), .Y(N240) );
  XNOR2X1 U2050 ( .A(n1465), .B(r696_carry_5_), .Y(N355) );
  OR2X1 U2051 ( .A(n1656), .B(n1650), .Y(r696_carry_5_) );
  XNOR2X1 U2052 ( .A(n1650), .B(n1656), .Y(N354) );
  XNOR2X1 U2053 ( .A(n1465), .B(r699_carry_5_), .Y(N411) );
  OR2X1 U2054 ( .A(n1656), .B(r699_carry_4_), .Y(r699_carry_5_) );
  XNOR2X1 U2055 ( .A(r699_carry_4_), .B(n1656), .Y(N410) );
  OR2X1 U2056 ( .A(n1650), .B(r699_carry_3_), .Y(r699_carry_4_) );
  XNOR2X1 U2057 ( .A(r699_carry_3_), .B(n1650), .Y(N409) );
  AND2X1 U2058 ( .A(r699_carry_2_), .B(n1651), .Y(r699_carry_3_) );
  XOR2X1 U2059 ( .A(n1651), .B(r699_carry_2_), .Y(N408) );
  AND2X1 U2060 ( .A(n16540), .B(n1652), .Y(r699_carry_2_) );
  XOR2X1 U2061 ( .A(n1652), .B(n1653), .Y(N407) );
  XOR2X1 U2062 ( .A(n1465), .B(add_804_carry[5]), .Y(N703) );
  OR2X1 U2063 ( .A(n1656), .B(add_804_carry[4]), .Y(add_804_carry[5]) );
  XNOR2X1 U2064 ( .A(add_804_carry[4]), .B(n1656), .Y(N702) );
  AND2X1 U2065 ( .A(add_804_carry[3]), .B(n1650), .Y(add_804_carry[4]) );
  XOR2X1 U2066 ( .A(n1650), .B(add_804_carry[3]), .Y(N701) );
  AND2X1 U2067 ( .A(n1652), .B(n1651), .Y(add_804_carry[3]) );
  XOR2X1 U2068 ( .A(n1651), .B(n1652), .Y(N700) );
  XOR2X1 U2069 ( .A(n1465), .B(add_727_carry_5_), .Y(N620) );
  AND2X1 U2070 ( .A(add_727_carry_4_), .B(n1656), .Y(add_727_carry_5_) );
  XOR2X1 U2071 ( .A(n1656), .B(add_727_carry_4_), .Y(N619) );
  OR2X1 U2072 ( .A(n1650), .B(add_727_carry_3_), .Y(add_727_carry_4_) );
  XNOR2X1 U2073 ( .A(add_727_carry_3_), .B(n1650), .Y(N618) );
  OR2X1 U2074 ( .A(n1651), .B(add_727_carry_2_), .Y(add_727_carry_3_) );
  XNOR2X1 U2075 ( .A(add_727_carry_2_), .B(n1651), .Y(N617) );
  OR2X1 U2076 ( .A(n1652), .B(n1653), .Y(add_727_carry_2_) );
  XNOR2X1 U2077 ( .A(n1653), .B(n1652), .Y(N616) );
  XNOR2X1 U2078 ( .A(n1465), .B(sub_503_carry_5_), .Y(N340) );
  OR2X1 U2079 ( .A(n1656), .B(sub_503_carry_4_), .Y(sub_503_carry_5_) );
  XNOR2X1 U2080 ( .A(sub_503_carry_4_), .B(n1656), .Y(N339) );
  AND2X1 U2081 ( .A(sub_503_carry_3_), .B(n1650), .Y(sub_503_carry_4_) );
  XOR2X1 U2082 ( .A(n1650), .B(sub_503_carry_3_), .Y(N338) );
  OR2X1 U2083 ( .A(n1651), .B(sub_503_carry_2_), .Y(sub_503_carry_3_) );
  XNOR2X1 U2084 ( .A(sub_503_carry_2_), .B(n1651), .Y(N337) );
  OR2X1 U2085 ( .A(n1652), .B(n1653), .Y(sub_503_carry_2_) );
  XNOR2X1 U2086 ( .A(n1653), .B(n1652), .Y(N336) );
  XNOR2X1 U2087 ( .A(n1465), .B(sub_580_carry[5]), .Y(N459) );
  OR2X1 U2088 ( .A(n1656), .B(sub_580_carry[4]), .Y(sub_580_carry[5]) );
  XNOR2X1 U2089 ( .A(sub_580_carry[4]), .B(n1656), .Y(N458) );
  OR2X1 U2090 ( .A(n1650), .B(sub_580_carry[3]), .Y(sub_580_carry[4]) );
  XNOR2X1 U2091 ( .A(sub_580_carry[3]), .B(n1650), .Y(N457) );
  AND2X1 U2092 ( .A(n1652), .B(n1651), .Y(sub_580_carry[3]) );
  XOR2X1 U2093 ( .A(n1651), .B(n1652), .Y(N456) );
  XOR2X1 U2094 ( .A(n1465), .B(r702_carry[5]), .Y(N479) );
  AND2X1 U2095 ( .A(r702_carry[4]), .B(n1656), .Y(r702_carry[5]) );
  XOR2X1 U2096 ( .A(n1656), .B(r702_carry[4]), .Y(N478) );
  AND2X1 U2097 ( .A(r702_carry[3]), .B(n1650), .Y(r702_carry[4]) );
  XOR2X1 U2098 ( .A(n1650), .B(r702_carry[3]), .Y(N477) );
  AND2X1 U2099 ( .A(n1652), .B(n1651), .Y(r702_carry[3]) );
  XOR2X1 U2100 ( .A(n1651), .B(n1652), .Y(N476) );
  XOR2X1 U2101 ( .A(n1465), .B(r703_carry_5_), .Y(N512) );
  AND2X1 U2102 ( .A(r703_carry_4_), .B(n1656), .Y(r703_carry_5_) );
  XOR2X1 U2103 ( .A(n1656), .B(r703_carry_4_), .Y(N511) );
  AND2X1 U2104 ( .A(r703_carry_3_), .B(n1650), .Y(r703_carry_4_) );
  XOR2X1 U2105 ( .A(n1650), .B(r703_carry_3_), .Y(N510) );
  OR2X1 U2106 ( .A(n1651), .B(r703_carry_2_), .Y(r703_carry_3_) );
  XNOR2X1 U2107 ( .A(r703_carry_2_), .B(n1651), .Y(N509) );
  OR2X1 U2108 ( .A(n1652), .B(n1653), .Y(r703_carry_2_) );
  XNOR2X1 U2109 ( .A(n1653), .B(n1652), .Y(N508) );
  XOR2X1 U2110 ( .A(n1656), .B(r704_carry[4]), .Y(N588) );
  OR2X1 U2111 ( .A(n1650), .B(r704_carry[3]), .Y(r704_carry[4]) );
  XNOR2X1 U2112 ( .A(r704_carry[3]), .B(n1650), .Y(N587) );
  AND2X1 U2113 ( .A(n1652), .B(n1651), .Y(r704_carry[3]) );
  XOR2X1 U2114 ( .A(n1651), .B(n1652), .Y(N586) );
  XOR2X1 U2115 ( .A(n1465), .B(n1656), .Y(N627) );
  XOR2X1 U2116 ( .A(n1465), .B(r707_carry_5_), .Y(N665) );
  OR2X1 U2117 ( .A(n1656), .B(r707_carry_4_), .Y(r707_carry_5_) );
  XNOR2X1 U2118 ( .A(r707_carry_4_), .B(n1656), .Y(N664) );
  AND2X1 U2119 ( .A(r707_carry_3_), .B(n1650), .Y(r707_carry_4_) );
  XOR2X1 U2120 ( .A(n1650), .B(r707_carry_3_), .Y(N663) );
  AND2X1 U2121 ( .A(r707_carry_2_), .B(n1651), .Y(r707_carry_3_) );
  XOR2X1 U2122 ( .A(n1651), .B(r707_carry_2_), .Y(N662) );
  AND2X1 U2123 ( .A(n16540), .B(n1652), .Y(r707_carry_2_) );
  XOR2X1 U2124 ( .A(n1652), .B(n1653), .Y(N661) );
  AND2X1 U2125 ( .A(r693_carry_4_), .B(n1656), .Y(r693_carry_5_) );
  OR2X1 U2126 ( .A(n1650), .B(r693_carry_3_), .Y(r693_carry_4_) );
  XNOR2X1 U2127 ( .A(r693_carry_3_), .B(n1650), .Y(N284) );
  AND2X1 U2128 ( .A(r693_carry_2_), .B(n1651), .Y(r693_carry_3_) );
  XOR2X1 U2129 ( .A(n1651), .B(r693_carry_2_), .Y(N283) );
  AND2X1 U2130 ( .A(n16540), .B(n1652), .Y(r693_carry_2_) );
  XOR2X1 U2131 ( .A(n1652), .B(n1653), .Y(N282) );
  XNOR2X1 U2132 ( .A(sub_1772_carry_5_), .B(n1474), .Y(read_access_32[5]) );
  XOR2X1 U2133 ( .A(r688_carry[5]), .B(n1465), .Y(N226) );
  NAND2BX1 U2134 ( .AN(n1652), .B(n1655), .Y(n1872) );
  OAI2BB1X1 U2135 ( .A0N(n16540), .A1N(n1652), .B0(n1872), .Y(N366) );
  NOR2X1 U2136 ( .A(n1872), .B(n1651), .Y(n1873) );
  AO21X1 U2137 ( .A0(n1872), .A1(n1651), .B0(n1873), .Y(N367) );
  NAND2X1 U2138 ( .A(n1873), .B(n1596), .Y(n1874) );
  OAI21XL U2139 ( .A0(n1873), .A1(n1596), .B0(n1874), .Y(N368) );
  XNOR2X1 U2140 ( .A(n1656), .B(n1874), .Y(N369) );
  NOR2X1 U2141 ( .A(n1656), .B(n1874), .Y(n1875) );
  XOR2X1 U2142 ( .A(n1465), .B(n1875), .Y(N370) );
  XOR2X1 U2143 ( .A(add_1046_carry[5]), .B(n1466), .Y(N883) );
  OAI221XL U2144 ( .A0(n1877), .A1(n1878), .B0(n1879), .B1(n1880), .C0(n1881), 
        .Y(zero_padding_buffer_r) );
  AOI21X1 U2145 ( .A0(n18820), .A1(n1883), .B0(n1884), .Y(n1881) );
  MXI2X1 U2146 ( .A(n18850), .B(n1886), .S0(n1887), .Y(n1884) );
  OAI22XL U2147 ( .A0(n1479), .A1(n1893), .B0(n1601), .B1(n1894), .Y(n1892) );
  OAI222XL U2148 ( .A0(n1486), .A1(n1615), .B0(n1471), .B1(n1896), .C0(n1384), 
        .C1(n1897), .Y(n1891) );
  OAI211X1 U2149 ( .A0(n1898), .A1(n1899), .B0(n1900), .C0(n1901), .Y(n18850)
         );
  NOR2BX1 U2150 ( .AN(n1902), .B(N3702), .Y(n1901) );
  AO22X1 U2151 ( .A0(n1869), .A1(n1478), .B0(n1867), .B1(n1383), .Y(n1899) );
  OAI221XL U2152 ( .A0(n1896), .A1(n8990), .B0(n1615), .B1(n8980), .C0(n1903), 
        .Y(n1898) );
  OAI21XL U2153 ( .A0(N3702), .A1(n1904), .B0(n1905), .Y(n1883) );
  OAI32X1 U2154 ( .A0(n1906), .A1(n1907), .A2(n1908), .B0(n1909), .B1(n1910), 
        .Y(n1905) );
  OAI22XL U2155 ( .A0(n1893), .A1(n8810), .B0(n1615), .B1(n911), .Y(n1910) );
  OAI222XL U2156 ( .A0(n1897), .A1(n916), .B0(n1896), .B1(n8680), .C0(n1894), 
        .C1(n889), .Y(n1909) );
  CLKINVX1 U2157 ( .A(n1911), .Y(n1908) );
  CLKINVX1 U2158 ( .A(n1912), .Y(n1906) );
  OAI21XL U2159 ( .A0(n1871), .A1(n1917), .B0(n1911), .Y(n1902) );
  NAND3X1 U2160 ( .A(n1920), .B(n1921), .C(n1922), .Y(n1880) );
  NAND3X1 U2161 ( .A(n1912), .B(n1911), .C(n1913), .Y(n1879) );
  OAI21XL U2162 ( .A0(n8820), .A1(n925), .B0(n1923), .Y(n1878) );
  OAI211X1 U2163 ( .A0(n1924), .A1(n1925), .B0(n1871), .C0(n1029), .Y(n1877)
         );
  OAI22XL U2164 ( .A0(n1478), .A1(n1893), .B0(n1485), .B1(n1615), .Y(n1925) );
  CLKINVX1 U2165 ( .A(n1926), .Y(n1924) );
  AOI211X1 U2166 ( .A0(n8990), .A1(n1868), .B0(n1927), .C0(n1928), .Y(n1926)
         );
  MXI2X1 U2167 ( .A(n1929), .B(n1930), .S0(n1383), .Y(sobel_count_r[1]) );
  MXI2X1 U2168 ( .A(n1931), .B(n916), .S0(n15810), .Y(n1930) );
  NAND2X1 U2169 ( .A(n15810), .B(n1384), .Y(n1929) );
  MXI2X1 U2170 ( .A(n1932), .B(n1384), .S0(n15810), .Y(sobel_count_r[0]) );
  NAND2X1 U2171 ( .A(n1384), .B(n1931), .Y(n1932) );
  CLKMX2X2 U2172 ( .A(n1385), .B(sobel_result[9]), .S0(n1642), .Y(
        sobel_answers_r[9]) );
  CLKMX2X2 U2173 ( .A(n1386), .B(sobel_result[8]), .S0(n16380), .Y(
        sobel_answers_r[8]) );
  CLKMX2X2 U2174 ( .A(n1387), .B(sobel_result[7]), .S0(n1639), .Y(
        sobel_answers_r[7]) );
  CLKMX2X2 U2175 ( .A(n1388), .B(sobel_result[6]), .S0(n1640), .Y(
        sobel_answers_r[6]) );
  CLKMX2X2 U2176 ( .A(n1389), .B(sobel_result[5]), .S0(n1641), .Y(
        sobel_answers_r[5]) );
  CLKMX2X2 U2177 ( .A(n1390), .B(sobel_result[4]), .S0(n1641), .Y(
        sobel_answers_r[4]) );
  CLKMX2X2 U2178 ( .A(n1391), .B(sobel_result[3]), .S0(n1641), .Y(
        sobel_answers_r[3]) );
  CLKMX2X2 U2179 ( .A(n1393), .B(sobel_result[1]), .S0(n1641), .Y(
        sobel_answers_r[1]) );
  CLKMX2X2 U2180 ( .A(n1394), .B(sobel_result[13]), .S0(n1641), .Y(
        sobel_answers_r[13]) );
  CLKMX2X2 U2181 ( .A(n1395), .B(sobel_result[12]), .S0(n1642), .Y(
        sobel_answers_r[12]) );
  CLKMX2X2 U2182 ( .A(n1396), .B(sobel_result[11]), .S0(n1642), .Y(
        sobel_answers_r[11]) );
  CLKMX2X2 U2183 ( .A(n1397), .B(sobel_result[10]), .S0(n1642), .Y(
        sobel_answers_r[10]) );
  CLKMX2X2 U2184 ( .A(n1385), .B(n1399), .S0(n1637), .Y(sobel_answers_r[23])
         );
  CLKMX2X2 U2185 ( .A(n1386), .B(n1400), .S0(n1637), .Y(sobel_answers_r[22])
         );
  CLKMX2X2 U2186 ( .A(n1387), .B(n1401), .S0(n1637), .Y(sobel_answers_r[21])
         );
  CLKMX2X2 U2187 ( .A(n1388), .B(n1402), .S0(n1637), .Y(sobel_answers_r[20])
         );
  CLKMX2X2 U2188 ( .A(n1389), .B(n1403), .S0(n1637), .Y(sobel_answers_r[19])
         );
  CLKMX2X2 U2189 ( .A(n1390), .B(n1404), .S0(n1637), .Y(sobel_answers_r[18])
         );
  CLKMX2X2 U2190 ( .A(n1391), .B(n1405), .S0(n1637), .Y(sobel_answers_r[17])
         );
  CLKMX2X2 U2191 ( .A(n1394), .B(n1408), .S0(n1636), .Y(sobel_answers_r[27])
         );
  CLKMX2X2 U2192 ( .A(n1395), .B(n1409), .S0(n1636), .Y(sobel_answers_r[26])
         );
  CLKMX2X2 U2193 ( .A(n1396), .B(n1410), .S0(n1636), .Y(sobel_answers_r[25])
         );
  CLKMX2X2 U2194 ( .A(n1397), .B(n1411), .S0(n1636), .Y(sobel_answers_r[24])
         );
  CLKMX2X2 U2195 ( .A(n1399), .B(n1413), .S0(n1636), .Y(sobel_answers_r[37])
         );
  CLKMX2X2 U2196 ( .A(n1400), .B(n1414), .S0(n1636), .Y(sobel_answers_r[36])
         );
  CLKMX2X2 U2197 ( .A(n1401), .B(n1415), .S0(n1636), .Y(sobel_answers_r[35])
         );
  CLKMX2X2 U2198 ( .A(n1402), .B(n1416), .S0(n1636), .Y(sobel_answers_r[34])
         );
  CLKMX2X2 U2199 ( .A(n1403), .B(n1417), .S0(n1636), .Y(sobel_answers_r[33])
         );
  CLKMX2X2 U2200 ( .A(n1404), .B(n1418), .S0(n1636), .Y(sobel_answers_r[32])
         );
  CLKMX2X2 U2201 ( .A(n1405), .B(n1419), .S0(n1635), .Y(sobel_answers_r[31])
         );
  CLKMX2X2 U2202 ( .A(n1408), .B(n1422), .S0(n1635), .Y(sobel_answers_r[41])
         );
  CLKMX2X2 U2203 ( .A(n1409), .B(n1423), .S0(n1635), .Y(sobel_answers_r[40])
         );
  CLKMX2X2 U2204 ( .A(n1410), .B(n1424), .S0(n1635), .Y(sobel_answers_r[39])
         );
  CLKMX2X2 U2205 ( .A(n1411), .B(n1425), .S0(n1635), .Y(sobel_answers_r[38])
         );
  CLKMX2X2 U2206 ( .A(n1413), .B(n1427), .S0(n1635), .Y(sobel_answers_r[51])
         );
  CLKMX2X2 U2207 ( .A(n1414), .B(n1428), .S0(n1635), .Y(sobel_answers_r[50])
         );
  CLKMX2X2 U2208 ( .A(n1415), .B(n1429), .S0(n1635), .Y(sobel_answers_r[49])
         );
  CLKMX2X2 U2209 ( .A(n1416), .B(n1430), .S0(n1635), .Y(sobel_answers_r[48])
         );
  CLKMX2X2 U2210 ( .A(n1417), .B(n1431), .S0(n1635), .Y(sobel_answers_r[47])
         );
  CLKMX2X2 U2211 ( .A(n1418), .B(n1432), .S0(n1634), .Y(sobel_answers_r[46])
         );
  CLKMX2X2 U2212 ( .A(n1419), .B(n1433), .S0(n1634), .Y(sobel_answers_r[45])
         );
  CLKMX2X2 U2213 ( .A(n1422), .B(n1436), .S0(n1634), .Y(sobel_answers_r[55])
         );
  CLKMX2X2 U2214 ( .A(n1423), .B(n1437), .S0(n1634), .Y(sobel_answers_r[54])
         );
  CLKMX2X2 U2215 ( .A(n1424), .B(n1438), .S0(n1634), .Y(sobel_answers_r[53])
         );
  CLKMX2X2 U2216 ( .A(n1425), .B(n1439), .S0(n1634), .Y(sobel_answers_r[52])
         );
  NAND2X1 U2217 ( .A(conv_temp_2[9]), .B(n1616), .Y(n1934) );
  NAND2X1 U2218 ( .A(conv_temp_2[8]), .B(n1616), .Y(n1939) );
  NAND3X1 U2219 ( .A(n1941), .B(n1942), .C(n1943), .Y(n2277) );
  AOI222XL U2220 ( .A0(median_result[7]), .A1(n1864), .B0(read_data_r[7]), 
        .B1(n1944), .C0(conv_temp_2[7]), .C1(n1616), .Y(n1943) );
  AOI22X1 U2221 ( .A0(n1401), .A1(n1938), .B0(n1387), .B1(n1937), .Y(n1942) );
  AOI22X1 U2222 ( .A0(n1429), .A1(n1617), .B0(n1415), .B1(n1945), .Y(n1941) );
  AOI222XL U2223 ( .A0(median_result[6]), .A1(n1864), .B0(read_data_r[6]), 
        .B1(n1944), .C0(conv_temp_2[6]), .C1(n1616), .Y(n1948) );
  AOI22X1 U2224 ( .A0(n1402), .A1(n1938), .B0(n1388), .B1(n1937), .Y(n1947) );
  AOI22X1 U2225 ( .A0(n1430), .A1(n1617), .B0(n1416), .B1(n1945), .Y(n1946) );
  NAND3X1 U2226 ( .A(n1949), .B(n1950), .C(n1951), .Y(n2279) );
  AOI222XL U2227 ( .A0(median_result[5]), .A1(n1864), .B0(read_data_r[5]), 
        .B1(n1944), .C0(conv_temp_2[5]), .C1(n1616), .Y(n1951) );
  AOI22X1 U2228 ( .A0(n1403), .A1(n1938), .B0(n1389), .B1(n1937), .Y(n1950) );
  AOI22X1 U2229 ( .A0(n1431), .A1(n1617), .B0(n1417), .B1(n1945), .Y(n1949) );
  NAND3X1 U2230 ( .A(n1952), .B(n1953), .C(n1954), .Y(n2280) );
  AOI22X1 U2231 ( .A0(n1404), .A1(n1938), .B0(n1390), .B1(n1937), .Y(n1953) );
  AOI22X1 U2232 ( .A0(n1432), .A1(n1617), .B0(n1418), .B1(n1945), .Y(n1952) );
  NAND3X1 U2233 ( .A(n1955), .B(n1956), .C(n1957), .Y(n2281) );
  AOI222XL U2234 ( .A0(median_result[3]), .A1(n1864), .B0(read_data_r[3]), 
        .B1(n1944), .C0(conv_temp_2[3]), .C1(n1616), .Y(n1957) );
  AOI22X1 U2235 ( .A0(n1405), .A1(n1938), .B0(n1391), .B1(n1937), .Y(n1956) );
  AOI22X1 U2236 ( .A0(n1433), .A1(n1617), .B0(n1419), .B1(n1945), .Y(n1955) );
  NAND3X1 U2237 ( .A(n1958), .B(n1959), .C(n1960), .Y(n2282) );
  AOI222XL U2238 ( .A0(median_result[2]), .A1(n1864), .B0(read_data_r[2]), 
        .B1(n1944), .C0(conv_temp_2[2]), .C1(n1616), .Y(n1960) );
  AOI22X1 U2239 ( .A0(n1434), .A1(n1617), .B0(n1420), .B1(n1945), .Y(n1958) );
  NAND3X1 U2240 ( .A(n1961), .B(n1962), .C(n1963), .Y(n2283) );
  AOI222XL U2241 ( .A0(median_result[1]), .A1(n1864), .B0(read_data_r[1]), 
        .B1(n1944), .C0(conv_temp_2[1]), .C1(n1616), .Y(n1963) );
  AOI22X1 U2242 ( .A0(n1435), .A1(n1617), .B0(n1421), .B1(n1945), .Y(n1961) );
  NAND2X1 U2243 ( .A(conv_temp_2[12]), .B(n1616), .Y(n1966) );
  OAI211X1 U2244 ( .A0(n949), .A1(n1933), .B0(n1968), .C0(n1969), .Y(n2273) );
  OAI211X1 U2245 ( .A0(n950), .A1(n1933), .B0(n1970), .C0(n1971), .Y(n2274) );
  NAND2X1 U2246 ( .A(conv_temp_2[10]), .B(n1616), .Y(n1970) );
  NAND3X1 U2247 ( .A(n1972), .B(n1973), .C(n1974), .Y(n2284) );
  AOI222XL U2248 ( .A0(median_result[0]), .A1(n1864), .B0(read_data_r[0]), 
        .B1(n1944), .C0(conv_temp_2[0]), .C1(n1616), .Y(n1974) );
  NOR2BX1 U2249 ( .AN(N1826), .B(n1458), .Y(n1980) );
  CLKMX2X2 U2250 ( .A(n1983), .B(n1984), .S0(n1459), .Y(n1981) );
  MXI2X1 U2251 ( .A(N1760), .B(N1738), .S0(n1460), .Y(n1984) );
  AOI22X1 U2252 ( .A0(n1440), .A1(n1617), .B0(n1426), .B1(n1945), .Y(n1972) );
  MXI2X1 U2253 ( .A(N1707), .B(N1685), .S0(n1462), .Y(n1987) );
  NAND2X1 U2254 ( .A(N1690), .B(n938), .Y(n1986) );
  OAI211X1 U2255 ( .A0(n1989), .A1(n1990), .B0(n1982), .C0(n1991), .Y(n1988)
         );
  NOR2X1 U2256 ( .A(n1456), .B(n1612), .Y(n1991) );
  CLKINVX1 U2257 ( .A(n1979), .Y(n1982) );
  MXI2X1 U2258 ( .A(n1994), .B(N1638), .S0(n1995), .Y(n1989) );
  NOR2X1 U2259 ( .A(n1463), .B(n8950), .Y(n1995) );
  NAND2X1 U2260 ( .A(n1992), .B(n1993), .Y(n1994) );
  OR2X1 U2261 ( .A(n1463), .B(n1464), .Y(n1993) );
  NAND2X1 U2262 ( .A(n1463), .B(n8950), .Y(n1992) );
  MXI2X1 U2263 ( .A(n1996), .B(n1997), .S0(n1449), .Y(median_output_r[3]) );
  OA21XL U2264 ( .A0(n1450), .A1(n1998), .B0(n1999), .Y(n1997) );
  MXI2X1 U2265 ( .A(n2001), .B(n2002), .S0(n1451), .Y(median_output_r[1]) );
  NAND2X1 U2266 ( .A(n1864), .B(n1601), .Y(n2001) );
  NAND2X1 U2267 ( .A(n1864), .B(n889), .Y(n2002) );
  AO22X1 U2268 ( .A0(N1584), .A1(n1631), .B0(n1305), .B1(n1618), .Y(conv_r[8])
         );
  AO22X1 U2269 ( .A0(N1583), .A1(n1631), .B0(n1306), .B1(n1618), .Y(conv_r[7])
         );
  AO22X1 U2270 ( .A0(N1582), .A1(n1631), .B0(n1307), .B1(n1618), .Y(conv_r[6])
         );
  AO22X1 U2271 ( .A0(N1581), .A1(n1631), .B0(n1308), .B1(n1618), .Y(conv_r[5])
         );
  AO22X1 U2272 ( .A0(N1577), .A1(n1631), .B0(n1312), .B1(n1618), .Y(conv_r[1])
         );
  AO22X1 U2273 ( .A0(N1576), .A1(n1631), .B0(n1313), .B1(n1618), .Y(conv_r[0])
         );
  AO22X1 U2274 ( .A0(N1586), .A1(n1631), .B0(n1319), .B1(n1618), .Y(conv_r[10]) );
  AO22X1 U2275 ( .A0(N1585), .A1(n1631), .B0(n1320), .B1(n1618), .Y(conv_r[9])
         );
  AO22X1 U2276 ( .A0(N1566), .A1(n1629), .B0(n1322), .B1(n2007), .Y(conv_r[19]) );
  AO22X1 U2277 ( .A0(N1565), .A1(n1629), .B0(n1323), .B1(n2007), .Y(conv_r[18]) );
  AO22X1 U2278 ( .A0(N1564), .A1(n1629), .B0(n1324), .B1(n2007), .Y(conv_r[17]) );
  AO22X1 U2279 ( .A0(N1563), .A1(n1629), .B0(n1325), .B1(n2007), .Y(conv_r[16]) );
  AO22X1 U2280 ( .A0(N1562), .A1(n1629), .B0(n1326), .B1(n2007), .Y(conv_r[15]) );
  AO22X1 U2281 ( .A0(N1561), .A1(n1629), .B0(n1327), .B1(n2007), .Y(conv_r[14]) );
  AO22X1 U2282 ( .A0(N1560), .A1(n1629), .B0(n1328), .B1(n2007), .Y(conv_r[13]) );
  AO22X1 U2283 ( .A0(N1559), .A1(n1629), .B0(n1329), .B1(n2007), .Y(conv_r[12]) );
  AO22X1 U2284 ( .A0(N1558), .A1(n1629), .B0(n1330), .B1(n2007), .Y(conv_r[11]) );
  AO22X1 U2285 ( .A0(N1568), .A1(n1629), .B0(n1336), .B1(n2007), .Y(conv_r[21]) );
  AO22X1 U2286 ( .A0(N1567), .A1(n1629), .B0(n1337), .B1(n2007), .Y(conv_r[20]) );
  AO22X1 U2287 ( .A0(N1548), .A1(n1633), .B0(n1339), .B1(n2009), .Y(conv_r[30]) );
  AO22X1 U2288 ( .A0(N1547), .A1(n1633), .B0(n1340), .B1(n2009), .Y(conv_r[29]) );
  AO22X1 U2289 ( .A0(N1546), .A1(n1633), .B0(n1341), .B1(n2009), .Y(conv_r[28]) );
  AO22X1 U2290 ( .A0(N1545), .A1(n1633), .B0(n1342), .B1(n2009), .Y(conv_r[27]) );
  AO22X1 U2291 ( .A0(N1544), .A1(n1633), .B0(n1343), .B1(n2009), .Y(conv_r[26]) );
  AO22X1 U2292 ( .A0(N1543), .A1(n1633), .B0(n1344), .B1(n2009), .Y(conv_r[25]) );
  AO22X1 U2293 ( .A0(N1542), .A1(n1633), .B0(n1345), .B1(n2009), .Y(conv_r[24]) );
  AO22X1 U2294 ( .A0(N1541), .A1(n1633), .B0(n1346), .B1(n2009), .Y(conv_r[23]) );
  AO22X1 U2295 ( .A0(N1540), .A1(n1633), .B0(n1347), .B1(n2009), .Y(conv_r[22]) );
  AO22X1 U2296 ( .A0(N1550), .A1(n1633), .B0(n1353), .B1(n2009), .Y(conv_r[32]) );
  AO22X1 U2297 ( .A0(N1549), .A1(n1633), .B0(n1354), .B1(n2009), .Y(conv_r[31]) );
  AO22X1 U2298 ( .A0(N1530), .A1(n1627), .B0(n1356), .B1(n856), .Y(conv_r[41])
         );
  AO22X1 U2299 ( .A0(N1529), .A1(n1627), .B0(n1357), .B1(n856), .Y(conv_r[40])
         );
  AO22X1 U2300 ( .A0(N1528), .A1(n1627), .B0(n1358), .B1(n856), .Y(conv_r[39])
         );
  AO22X1 U2301 ( .A0(N1527), .A1(n1627), .B0(n1359), .B1(n856), .Y(conv_r[38])
         );
  AO22X1 U2302 ( .A0(N1523), .A1(n1627), .B0(n1363), .B1(n856), .Y(conv_r[34])
         );
  AO22X1 U2303 ( .A0(N1522), .A1(n1627), .B0(n1364), .B1(n856), .Y(conv_r[33])
         );
  AO22X1 U2304 ( .A0(N1532), .A1(n1627), .B0(n1370), .B1(n856), .Y(conv_r[43])
         );
  AO22X1 U2305 ( .A0(N1531), .A1(n1627), .B0(n1371), .B1(n856), .Y(conv_r[42])
         );
  OAI221XL U2306 ( .A0(n922), .A1(n8690), .B0(n892), .B1(n1619), .C0(n2012), 
        .Y(conv_temp[9]) );
  OAI221XL U2307 ( .A0(n890), .A1(n8690), .B0(n917), .B1(n1619), .C0(n2013), 
        .Y(conv_temp[8]) );
  OAI221XL U2308 ( .A0(n9150), .A1(n8690), .B0(n888), .B1(n1619), .C0(n2014), 
        .Y(conv_temp[7]) );
  OAI221XL U2309 ( .A0(n914), .A1(n8690), .B0(n884), .B1(n1619), .C0(n2015), 
        .Y(conv_temp[6]) );
  OAI221XL U2310 ( .A0(n9060), .A1(n8690), .B0(n878), .B1(n1619), .C0(n2016), 
        .Y(conv_temp[5]) );
  OAI221XL U2311 ( .A0(n1005), .A1(n8690), .B0(n1009), .B1(n1619), .C0(n2019), 
        .Y(conv_temp[16]) );
  OAI221XL U2312 ( .A0(n1023), .A1(n8690), .B0(n1027), .B1(n1619), .C0(n2021), 
        .Y(conv_temp[14]) );
  OAI221XL U2313 ( .A0(n1033), .A1(n8690), .B0(n1037), .B1(n1619), .C0(n2022), 
        .Y(conv_temp[13]) );
  OAI221XL U2314 ( .A0(n1043), .A1(n8690), .B0(n1047), .B1(n1619), .C0(n2023), 
        .Y(conv_temp[12]) );
  OAI221XL U2315 ( .A0(n926), .A1(n8690), .B0(n894), .B1(n1619), .C0(n2024), 
        .Y(conv_temp[11]) );
  OAI221XL U2316 ( .A0(n924), .A1(n8690), .B0(n893), .B1(n1619), .C0(n2025), 
        .Y(conv_temp[10]) );
  OAI2BB2XL U2317 ( .B0(n2026), .B1(n9040), .A0N(n1616), .A1N(n8750), .Y(
        conv_output_r[2]) );
  AOI2BB1X1 U2318 ( .A0N(n1452), .A1N(n2027), .B0(conv_output_r[0]), .Y(n2026)
         );
  NAND2X1 U2319 ( .A(n1602), .B(n1616), .Y(n2028) );
  CLKINVX1 U2320 ( .A(n2029), .Y(conv_output_r[0]) );
  NAND2X1 U2321 ( .A(n1616), .B(n978), .Y(n2029) );
  NOR2BX1 U2322 ( .AN(N883), .B(n2030), .Y(conv_channels_8_r[5]) );
  NOR2BX1 U2323 ( .AN(N882), .B(n2030), .Y(conv_channels_8_r[4]) );
  NOR2BX1 U2324 ( .AN(N881), .B(n2030), .Y(conv_channels_8_r[3]) );
  NOR2BX1 U2325 ( .AN(N880), .B(n2030), .Y(conv_channels_8_r[2]) );
  NOR2BX1 U2326 ( .AN(N879), .B(n2030), .Y(conv_channels_8_r[1]) );
  NOR2BX1 U2327 ( .AN(n8680), .B(n2030), .Y(conv_channels_8_r[0]) );
  NOR2BX1 U2328 ( .AN(N866), .B(n2031), .Y(conv_channels_32_r[7]) );
  NOR2BX1 U2329 ( .AN(N865), .B(n2031), .Y(conv_channels_32_r[6]) );
  NOR2BX1 U2330 ( .AN(N864), .B(n2031), .Y(conv_channels_32_r[5]) );
  NOR2BX1 U2331 ( .AN(N863), .B(n2031), .Y(conv_channels_32_r[4]) );
  NOR2BX1 U2332 ( .AN(N862), .B(n2031), .Y(conv_channels_32_r[3]) );
  NOR2BX1 U2333 ( .AN(N861), .B(n2031), .Y(conv_channels_32_r[2]) );
  NOR2BX1 U2334 ( .AN(N860), .B(n2031), .Y(conv_channels_32_r[1]) );
  NOR2BX1 U2335 ( .AN(N859), .B(n2031), .Y(conv_channels_32_r[0]) );
  NOR2BX1 U2336 ( .AN(N870), .B(n2032), .Y(conv_channels_16_r[1]) );
  NOR2BX1 U2337 ( .AN(N869), .B(n2032), .Y(conv_channels_16_r[0]) );
  AND2X1 U2338 ( .A(n1507), .B(n1647), .Y(a9[7]) );
  AND2X1 U2339 ( .A(n1516), .B(n1647), .Y(a9[6]) );
  AND2X1 U2340 ( .A(n15250), .B(n1647), .Y(a9[5]) );
  AND2X1 U2341 ( .A(n15340), .B(n1647), .Y(a9[4]) );
  AND2X1 U2342 ( .A(n15430), .B(n1647), .Y(a9[3]) );
  AND2X1 U2343 ( .A(n1506), .B(n1647), .Y(a8[7]) );
  AND2X1 U2344 ( .A(n1515), .B(n1647), .Y(a8[6]) );
  AND2X1 U2345 ( .A(n15240), .B(n1647), .Y(a8[5]) );
  AND2X1 U2346 ( .A(n15330), .B(n1647), .Y(a8[4]) );
  AND2X1 U2347 ( .A(n15420), .B(n1646), .Y(a8[3]) );
  AND2X1 U2348 ( .A(n15510), .B(n1646), .Y(a8[2]) );
  AND2X1 U2349 ( .A(n15600), .B(n1646), .Y(a8[1]) );
  AND2X1 U2350 ( .A(n15690), .B(n1646), .Y(a8[0]) );
  AND2X1 U2351 ( .A(n1505), .B(n1646), .Y(a7[7]) );
  AND2X1 U2352 ( .A(n1514), .B(n1646), .Y(a7[6]) );
  AND2X1 U2353 ( .A(n15230), .B(n1646), .Y(a7[5]) );
  AND2X1 U2354 ( .A(n15320), .B(n1646), .Y(a7[4]) );
  AND2X1 U2355 ( .A(n15410), .B(n1646), .Y(a7[3]) );
  AND2X1 U2356 ( .A(n15500), .B(n1646), .Y(a7[2]) );
  AND2X1 U2357 ( .A(n15590), .B(n1646), .Y(a7[1]) );
  AND2X1 U2358 ( .A(n1504), .B(n1644), .Y(a6[7]) );
  AND2X1 U2359 ( .A(n1513), .B(n1644), .Y(a6[6]) );
  AND2X1 U2360 ( .A(n15220), .B(n1644), .Y(a6[5]) );
  AND2X1 U2361 ( .A(n15310), .B(n1644), .Y(a6[4]) );
  AND2X1 U2362 ( .A(n15400), .B(n1644), .Y(a6[3]) );
  AND2X1 U2363 ( .A(n15490), .B(n1644), .Y(a6[2]) );
  AND2X1 U2364 ( .A(n1503), .B(n1649), .Y(\a5[7] ) );
  AND2X1 U2365 ( .A(n1512), .B(n1649), .Y(\a5[6] ) );
  AND2X1 U2366 ( .A(n15210), .B(n1643), .Y(\a5[5] ) );
  AND2X1 U2367 ( .A(n15300), .B(n1645), .Y(\a5[4] ) );
  AND2X1 U2368 ( .A(n15390), .B(n1645), .Y(\a5[3] ) );
  AND2X1 U2369 ( .A(n15480), .B(n1645), .Y(\a5[2] ) );
  AND2X1 U2370 ( .A(n15570), .B(n1645), .Y(\a5[1] ) );
  AND2X1 U2371 ( .A(n15660), .B(n1645), .Y(\a5[0] ) );
  AND2X1 U2372 ( .A(n1502), .B(n1645), .Y(a4[7]) );
  AND2X1 U2373 ( .A(n1511), .B(n1645), .Y(a4[6]) );
  AND2X1 U2374 ( .A(n1520), .B(n1645), .Y(a4[5]) );
  AND2X1 U2375 ( .A(n15290), .B(n1645), .Y(a4[4]) );
  AND2X1 U2376 ( .A(n1538), .B(n1645), .Y(a4[3]) );
  AND2X1 U2377 ( .A(n1501), .B(n1644), .Y(a3[7]) );
  AND2X1 U2378 ( .A(n1510), .B(n1644), .Y(a3[6]) );
  AND2X1 U2379 ( .A(n1519), .B(n1644), .Y(a3[5]) );
  AND2X1 U2380 ( .A(n15280), .B(n1644), .Y(a3[4]) );
  AND2X1 U2381 ( .A(n15370), .B(n1644), .Y(a3[3]) );
  AND2X1 U2382 ( .A(n1500), .B(n1644), .Y(a2[7]) );
  AND2X1 U2383 ( .A(n1509), .B(n1644), .Y(a2[6]) );
  AND2X1 U2384 ( .A(n1518), .B(n1644), .Y(a2[5]) );
  AND2X1 U2385 ( .A(n15270), .B(n1644), .Y(a2[4]) );
  AND2X1 U2386 ( .A(n15360), .B(n1643), .Y(a2[3]) );
  AND2X1 U2387 ( .A(n15450), .B(n1643), .Y(a2[2]) );
  AND2X1 U2388 ( .A(n15540), .B(n1643), .Y(a2[1]) );
  AND2X1 U2389 ( .A(n15630), .B(n1643), .Y(a2[0]) );
  AND2X1 U2390 ( .A(n1499), .B(n1643), .Y(a1[7]) );
  AND2X1 U2391 ( .A(n1508), .B(n1643), .Y(a1[6]) );
  AND2X1 U2392 ( .A(n1517), .B(n1643), .Y(a1[5]) );
  AND2X1 U2393 ( .A(n15260), .B(n1643), .Y(a1[4]) );
  AND2X1 U2394 ( .A(N901), .B(n1593), .Y(SRAM_load_data_r[3]) );
  AND2X1 U2395 ( .A(N900), .B(n1593), .Y(SRAM_load_data_r[2]) );
  AND2X1 U2396 ( .A(N899), .B(n1593), .Y(SRAM_load_data_r[1]) );
  AND2X1 U2397 ( .A(N898), .B(n1593), .Y(SRAM_load_data_r[0]) );
  MXI2X1 U2398 ( .A(n2041), .B(n2040), .S0(n1453), .Y(SRAM_load_count_r[2]) );
  AOI2BB1X1 U2399 ( .A0N(n1454), .A1N(n2039), .B0(SRAM_load_count_r[0]), .Y(
        n2040) );
  NAND3X1 U2400 ( .A(n1603), .B(n2042), .C(n1454), .Y(n2041) );
  MXI2X1 U2401 ( .A(n2043), .B(n2044), .S0(n1454), .Y(SRAM_load_count_r[1]) );
  NAND2X1 U2402 ( .A(n1603), .B(n2042), .Y(n2043) );
  CLKINVX1 U2403 ( .A(n2044), .Y(SRAM_load_count_r[0]) );
  NAND2X1 U2404 ( .A(n2042), .B(n8820), .Y(n2044) );
  CLKINVX1 U2405 ( .A(n1621), .Y(SRAM_WEN_4_r) );
  NAND2X1 U2406 ( .A(n2048), .B(n2049), .Y(read_data_r[7]) );
  AOI22X1 U2407 ( .A0(SRAM_READ_DATA_4[7]), .A1(n2050), .B0(
        SRAM_READ_DATA_3[7]), .B1(n2051), .Y(n2049) );
  AOI22X1 U2408 ( .A0(SRAM_READ_DATA_2[7]), .A1(n2052), .B0(
        SRAM_READ_DATA_1[7]), .B1(n2053), .Y(n2048) );
  NAND2X1 U2409 ( .A(n2054), .B(n2055), .Y(read_data_r[6]) );
  AOI22X1 U2410 ( .A0(SRAM_READ_DATA_4[6]), .A1(n2050), .B0(
        SRAM_READ_DATA_3[6]), .B1(n2051), .Y(n2055) );
  AOI22X1 U2411 ( .A0(SRAM_READ_DATA_2[6]), .A1(n2052), .B0(
        SRAM_READ_DATA_1[6]), .B1(n2053), .Y(n2054) );
  NAND2X1 U2412 ( .A(n2056), .B(n2057), .Y(read_data_r[5]) );
  NAND2X1 U2413 ( .A(n2058), .B(n2059), .Y(read_data_r[4]) );
  NAND2X1 U2414 ( .A(n2060), .B(n2061), .Y(read_data_r[3]) );
  NAND2X1 U2415 ( .A(n2062), .B(n2063), .Y(read_data_r[2]) );
  NAND2X1 U2416 ( .A(n2064), .B(n2065), .Y(read_data_r[1]) );
  NAND2X1 U2417 ( .A(n2066), .B(n2067), .Y(read_data_r[0]) );
  OAI31XL U2418 ( .A0(n2074), .A1(n2075), .A2(n2076), .B0(n923), .Y(n2073) );
  OAI32X1 U2419 ( .A0(n1976), .A1(read_access_32[6]), .A2(read_access_32[5]), 
        .B0(n1893), .B1(n2077), .Y(n2076) );
  NOR2X1 U2420 ( .A(n1481), .B(n1615), .Y(n2075) );
  OAI21XL U2421 ( .A0(read_access_16_5_), .A1(n1975), .B0(n2078), .Y(n2074) );
  CLKINVX1 U2422 ( .A(n2079), .Y(n2078) );
  OAI2BB2XL U2423 ( .B0(n1615), .B1(n919), .A0N(n1863), .A1N(read_access_16_5_), .Y(n2081) );
  CLKINVX1 U2424 ( .A(read_access_32[5]), .Y(n2069) );
  NOR2X1 U2425 ( .A(n1620), .B(n1604), .Y(SRAM_INPUT_DATA_4_r[7]) );
  NOR2X1 U2426 ( .A(n1620), .B(n1605), .Y(SRAM_INPUT_DATA_4_r[6]) );
  NOR2X1 U2427 ( .A(n1620), .B(n1606), .Y(SRAM_INPUT_DATA_4_r[5]) );
  NOR2X1 U2428 ( .A(n1620), .B(n1607), .Y(SRAM_INPUT_DATA_4_r[4]) );
  NOR2X1 U2429 ( .A(n1620), .B(n1608), .Y(SRAM_INPUT_DATA_4_r[3]) );
  NOR2X1 U2430 ( .A(n1620), .B(n1609), .Y(SRAM_INPUT_DATA_4_r[2]) );
  NOR2X1 U2431 ( .A(n1620), .B(n1610), .Y(SRAM_INPUT_DATA_4_r[1]) );
  NOR2X1 U2432 ( .A(n1620), .B(n1611), .Y(SRAM_INPUT_DATA_4_r[0]) );
  NOR2X1 U2433 ( .A(n1604), .B(n16220), .Y(SRAM_INPUT_DATA_3_r[7]) );
  NOR2X1 U2434 ( .A(n1605), .B(n16220), .Y(SRAM_INPUT_DATA_3_r[6]) );
  NOR2X1 U2435 ( .A(n1606), .B(n16220), .Y(SRAM_INPUT_DATA_3_r[5]) );
  NOR2X1 U2436 ( .A(n1607), .B(n16220), .Y(SRAM_INPUT_DATA_3_r[4]) );
  NOR2X1 U2437 ( .A(n1608), .B(n16220), .Y(SRAM_INPUT_DATA_3_r[3]) );
  NOR2X1 U2438 ( .A(n1609), .B(n16220), .Y(SRAM_INPUT_DATA_3_r[2]) );
  NOR2X1 U2439 ( .A(n1610), .B(n16220), .Y(SRAM_INPUT_DATA_3_r[1]) );
  NOR2X1 U2440 ( .A(n1611), .B(n16220), .Y(SRAM_INPUT_DATA_3_r[0]) );
  NOR2X1 U2441 ( .A(n1604), .B(n1623), .Y(SRAM_INPUT_DATA_2_r[7]) );
  NOR2X1 U2442 ( .A(n1605), .B(n1623), .Y(SRAM_INPUT_DATA_2_r[6]) );
  NOR2X1 U2443 ( .A(n1606), .B(n1623), .Y(SRAM_INPUT_DATA_2_r[5]) );
  NOR2X1 U2444 ( .A(n1607), .B(n1623), .Y(SRAM_INPUT_DATA_2_r[4]) );
  NOR2X1 U2445 ( .A(n1608), .B(n1623), .Y(SRAM_INPUT_DATA_2_r[3]) );
  NOR2X1 U2446 ( .A(n1609), .B(n1623), .Y(SRAM_INPUT_DATA_2_r[2]) );
  NOR2X1 U2447 ( .A(n1610), .B(n1623), .Y(SRAM_INPUT_DATA_2_r[1]) );
  NOR2X1 U2448 ( .A(n1611), .B(n1623), .Y(SRAM_INPUT_DATA_2_r[0]) );
  NOR2X1 U2449 ( .A(n1604), .B(n1624), .Y(SRAM_INPUT_DATA_1_r[7]) );
  CLKINVX1 U2450 ( .A(i_in_data[7]), .Y(n2084) );
  NOR2X1 U2451 ( .A(n1605), .B(n1624), .Y(SRAM_INPUT_DATA_1_r[6]) );
  CLKINVX1 U2452 ( .A(i_in_data[6]), .Y(n2085) );
  NOR2X1 U2453 ( .A(n1606), .B(n1624), .Y(SRAM_INPUT_DATA_1_r[5]) );
  CLKINVX1 U2454 ( .A(i_in_data[5]), .Y(n2086) );
  NOR2X1 U2455 ( .A(n1607), .B(n1624), .Y(SRAM_INPUT_DATA_1_r[4]) );
  CLKINVX1 U2456 ( .A(i_in_data[4]), .Y(n2087) );
  NOR2X1 U2457 ( .A(n1608), .B(n1624), .Y(SRAM_INPUT_DATA_1_r[3]) );
  CLKINVX1 U2458 ( .A(i_in_data[3]), .Y(n2088) );
  NOR2X1 U2459 ( .A(n1609), .B(n1624), .Y(SRAM_INPUT_DATA_1_r[2]) );
  CLKINVX1 U2460 ( .A(i_in_data[2]), .Y(n2089) );
  NOR2X1 U2461 ( .A(n1610), .B(n1624), .Y(SRAM_INPUT_DATA_1_r[1]) );
  CLKINVX1 U2462 ( .A(i_in_data[1]), .Y(n2090) );
  NOR2X1 U2463 ( .A(n1611), .B(n1624), .Y(SRAM_INPUT_DATA_1_r[0]) );
  CLKINVX1 U2464 ( .A(i_in_data[0]), .Y(n2091) );
  OAI211X1 U2465 ( .A0(n15770), .A1(n1574), .B0(n2097), .C0(n2098), .Y(
        SRAM_CEN_4_r) );
  OA21XL U2466 ( .A0(n1379), .A1(n15720), .B0(n15710), .Y(n2098) );
  NAND3X1 U2467 ( .A(n2101), .B(n15710), .C(n2102), .Y(SRAM_CEN_3_r) );
  AOI211X1 U2468 ( .A0(n1592), .A1(n15730), .B0(n2104), .C0(n2105), .Y(n2102)
         );
  NAND3X1 U2469 ( .A(n1623), .B(n2107), .C(n2106), .Y(SRAM_CEN_1_r) );
  AND3X1 U2470 ( .A(n1620), .B(n1621), .C(n2097), .Y(n2101) );
  NAND3X1 U2471 ( .A(n15750), .B(n1379), .C(n15710), .Y(n2097) );
  NOR2X1 U2472 ( .A(n2108), .B(n2079), .Y(n2100) );
  OAI22XL U2473 ( .A0(n1283), .A1(n1621), .B0(n932), .B1(n1620), .Y(
        SRAM_ADDRESS_4_r[8]) );
  OAI22XL U2474 ( .A0(n1287), .A1(n1621), .B0(n933), .B1(n1620), .Y(
        SRAM_ADDRESS_4_r[7]) );
  OAI22XL U2475 ( .A0(n1288), .A1(n1621), .B0(n934), .B1(n1620), .Y(
        SRAM_ADDRESS_4_r[6]) );
  OAI22XL U2476 ( .A0(n1290), .A1(n1621), .B0(n935), .B1(n1620), .Y(
        SRAM_ADDRESS_4_r[5]) );
  OAI22XL U2477 ( .A0(n1291), .A1(n1621), .B0(n941), .B1(n1620), .Y(
        SRAM_ADDRESS_4_r[4]) );
  OAI22XL U2478 ( .A0(n1376), .A1(n1621), .B0(n942), .B1(n1620), .Y(
        SRAM_ADDRESS_4_r[3]) );
  OAI22XL U2479 ( .A0(n1292), .A1(n1621), .B0(n940), .B1(n1620), .Y(
        SRAM_ADDRESS_4_r[2]) );
  OAI22XL U2480 ( .A0(n1377), .A1(n1621), .B0(n943), .B1(n1620), .Y(
        SRAM_ADDRESS_4_r[1]) );
  OAI22XL U2481 ( .A0(n1378), .A1(n1621), .B0(n939), .B1(n1620), .Y(
        SRAM_ADDRESS_4_r[0]) );
  NOR2X1 U2482 ( .A(n2103), .B(n2070), .Y(n2072) );
  NAND2X1 U2483 ( .A(n2077), .B(n2082), .Y(n2103) );
  CLKINVX1 U2484 ( .A(n1020), .Y(n2077) );
  OAI22XL U2485 ( .A0(n1283), .A1(n1594), .B0(n932), .B1(n16220), .Y(
        SRAM_ADDRESS_3_r[8]) );
  OAI22XL U2486 ( .A0(n1287), .A1(n1594), .B0(n933), .B1(n16220), .Y(
        SRAM_ADDRESS_3_r[7]) );
  OAI22XL U2487 ( .A0(n1288), .A1(n1594), .B0(n934), .B1(n16220), .Y(
        SRAM_ADDRESS_3_r[6]) );
  OAI22XL U2488 ( .A0(n1290), .A1(n1594), .B0(n935), .B1(n16220), .Y(
        SRAM_ADDRESS_3_r[5]) );
  OAI22XL U2489 ( .A0(n1291), .A1(n1594), .B0(n941), .B1(n16220), .Y(
        SRAM_ADDRESS_3_r[4]) );
  OAI22XL U2490 ( .A0(n1376), .A1(n1594), .B0(n942), .B1(n16220), .Y(
        SRAM_ADDRESS_3_r[3]) );
  OAI22XL U2491 ( .A0(n1292), .A1(n1594), .B0(n940), .B1(n16220), .Y(
        SRAM_ADDRESS_3_r[2]) );
  OAI22XL U2492 ( .A0(n1377), .A1(n1594), .B0(n943), .B1(n16220), .Y(
        SRAM_ADDRESS_3_r[1]) );
  OAI22XL U2493 ( .A0(n1378), .A1(n1594), .B0(n939), .B1(n16220), .Y(
        SRAM_ADDRESS_3_r[0]) );
  NOR2BX1 U2494 ( .AN(n1473), .B(n1474), .Y(n2070) );
  OAI22XL U2495 ( .A0(n1283), .A1(n896), .B0(n932), .B1(n1623), .Y(
        SRAM_ADDRESS_2_r[8]) );
  OAI22XL U2496 ( .A0(n1287), .A1(n896), .B0(n933), .B1(n1623), .Y(
        SRAM_ADDRESS_2_r[7]) );
  OAI22XL U2497 ( .A0(n1288), .A1(n896), .B0(n934), .B1(n1623), .Y(
        SRAM_ADDRESS_2_r[6]) );
  OAI22XL U2498 ( .A0(n1290), .A1(n896), .B0(n935), .B1(n1623), .Y(
        SRAM_ADDRESS_2_r[5]) );
  OAI22XL U2499 ( .A0(n1291), .A1(n896), .B0(n941), .B1(n1623), .Y(
        SRAM_ADDRESS_2_r[4]) );
  OAI22XL U2500 ( .A0(n1376), .A1(n896), .B0(n942), .B1(n1623), .Y(
        SRAM_ADDRESS_2_r[3]) );
  OAI22XL U2501 ( .A0(n1292), .A1(n896), .B0(n940), .B1(n1623), .Y(
        SRAM_ADDRESS_2_r[2]) );
  OAI22XL U2502 ( .A0(n1377), .A1(n2107), .B0(n943), .B1(n1623), .Y(
        SRAM_ADDRESS_2_r[1]) );
  OAI22XL U2503 ( .A0(n1378), .A1(n2107), .B0(n939), .B1(n1623), .Y(
        SRAM_ADDRESS_2_r[0]) );
  NOR3X1 U2504 ( .A(n891), .B(n1497), .C(n1574), .Y(n2104) );
  OAI2BB2XL U2505 ( .B0(n963), .B1(n2082), .A0N(n2108), .A1N(n1481), .Y(
        SRAM_WEN_2_w) );
  NAND2BX1 U2506 ( .AN(n1473), .B(n1474), .Y(n2082) );
  OAI22XL U2507 ( .A0(n932), .A1(n1624), .B0(n1283), .B1(n1595), .Y(
        SRAM_ADDRESS_1_r[8]) );
  AOI222XL U2508 ( .A0(n962), .A1(n1475), .B0(n1861), .B1(n1467), .C0(n2108), 
        .C1(n1482), .Y(n2109) );
  OAI22XL U2509 ( .A0(n933), .A1(n1624), .B0(n1287), .B1(n1595), .Y(
        SRAM_ADDRESS_1_r[7]) );
  AOI221XL U2510 ( .A0(n2118), .A1(n1449), .B0(n1867), .B1(n1455), .C0(n2119), 
        .Y(n2110) );
  CLKINVX1 U2511 ( .A(n2120), .Y(n2119) );
  AOI222XL U2512 ( .A0(n1483), .A1(n2108), .B0(n1468), .B1(n1861), .C0(n1476), 
        .C1(n962), .Y(n2120) );
  OAI22XL U2513 ( .A0(n934), .A1(n1624), .B0(n1288), .B1(n1595), .Y(
        SRAM_ADDRESS_1_r[6]) );
  AOI221XL U2514 ( .A0(n2118), .A1(n1450), .B0(n1867), .B1(n15760), .C0(n2121), 
        .Y(n2111) );
  CLKINVX1 U2515 ( .A(n2122), .Y(n2121) );
  AOI222XL U2516 ( .A0(n1484), .A1(n2108), .B0(n1469), .B1(n1861), .C0(n1477), 
        .C1(n962), .Y(n2122) );
  OAI22XL U2517 ( .A0(n935), .A1(n1624), .B0(n1290), .B1(n1595), .Y(
        SRAM_ADDRESS_1_r[5]) );
  NAND4X1 U2518 ( .A(n2127), .B(n2128), .C(n2129), .D(n2130), .Y(n2126) );
  OAI22XL U2519 ( .A0(n2147), .A1(n1017), .B0(n2148), .B1(n2149), .Y(n2124) );
  OAI222XL U2520 ( .A0(n2150), .A1(n1017), .B0(n2151), .B1(n928), .C0(n2152), 
        .C1(n8710), .Y(n2123) );
  OAI22XL U2521 ( .A0(n941), .A1(n1624), .B0(n1291), .B1(n1595), .Y(
        SRAM_ADDRESS_1_r[4]) );
  NAND4X1 U2522 ( .A(n2157), .B(n2158), .C(n2159), .D(n2160), .Y(n2156) );
  OAI221XL U2523 ( .A0(n2141), .A1(n9070), .B0(n2142), .B1(n991), .C0(n2161), 
        .Y(n2155) );
  CLKINVX1 U2524 ( .A(n2162), .Y(n2141) );
  OAI22XL U2525 ( .A0(n2147), .A1(n1600), .B0(n2148), .B1(n2163), .Y(n2154) );
  CLKINVX1 U2526 ( .A(n2164), .Y(n2148) );
  CLKINVX1 U2527 ( .A(n2165), .Y(n2152) );
  OAI22XL U2528 ( .A0(n942), .A1(n1624), .B0(n1376), .B1(n1595), .Y(
        SRAM_ADDRESS_1_r[3]) );
  AND4X1 U2529 ( .A(n2166), .B(n2167), .C(n2168), .D(n2169), .Y(n2114) );
  AND4X1 U2530 ( .A(n2170), .B(n2171), .C(n2172), .D(n2173), .Y(n2169) );
  AOI222XL U2531 ( .A0(N663), .A1(n2145), .B0(N284), .B1(n2165), .C0(N224), 
        .C1(n2164), .Y(n2173) );
  AOI22X1 U2532 ( .A0(N284), .A1(n2162), .B0(N368), .B1(n2132), .Y(n2171) );
  AOI22X1 U2533 ( .A0(n1596), .A1(n2133), .B0(N409), .B1(n2131), .Y(n2170) );
  NOR3X1 U2534 ( .A(n2174), .B(n2175), .C(n2176), .Y(n2168) );
  MXI2X1 U2535 ( .A(n2142), .B(n2147), .S0(n1650), .Y(n2176) );
  MXI2X1 U2536 ( .A(n2151), .B(n2150), .S0(n1650), .Y(n2175) );
  AOI222XL U2537 ( .A0(N457), .A1(n2137), .B0(N618), .B1(n2134), .C0(N701), 
        .C1(n2135), .Y(n2167) );
  AOI22X1 U2538 ( .A0(N338), .A1(n2138), .B0(N477), .B1(n2136), .Y(n2166) );
  AOI22X1 U2539 ( .A0(N337), .A1(n2138), .B0(N476), .B1(n2136), .Y(n2184) );
  AOI222XL U2540 ( .A0(N283), .A1(n2162), .B0(n1651), .B1(n2146), .C0(N223), 
        .C1(n2144), .Y(n2180) );
  OAI22XL U2541 ( .A0(n943), .A1(n1624), .B0(n1377), .B1(n1595), .Y(
        SRAM_ADDRESS_1_r[1]) );
  AND4X1 U2542 ( .A(n2190), .B(n2191), .C(n2192), .D(n2193), .Y(n2116) );
  AND4X1 U2543 ( .A(n2194), .B(n2195), .C(n2196), .D(n2197), .Y(n2193) );
  AOI222XL U2544 ( .A0(N616), .A1(n2134), .B0(n1652), .B1(n2133), .C0(N407), 
        .C1(n2131), .Y(n2197) );
  AOI22X1 U2545 ( .A0(N336), .A1(n2138), .B0(n1598), .B1(n2136), .Y(n2195) );
  AOI222XL U2546 ( .A0(N282), .A1(n2162), .B0(n1652), .B1(n2146), .C0(N222), 
        .C1(n2144), .Y(n2191) );
  OAI22XL U2547 ( .A0(n1378), .A1(n1595), .B0(n939), .B1(n1624), .Y(
        SRAM_ADDRESS_1_r[0]) );
  NOR3X1 U2548 ( .A(n1496), .B(n1487), .C(n1574), .Y(n2105) );
  NAND2X1 U2549 ( .A(i_in_valid), .B(n1859), .Y(n2096) );
  NAND3BX1 U2550 ( .AN(n1861), .B(n2200), .C(n1894), .Y(n2079) );
  AND4X1 U2551 ( .A(n2201), .B(n2202), .C(n2203), .D(n2204), .Y(n2117) );
  NOR4X1 U2552 ( .A(n2205), .B(n2206), .C(n2207), .D(n2208), .Y(n2204) );
  AO22X1 U2553 ( .A0(n9050), .A1(n2131), .B0(n16540), .B1(n2133), .Y(n2207) );
  AO21X1 U2554 ( .A0(n2217), .A1(n16540), .B0(N3697), .Y(n2214) );
  NOR2X1 U2555 ( .A(N3697), .B(sub_410_aco_B_0_), .Y(n1922) );
  CLKINVX1 U2556 ( .A(n1887), .Y(sub_410_aco_B_0_) );
  AO22X1 U2557 ( .A0(n1653), .A1(n2146), .B0(n9050), .B1(n2145), .Y(n2205) );
  AND4X1 U2558 ( .A(n2220), .B(n2221), .C(n2222), .D(n2223), .Y(n2203) );
  NAND2X1 U2559 ( .A(n1655), .B(n2140), .Y(n2223) );
  MXI2X1 U2560 ( .A(n2165), .B(n2189), .S0(n1653), .Y(n2222) );
  MXI2X1 U2561 ( .A(n2162), .B(n2178), .S0(n1653), .Y(n2220) );
  OA22X1 U2562 ( .A0(n2210), .A1(n1913), .B0(n2219), .B1(n1918), .Y(n2235) );
  CLKINVX1 U2563 ( .A(n1889), .Y(n2219) );
  NOR3X1 U2564 ( .A(n8820), .B(n1453), .C(n1917), .Y(n1889) );
  CLKINVX1 U2565 ( .A(n18880), .Y(n2209) );
  NOR3X1 U2566 ( .A(n1871), .B(n1603), .C(n1917), .Y(n18880) );
  OA22X1 U2567 ( .A0(n1913), .A1(n1918), .B0(n2212), .B1(n1920), .Y(n2236) );
  NAND3BX1 U2568 ( .AN(n1917), .B(n1453), .C(n1603), .Y(n1920) );
  NAND2X1 U2569 ( .A(n2237), .B(n8820), .Y(n1913) );
  AOI2BB2X1 U2570 ( .B0(n1858), .B1(n1869), .A0N(n1896), .A1N(n2241), .Y(n2240) );
  AOI32X1 U2571 ( .A0(n1867), .A1(n916), .A2(n1383), .B0(n2242), .B1(n889), 
        .Y(n2239) );
  NAND2X1 U2572 ( .A(n2225), .B(n8820), .Y(n1919) );
  CLKINVX1 U2573 ( .A(n2230), .Y(n2245) );
  NOR2X1 U2574 ( .A(n2217), .B(N3697), .Y(n1923) );
  CLKINVX1 U2575 ( .A(n1900), .Y(n2217) );
  CLKINVX1 U2576 ( .A(n1907), .Y(n2216) );
  NOR3X1 U2577 ( .A(n1603), .B(n1453), .C(n1917), .Y(n1907) );
  NAND2X1 U2578 ( .A(n1454), .B(n1029), .Y(n1917) );
  CLKINVX1 U2579 ( .A(n1903), .Y(n2242) );
  NAND2X1 U2580 ( .A(n2118), .B(n1451), .Y(n1903) );
  CLKINVX1 U2581 ( .A(n1894), .Y(n2118) );
  NAND2X1 U2582 ( .A(n2237), .B(n1603), .Y(n1912) );
  NOR3X1 U2583 ( .A(n1454), .B(n1374), .C(n1871), .Y(n2237) );
  CLKINVX1 U2584 ( .A(NMS_output_r[0]), .Y(n2250) );
  OAI32X1 U2585 ( .A0(n982), .A1(n1979), .A2(n930), .B0(n2252), .B1(n8720), 
        .Y(NMS_output_count_r[2]) );
  CLKINVX1 U2586 ( .A(n2254), .Y(NMS_output_count_r[0]) );
  CLKMX2X2 U2587 ( .A(n1457), .B(n15800), .S0(n1642), .Y(NMS_direction_r[1])
         );
  CLKMX2X2 U2588 ( .A(n1457), .B(n1459), .S0(n1634), .Y(NMS_direction_r[3]) );
  CLKMX2X2 U2589 ( .A(n1458), .B(n1460), .S0(n1634), .Y(NMS_direction_r[2]) );
  CLKMX2X2 U2590 ( .A(n1459), .B(n1461), .S0(n1634), .Y(NMS_direction_r[5]) );
  CLKMX2X2 U2591 ( .A(n1461), .B(n1463), .S0(n1634), .Y(NMS_direction_r[7]) );
  NAND2X1 U2592 ( .A(n2255), .B(n2027), .Y(N915) );
  NAND2X1 U2593 ( .A(n2255), .B(n2251), .Y(N895) );
  NAND2X1 U2594 ( .A(n2255), .B(n1998), .Y(N885) );
  NAND3X1 U2595 ( .A(n1656), .B(n1596), .C(n1465), .Y(N3702) );
  NAND3X1 U2596 ( .A(n1600), .B(n1017), .C(n1596), .Y(N3697) );
  CLKINVX1 U2597 ( .A(N226), .Y(n2149) );
  CLKINVX1 U2598 ( .A(N225), .Y(n2163) );
  CLKINVX1 U2599 ( .A(N224), .Y(n2260) );
  CLKINVX1 U2600 ( .A(N223), .Y(n2261) );
  CLKINVX1 U2601 ( .A(N222), .Y(n2262) );
  NOR2X1 U2602 ( .A(n1900), .B(n1653), .Y(n18820) );
  NAND2X1 U2603 ( .A(n1651), .B(n1652), .Y(n1900) );
  NAND2X1 U2604 ( .A(n911), .B(n8980), .Y(n2231) );
  NAND2X1 U2605 ( .A(n8680), .B(n8990), .Y(n2230) );
  NAND2X1 U2606 ( .A(n8810), .B(n909), .Y(n2229) );
  NAND2X1 U2607 ( .A(n1486), .B(n8980), .Y(n2234) );
  NAND2X1 U2608 ( .A(n1479), .B(n909), .Y(n2232) );
  NAND3X1 U2609 ( .A(n1615), .B(n2200), .C(n1852), .Y(n2042) );
  NOR2X1 U2610 ( .A(n2228), .B(n876), .Y(n2266) );
  NAND2X1 U2611 ( .A(n1485), .B(n1486), .Y(n2228) );
  NAND3BX1 U2612 ( .AN(n2226), .B(n1476), .C(n1477), .Y(n2267) );
  NAND2X1 U2613 ( .A(n1478), .B(n1479), .Y(n2226) );
endmodule


module core_DW01_cmp6_5 ( A, B, LT, GT );
  input [13:0] A;
  input [13:0] B;
  output LT, GT;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63;

  OAI21X1 U1 ( .A0(n15), .A1(n16), .B0(n17), .Y(LT) );
  AOI211X4 U2 ( .A0(n62), .A1(n9), .B0(n46), .C0(n63), .Y(n61) );
  INVX1 U3 ( .A(B[3]), .Y(n13) );
  CLKINVX1 U4 ( .A(B[2]), .Y(n14) );
  CLKINVX1 U5 ( .A(B[8]), .Y(n12) );
  NAND2X2 U6 ( .A(A[2]), .B(n14), .Y(n60) );
  AOI31X2 U7 ( .A0(n5), .A1(n52), .A2(n28), .B0(n25), .Y(n51) );
  INVX3 U8 ( .A(n53), .Y(n5) );
  AOI31X2 U9 ( .A0(n8), .A1(n60), .A2(n44), .B0(n41), .Y(n59) );
  INVX3 U10 ( .A(n61), .Y(n8) );
  OAI211X2 U11 ( .A0(n37), .A1(n7), .B0(n34), .C0(n58), .Y(n56) );
  INVX3 U12 ( .A(n59), .Y(n7) );
  NAND2BX4 U13 ( .AN(n42), .B(n60), .Y(n46) );
  NOR2X2 U14 ( .A(n14), .B(A[2]), .Y(n42) );
  OAI31X1 U15 ( .A0(n41), .A1(n42), .A2(n43), .B0(n44), .Y(n38) );
  AOI211X2 U16 ( .A0(A[1]), .A1(n45), .B0(n46), .C0(n47), .Y(n43) );
  OAI31X2 U17 ( .A0(n25), .A1(n26), .A2(n27), .B0(n28), .Y(n22) );
  AOI211X2 U18 ( .A0(n29), .A1(n30), .B0(n31), .C0(n32), .Y(n27) );
  AOI211X2 U19 ( .A0(n54), .A1(n55), .B0(n31), .C0(n6), .Y(n53) );
  NAND3X2 U20 ( .A(n56), .B(n40), .C(n35), .Y(n55) );
  AOI32X2 U21 ( .A0(n49), .A1(n24), .A2(n20), .B0(A[12]), .B1(n10), .Y(n48) );
  OAI211X2 U22 ( .A0(n21), .A1(n4), .B0(n19), .C0(n50), .Y(n49) );
  CLKINVX3 U23 ( .A(n48), .Y(n2) );
  NAND2BXL U24 ( .AN(A[7]), .B(B[7]), .Y(n30) );
  CLKINVX1 U25 ( .A(n30), .Y(n6) );
  INVX1 U26 ( .A(n51), .Y(n4) );
  INVX1 U27 ( .A(A[1]), .Y(n9) );
  CLKINVX1 U28 ( .A(B[12]), .Y(n10) );
  CLKINVX1 U29 ( .A(B[9]), .Y(n11) );
  CLKINVX1 U30 ( .A(A[12]), .Y(n3) );
  CLKINVX1 U31 ( .A(A[13]), .Y(n1) );
  AOI32X1 U32 ( .A0(n18), .A1(n19), .A2(n20), .B0(B[12]), .B1(n3), .Y(n16) );
  OAI211X1 U33 ( .A0(n21), .A1(n22), .B0(n23), .C0(n24), .Y(n18) );
  AOI31X1 U34 ( .A0(n33), .A1(n34), .A2(n35), .B0(n36), .Y(n29) );
  OAI211X1 U35 ( .A0(n37), .A1(n38), .B0(n39), .C0(n40), .Y(n33) );
  AOI2BB1X1 U36 ( .A0N(n45), .A1N(A[1]), .B0(B[1]), .Y(n47) );
  NAND2BX1 U37 ( .AN(A[0]), .B(B[0]), .Y(n45) );
  AO21X1 U38 ( .A0(n17), .A1(n2), .B0(n15), .Y(GT) );
  NOR2X1 U39 ( .A(n1), .B(B[13]), .Y(n15) );
  XOR2X1 U40 ( .A(n3), .B(B[12]), .Y(n20) );
  NAND2BX1 U41 ( .AN(A[11]), .B(B[11]), .Y(n24) );
  NAND2BX1 U42 ( .AN(B[11]), .B(A[11]), .Y(n19) );
  NOR2X1 U43 ( .A(n11), .B(A[9]), .Y(n25) );
  NAND2X1 U44 ( .A(A[9]), .B(n11), .Y(n28) );
  NAND2BX1 U45 ( .AN(n26), .B(n52), .Y(n31) );
  NAND2X1 U46 ( .A(A[8]), .B(n12), .Y(n52) );
  NOR2X1 U47 ( .A(n12), .B(A[8]), .Y(n26) );
  NOR2X1 U48 ( .A(n57), .B(n36), .Y(n35) );
  NOR2BX1 U49 ( .AN(B[6]), .B(A[6]), .Y(n36) );
  NAND2BX1 U50 ( .AN(A[5]), .B(B[5]), .Y(n40) );
  NAND2BX1 U51 ( .AN(B[5]), .B(A[5]), .Y(n34) );
  NOR2X1 U52 ( .A(n13), .B(A[3]), .Y(n41) );
  NAND2X1 U53 ( .A(A[3]), .B(n13), .Y(n44) );
  OA21XL U54 ( .A0(n62), .A1(n9), .B0(B[1]), .Y(n63) );
  NAND2BX1 U55 ( .AN(B[0]), .B(A[0]), .Y(n62) );
  NAND2X1 U56 ( .A(n58), .B(n39), .Y(n37) );
  NAND2BX1 U57 ( .AN(A[4]), .B(B[4]), .Y(n39) );
  NAND2BX1 U58 ( .AN(B[4]), .B(A[4]), .Y(n58) );
  NOR2X1 U59 ( .A(n57), .B(n32), .Y(n54) );
  NOR2BX1 U60 ( .AN(A[7]), .B(B[7]), .Y(n32) );
  NOR2BX1 U61 ( .AN(A[6]), .B(B[6]), .Y(n57) );
  NAND2X1 U62 ( .A(n50), .B(n23), .Y(n21) );
  NAND2BX1 U63 ( .AN(A[10]), .B(B[10]), .Y(n23) );
  NAND2BX1 U64 ( .AN(B[10]), .B(A[10]), .Y(n50) );
  NAND2X1 U65 ( .A(B[13]), .B(n1), .Y(n17) );
endmodule


module core_DW01_cmp6_4 ( A, B, LT, GT, i_rst_n_INV, i_clk );
  input [13:0] A;
  input [13:0] B;
  input i_rst_n_INV, i_clk;
  output LT, GT;
  wire   n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67;

  DFFSX1 i_clk_r_REG249_S12 ( .D(n20), .CK(i_clk), .SN(i_rst_n_INV), .Q(n2) );
  DFFRX1 i_clk_r_REG250_S12 ( .D(n6), .CK(i_clk), .RN(i_rst_n_INV), .Q(n3) );
  INVX3 U1 ( .A(n65), .Y(n12) );
  NAND2BX4 U2 ( .AN(n46), .B(n64), .Y(n50) );
  NOR2X2 U3 ( .A(n18), .B(A[2]), .Y(n46) );
  AOI211X2 U4 ( .A0(n33), .A1(n34), .B0(n35), .C0(n36), .Y(n31) );
  AOI31X2 U5 ( .A0(n37), .A1(n38), .A2(n39), .B0(n40), .Y(n33) );
  CLKINVX1 U6 ( .A(A[1]), .Y(n13) );
  INVX1 U7 ( .A(n63), .Y(n11) );
  AOI31X2 U8 ( .A0(n9), .A1(n56), .A2(n32), .B0(n29), .Y(n55) );
  INVX3 U9 ( .A(n57), .Y(n9) );
  OAI211X2 U10 ( .A0(n41), .A1(n11), .B0(n38), .C0(n62), .Y(n60) );
  NAND2X2 U11 ( .A(A[2]), .B(n18), .Y(n64) );
  CLKINVX1 U12 ( .A(B[2]), .Y(n18) );
  OAI211X2 U13 ( .A0(n25), .A1(n26), .B0(n27), .C0(n28), .Y(n22) );
  OAI31X2 U14 ( .A0(n29), .A1(n30), .A2(n31), .B0(n32), .Y(n26) );
  AOI32X2 U15 ( .A0(n53), .A1(n28), .A2(n24), .B0(A[12]), .B1(n14), .Y(n52) );
  OAI211X2 U16 ( .A0(n25), .A1(n8), .B0(n23), .C0(n54), .Y(n53) );
  AOI211X2 U17 ( .A0(n58), .A1(n59), .B0(n35), .C0(n10), .Y(n57) );
  NAND3X2 U18 ( .A(n60), .B(n44), .C(n39), .Y(n59) );
  AOI211X2 U19 ( .A0(n66), .A1(n13), .B0(n50), .C0(n67), .Y(n65) );
  OA21X4 U20 ( .A0(n66), .A1(n13), .B0(B[1]), .Y(n67) );
  INVX1 U21 ( .A(B[3]), .Y(n17) );
  INVX1 U22 ( .A(n34), .Y(n10) );
  INVX1 U23 ( .A(B[9]), .Y(n15) );
  INVX1 U24 ( .A(n55), .Y(n8) );
  CLKINVX1 U25 ( .A(n52), .Y(n6) );
  CLKINVX1 U26 ( .A(B[12]), .Y(n14) );
  CLKINVX1 U27 ( .A(B[8]), .Y(n16) );
  CLKINVX1 U28 ( .A(A[12]), .Y(n7) );
  CLKINVX1 U29 ( .A(A[13]), .Y(n5) );
  OAI21XL U30 ( .A0(n19), .A1(n2), .B0(n21), .Y(LT) );
  AOI32X1 U31 ( .A0(n22), .A1(n23), .A2(n24), .B0(B[12]), .B1(n7), .Y(n20) );
  OAI211X1 U32 ( .A0(n41), .A1(n42), .B0(n43), .C0(n44), .Y(n37) );
  OAI31XL U33 ( .A0(n45), .A1(n46), .A2(n47), .B0(n48), .Y(n42) );
  AOI211X1 U34 ( .A0(A[1]), .A1(n49), .B0(n50), .C0(n51), .Y(n47) );
  AOI2BB1X1 U35 ( .A0N(n49), .A1N(A[1]), .B0(B[1]), .Y(n51) );
  NAND2BX1 U36 ( .AN(A[0]), .B(B[0]), .Y(n49) );
  AO21X1 U37 ( .A0(n21), .A1(n3), .B0(n19), .Y(GT) );
  NOR2X1 U38 ( .A(n5), .B(B[13]), .Y(n19) );
  XOR2X1 U39 ( .A(n7), .B(B[12]), .Y(n24) );
  NAND2BX1 U40 ( .AN(A[11]), .B(B[11]), .Y(n28) );
  NAND2BX1 U41 ( .AN(B[11]), .B(A[11]), .Y(n23) );
  NOR2X1 U42 ( .A(n15), .B(A[9]), .Y(n29) );
  NAND2X1 U43 ( .A(A[9]), .B(n15), .Y(n32) );
  NAND2BX1 U44 ( .AN(A[7]), .B(B[7]), .Y(n34) );
  NAND2BX1 U45 ( .AN(n30), .B(n56), .Y(n35) );
  NAND2X1 U46 ( .A(A[8]), .B(n16), .Y(n56) );
  NOR2X1 U47 ( .A(n16), .B(A[8]), .Y(n30) );
  NOR2X1 U48 ( .A(n61), .B(n40), .Y(n39) );
  NOR2BX1 U49 ( .AN(B[6]), .B(A[6]), .Y(n40) );
  NAND2BX1 U50 ( .AN(A[5]), .B(B[5]), .Y(n44) );
  NAND2BX1 U51 ( .AN(B[5]), .B(A[5]), .Y(n38) );
  AOI31X1 U52 ( .A0(n12), .A1(n64), .A2(n48), .B0(n45), .Y(n63) );
  NOR2X1 U53 ( .A(n17), .B(A[3]), .Y(n45) );
  NAND2X1 U54 ( .A(A[3]), .B(n17), .Y(n48) );
  NAND2BX1 U55 ( .AN(B[0]), .B(A[0]), .Y(n66) );
  NAND2X1 U56 ( .A(n62), .B(n43), .Y(n41) );
  NAND2BX1 U57 ( .AN(A[4]), .B(B[4]), .Y(n43) );
  NAND2BX1 U58 ( .AN(B[4]), .B(A[4]), .Y(n62) );
  NOR2X1 U59 ( .A(n61), .B(n36), .Y(n58) );
  NOR2BX1 U60 ( .AN(A[7]), .B(B[7]), .Y(n36) );
  NOR2BX1 U61 ( .AN(A[6]), .B(B[6]), .Y(n61) );
  NAND2X1 U62 ( .A(n54), .B(n27), .Y(n25) );
  NAND2BX1 U63 ( .AN(A[10]), .B(B[10]), .Y(n27) );
  NAND2BX1 U64 ( .AN(B[10]), .B(A[10]), .Y(n54) );
  NAND2X1 U65 ( .A(B[13]), .B(n5), .Y(n21) );
endmodule


module core_DW01_cmp6_3 ( A, B, LT, GT, i_rst_n_INV, i_clk );
  input [13:0] A;
  input [13:0] B;
  input i_rst_n_INV, i_clk;
  output LT, GT;
  wire   n1, n2, n4, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67;

  DFFSX1 i_clk_r_REG248_S12 ( .D(n52), .CK(i_clk), .SN(i_rst_n_INV), .QN(n2)
         );
  DFFSX1 i_clk_r_REG247_S12 ( .D(n20), .CK(i_clk), .SN(i_rst_n_INV), .Q(n4) );
  OA21X4 U1 ( .A0(n25), .A1(n8), .B0(n23), .Y(n1) );
  NAND2X6 U2 ( .A(n1), .B(n54), .Y(n53) );
  INVX3 U3 ( .A(n55), .Y(n8) );
  NAND2BX4 U4 ( .AN(B[10]), .B(A[10]), .Y(n54) );
  AOI32X2 U5 ( .A0(n53), .A1(n28), .A2(n24), .B0(A[12]), .B1(n14), .Y(n52) );
  INVX6 U6 ( .A(B[2]), .Y(n18) );
  NAND2BX4 U7 ( .AN(B[0]), .B(A[0]), .Y(n66) );
  NAND2BX2 U8 ( .AN(n46), .B(n64), .Y(n50) );
  NAND3X1 U9 ( .A(n60), .B(n44), .C(n39), .Y(n59) );
  OAI211X1 U10 ( .A0(n41), .A1(n11), .B0(n38), .C0(n62), .Y(n60) );
  CLKINVX1 U11 ( .A(n63), .Y(n11) );
  AOI31X2 U12 ( .A0(n9), .A1(n56), .A2(n32), .B0(n29), .Y(n55) );
  INVX3 U13 ( .A(n57), .Y(n9) );
  OA21X2 U14 ( .A0(n66), .A1(n13), .B0(B[1]), .Y(n67) );
  INVX1 U15 ( .A(A[1]), .Y(n13) );
  OAI211X2 U16 ( .A0(n25), .A1(n26), .B0(n27), .C0(n28), .Y(n22) );
  OAI31X2 U17 ( .A0(n29), .A1(n30), .A2(n31), .B0(n32), .Y(n26) );
  AOI211X2 U18 ( .A0(n33), .A1(n34), .B0(n35), .C0(n36), .Y(n31) );
  AOI211X2 U19 ( .A0(n58), .A1(n59), .B0(n35), .C0(n10), .Y(n57) );
  AOI211X2 U20 ( .A0(n66), .A1(n13), .B0(n50), .C0(n67), .Y(n65) );
  NAND2XL U21 ( .A(A[8]), .B(n16), .Y(n56) );
  INVX1 U22 ( .A(n34), .Y(n10) );
  INVX1 U23 ( .A(A[12]), .Y(n7) );
  NAND2BX1 U24 ( .AN(B[11]), .B(A[11]), .Y(n23) );
  NAND2BXL U25 ( .AN(B[5]), .B(A[5]), .Y(n38) );
  NAND2BXL U26 ( .AN(A[7]), .B(B[7]), .Y(n34) );
  INVX1 U27 ( .A(B[8]), .Y(n16) );
  NAND2BXL U28 ( .AN(A[10]), .B(B[10]), .Y(n27) );
  NAND2XL U29 ( .A(A[9]), .B(n15), .Y(n32) );
  CLKINVX1 U30 ( .A(B[12]), .Y(n14) );
  INVX1 U31 ( .A(n65), .Y(n12) );
  CLKINVX1 U32 ( .A(B[3]), .Y(n17) );
  CLKINVX1 U33 ( .A(B[9]), .Y(n15) );
  CLKINVX1 U34 ( .A(A[13]), .Y(n6) );
  OAI21XL U35 ( .A0(n19), .A1(n4), .B0(n21), .Y(LT) );
  AOI32X1 U36 ( .A0(n22), .A1(n23), .A2(n24), .B0(B[12]), .B1(n7), .Y(n20) );
  AOI31X1 U37 ( .A0(n37), .A1(n38), .A2(n39), .B0(n40), .Y(n33) );
  OAI211X1 U38 ( .A0(n41), .A1(n42), .B0(n43), .C0(n44), .Y(n37) );
  OAI31XL U39 ( .A0(n45), .A1(n46), .A2(n47), .B0(n48), .Y(n42) );
  AOI211X1 U40 ( .A0(A[1]), .A1(n49), .B0(n50), .C0(n51), .Y(n47) );
  AOI2BB1X1 U41 ( .A0N(n49), .A1N(A[1]), .B0(B[1]), .Y(n51) );
  NAND2BX1 U42 ( .AN(A[0]), .B(B[0]), .Y(n49) );
  AO21X1 U43 ( .A0(n21), .A1(n2), .B0(n19), .Y(GT) );
  NOR2X1 U44 ( .A(n6), .B(B[13]), .Y(n19) );
  XOR2X1 U45 ( .A(n7), .B(B[12]), .Y(n24) );
  NAND2BX1 U46 ( .AN(A[11]), .B(B[11]), .Y(n28) );
  NOR2X1 U47 ( .A(n15), .B(A[9]), .Y(n29) );
  NAND2BX1 U48 ( .AN(n30), .B(n56), .Y(n35) );
  NOR2X1 U49 ( .A(n16), .B(A[8]), .Y(n30) );
  NOR2X1 U50 ( .A(n61), .B(n40), .Y(n39) );
  NOR2BX1 U51 ( .AN(B[6]), .B(A[6]), .Y(n40) );
  NAND2BX1 U52 ( .AN(A[5]), .B(B[5]), .Y(n44) );
  AOI31X1 U53 ( .A0(n12), .A1(n64), .A2(n48), .B0(n45), .Y(n63) );
  NOR2X1 U54 ( .A(n17), .B(A[3]), .Y(n45) );
  NAND2X1 U55 ( .A(A[3]), .B(n17), .Y(n48) );
  NAND2X1 U56 ( .A(A[2]), .B(n18), .Y(n64) );
  NOR2X1 U57 ( .A(n18), .B(A[2]), .Y(n46) );
  NAND2X1 U58 ( .A(n62), .B(n43), .Y(n41) );
  NAND2BX1 U59 ( .AN(A[4]), .B(B[4]), .Y(n43) );
  NAND2BX1 U60 ( .AN(B[4]), .B(A[4]), .Y(n62) );
  NOR2X1 U61 ( .A(n61), .B(n36), .Y(n58) );
  NOR2BX1 U62 ( .AN(A[7]), .B(B[7]), .Y(n36) );
  NOR2BX1 U63 ( .AN(A[6]), .B(B[6]), .Y(n61) );
  NAND2X1 U64 ( .A(n54), .B(n27), .Y(n25) );
  NAND2X1 U65 ( .A(B[13]), .B(n6), .Y(n21) );
endmodule


module core_DW01_cmp6_2 ( A, B, LT, GT, i_rst_n_INV, i_clk );
  input [13:0] A;
  input [13:0] B;
  input i_rst_n_INV, i_clk;
  output LT, GT;
  wire   n1, n2, n3, n4, n5, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70;

  DFFSX1 i_clk_r_REG254_S11 ( .D(n55), .CK(i_clk), .SN(i_rst_n_INV), .QN(n5)
         );
  DFFSX1 i_clk_r_REG253_S11 ( .D(n23), .CK(i_clk), .SN(i_rst_n_INV), .Q(n7) );
  NOR3X8 U1 ( .A(n1), .B(n2), .C(n3), .Y(n4) );
  NOR2X8 U2 ( .A(n4), .B(n48), .Y(n66) );
  CLKINVX6 U3 ( .A(n15), .Y(n1) );
  CLKINVX2 U4 ( .A(n67), .Y(n2) );
  INVX4 U5 ( .A(n51), .Y(n3) );
  INVX3 U6 ( .A(n68), .Y(n15) );
  NOR2X8 U7 ( .A(n20), .B(A[3]), .Y(n48) );
  INVX4 U8 ( .A(n66), .Y(n14) );
  NOR2X2 U9 ( .A(n21), .B(A[2]), .Y(n49) );
  NAND2X2 U10 ( .A(A[2]), .B(n21), .Y(n67) );
  AOI211X2 U11 ( .A0(n36), .A1(n37), .B0(n38), .C0(n39), .Y(n34) );
  AOI31X2 U12 ( .A0(n40), .A1(n41), .A2(n42), .B0(n43), .Y(n36) );
  AOI2BB1XL U13 ( .A0N(n52), .A1N(A[1]), .B0(B[1]), .Y(n54) );
  INVX4 U14 ( .A(A[1]), .Y(n16) );
  OAI211X1 U15 ( .A0(n28), .A1(n11), .B0(n26), .C0(n57), .Y(n56) );
  INVX1 U16 ( .A(n58), .Y(n11) );
  OAI211X4 U17 ( .A0(n44), .A1(n45), .B0(n46), .C0(n47), .Y(n40) );
  OAI31X2 U18 ( .A0(n32), .A1(n33), .A2(n34), .B0(n35), .Y(n29) );
  AOI31X2 U19 ( .A0(n12), .A1(n59), .A2(n35), .B0(n32), .Y(n58) );
  INVX3 U20 ( .A(n60), .Y(n12) );
  OAI211X2 U21 ( .A0(n44), .A1(n14), .B0(n41), .C0(n65), .Y(n63) );
  AOI211X2 U22 ( .A0(n61), .A1(n62), .B0(n38), .C0(n13), .Y(n60) );
  NAND3X2 U23 ( .A(n63), .B(n47), .C(n42), .Y(n62) );
  NAND2BX4 U24 ( .AN(B[0]), .B(A[0]), .Y(n69) );
  INVX3 U25 ( .A(B[2]), .Y(n21) );
  NAND2XL U26 ( .A(A[8]), .B(n19), .Y(n59) );
  INVX1 U27 ( .A(n37), .Y(n13) );
  INVX1 U28 ( .A(A[12]), .Y(n10) );
  NAND2BXL U29 ( .AN(B[5]), .B(A[5]), .Y(n41) );
  NAND2BXL U30 ( .AN(A[7]), .B(B[7]), .Y(n37) );
  INVX1 U31 ( .A(B[8]), .Y(n19) );
  NAND2XL U32 ( .A(A[9]), .B(n18), .Y(n35) );
  NAND2BXL U33 ( .AN(A[10]), .B(B[10]), .Y(n30) );
  NAND2BXL U34 ( .AN(B[10]), .B(A[10]), .Y(n57) );
  CLKINVX1 U35 ( .A(B[12]), .Y(n17) );
  CLKINVX1 U36 ( .A(B[3]), .Y(n20) );
  CLKINVX1 U37 ( .A(B[9]), .Y(n18) );
  CLKINVX1 U38 ( .A(A[13]), .Y(n9) );
  OAI21XL U39 ( .A0(n22), .A1(n7), .B0(n24), .Y(LT) );
  AOI32X1 U40 ( .A0(n25), .A1(n26), .A2(n27), .B0(B[12]), .B1(n10), .Y(n23) );
  OAI211X1 U41 ( .A0(n28), .A1(n29), .B0(n30), .C0(n31), .Y(n25) );
  OAI31XL U42 ( .A0(n48), .A1(n49), .A2(n50), .B0(n51), .Y(n45) );
  AOI211X1 U43 ( .A0(A[1]), .A1(n52), .B0(n53), .C0(n54), .Y(n50) );
  NAND2BX1 U44 ( .AN(A[0]), .B(B[0]), .Y(n52) );
  AO21X1 U45 ( .A0(n24), .A1(n5), .B0(n22), .Y(GT) );
  NOR2X1 U46 ( .A(n9), .B(B[13]), .Y(n22) );
  AOI32X1 U47 ( .A0(n56), .A1(n31), .A2(n27), .B0(A[12]), .B1(n17), .Y(n55) );
  XOR2X1 U48 ( .A(n10), .B(B[12]), .Y(n27) );
  NAND2BX1 U49 ( .AN(A[11]), .B(B[11]), .Y(n31) );
  NAND2BX1 U50 ( .AN(B[11]), .B(A[11]), .Y(n26) );
  NOR2X1 U51 ( .A(n18), .B(A[9]), .Y(n32) );
  NAND2BX1 U52 ( .AN(n33), .B(n59), .Y(n38) );
  NOR2X1 U53 ( .A(n19), .B(A[8]), .Y(n33) );
  NOR2X1 U54 ( .A(n64), .B(n43), .Y(n42) );
  NOR2BX1 U55 ( .AN(B[6]), .B(A[6]), .Y(n43) );
  NAND2BX1 U56 ( .AN(A[5]), .B(B[5]), .Y(n47) );
  NAND2X1 U57 ( .A(A[3]), .B(n20), .Y(n51) );
  AOI211X1 U58 ( .A0(n69), .A1(n16), .B0(n53), .C0(n70), .Y(n68) );
  OA21XL U59 ( .A0(n69), .A1(n16), .B0(B[1]), .Y(n70) );
  NAND2BX1 U60 ( .AN(n49), .B(n67), .Y(n53) );
  NAND2X1 U61 ( .A(n65), .B(n46), .Y(n44) );
  NAND2BX1 U62 ( .AN(A[4]), .B(B[4]), .Y(n46) );
  NAND2BX1 U63 ( .AN(B[4]), .B(A[4]), .Y(n65) );
  NOR2X1 U64 ( .A(n64), .B(n39), .Y(n61) );
  NOR2BX1 U65 ( .AN(A[7]), .B(B[7]), .Y(n39) );
  NOR2BX1 U66 ( .AN(A[6]), .B(B[6]), .Y(n64) );
  NAND2X1 U67 ( .A(n57), .B(n30), .Y(n28) );
  NAND2X1 U68 ( .A(B[13]), .B(n9), .Y(n24) );
endmodule


module core_DW01_cmp6_1 ( A, B, LT, GT, i_rst_n_INV, i_clk );
  input [13:0] A;
  input [13:0] B;
  input i_rst_n_INV, i_clk;
  output LT, GT;
  wire   n1, n3, n4, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68;

  DFFSX1 i_clk_r_REG251_S11 ( .D(n21), .CK(i_clk), .SN(i_rst_n_INV), .Q(n3) );
  DFFRX1 i_clk_r_REG252_S11 ( .D(n7), .CK(i_clk), .RN(i_rst_n_INV), .Q(n4) );
  OA21X4 U1 ( .A0(n42), .A1(n12), .B0(n39), .Y(n1) );
  NAND2X8 U2 ( .A(n1), .B(n63), .Y(n61) );
  INVX3 U3 ( .A(n64), .Y(n12) );
  NAND2BX4 U4 ( .AN(B[4]), .B(A[4]), .Y(n63) );
  NAND3X8 U5 ( .A(n61), .B(n45), .C(n40), .Y(n60) );
  OAI31X1 U6 ( .A0(n46), .A1(n47), .A2(n48), .B0(n49), .Y(n43) );
  NOR2X2 U7 ( .A(n19), .B(A[2]), .Y(n47) );
  CLKINVX2 U8 ( .A(B[2]), .Y(n19) );
  AOI2BB1XL U9 ( .A0N(n50), .A1N(A[1]), .B0(B[1]), .Y(n52) );
  INVX2 U10 ( .A(A[1]), .Y(n14) );
  OAI31X2 U11 ( .A0(n30), .A1(n31), .A2(n32), .B0(n33), .Y(n27) );
  AOI211X2 U12 ( .A0(n34), .A1(n35), .B0(n36), .C0(n37), .Y(n32) );
  AOI31X2 U13 ( .A0(n13), .A1(n65), .A2(n49), .B0(n46), .Y(n64) );
  NAND2BX4 U14 ( .AN(n47), .B(n65), .Y(n51) );
  NAND2X2 U15 ( .A(A[2]), .B(n19), .Y(n65) );
  CLKINVX1 U16 ( .A(B[3]), .Y(n18) );
  AOI211XL U17 ( .A0(A[1]), .A1(n50), .B0(n51), .C0(n52), .Y(n48) );
  AOI32X2 U18 ( .A0(n54), .A1(n29), .A2(n25), .B0(A[12]), .B1(n15), .Y(n53) );
  OAI211X2 U19 ( .A0(n26), .A1(n9), .B0(n24), .C0(n55), .Y(n54) );
  AOI211X2 U20 ( .A0(n59), .A1(n60), .B0(n36), .C0(n11), .Y(n58) );
  AOI211X2 U21 ( .A0(n67), .A1(n14), .B0(n51), .C0(n68), .Y(n66) );
  OA21X4 U22 ( .A0(n67), .A1(n14), .B0(B[1]), .Y(n68) );
  INVX1 U23 ( .A(n35), .Y(n11) );
  INVX1 U24 ( .A(B[9]), .Y(n16) );
  INVX1 U25 ( .A(n56), .Y(n9) );
  INVX1 U26 ( .A(n58), .Y(n10) );
  INVX1 U27 ( .A(n66), .Y(n13) );
  CLKINVX1 U28 ( .A(n53), .Y(n7) );
  CLKINVX1 U29 ( .A(B[12]), .Y(n15) );
  CLKINVX1 U30 ( .A(B[8]), .Y(n17) );
  CLKINVX1 U31 ( .A(A[12]), .Y(n8) );
  CLKINVX1 U32 ( .A(A[13]), .Y(n6) );
  OAI21XL U33 ( .A0(n20), .A1(n3), .B0(n22), .Y(LT) );
  AOI32X1 U34 ( .A0(n23), .A1(n24), .A2(n25), .B0(B[12]), .B1(n8), .Y(n21) );
  OAI211X1 U35 ( .A0(n26), .A1(n27), .B0(n28), .C0(n29), .Y(n23) );
  AOI31X1 U36 ( .A0(n38), .A1(n39), .A2(n40), .B0(n41), .Y(n34) );
  OAI211X1 U37 ( .A0(n42), .A1(n43), .B0(n44), .C0(n45), .Y(n38) );
  NAND2BX1 U38 ( .AN(A[0]), .B(B[0]), .Y(n50) );
  AO21X1 U39 ( .A0(n22), .A1(n4), .B0(n20), .Y(GT) );
  NOR2X1 U40 ( .A(n6), .B(B[13]), .Y(n20) );
  XOR2X1 U41 ( .A(n8), .B(B[12]), .Y(n25) );
  NAND2BX1 U42 ( .AN(A[11]), .B(B[11]), .Y(n29) );
  NAND2BX1 U43 ( .AN(B[11]), .B(A[11]), .Y(n24) );
  AOI31X1 U44 ( .A0(n10), .A1(n57), .A2(n33), .B0(n30), .Y(n56) );
  NOR2X1 U45 ( .A(n16), .B(A[9]), .Y(n30) );
  NAND2X1 U46 ( .A(A[9]), .B(n16), .Y(n33) );
  NAND2BX1 U47 ( .AN(A[7]), .B(B[7]), .Y(n35) );
  NAND2BX1 U48 ( .AN(n31), .B(n57), .Y(n36) );
  NAND2X1 U49 ( .A(A[8]), .B(n17), .Y(n57) );
  NOR2X1 U50 ( .A(n17), .B(A[8]), .Y(n31) );
  NOR2X1 U51 ( .A(n62), .B(n41), .Y(n40) );
  NOR2BX1 U52 ( .AN(B[6]), .B(A[6]), .Y(n41) );
  NAND2BX1 U53 ( .AN(A[5]), .B(B[5]), .Y(n45) );
  NAND2BX1 U54 ( .AN(B[5]), .B(A[5]), .Y(n39) );
  NOR2X1 U55 ( .A(n18), .B(A[3]), .Y(n46) );
  NAND2X1 U56 ( .A(A[3]), .B(n18), .Y(n49) );
  NAND2BX1 U57 ( .AN(B[0]), .B(A[0]), .Y(n67) );
  NAND2X1 U58 ( .A(n63), .B(n44), .Y(n42) );
  NAND2BX1 U59 ( .AN(A[4]), .B(B[4]), .Y(n44) );
  NOR2X1 U60 ( .A(n62), .B(n37), .Y(n59) );
  NOR2BX1 U61 ( .AN(A[7]), .B(B[7]), .Y(n37) );
  NOR2BX1 U62 ( .AN(A[6]), .B(B[6]), .Y(n62) );
  NAND2X1 U63 ( .A(n55), .B(n28), .Y(n26) );
  NAND2BX1 U64 ( .AN(A[10]), .B(B[10]), .Y(n28) );
  NAND2BX1 U65 ( .AN(B[10]), .B(A[10]), .Y(n55) );
  NAND2X1 U66 ( .A(B[13]), .B(n6), .Y(n22) );
endmodule


module core_DW01_cmp6_0 ( A, B, LT, GT );
  input [13:0] A;
  input [13:0] B;
  output LT, GT;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63;

  NAND2X2 U1 ( .A(A[2]), .B(n14), .Y(n60) );
  CLKINVX1 U2 ( .A(B[3]), .Y(n13) );
  AOI211X1 U3 ( .A0(A[1]), .A1(n45), .B0(n46), .C0(n47), .Y(n43) );
  NOR2X1 U4 ( .A(n13), .B(A[3]), .Y(n41) );
  OAI21X1 U5 ( .A0(n15), .A1(n16), .B0(n17), .Y(LT) );
  AOI32X1 U6 ( .A0(n18), .A1(n19), .A2(n20), .B0(B[12]), .B1(n3), .Y(n16) );
  AOI211X2 U7 ( .A0(n62), .A1(n9), .B0(n46), .C0(n63), .Y(n61) );
  OA21X2 U8 ( .A0(n62), .A1(n9), .B0(B[1]), .Y(n63) );
  AOI31X2 U9 ( .A0(n8), .A1(n60), .A2(n44), .B0(n41), .Y(n59) );
  INVX3 U10 ( .A(n61), .Y(n8) );
  AOI32X2 U11 ( .A0(n49), .A1(n24), .A2(n20), .B0(A[12]), .B1(n10), .Y(n48) );
  OAI211X2 U12 ( .A0(n21), .A1(n4), .B0(n19), .C0(n50), .Y(n49) );
  OAI31X1 U13 ( .A0(n25), .A1(n26), .A2(n27), .B0(n28), .Y(n22) );
  AOI211X2 U14 ( .A0(n29), .A1(n30), .B0(n31), .C0(n32), .Y(n27) );
  OAI31X1 U15 ( .A0(n41), .A1(n42), .A2(n43), .B0(n44), .Y(n38) );
  NAND2BX4 U16 ( .AN(B[0]), .B(A[0]), .Y(n62) );
  NOR2X4 U17 ( .A(n14), .B(A[2]), .Y(n42) );
  NAND2BX4 U18 ( .AN(A[0]), .B(B[0]), .Y(n45) );
  OAI211X2 U19 ( .A0(n37), .A1(n7), .B0(n34), .C0(n58), .Y(n56) );
  INVX3 U20 ( .A(n59), .Y(n7) );
  INVX8 U21 ( .A(A[1]), .Y(n9) );
  AOI211X2 U22 ( .A0(n54), .A1(n55), .B0(n31), .C0(n6), .Y(n53) );
  NAND3X2 U23 ( .A(n56), .B(n40), .C(n35), .Y(n55) );
  INVX1 U24 ( .A(n53), .Y(n5) );
  INVX1 U25 ( .A(n51), .Y(n4) );
  INVX3 U26 ( .A(B[2]), .Y(n14) );
  CLKINVX3 U27 ( .A(n48), .Y(n2) );
  INVX1 U28 ( .A(B[8]), .Y(n12) );
  CLKINVX1 U29 ( .A(n30), .Y(n6) );
  CLKINVX1 U30 ( .A(B[12]), .Y(n10) );
  CLKINVX1 U31 ( .A(B[9]), .Y(n11) );
  CLKINVX1 U32 ( .A(A[12]), .Y(n3) );
  CLKINVX1 U33 ( .A(A[13]), .Y(n1) );
  OAI211X1 U34 ( .A0(n21), .A1(n22), .B0(n23), .C0(n24), .Y(n18) );
  AOI31X1 U35 ( .A0(n33), .A1(n34), .A2(n35), .B0(n36), .Y(n29) );
  OAI211X1 U36 ( .A0(n37), .A1(n38), .B0(n39), .C0(n40), .Y(n33) );
  AOI2BB1X1 U37 ( .A0N(n45), .A1N(A[1]), .B0(B[1]), .Y(n47) );
  AO21X1 U38 ( .A0(n17), .A1(n2), .B0(n15), .Y(GT) );
  NOR2X1 U39 ( .A(n1), .B(B[13]), .Y(n15) );
  XOR2X1 U40 ( .A(n3), .B(B[12]), .Y(n20) );
  NAND2BX1 U41 ( .AN(A[11]), .B(B[11]), .Y(n24) );
  NAND2BX1 U42 ( .AN(B[11]), .B(A[11]), .Y(n19) );
  AOI31X1 U43 ( .A0(n5), .A1(n52), .A2(n28), .B0(n25), .Y(n51) );
  NOR2X1 U44 ( .A(n11), .B(A[9]), .Y(n25) );
  NAND2X1 U45 ( .A(A[9]), .B(n11), .Y(n28) );
  NAND2BX1 U46 ( .AN(A[7]), .B(B[7]), .Y(n30) );
  NAND2BX1 U47 ( .AN(n26), .B(n52), .Y(n31) );
  NAND2X1 U48 ( .A(A[8]), .B(n12), .Y(n52) );
  NOR2X1 U49 ( .A(n12), .B(A[8]), .Y(n26) );
  NOR2X1 U50 ( .A(n57), .B(n36), .Y(n35) );
  NOR2BX1 U51 ( .AN(B[6]), .B(A[6]), .Y(n36) );
  NAND2BX1 U52 ( .AN(A[5]), .B(B[5]), .Y(n40) );
  NAND2BX1 U53 ( .AN(B[5]), .B(A[5]), .Y(n34) );
  NAND2X1 U54 ( .A(A[3]), .B(n13), .Y(n44) );
  NAND2BX1 U55 ( .AN(n42), .B(n60), .Y(n46) );
  NAND2X1 U56 ( .A(n58), .B(n39), .Y(n37) );
  NAND2BX1 U57 ( .AN(A[4]), .B(B[4]), .Y(n39) );
  NAND2BX1 U58 ( .AN(B[4]), .B(A[4]), .Y(n58) );
  NOR2X1 U59 ( .A(n57), .B(n32), .Y(n54) );
  NOR2BX1 U60 ( .AN(A[7]), .B(B[7]), .Y(n32) );
  NOR2BX1 U61 ( .AN(A[6]), .B(B[6]), .Y(n57) );
  NAND2X1 U62 ( .A(n50), .B(n23), .Y(n21) );
  NAND2BX1 U63 ( .AN(A[10]), .B(B[10]), .Y(n23) );
  NAND2BX1 U64 ( .AN(B[10]), .B(A[10]), .Y(n50) );
  NAND2X1 U65 ( .A(B[13]), .B(n1), .Y(n17) );
endmodule


module core_DW01_inc_4_DW01_inc_10 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module core_DW01_inc_3_DW01_inc_9 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module core_DW01_inc_1_DW01_inc_4 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;
  wire   n1, n2, n3, n4;
  wire   [10:2] carry;

  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX2 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX2 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX4 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX4 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  CMPR22X2 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  NAND2X1 U1 ( .A(carry[10]), .B(n2), .Y(n3) );
  NAND2X2 U2 ( .A(n1), .B(A[10]), .Y(n4) );
  NAND2X2 U3 ( .A(n3), .B(n4), .Y(SUM[10]) );
  CLKINVX1 U4 ( .A(carry[10]), .Y(n1) );
  INVXL U5 ( .A(A[10]), .Y(n2) );
  INVXL U6 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module core_DW01_inc_0 ( \A[13] , \A[12] , \A[11] , \A[10] , \A[9] , \A[8] , 
        \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , 
        \SUM[14] , \SUM[13] , \SUM[12] , \SUM[11] , \SUM[10] , \SUM[9] , 
        \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] , \SUM[3] , \SUM[2] , 
        \SUM[1]  );
  input \A[13] , \A[12] , \A[11] , \A[10] , \A[9] , \A[8] , \A[7] , \A[6] ,
         \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] ;
  output \SUM[14] , \SUM[13] , \SUM[12] , \SUM[11] , \SUM[10] , \SUM[9] ,
         \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] , \SUM[3] , \SUM[2] ,
         \SUM[1] ;
  wire   n1, n2, n3, n4;
  wire   [13:0] A;
  wire   [14:1] SUM;
  wire   [13:2] carry;
  assign A[13] = \A[13] ;
  assign A[12] = \A[12] ;
  assign A[11] = \A[11] ;
  assign A[10] = \A[10] ;
  assign A[9] = \A[9] ;
  assign A[8] = \A[8] ;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign A[0] = \A[0] ;
  assign \SUM[14]  = SUM[14];
  assign \SUM[13]  = SUM[13];
  assign \SUM[12]  = SUM[12];
  assign \SUM[11]  = SUM[11];
  assign \SUM[10]  = SUM[10];
  assign \SUM[9]  = SUM[9];
  assign \SUM[8]  = SUM[8];
  assign \SUM[7]  = SUM[7];
  assign \SUM[6]  = SUM[6];
  assign \SUM[5]  = SUM[5];
  assign \SUM[4]  = SUM[4];
  assign \SUM[3]  = SUM[3];
  assign \SUM[2]  = SUM[2];
  assign \SUM[1]  = SUM[1];

  ADDHX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(SUM[14]), .S(SUM[13]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX2 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHX4 U1_1_9 ( .A(n3), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX4 U1_1_10 ( .A(n4), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHX2 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX2 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX2 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_6 ( .A(n1), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_7 ( .A(n2), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX2 U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKBUFX2 U1 ( .A(A[6]), .Y(n1) );
  CLKBUFX2 U2 ( .A(A[7]), .Y(n2) );
  CLKBUFX2 U3 ( .A(A[9]), .Y(n3) );
  CLKBUFX2 U4 ( .A(A[10]), .Y(n4) );
endmodule


module core_DW01_add_3 ( A, SUM, \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , 
        \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0]  );
  input [16:0] A;
  output [16:0] SUM;
  input \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , \B[6] , \B[5] , \B[4] ,
         \B[3] , \B[2] , \B[1] , \B[0] ;
  wire   n1;
  wire   [11:0] B;
  wire   [15:1] carry;
  assign B[11] = \B[11] ;
  assign B[10] = \B[10] ;
  assign B[9] = \B[9] ;
  assign B[8] = \B[8] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  CMPR32X2 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX4 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFHX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  CLKAND2X8 U1 ( .A(carry[14]), .B(A[14]), .Y(carry[15]) );
  XOR2X1 U2 ( .A(A[14]), .B(carry[14]), .Y(SUM[14]) );
  CLKAND2X8 U3 ( .A(carry[13]), .B(A[13]), .Y(carry[14]) );
  CLKAND2X3 U4 ( .A(carry[12]), .B(A[12]), .Y(carry[13]) );
  XOR2X4 U5 ( .A(A[15]), .B(carry[15]), .Y(SUM[15]) );
  NAND2X6 U6 ( .A(carry[15]), .B(A[15]), .Y(n1) );
  XNOR2X1 U7 ( .A(A[16]), .B(n1), .Y(SUM[16]) );
  XOR2X1 U8 ( .A(A[13]), .B(carry[13]), .Y(SUM[13]) );
  XOR2X1 U9 ( .A(A[12]), .B(carry[12]), .Y(SUM[12]) );
  AND2X1 U10 ( .A(A[0]), .B(B[0]), .Y(carry[1]) );
  XOR2X1 U11 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module core_DW01_add_2 ( A, SUM, \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , 
        \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0]  );
  input [16:0] A;
  output [16:0] SUM;
  input \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , \B[6] , \B[5] , \B[4] ,
         \B[3] , \B[2] , \B[1] , \B[0] ;
  wire   n1, n2;
  wire   [11:0] B;
  wire   [15:1] carry;
  assign B[11] = \B[11] ;
  assign B[10] = \B[10] ;
  assign B[9] = \B[9] ;
  assign B[8] = \B[8] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFHX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(A[0]), .B(B[0]), .Y(carry[1]) );
  XNOR2X4 U2 ( .A(A[16]), .B(n2), .Y(SUM[16]) );
  AND2XL U3 ( .A(carry[13]), .B(A[13]), .Y(n1) );
  CLKAND2X12 U4 ( .A(carry[13]), .B(A[13]), .Y(carry[14]) );
  CLKAND2X12 U5 ( .A(carry[12]), .B(A[12]), .Y(carry[13]) );
  XOR2XL U6 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X4 U7 ( .A(A[15]), .B(carry[15]), .Y(SUM[15]) );
  AND2X8 U8 ( .A(carry[14]), .B(A[14]), .Y(carry[15]) );
  NAND2X1 U9 ( .A(carry[15]), .B(A[15]), .Y(n2) );
  XOR2X1 U10 ( .A(A[14]), .B(n1), .Y(SUM[14]) );
  XOR2X1 U11 ( .A(A[13]), .B(carry[13]), .Y(SUM[13]) );
  XOR2X1 U12 ( .A(A[12]), .B(carry[12]), .Y(SUM[12]) );
endmodule


module core_DW01_add_1 ( A, SUM, \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , 
        \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0]  );
  input [16:0] A;
  output [16:0] SUM;
  input \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , \B[6] , \B[5] , \B[4] ,
         \B[3] , \B[2] , \B[1] , \B[0] ;
  wire   n1;
  wire   [11:0] B;
  wire   [15:1] carry;
  assign B[11] = \B[11] ;
  assign B[10] = \B[10] ;
  assign B[9] = \B[9] ;
  assign B[8] = \B[8] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  ADDFHX4 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFHX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(A[0]), .B(B[0]), .Y(carry[1]) );
  XOR2X1 U2 ( .A(A[13]), .B(carry[13]), .Y(SUM[13]) );
  CLKAND2X12 U3 ( .A(carry[13]), .B(A[13]), .Y(carry[14]) );
  CLKAND2X12 U4 ( .A(carry[12]), .B(A[12]), .Y(carry[13]) );
  XOR2XL U5 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XNOR2X4 U6 ( .A(A[16]), .B(n1), .Y(SUM[16]) );
  NAND2X1 U7 ( .A(carry[15]), .B(A[15]), .Y(n1) );
  XOR2X1 U8 ( .A(A[15]), .B(carry[15]), .Y(SUM[15]) );
  AND2X1 U9 ( .A(carry[14]), .B(A[14]), .Y(carry[15]) );
  XOR2X1 U10 ( .A(A[14]), .B(carry[14]), .Y(SUM[14]) );
  XOR2X1 U11 ( .A(A[12]), .B(carry[12]), .Y(SUM[12]) );
endmodule


module core_DW01_add_0 ( A, SUM, \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , 
        \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0]  );
  input [16:0] A;
  output [16:0] SUM;
  input \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , \B[6] , \B[5] , \B[4] ,
         \B[3] , \B[2] , \B[1] , \B[0] ;
  wire   n1;
  wire   [11:0] B;
  wire   [15:1] carry;
  assign B[11] = \B[11] ;
  assign B[10] = \B[10] ;
  assign B[9] = \B[9] ;
  assign B[8] = \B[8] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  ADDFHX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  XOR2X4 U1 ( .A(A[15]), .B(carry[15]), .Y(SUM[15]) );
  AND2X2 U2 ( .A(carry[12]), .B(A[12]), .Y(carry[13]) );
  XNOR2X2 U3 ( .A(A[16]), .B(n1), .Y(SUM[16]) );
  NAND2X2 U4 ( .A(carry[15]), .B(A[15]), .Y(n1) );
  CLKAND2X2 U5 ( .A(A[0]), .B(B[0]), .Y(carry[1]) );
  CLKAND2X12 U6 ( .A(carry[13]), .B(A[13]), .Y(carry[14]) );
  XOR2XL U7 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  AND2X8 U8 ( .A(carry[14]), .B(A[14]), .Y(carry[15]) );
  XOR2X1 U9 ( .A(A[14]), .B(carry[14]), .Y(SUM[14]) );
  XOR2X1 U10 ( .A(A[13]), .B(carry[13]), .Y(SUM[13]) );
  XOR2X1 U11 ( .A(A[12]), .B(carry[12]), .Y(SUM[12]) );
endmodule


module Sobel_gradient ( i_clk, i_rst_n, i_start, a1, a2, a3, a4, a6, a7, a8, 
        a9, o_sobel_finish, sobel_result, NMS_direction, sobel1U80_Y_INV );
  input [7:0] a1;
  input [7:0] a2;
  input [7:0] a3;
  input [7:0] a4;
  input [7:0] a6;
  input [7:0] a7;
  input [7:0] a8;
  input [7:0] a9;
  output [13:0] sobel_result;
  output [1:0] NMS_direction;
  input i_clk, i_rst_n, i_start;
  output o_sobel_finish, sobel1U80_Y_INV;
  wire   n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931,
         n932, n933, n934, N35, N46, N47, N48, N49, N50, N51, N52, N53, N54,
         N55, N65, N66, N67, N68, N69, N70, N71, N72, N73, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N111, N112, N113, N114, N115, N116,
         N117, N118, N119, N128, N129, N130, N131, N132, N133, N134, N135,
         N136, N137, N152, N153, N154, N155, N156, N157, N158, N159, N160,
         N161, N162, N163, N164, Gxy_r_0__12_, Gxy_r_0__11_, Gxy_r_0__10_,
         Gxy_r_0__9_, Gxy_r_0__8_, Gxy_r_0__7_, Gxy_r_0__5_, Gxy_r_0__4_,
         Gxy_r_0__3_, N205, N206, N207, N208, N209, N210, N211, N212, N213,
         N214, N215, N216, N217, N218, N220, n102, n103, n104, n105, n106,
         n107, n1110, n1130, n1140, n1150, n121, n122, n123, n124, n125, n126,
         n127, n1280, n138, n139, n140, n141, res_3_9_, res_3_8_, res_3_7_,
         res_3_6_, res_3_5_, res_3_4_, res_3_3_, res_3_2_, res_3_1_, res_3_10_,
         res_3_0_, res_2_9_, res_2_8_, res_2_7_, res_2_6_, res_2_5_, res_2_4_,
         res_2_3_, res_2_2_, res_2_1_, res_2_10_, res_1_9_, res_1_8_, res_1_7_,
         res_1_6_, res_1_5_, res_1_4_, res_1_3_, res_1_2_, res_1_1_, res_1_10_,
         res_1_0_, ans_9_, ans_8_, ans_7_, ans_6_, ans_5_, ans_4_, ans_3_,
         ans_2_, ans_1_, ans_11_, ans_10_, ans_0_,
         sub_1_root_sub_0_root_sub_2382_DIFF_5_,
         sub_1_root_sub_0_root_sub_2382_DIFF_6_,
         sub_1_root_sub_0_root_sub_2382_DIFF_7_,
         sub_1_root_sub_0_root_sub_2382_DIFF_8_,
         sub_1_root_sub_0_root_sub_2382_DIFF_9_,
         sub_1_root_sub_0_root_sub_2382_DIFF_10_,
         sub_1_root_sub_0_root_sub_2382_DIFF_11_,
         sub_1_root_sub_0_root_sub_2382_DIFF_12_,
         sub_1_root_sub_0_root_sub_2382_DIFF_13_,
         sub_1_root_sub_0_root_sub_2382_DIFF_14_,
         sub_1_root_sub_0_root_sub_2382_DIFF_15_,
         sub_1_root_sub_0_root_sub_2382_DIFF_16_,
         sub_1_root_sub_0_root_sub_2382_DIFF_17_,
         sub_1_root_sub_0_root_sub_2382_DIFF_18_,
         add_3_root_sub_0_root_sub_2382_SUM_2_,
         add_3_root_sub_0_root_sub_2382_SUM_3_,
         add_3_root_sub_0_root_sub_2382_SUM_4_,
         add_3_root_sub_0_root_sub_2382_SUM_5_,
         add_3_root_sub_0_root_sub_2382_SUM_6_,
         add_3_root_sub_0_root_sub_2382_SUM_7_,
         add_3_root_sub_0_root_sub_2382_SUM_8_,
         add_3_root_sub_0_root_sub_2382_SUM_9_,
         add_3_root_sub_0_root_sub_2382_SUM_10_,
         add_3_root_sub_0_root_sub_2382_SUM_11_,
         add_3_root_sub_0_root_sub_2382_SUM_12_,
         add_3_root_sub_0_root_sub_2382_SUM_13_,
         add_3_root_sub_0_root_sub_2382_SUM_14_,
         add_3_root_sub_0_root_sub_2382_SUM_15_, n2, n3, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n3500, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n4600, n4700, n4800,
         n4900, n5000, n5100, n5200, n5300, n5400, n5500, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n6500, n6600, n6700, n6800, n6900, n7000,
         n7100, n7200, n7300, n74, n75, n76, n77, n78, n79, n80, n81, n8200,
         n8300, n8400, n8500, n8600, n8700, n8800, n8900, n9000, n9100, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n108, n109, n110,
         n1120, n1160, n1170, n1180, n1190, n120, n1290, n1300, n1310, n1320,
         n1330, n1340, n1350, n1360, n1370, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n1520, n1530, n1540, n1550, n1560, n1570,
         n1580, n1590, n1600, n1610, n1620, n1630, n1640, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n2050, n2060, n2070, n2080, n2090, n2100,
         n2110, n2120, n2130, n2140, n2150, n2160, n2170, n2180, n219, n2200,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n3501, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n4601, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n4701, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n4801, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n4901, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n5001, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n5101, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n5201, n521, n522, n523, n524, n525, n526, n527, n528,
         n529, n5301, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n5401, n541, n542, n543, n544, n545, n546, n547, n548, n549, n5501,
         n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n6501, n651, n652, n653, n654, n655, n656, n657, n658, n659, n6601,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n6701, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n6801, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n6901, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n7001, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n7101, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n7201, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n7301, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, n806,
         n807, n808, n809, n810, n811, n812, n813, n814, n815, n816, n817,
         n818, n819, n8201, n821, n822, n823, n824, n825, n826, n827, n829,
         n8301, n831, n832, n833, n834, n835, n836, n837, n838, n839, n8401,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, n8501, n851,
         n852, n853, n854, n855, n856, n857, n858, n859, n8601, n861, n862,
         n863, n864, n865, n866, n867, n868, n869, n8701, n871, n872, n873,
         n874, n875, n876, n892, n893, n894, n895, n896, n897, n898, n899,
         n9001, n901, n902, n903, n904, n905, n906, n907, n908, n909, n9101,
         n911, n912, n913, n914, n915, n916, n917, n918, n919;
  wire   [20:0] indata2;
  wire   [20:0] indata3;
  wire   [20:0] indata4;
  wire   [2:0] state_r;
  wire   [9:0] temp_1;
  wire   [7:0] temp_2;
  wire   [9:1] temp_3;
  wire   [8:1] temp_4;
  wire   [9:0] temp_5;
  wire   [7:0] temp_6;
  wire   [12:0] Gxy_temp;
  wire   [1:0] smallest_r;

  comparator comp ( .a1({1'b0, Gxy_r_0__12_, Gxy_r_0__11_, Gxy_r_0__10_, 
        Gxy_r_0__9_, Gxy_r_0__8_, Gxy_r_0__7_, n7, n97, Gxy_r_0__4_, n272, 
        n626, n627, n270, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .a2({
        indata2[20], n233, n2140, n225, n239, n266, indata2[14], n236, n265, 
        n227, n197, n242, n241, n219, n2180, indata2[5:3], n9100, indata2[1:0]}), .a3({indata3[20], n630, indata3[18:7], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .a4(indata4), .smallest(smallest_r), .sobel1U82_Y(n2120), 
        .i_rst_n_INV(n829), .i_clk(i_clk) );
  NAND3BX4 U74 ( .AN(state_r[1]), .B(state_r[2]), .C(state_r[0]), .Y(n102) );
  Sobel_gradient_DW01_add_0_DW01_add_14 add_2484 ( .SUM({N218, N217, N216, 
        N215, N214, N213, N212, N211, N210, N209, N208, N207, N206, N205}), 
        .\A[12] (n151), .\A[11] (n729), .\A[10] (n5300), .\A[9] (n171), 
        .\A[8] (n108), .\A[7] (n1540), .\A[6] (n99), .\A[5] (n165), .\A[4] (
        n733), .\A[3] (n732), .\A[2] (n731), .\A[1] (n7301), .\A[0] (n56), 
        .\B[12] (Gxy_r_0__12_), .\B[11] (Gxy_r_0__11_), .\B[10] (Gxy_r_0__10_), 
        .\B[9] (Gxy_r_0__9_), .\B[8] (Gxy_r_0__8_), .\B[7] (Gxy_r_0__7_), 
        .\B[6] (n450), .\B[5] (Gxy_r_0__5_), .\B[4] (Gxy_r_0__4_), .\B[3] (
        Gxy_r_0__3_), .\B[2] (n626), .\B[1] (n627), .\B[0] (n269) );
  Sobel_gradient_DW01_inc_0_DW01_inc_12 add_2361 ( .A({n98, n81, n78, n76, 
        n892, n6800, n7300, n6500, n893, n234, n248, n894, n895}), .SUM({N164, 
        N163, N162, N161, N160, N159, N158, N157, N156, N155, N154, N153, N152}), .sobel1U120_Y(n275), .i_rst_n_INV(i_rst_n), .i_clk(i_clk) );
  Sobel_gradient_DW01_inc_1_DW01_inc_13 add_2342 ( .SUM({N137, N136, N135, 
        N134, N133, N132, N131, N130, N129, N128}), .\A[7] (n8500), .\A[6] (
        n8400), .\A[5] (n8200), .\A[4] (n79), .\A[3] (n7200), .\A[2] (n7100), 
        .\A[1] (n2170), .\A[0] (n243) );
  Sobel_gradient_DW01_inc_2_DW01_inc_14 add_2340 ( .sobel1U79_Y(N35), 
        .i_rst_n_INV(i_rst_n), .i_clk(i_clk), .\A[8] (n904), .\A[7] (n905), 
        .\A[6] (n906), .\A[5] (n907), .\A[4] (n908), .\A[3] (n909), .\A[2] (
        n9101), .\A[1] (n911), .\SUM[9] (N119), .\SUM[8] (N118), .\SUM[7] (
        N117), .\SUM[6] (N116), .\SUM[5] (N115), .\SUM[4] (N114), .\SUM[3] (
        N113), .\SUM[2] (N112), .\SUM[1] (N111) );
  Sobel_gradient_DW01_inc_3_DW01_inc_15 add_2334 ( .SUM({N91, N90, N89, N88, 
        N87, N86, N85, N84, N83, N82}), .\A[7] (n8600), .\A[6] (n8300), 
        .\A[5] (n80), .\A[4] (n75), .\A[3] (n6900), .\A[2] (n7000), .\A[1] (
        n221), .\A[0] (n245) );
  Sobel_gradient_DW01_inc_4_DW01_inc_16 add_2332 ( .sobel1U79_Y(N35), 
        .i_rst_n_INV(i_rst_n), .i_clk(i_clk), .\A[8] (n912), .\A[7] (n913), 
        .\A[6] (n914), .\A[5] (n915), .\A[4] (n916), .\A[3] (n917), .\A[2] (
        n918), .\A[1] (n919), .\SUM[9] (N73), .\SUM[8] (N72), .\SUM[7] (N71), 
        .\SUM[6] (N70), .\SUM[5] (N69), .\SUM[4] (N68), .\SUM[3] (N67), 
        .\SUM[2] (N66), .\SUM[1] (N65) );
  Sobel_gradient_DW01_inc_5_DW01_inc_17 r440 ( .SUM({N55, N54, N53, N52, N51, 
        N50, N49, N48, N47, N46}), .sobel1U79_Y(N35), .i_rst_n_INV(i_rst_n), 
        .i_clk(i_clk), .\A[7] (n896), .\A[6] (n897), .\A[5] (n898), .\A[4] (
        n899), .\A[3] (n9001), .\A[2] (n901), .\A[1] (n902), .\A[0] (n903) );
  Sobel_gradient_DW01_add_7_DW01_add_29 add_4_root_add_2360 ( .A({n204, temp_1}), .SUM({res_3_10_, res_3_9_, res_3_8_, res_3_7_, res_3_6_, res_3_5_, res_3_4_, 
        res_3_3_, res_3_2_, res_3_1_, res_3_0_}), .\B[7] (temp_2[7]), .\B[6] (
        temp_2[6]), .\B[5] (temp_2[5]), .\B[4] (temp_2[4]), .\B[3] (temp_2[3]), 
        .\B[2] (temp_2[2]), .\B[1] (temp_2[1]), .\B[0] (temp_2[0]) );
  Sobel_gradient_DW01_add_6_DW01_add_28 add_3_root_add_2360 ( .\A[10] (n2060), 
        .\A[9] (temp_3[9]), .\A[8] (temp_3[8]), .\A[7] (temp_3[7]), .\A[6] (
        temp_3[6]), .\A[5] (temp_3[5]), .\A[4] (temp_3[4]), .\A[3] (temp_3[3]), 
        .\A[2] (temp_3[2]), .\A[1] (temp_3[1]), .\B[8] (temp_4[8]), .\B[7] (
        temp_4[7]), .\B[6] (temp_4[6]), .\B[5] (temp_4[5]), .\B[4] (temp_4[4]), 
        .\B[3] (temp_4[3]), .\B[2] (temp_4[2]), .\B[1] (temp_4[1]), 
        .\SUM[10] (res_2_10_), .\SUM[9] (res_2_9_), .\SUM[8] (res_2_8_), 
        .\SUM[7] (res_2_7_), .\SUM[6] (res_2_6_), .\SUM[5] (res_2_5_), 
        .\SUM[4] (res_2_4_), .\SUM[3] (res_2_3_), .\SUM[2] (res_2_2_), 
        .\SUM[1] (res_2_1_) );
  Sobel_gradient_DW01_add_5_DW01_add_27 add_2_root_add_2360 ( .A({temp_5[9], 
        temp_5}), .SUM({res_1_10_, res_1_9_, res_1_8_, res_1_7_, res_1_6_, 
        res_1_5_, res_1_4_, res_1_3_, res_1_2_, res_1_1_, res_1_0_}), .\B[7] (
        temp_6[7]), .\B[6] (temp_6[6]), .\B[5] (temp_6[5]), .\B[4] (temp_6[4]), 
        .\B[3] (temp_6[3]), .\B[2] (temp_6[2]), .\B[1] (temp_6[1]), .\B[0] (
        temp_6[0]) );
  Sobel_gradient_DW01_add_4_DW01_add_26 add_1_root_add_2360 ( .A({n255, n255, 
        res_3_9_, res_3_8_, res_3_7_, res_3_6_, res_3_5_, res_3_4_, res_3_3_, 
        res_3_2_, res_3_1_, res_3_0_}), .SUM({ans_11_, ans_10_, ans_9_, ans_8_, 
        ans_7_, ans_6_, ans_5_, ans_4_, ans_3_, ans_2_, ans_1_, ans_0_}), 
        .\B[11] (n198), .\B[10] (n150), .\B[9] (res_2_9_), .\B[8] (res_2_8_), 
        .\B[7] (res_2_7_), .\B[6] (res_2_6_), .\B[5] (res_2_5_), .\B[4] (
        res_2_4_), .\B[3] (res_2_3_), .\B[2] (res_2_2_), .\B[1] (res_2_1_) );
  Sobel_gradient_DW01_add_3_DW01_add_25 add_0_root_add_2360 ( .A({res_1_10_, 
        res_1_10_, res_1_10_, res_1_9_, res_1_8_, res_1_7_, res_1_6_, res_1_5_, 
        res_1_4_, res_1_3_, res_1_2_, res_1_1_, res_1_0_}), .B({n257, ans_11_, 
        ans_10_, ans_9_, ans_8_, ans_7_, ans_6_, ans_5_, ans_4_, ans_3_, 
        ans_2_, ans_1_, ans_0_}), .SUM(Gxy_temp) );
  Sobel_gradient_DW01_sub_7 sub_0_root_sub_0_root_sub_2382 ( .DIFF(indata2), 
        .sobel1U120_Y(n275), .i_rst_n_INV(i_rst_n), .i_clk(i_clk), .\A[20] (
        n629), .\A[19] (n628), .\A[18] (
        sub_1_root_sub_0_root_sub_2382_DIFF_18_), .\A[17] (
        sub_1_root_sub_0_root_sub_2382_DIFF_17_), .\A[16] (
        sub_1_root_sub_0_root_sub_2382_DIFF_16_), .\A[15] (
        sub_1_root_sub_0_root_sub_2382_DIFF_15_), .\A[14] (
        sub_1_root_sub_0_root_sub_2382_DIFF_14_), .\A[13] (
        sub_1_root_sub_0_root_sub_2382_DIFF_13_), .\A[12] (
        sub_1_root_sub_0_root_sub_2382_DIFF_12_), .\A[11] (
        sub_1_root_sub_0_root_sub_2382_DIFF_11_), .\A[10] (
        sub_1_root_sub_0_root_sub_2382_DIFF_10_), .\A[9] (
        sub_1_root_sub_0_root_sub_2382_DIFF_9_), .\A[8] (
        sub_1_root_sub_0_root_sub_2382_DIFF_8_), .\A[7] (
        sub_1_root_sub_0_root_sub_2382_DIFF_7_), .\A[6] (
        sub_1_root_sub_0_root_sub_2382_DIFF_6_), .\A[5] (
        sub_1_root_sub_0_root_sub_2382_DIFF_5_), .\A[4] (n1370), .\B[15] (
        add_3_root_sub_0_root_sub_2382_SUM_15_), .\B[14] (
        add_3_root_sub_0_root_sub_2382_SUM_14_), .\B[13] (
        add_3_root_sub_0_root_sub_2382_SUM_13_), .\B[12] (
        add_3_root_sub_0_root_sub_2382_SUM_12_), .\B[11] (
        add_3_root_sub_0_root_sub_2382_SUM_11_), .\B[10] (
        add_3_root_sub_0_root_sub_2382_SUM_10_), .\B[9] (
        add_3_root_sub_0_root_sub_2382_SUM_9_), .\B[8] (
        add_3_root_sub_0_root_sub_2382_SUM_8_), .\B[7] (
        add_3_root_sub_0_root_sub_2382_SUM_7_), .\B[6] (
        add_3_root_sub_0_root_sub_2382_SUM_6_), .\B[5] (
        add_3_root_sub_0_root_sub_2382_SUM_5_), .\B[4] (
        add_3_root_sub_0_root_sub_2382_SUM_4_), .\B[3] (
        add_3_root_sub_0_root_sub_2382_SUM_3_), .\B[2] (
        add_3_root_sub_0_root_sub_2382_SUM_2_), .\B[1] (n2), .\B[0] (n1370) );
  Sobel_gradient_DW01_sub_8 sub_2384 ( .A({indata2[20:18], n225, 
        indata2[16:11], n144, indata2[9:8], n219, n2180, indata2[5:3], n9100, 
        indata2[1:0]}), .DIFF(indata4), .\B[20] (n151), .\B[19] (n729), 
        .\B[18] (n5300), .\B[17] (n738), .\B[16] (n737), .\B[15] (n1540), 
        .\B[14] (n735), .\B[13] (n166), .\B[12] (n733), .\B[11] (n732), 
        .\B[10] (n143), .\B[9] (n7301), .\B[8] (n1370) );
  DFFSX1 i_clk_r_REG351_S6 ( .D(n724), .CK(i_clk), .SN(n726), .Q(n825), .QN(
        n81) );
  DFFSX1 i_clk_r_REG350_S6 ( .D(n723), .CK(i_clk), .SN(n726), .Q(n824), .QN(
        n78) );
  DFFSX1 i_clk_r_REG349_S6 ( .D(n722), .CK(i_clk), .SN(n726), .Q(n823), .QN(
        n76) );
  DFFSX1 i_clk_r_REG348_S6 ( .D(n721), .CK(i_clk), .SN(n726), .Q(n822) );
  DFFSX1 i_clk_r_REG347_S6 ( .D(n7201), .CK(i_clk), .SN(n726), .Q(n821), .QN(
        n6800) );
  DFFSX1 i_clk_r_REG319_S7 ( .D(n666), .CK(i_clk), .SN(n726), .Q(n768) );
  DFFSX1 i_clk_r_REG236_S7 ( .D(n664), .CK(i_clk), .SN(n726), .Q(n766) );
  DFFSX1 i_clk_r_REG317_S7 ( .D(n663), .CK(i_clk), .SN(n726), .Q(n765) );
  DFFRX4 i_clk_r_REG329_S7 ( .D(n653), .CK(i_clk), .RN(n726), .Q(n738), .QN(
        n305) );
  DFFRX4 i_clk_r_REG327_S7 ( .D(n652), .CK(i_clk), .RN(n726), .Q(n737), .QN(
        n316) );
  DFFRX4 i_clk_r_REG326_S7 ( .D(n651), .CK(i_clk), .RN(n726), .Q(n736), .QN(
        n191) );
  DFFRX4 i_clk_r_REG324_S7 ( .D(n6501), .CK(i_clk), .RN(n726), .Q(n735), .QN(
        n314) );
  DFFRX4 i_clk_r_REG322_S7 ( .D(n649), .CK(i_clk), .RN(n726), .Q(n734), .QN(
        n311) );
  DFFRX4 i_clk_r_REG331_S7 ( .D(n644), .CK(i_clk), .RN(n726), .Q(n729), .QN(
        n179) );
  DFFRX4 i_clk_r_REG330_S7 ( .D(n643), .CK(i_clk), .RN(n726), .Q(n728), .QN(
        n190) );
  DFFRXL i_clk_r_REG310_S8 ( .D(n921), .CK(i_clk), .RN(n726), .Q(
        sobel_result[13]) );
  DFFRXL i_clk_r_REG353_S6 ( .D(n6701), .CK(i_clk), .RN(n726), .Q(n772) );
  DFFRXL i_clk_r_REG354_S7 ( .D(n669), .CK(i_clk), .RN(n726), .Q(n771) );
  DFFRXL i_clk_r_REG300_S8 ( .D(n923), .CK(i_clk), .RN(n726), .Q(
        sobel_result[11]) );
  DFFRXL i_clk_r_REG305_S8 ( .D(n922), .CK(i_clk), .RN(n726), .Q(
        sobel_result[12]) );
  DFFRXL i_clk_r_REG285_S8 ( .D(n926), .CK(i_clk), .RN(n726), .Q(
        sobel_result[8]) );
  DFFRXL i_clk_r_REG280_S8 ( .D(n927), .CK(i_clk), .RN(n726), .Q(
        sobel_result[7]) );
  DFFRXL i_clk_r_REG270_S8 ( .D(n929), .CK(i_clk), .RN(n726), .Q(
        sobel_result[5]) );
  DFFRXL i_clk_r_REG539_S5 ( .D(n6801), .CK(i_clk), .RN(n726), .Q(n782) );
  DFFRXL i_clk_r_REG275_S8 ( .D(n928), .CK(i_clk), .RN(n726), .Q(
        sobel_result[6]) );
  DFFRXL i_clk_r_REG548_S8 ( .D(n704), .CK(i_clk), .RN(n726), .Q(n806) );
  DFFRXL i_clk_r_REG513_S5 ( .D(n679), .CK(i_clk), .RN(n726), .Q(n781) );
  DFFRXL i_clk_r_REG542_S6 ( .D(n688), .CK(i_clk), .RN(n726), .Q(n790) );
  DFFRXL i_clk_r_REG265_S8 ( .D(n930), .CK(i_clk), .RN(n726), .Q(
        sobel_result[4]) );
  DFFRXL i_clk_r_REG522_S8 ( .D(n703), .CK(i_clk), .RN(n726), .Q(n805) );
  DFFRXL i_clk_r_REG487_S5 ( .D(n678), .CK(i_clk), .RN(n726), .Q(n780) );
  DFFRXL i_clk_r_REG516_S6 ( .D(n687), .CK(i_clk), .RN(n726), .Q(n789) );
  DFFRXL i_clk_r_REG260_S8 ( .D(n931), .CK(i_clk), .RN(n726), .Q(
        sobel_result[3]) );
  DFFRXL i_clk_r_REG496_S8 ( .D(n702), .CK(i_clk), .RN(n726), .Q(n804) );
  DFFRXL i_clk_r_REG461_S5 ( .D(n677), .CK(i_clk), .RN(n726), .Q(n779) );
  DFFRXL i_clk_r_REG490_S6 ( .D(n686), .CK(i_clk), .RN(n726), .Q(n788) );
  DFFRXL i_clk_r_REG470_S8 ( .D(n701), .CK(i_clk), .RN(n726), .Q(n803) );
  DFFRXL i_clk_r_REG435_S5 ( .D(n676), .CK(i_clk), .RN(n726), .Q(n778) );
  DFFRXL i_clk_r_REG464_S6 ( .D(n685), .CK(i_clk), .RN(n726), .Q(n787) );
  DFFRXL i_clk_r_REG242_S8 ( .D(n933), .CK(i_clk), .RN(n726), .Q(
        sobel_result[1]) );
  DFFRXL i_clk_r_REG444_S8 ( .D(n7001), .CK(i_clk), .RN(n726), .Q(n802) );
  DFFRXL i_clk_r_REG409_S5 ( .D(n675), .CK(i_clk), .RN(n726), .Q(n777) );
  DFFRXL i_clk_r_REG438_S6 ( .D(n684), .CK(i_clk), .RN(n726), .Q(n786) );
  DFFRXL i_clk_r_REG418_S8 ( .D(n699), .CK(i_clk), .RN(n726), .Q(n801) );
  DFFRXL i_clk_r_REG383_S5 ( .D(n674), .CK(i_clk), .RN(n726), .Q(n776) );
  DFFRXL i_clk_r_REG255_S8 ( .D(n932), .CK(i_clk), .RN(n726), .Q(
        sobel_result[2]) );
  DFFRXL i_clk_r_REG412_S6 ( .D(n683), .CK(i_clk), .RN(n726), .Q(n785) );
  DFFRXL i_clk_r_REG392_S8 ( .D(n698), .CK(i_clk), .RN(n726), .Q(n800) );
  DFFRXL i_clk_r_REG386_S6 ( .D(n682), .CK(i_clk), .RN(n726), .Q(n784) );
  DFFRXL i_clk_r_REG198_S5 ( .D(n673), .CK(i_clk), .RN(n726), .Q(n775) );
  DFFRXL i_clk_r_REG336_S8 ( .D(n934), .CK(i_clk), .RN(n726), .Q(
        sobel_result[0]) );
  DFFRXL i_clk_r_REG400_S11 ( .D(n706), .CK(i_clk), .RN(n726), .Q(n807), .QN(
        n2170) );
  DFFRXL i_clk_r_REG366_S8 ( .D(n697), .CK(i_clk), .RN(n726), .Q(n799) );
  DFFRXL i_clk_r_REG357_S6 ( .D(n681), .CK(i_clk), .RN(n726), .Q(n783) );
  DFFRX1 i_clk_r_REG318_S7 ( .D(n647), .CK(i_clk), .RN(n726), .Q(n732), .QN(
        n8700) );
  DFFRXL i_clk_r_REG545_S7 ( .D(n696), .CK(i_clk), .RN(n726), .Q(n798), .QN(
        n8600) );
  DFFRXL i_clk_r_REG556_S11 ( .D(n712), .CK(i_clk), .RN(n726), .Q(n813), .QN(
        n8500) );
  DFFRXL i_clk_r_REG504_S11 ( .D(n7101), .CK(i_clk), .RN(n726), .Q(n811), .QN(
        n8200) );
  DFFRXL i_clk_r_REG530_S11 ( .D(n711), .CK(i_clk), .RN(n726), .Q(n812), .QN(
        n8400) );
  DFFRXL i_clk_r_REG493_S7 ( .D(n694), .CK(i_clk), .RN(n726), .Q(n796), .QN(
        n80) );
  DFFRXL i_clk_r_REG519_S7 ( .D(n695), .CK(i_clk), .RN(n726), .Q(n797), .QN(
        n8300) );
  DFFRXL i_clk_r_REG478_S11 ( .D(n709), .CK(i_clk), .RN(n726), .Q(n810), .QN(
        n79) );
  DFFRXL i_clk_r_REG467_S7 ( .D(n693), .CK(i_clk), .RN(n726), .Q(n795), .QN(
        n75) );
  DFFRXL i_clk_r_REG452_S11 ( .D(n708), .CK(i_clk), .RN(n726), .Q(n809), .QN(
        n7200) );
  DFFRXL i_clk_r_REG441_S7 ( .D(n692), .CK(i_clk), .RN(n726), .Q(n794), .QN(
        n6900) );
  DFFSX4 i_clk_r_REG328_S7 ( .D(n671), .CK(i_clk), .SN(n726), .Q(n773), .QN(
        n263) );
  DFFSX4 i_clk_r_REG325_S7 ( .D(n667), .CK(i_clk), .SN(n726), .QN(n235) );
  DFFSX4 i_clk_r_REG343_S6 ( .D(n716), .CK(i_clk), .SN(n726), .Q(n817), .QN(
        n234) );
  DFFSX4 i_clk_r_REG323_S7 ( .D(n668), .CK(i_clk), .SN(n726), .Q(n769), .QN(
        n252) );
  DFFSX4 i_clk_r_REG352_S6 ( .D(n5500), .CK(i_clk), .SN(n726), .Q(n770), .QN(
        n279) );
  DFFRX1 i_clk_r_REG290_S8 ( .D(n925), .CK(i_clk), .RN(n726), .Q(
        sobel_result[9]) );
  DFFRX1 i_clk_r_REG295_S8 ( .D(n924), .CK(i_clk), .RN(n726), .Q(
        sobel_result[10]) );
  DFFRX4 i_clk_r_REG320_S7 ( .D(n648), .CK(i_clk), .RN(n726), .Q(n733), .QN(
        n1340) );
  DFFRX4 i_clk_r_REG334_S7 ( .D(n642), .CK(i_clk), .RN(n726), .Q(n56), .QN(
        n285) );
  DFFRX4 i_clk_r_REG240_S7 ( .D(n662), .CK(i_clk), .RN(n726), .Q(n764), .QN(
        n258) );
  DFFRX4 i_clk_r_REG634_S3 ( .D(state_r[0]), .CK(i_clk), .RN(n726), .Q(n759), 
        .QN(n244) );
  DFFSX4 i_clk_r_REG344_S6 ( .D(n717), .CK(i_clk), .SN(n726), .Q(n818) );
  DFFRX4 i_clk_r_REG333_S6 ( .D(n725), .CK(i_clk), .RN(n726), .Q(n826), .QN(
        n259) );
  DFFRX4 i_clk_r_REG637_S4 ( .D(state_r[2]), .CK(i_clk), .RN(n726), .Q(n739), 
        .QN(n246) );
  DFFRX4 i_clk_r_REG201_S6 ( .D(n727), .CK(i_clk), .RN(n726), .Q(n827), .QN(
        n280) );
  DFFRX4 i_clk_r_REG315_S7 ( .D(n646), .CK(i_clk), .RN(n726), .Q(n731), .QN(
        n142) );
  DFFRX4 i_clk_r_REG636_S4 ( .D(state_r[1]), .CK(i_clk), .RN(n726), .Q(n758), 
        .QN(n237) );
  DFFSX4 i_clk_r_REG342_S6 ( .D(n715), .CK(i_clk), .SN(n726), .Q(n816), .QN(
        n248) );
  DFFSX4 i_clk_r_REG335_S7 ( .D(n665), .CK(i_clk), .SN(n726), .Q(n767), .QN(
        n1570) );
  DFFRX4 i_clk_r_REG321_S7 ( .D(n6601), .CK(i_clk), .RN(n726), .Q(n762) );
  DFFRX4 i_clk_r_REG341_S6 ( .D(n714), .CK(i_clk), .RN(n726), .Q(n815), .QN(
        n278) );
  DFFSX2 i_clk_r_REG238_S7 ( .D(n654), .CK(i_clk), .SN(n726), .Q(n754), .QN(
        n6700) );
  DFFRX4 i_clk_r_REG199_S6 ( .D(n713), .CK(i_clk), .RN(n726), .Q(n814), .QN(
        n250) );
  DFFSX4 i_clk_r_REG235_S7 ( .D(n658), .CK(i_clk), .SN(n726), .Q(n760), .QN(
        n309) );
  DFFRX1 i_clk_r_REG426_S11 ( .D(n707), .CK(i_clk), .RN(n726), .Q(n808), .QN(
        n7100) );
  DFFRX2 i_clk_r_REG332_S7 ( .D(n661), .CK(i_clk), .RN(n726), .Q(n763), .QN(
        n1360) );
  DFFRX1 i_clk_r_REG415_S7 ( .D(n691), .CK(i_clk), .RN(n726), .Q(n793), .QN(
        n7000) );
  DFFSX4 i_clk_r_REG316_S7 ( .D(n672), .CK(i_clk), .SN(n726), .Q(n774) );
  DFFRX1 i_clk_r_REG360_S7 ( .D(n689), .CK(i_clk), .RN(n726), .Q(n791), .QN(
        n245) );
  DFFRX1 i_clk_r_REG374_S11 ( .D(n705), .CK(i_clk), .RN(n726), .QN(n243) );
  DFFSX1 i_clk_r_REG345_S6 ( .D(n718), .CK(i_clk), .SN(n726), .Q(n819), .QN(
        n6500) );
  DFFSX2 i_clk_r_REG234_S7 ( .D(n659), .CK(i_clk), .SN(n726), .Q(n761) );
  DFFSX2 i_clk_r_REG239_S7 ( .D(n656), .CK(i_clk), .SN(n726), .Q(n756), .QN(
        n6600) );
  DFFSX4 i_clk_r_REG346_S6 ( .D(n719), .CK(i_clk), .SN(n726), .Q(n8201), .QN(
        n7300) );
  DFFRX1 i_clk_r_REG389_S7 ( .D(n6901), .CK(i_clk), .RN(n726), .Q(n792), .QN(
        n221) );
  DFFSX4 i_clk_r_REG232_S7 ( .D(n657), .CK(i_clk), .SN(n726), .Q(n757) );
  DFFRX4 i_clk_r_REG237_S7 ( .D(n655), .CK(i_clk), .RN(n726), .Q(n755), .QN(
        n229) );
  DFFRX2 i_clk_r_REG202_S7 ( .D(n645), .CK(i_clk), .RN(n726), .Q(n7301), .QN(
        n8800) );
  NAND2X4 U3 ( .A(n438), .B(n468), .Y(n440) );
  NAND2X6 U4 ( .A(n864), .B(n865), .Y(n855) );
  INVX3 U5 ( .A(n8800), .Y(n2) );
  AND2X4 U6 ( .A(n166), .B(n735), .Y(n337) );
  NAND2X2 U7 ( .A(n737), .B(n735), .Y(n865) );
  NAND2X6 U8 ( .A(n165), .B(n735), .Y(n36) );
  BUFX16 U10 ( .A(indata2[17]), .Y(n225) );
  AND2X6 U11 ( .A(n148), .B(n331), .Y(n62) );
  XOR2X2 U13 ( .A(n294), .B(n623), .Y(indata3[14]) );
  NAND2X1 U14 ( .A(n546), .B(n5401), .Y(n623) );
  XOR3X2 U15 ( .A(n738), .B(n581), .C(n497), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_9_) );
  NAND2X2 U16 ( .A(n602), .B(n738), .Y(n557) );
  CLKBUFX3 U17 ( .A(n269), .Y(n3) );
  CLKBUFX2 U18 ( .A(n598), .Y(n269) );
  INVX6 U19 ( .A(n421), .Y(n14) );
  AOI2BB1X1 U20 ( .A0N(n593), .A1N(n99), .B0(n303), .Y(n297) );
  AOI2BB2X4 U21 ( .B0(n254), .B1(n342), .A0N(n5), .A1N(n818), .Y(n341) );
  CLKINVX20 U22 ( .A(n98), .Y(n5) );
  INVX8 U23 ( .A(N160), .Y(n529) );
  OAI31X2 U24 ( .A0(n535), .A1(n303), .A2(n302), .B0(n534), .Y(n2160) );
  XNOR3X2 U25 ( .A(n1360), .B(n190), .C(n492), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_12_) );
  AOI2BB1X4 U26 ( .A0N(n494), .A1N(n862), .B0(n861), .Y(n492) );
  INVX3 U27 ( .A(n92), .Y(n184) );
  OR2X4 U28 ( .A(n383), .B(n98), .Y(n539) );
  INVX16 U29 ( .A(n254), .Y(n98) );
  XOR2X1 U30 ( .A(n108), .B(n191), .Y(n28) );
  INVX3 U31 ( .A(n316), .Y(n108) );
  OAI2BB1X1 U32 ( .A0N(Gxy_r_0__3_), .A1N(n8700), .B0(n519), .Y(n125) );
  INVX6 U33 ( .A(n519), .Y(n515) );
  NAND2X1 U34 ( .A(n732), .B(n595), .Y(n519) );
  BUFX6 U35 ( .A(n414), .Y(n6) );
  MXI2X4 U36 ( .A(n2130), .B(n77), .S0(n379), .Y(n414) );
  INVX8 U37 ( .A(n415), .Y(n403) );
  INVX16 U38 ( .A(N161), .Y(n383) );
  CLKINVX1 U39 ( .A(n593), .Y(n7) );
  INVX3 U40 ( .A(n450), .Y(n593) );
  NAND2X2 U41 ( .A(n819), .B(n21), .Y(n361) );
  NAND2X6 U42 ( .A(n552), .B(n384), .Y(n392) );
  NAND2X4 U43 ( .A(n1320), .B(n181), .Y(n282) );
  AOI21X2 U44 ( .A0(n765), .A1(n626), .B0(n511), .Y(n514) );
  CLKINVX1 U45 ( .A(n443), .Y(n8) );
  INVX3 U46 ( .A(n8), .Y(n9) );
  AND2X6 U47 ( .A(n405), .B(n404), .Y(n406) );
  INVX3 U48 ( .A(n332), .Y(n147) );
  BUFX20 U49 ( .A(n425), .Y(n10) );
  CLKBUFX2 U50 ( .A(n254), .Y(n11) );
  XOR2X1 U51 ( .A(n229), .B(n627), .Y(n483) );
  INVX16 U52 ( .A(n627), .Y(n634) );
  NAND2X6 U53 ( .A(n4801), .B(n479), .Y(n627) );
  CLKINVX1 U54 ( .A(n869), .Y(n498) );
  AND3X6 U55 ( .A(n762), .B(n853), .C(n869), .Y(n2150) );
  NAND3X2 U56 ( .A(n762), .B(n853), .C(n869), .Y(n866) );
  XNOR2X4 U57 ( .A(n12), .B(n1560), .Y(sub_1_root_sub_0_root_sub_2382_DIFF_13_) );
  NAND2X4 U58 ( .A(n1310), .B(n454), .Y(n12) );
  INVX8 U59 ( .A(N157), .Y(n362) );
  INVXL U60 ( .A(n342), .Y(n1170) );
  NAND2X6 U61 ( .A(N159), .B(n1180), .Y(n527) );
  MX2X6 U62 ( .A(n300), .B(n299), .S0(n283), .Y(
        sub_1_root_sub_0_root_sub_2382_DIFF_9_) );
  OR2X6 U63 ( .A(n463), .B(n340), .Y(n439) );
  INVX2 U64 ( .A(n463), .Y(n13) );
  CLKINVX1 U65 ( .A(n463), .Y(n192) );
  NAND2X2 U66 ( .A(n249), .B(n191), .Y(n839) );
  OAI2BB1X4 U67 ( .A0N(n191), .A1N(n773), .B0(n839), .Y(n834) );
  OA21X4 U68 ( .A0(n58), .A1(n466), .B0(n469), .Y(n467) );
  INVX4 U69 ( .A(n469), .Y(n465) );
  INVX16 U70 ( .A(n109), .Y(n110) );
  INVX16 U71 ( .A(n258), .Y(n109) );
  CLKINVX1 U72 ( .A(n370), .Y(n193) );
  AND2X4 U73 ( .A(n290), .B(n201), .Y(n1550) );
  NAND2X6 U75 ( .A(n44), .B(n429), .Y(n4700) );
  NAND2X2 U76 ( .A(n430), .B(n45), .Y(n4600) );
  CLKINVX8 U77 ( .A(n430), .Y(n44) );
  NAND2X2 U78 ( .A(n401), .B(n394), .Y(n405) );
  AO21X4 U79 ( .A0(n1180), .A1(N162), .B0(n400), .Y(n394) );
  NAND2X6 U80 ( .A(n423), .B(n14), .Y(n15) );
  NAND2X4 U81 ( .A(n422), .B(n421), .Y(n16) );
  NAND2X8 U82 ( .A(n15), .B(n16), .Y(sub_1_root_sub_0_root_sub_2382_DIFF_16_)
         );
  NAND2X2 U83 ( .A(n416), .B(n94), .Y(n422) );
  CLKAND2X6 U84 ( .A(n601), .B(n188), .Y(n57) );
  INVX6 U85 ( .A(n390), .Y(n188) );
  XOR3X2 U86 ( .A(n166), .B(n1540), .C(n501), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_7_) );
  INVX8 U87 ( .A(n466), .Y(n1320) );
  OR2X2 U88 ( .A(n465), .B(n466), .Y(n472) );
  INVX16 U89 ( .A(N163), .Y(n384) );
  NAND2X6 U90 ( .A(n109), .B(n346), .Y(n355) );
  AND2X8 U91 ( .A(n312), .B(n378), .Y(n379) );
  XOR2X1 U92 ( .A(n18), .B(n637), .Y(n17) );
  CLKXOR2X2 U93 ( .A(n495), .B(n17), .Y(add_3_root_sub_0_root_sub_2382_SUM_11_) );
  CLKINVX1 U94 ( .A(n179), .Y(n18) );
  INVX2 U95 ( .A(n1520), .Y(n1540) );
  NAND3X6 U96 ( .A(n526), .B(n25), .C(n366), .Y(n443) );
  NAND2X6 U97 ( .A(n4600), .B(n4700), .Y(n366) );
  INVX3 U98 ( .A(n1160), .Y(n8401) );
  INVX4 U99 ( .A(n405), .Y(n395) );
  OR2X4 U100 ( .A(n633), .B(n851), .Y(n19) );
  OR2X4 U101 ( .A(n6600), .B(n851), .Y(n20) );
  NAND3X6 U102 ( .A(n19), .B(n20), .C(n849), .Y(n842) );
  INVX3 U103 ( .A(n598), .Y(n633) );
  OR2X6 U104 ( .A(n1330), .B(n1620), .Y(n851) );
  NAND2X2 U105 ( .A(n761), .B(n475), .Y(n849) );
  XNOR2X2 U106 ( .A(n428), .B(n427), .Y(n289) );
  NOR2X6 U107 ( .A(n43), .B(n433), .Y(n436) );
  NAND2X8 U108 ( .A(n442), .B(n453), .Y(n445) );
  AND2X6 U109 ( .A(n1550), .B(n415), .Y(n409) );
  INVX4 U110 ( .A(n451), .Y(n1300) );
  INVX8 U111 ( .A(n277), .Y(n21) );
  CLKINVX8 U112 ( .A(n1600), .Y(n277) );
  AO22X1 U113 ( .A0(N128), .A1(n636), .B0(N82), .B1(n2200), .Y(temp_5[0]) );
  NAND2X4 U114 ( .A(n397), .B(n187), .Y(n398) );
  CLKAND2X2 U115 ( .A(n816), .B(n1600), .Y(n101) );
  CLKMX2X6 U116 ( .A(n288), .B(n289), .S0(n436), .Y(
        sub_1_root_sub_0_root_sub_2382_DIFF_15_) );
  NAND2X6 U117 ( .A(n522), .B(n260), .Y(n450) );
  XNOR2X1 U118 ( .A(Gxy_r_0__4_), .B(n733), .Y(n22) );
  AND2X2 U119 ( .A(n41), .B(n42), .Y(n23) );
  INVX3 U120 ( .A(n418), .Y(n433) );
  CLKAND2X8 U121 ( .A(n344), .B(n281), .Y(n24) );
  CLKINVX8 U122 ( .A(n373), .Y(n199) );
  CLKXOR2X2 U123 ( .A(n22), .B(n517), .Y(indata3[11]) );
  INVX6 U124 ( .A(n10), .Y(n420) );
  CLKMX2X6 U125 ( .A(Gxy_temp[12]), .B(n772), .S0(n167), .Y(n6701) );
  AND2X8 U126 ( .A(n273), .B(n274), .Y(n5500) );
  INVX8 U127 ( .A(n96), .Y(n377) );
  CLKINVX6 U128 ( .A(n377), .Y(n3500) );
  NAND2X6 U129 ( .A(n773), .B(n637), .Y(n836) );
  AO21X2 U130 ( .A0(n25), .A1(n526), .B0(n366), .Y(n371) );
  NAND2X6 U131 ( .A(n5000), .B(n5100), .Y(n92) );
  OA21X4 U132 ( .A0(n98), .A1(n362), .B0(n361), .Y(n202) );
  CLKXOR2X4 U133 ( .A(n430), .B(n429), .Y(n444) );
  INVX12 U134 ( .A(n344), .Y(n331) );
  AO22X2 U135 ( .A0(n799), .A1(n2200), .B0(n783), .B1(n636), .Y(temp_4[1]) );
  AO22X1 U136 ( .A0(N66), .A1(n2200), .B0(N112), .B1(n636), .Y(temp_3[2]) );
  AO22X1 U137 ( .A0(N67), .A1(n2200), .B0(N113), .B1(n636), .Y(temp_3[3]) );
  AO22X1 U138 ( .A0(n802), .A1(n2200), .B0(n786), .B1(n636), .Y(temp_4[4]) );
  AO22X2 U139 ( .A0(N68), .A1(n2200), .B0(N114), .B1(n636), .Y(temp_3[4]) );
  INVX12 U140 ( .A(n222), .Y(n636) );
  NOR2X8 U141 ( .A(n38), .B(n357), .Y(n359) );
  INVX4 U142 ( .A(n360), .Y(n4800) );
  NAND2X8 U143 ( .A(N159), .B(n1180), .Y(n25) );
  INVX3 U144 ( .A(n1310), .Y(n373) );
  CLKBUFX3 U145 ( .A(n598), .Y(n268) );
  CLKINVX8 U146 ( .A(n468), .Y(n466) );
  XNOR2X4 U147 ( .A(n297), .B(n528), .Y(indata3[13]) );
  INVX16 U148 ( .A(n195), .Y(n462) );
  NAND3X4 U149 ( .A(n473), .B(n474), .C(n6700), .Y(n477) );
  OR2X8 U150 ( .A(n463), .B(n340), .Y(n281) );
  XOR2X4 U151 ( .A(n455), .B(n599), .Y(n456) );
  CLKXOR2X8 U152 ( .A(n349), .B(n28), .Y(n455) );
  INVX8 U153 ( .A(n454), .Y(n256) );
  CLKINVX4 U154 ( .A(n1640), .Y(n1350) );
  NAND2X2 U155 ( .A(n757), .B(n774), .Y(n502) );
  NAND4BX4 U156 ( .AN(n417), .B(n10), .C(n1310), .D(n418), .Y(n419) );
  AOI21X2 U157 ( .A0(n249), .A1(n1190), .B0(n345), .Y(n348) );
  INVX4 U158 ( .A(n333), .Y(n146) );
  NAND2X8 U159 ( .A(n336), .B(n335), .Y(n333) );
  INVX1 U160 ( .A(N159), .Y(n352) );
  NAND3BX2 U161 ( .AN(n612), .B(smallest_r[0]), .C(n611), .Y(n620) );
  XOR2X1 U162 ( .A(Gxy_r_0__11_), .B(n729), .Y(n555) );
  NAND2X4 U163 ( .A(n439), .B(n441), .Y(n351) );
  OAI31X2 U164 ( .A0(n382), .A1(n381), .A2(n6), .B0(n10), .Y(n396) );
  INVX3 U165 ( .A(n566), .Y(n569) );
  OAI211X2 U166 ( .A0(n562), .A1(n729), .B0(n561), .C0(n560), .Y(n564) );
  NAND2X4 U167 ( .A(n553), .B(n5400), .Y(n561) );
  INVX12 U168 ( .A(N156), .Y(n342) );
  XNOR2X4 U169 ( .A(n444), .B(n291), .Y(n449) );
  CLKINVX8 U170 ( .A(n353), .Y(n429) );
  MX2X6 U171 ( .A(n457), .B(n456), .S0(n169), .Y(
        sub_1_root_sub_0_root_sub_2382_DIFF_12_) );
  AND2X8 U172 ( .A(n180), .B(n439), .Y(n169) );
  INVX6 U173 ( .A(n314), .Y(n8900) );
  INVX12 U174 ( .A(n8900), .Y(n9000) );
  XOR2X4 U175 ( .A(n9000), .B(n110), .Y(n307) );
  CLKINVX6 U176 ( .A(n764), .Y(n345) );
  NAND2X4 U177 ( .A(n347), .B(n764), .Y(n356) );
  BUFX16 U178 ( .A(indata2[10]), .Y(n144) );
  INVX12 U179 ( .A(n33), .Y(n329) );
  AO21X4 U180 ( .A0(n762), .A1(n502), .B0(n313), .Y(n501) );
  XOR2X2 U181 ( .A(n637), .B(n262), .Y(n170) );
  XNOR2X2 U182 ( .A(Gxy_r_0__4_), .B(n192), .Y(n1290) );
  AO22X2 U183 ( .A0(n315), .A1(n852), .B0(n729), .B1(n738), .Y(n861) );
  INVX1 U184 ( .A(indata2[12]), .Y(n264) );
  NAND2X2 U185 ( .A(n768), .B(n583), .Y(n532) );
  OR2X1 U186 ( .A(Gxy_r_0__8_), .B(n316), .Y(n26) );
  OR2X2 U187 ( .A(n547), .B(n546), .Y(n27) );
  NAND3X6 U188 ( .A(n26), .B(n27), .C(n545), .Y(n548) );
  INVX6 U189 ( .A(n600), .Y(Gxy_r_0__8_) );
  NAND2X6 U190 ( .A(n24), .B(n282), .Y(n3501) );
  NOR2X4 U191 ( .A(n5200), .B(n308), .Y(n349) );
  CLKXOR2X1 U192 ( .A(n756), .B(n851), .Y(n29) );
  CLKXOR2X2 U193 ( .A(n632), .B(n29), .Y(
        sub_1_root_sub_0_root_sub_2382_DIFF_7_) );
  NAND2X8 U194 ( .A(n306), .B(n30), .Y(n31) );
  NAND2X6 U195 ( .A(n307), .B(n1350), .Y(n32) );
  NAND2X8 U196 ( .A(n31), .B(n32), .Y(n33) );
  INVX3 U197 ( .A(n1350), .Y(n30) );
  AND2X8 U198 ( .A(n345), .B(n9000), .Y(n306) );
  NAND2X4 U199 ( .A(n376), .B(n375), .Y(n34) );
  NAND2X8 U200 ( .A(n34), .B(n3500), .Y(n430) );
  INVX8 U201 ( .A(n835), .Y(n375) );
  INVX8 U202 ( .A(n358), .Y(n37) );
  NAND2X8 U203 ( .A(n36), .B(n37), .Y(n38) );
  INVX4 U204 ( .A(n1630), .Y(n165) );
  INVX8 U205 ( .A(n355), .Y(n358) );
  INVX3 U206 ( .A(n356), .Y(n357) );
  NAND2XL U207 ( .A(Gxy_r_0__10_), .B(n40), .Y(n41) );
  NAND2X2 U208 ( .A(n39), .B(n5300), .Y(n42) );
  INVXL U209 ( .A(Gxy_r_0__10_), .Y(n39) );
  INVXL U210 ( .A(n5300), .Y(n40) );
  INVX4 U211 ( .A(n267), .Y(Gxy_r_0__10_) );
  AND3X8 U212 ( .A(n435), .B(n9), .C(n434), .Y(n43) );
  NAND2X4 U213 ( .A(n63), .B(n1310), .Y(n435) );
  CLKINVX2 U214 ( .A(n429), .Y(n45) );
  NAND2X2 U215 ( .A(n360), .B(n170), .Y(n5000) );
  NAND2X6 U216 ( .A(n4800), .B(n4900), .Y(n5100) );
  INVX2 U217 ( .A(n170), .Y(n4900) );
  AOI2BB1X4 U218 ( .A0N(n359), .A1N(n834), .B0(n838), .Y(n360) );
  OAI211X4 U219 ( .A0(n98), .A1(n437), .B0(n260), .C0(n92), .Y(n434) );
  AO21X4 U220 ( .A0(n839), .A1(n348), .B0(n1160), .Y(n5200) );
  CLKBUFX3 U221 ( .A(indata2[16]), .Y(n239) );
  CLKAND2X2 U222 ( .A(n454), .B(n432), .Y(n63) );
  BUFX20 U223 ( .A(n728), .Y(n5300) );
  BUFX6 U224 ( .A(n558), .Y(n5400) );
  NAND2XL U225 ( .A(n267), .B(n5300), .Y(n558) );
  NAND2X2 U226 ( .A(n1370), .B(n632), .Y(n871) );
  CLKINVX8 U227 ( .A(n268), .Y(n632) );
  OR3X8 U228 ( .A(n769), .B(n191), .C(n110), .Y(n324) );
  CLKINVX8 U229 ( .A(n5101), .Y(n511) );
  NAND2X1 U230 ( .A(n567), .B(n566), .Y(n565) );
  XOR3X1 U231 ( .A(n627), .B(n7301), .C(n8701), .Y(indata3[8]) );
  INVX4 U232 ( .A(n541), .Y(n542) );
  INVX8 U233 ( .A(n567), .Y(n568) );
  CLKINVX8 U234 ( .A(n196), .Y(n197) );
  INVX4 U235 ( .A(n144), .Y(n196) );
  NOR2X2 U236 ( .A(n445), .B(n169), .Y(n448) );
  AO21X2 U237 ( .A0(n3), .A1(n767), .B0(n8701), .Y(indata3[7]) );
  NAND2X6 U238 ( .A(n539), .B(n538), .Y(Gxy_r_0__9_) );
  AOI21X2 U239 ( .A0(n192), .A1(Gxy_r_0__4_), .B0(n461), .Y(n120) );
  INVX1 U240 ( .A(n557), .Y(n5501) );
  NAND3XL U241 ( .A(n559), .B(n557), .C(n5400), .Y(n554) );
  NAND4X6 U242 ( .A(n559), .B(n563), .C(n5400), .D(n557), .Y(n567) );
  AND2X8 U243 ( .A(n557), .B(n549), .Y(n298) );
  CLKAND2X2 U244 ( .A(n735), .B(n593), .Y(n303) );
  INVX2 U245 ( .A(n184), .Y(n185) );
  CLKINVX1 U246 ( .A(n411), .Y(n381) );
  AND2X2 U247 ( .A(N48), .B(n275), .Y(temp_1[2]) );
  BUFX16 U248 ( .A(n635), .Y(n2200) );
  XOR2X1 U249 ( .A(n601), .B(n151), .Y(n621) );
  INVX12 U250 ( .A(Gxy_r_0__3_), .Y(n595) );
  INVXL U251 ( .A(n260), .Y(n174) );
  NAND2X1 U252 ( .A(n773), .B(n190), .Y(n863) );
  INVX3 U253 ( .A(n854), .Y(n867) );
  INVXL U254 ( .A(n315), .Y(n93) );
  NAND3X2 U255 ( .A(n845), .B(n846), .C(n476), .Y(n181) );
  INVX3 U256 ( .A(n177), .Y(n1560) );
  XOR2X2 U257 ( .A(n298), .B(n559), .Y(indata3[16]) );
  AND2XL U258 ( .A(N50), .B(n275), .Y(temp_1[4]) );
  NAND2X6 U259 ( .A(n57), .B(n388), .Y(n189) );
  INVX3 U260 ( .A(n101), .Y(n473) );
  AO22X2 U261 ( .A0(N133), .A1(n636), .B0(N87), .B1(n2200), .Y(temp_5[5]) );
  AND2X2 U262 ( .A(N47), .B(n275), .Y(temp_1[1]) );
  INVX6 U263 ( .A(n2110), .Y(n2120) );
  CLKINVX1 U264 ( .A(N220), .Y(n2110) );
  INVX3 U265 ( .A(n587), .Y(n583) );
  AND3X2 U266 ( .A(n298), .B(n625), .C(n624), .Y(n122) );
  NAND4BBXL U267 ( .AN(n610), .BN(n609), .C(n608), .D(n607), .Y(n1150) );
  INVX3 U268 ( .A(n458), .Y(n343) );
  CLKXOR2X2 U269 ( .A(n637), .B(n5300), .Y(n353) );
  AND2X2 U270 ( .A(n475), .B(n761), .Y(n1580) );
  INVX3 U271 ( .A(n276), .Y(n846) );
  INVX3 U272 ( .A(n501), .Y(n499) );
  MX2X2 U273 ( .A(n472), .B(n471), .S0(n58), .Y(
        sub_1_root_sub_0_root_sub_2382_DIFF_10_) );
  XOR2X1 U274 ( .A(n224), .B(n595), .Y(n471) );
  OAI21X1 U275 ( .A0(n529), .A1(n98), .B0(n426), .Y(n428) );
  CLKINVX1 U276 ( .A(n859), .Y(n489) );
  AOI2BB2X1 U277 ( .B0(n861), .B1(n859), .A0N(n2100), .A1N(n190), .Y(n8601) );
  XOR2X1 U278 ( .A(n760), .B(n285), .Y(sub_1_root_sub_0_root_sub_2382_DIFF_5_)
         );
  XOR2X2 U279 ( .A(n1370), .B(n731), .Y(add_3_root_sub_0_root_sub_2382_SUM_2_)
         );
  AND2X2 U280 ( .A(n843), .B(n2070), .Y(n2130) );
  CLKINVX1 U281 ( .A(n5401), .Y(n544) );
  CLKINVX1 U282 ( .A(n549), .Y(n553) );
  BUFX4 U283 ( .A(indata2[6]), .Y(n2180) );
  XOR2X2 U284 ( .A(n319), .B(n151), .Y(n393) );
  NOR2BX2 U285 ( .AN(n301), .B(n2090), .Y(n293) );
  AND2X2 U286 ( .A(n232), .B(n301), .Y(n292) );
  AOI2BB1X1 U287 ( .A0N(n5201), .A1N(n516), .B0(n515), .Y(n517) );
  NAND2X1 U288 ( .A(Gxy_r_0__10_), .B(n190), .Y(n560) );
  XOR2X2 U289 ( .A(n537), .B(n624), .Y(indata3[15]) );
  CLKINVX12 U290 ( .A(n738), .Y(n637) );
  AND2X2 U291 ( .A(N51), .B(n275), .Y(temp_1[5]) );
  AND2X2 U292 ( .A(N46), .B(n275), .Y(temp_1[0]) );
  AND2XL U293 ( .A(N49), .B(n275), .Y(temp_1[3]) );
  INVX3 U294 ( .A(n361), .Y(n452) );
  AO22X1 U295 ( .A0(N72), .A1(n2200), .B0(N118), .B1(n636), .Y(temp_3[8]) );
  BUFX4 U296 ( .A(res_3_10_), .Y(n255) );
  CLKINVX1 U297 ( .A(n555), .Y(n622) );
  CLKINVX1 U298 ( .A(Gxy_r_0__9_), .Y(n602) );
  NAND2X4 U299 ( .A(n228), .B(n1600), .Y(n4801) );
  BUFX4 U300 ( .A(n521), .Y(n260) );
  INVX1 U301 ( .A(n822), .Y(n892) );
  CLKINVX1 U302 ( .A(n229), .Y(n230) );
  BUFX4 U303 ( .A(n815), .Y(n228) );
  CLKINVX1 U304 ( .A(Gxy_temp[0]), .Y(n895) );
  OAI21XL U305 ( .A0(n575), .A1(n503), .B0(n574), .Y(n504) );
  CLKINVX1 U306 ( .A(n588), .Y(n584) );
  NAND2X2 U307 ( .A(n641), .B(n275), .Y(n274) );
  OAI2BB1X1 U308 ( .A0N(n876), .A1N(n1150), .B0(n873), .Y(NMS_direction[0]) );
  MX2XL U309 ( .A(n816), .B(Gxy_temp[2]), .S0(n275), .Y(n715) );
  CLKINVX4 U310 ( .A(n346), .Y(n1190) );
  AOI21X4 U311 ( .A0(n481), .A1(n8501), .B0(n276), .Y(n283) );
  NAND2X4 U312 ( .A(n826), .B(n1590), .Y(n485) );
  INVX16 U313 ( .A(Gxy_r_0__5_), .Y(n599) );
  INVX3 U314 ( .A(Gxy_r_0__11_), .Y(n562) );
  AO21X4 U315 ( .A0(N163), .A1(n1180), .B0(n2090), .Y(Gxy_r_0__11_) );
  NAND2X4 U316 ( .A(n25), .B(n526), .Y(Gxy_r_0__7_) );
  NAND3X4 U317 ( .A(n199), .B(n418), .C(n200), .Y(n95) );
  XOR2X4 U318 ( .A(n399), .B(n301), .Y(n149) );
  INVX4 U319 ( .A(N158), .Y(n437) );
  CLKINVX1 U320 ( .A(n763), .Y(n2100) );
  INVX4 U321 ( .A(n285), .Y(n1370) );
  NAND2X1 U322 ( .A(n825), .B(n98), .Y(n552) );
  AOI21X4 U323 ( .A0(n847), .A1(n477), .B0(n464), .Y(n58) );
  CLKAND2X12 U324 ( .A(n831), .B(n222), .Y(n59) );
  AND2X2 U325 ( .A(n729), .B(n763), .Y(n60) );
  CLKINVX1 U326 ( .A(n237), .Y(n238) );
  AND2XL U327 ( .A(n626), .B(n272), .Y(n61) );
  CLKAND2X8 U328 ( .A(n5301), .B(n532), .Y(n64) );
  INVX3 U329 ( .A(n417), .Y(n200) );
  CLKINVX1 U330 ( .A(n526), .Y(n431) );
  INVX3 U331 ( .A(n601), .Y(Gxy_r_0__12_) );
  NAND2X2 U332 ( .A(N164), .B(n1180), .Y(n601) );
  CLKINVX1 U333 ( .A(n552), .Y(n2090) );
  INVX1 U334 ( .A(temp_3[9]), .Y(n2050) );
  AO22X1 U335 ( .A0(N73), .A1(n2200), .B0(N119), .B1(n636), .Y(temp_3[9]) );
  CLKINVX1 U336 ( .A(n385), .Y(n400) );
  XOR2X1 U337 ( .A(n178), .B(n190), .Y(n74) );
  CLKINVX1 U338 ( .A(temp_1[9]), .Y(n203) );
  AND2X2 U339 ( .A(N55), .B(n275), .Y(temp_1[9]) );
  XNOR2X1 U340 ( .A(n1360), .B(n179), .Y(n77) );
  CLKINVX1 U341 ( .A(n60), .Y(n2070) );
  INVX16 U342 ( .A(n59), .Y(n275) );
  OA21X4 U343 ( .A0(n98), .A1(n342), .B0(n339), .Y(n340) );
  AND2X4 U344 ( .A(N156), .B(n254), .Y(n334) );
  NAND2X8 U345 ( .A(n249), .B(n773), .Y(n853) );
  NOR2X4 U346 ( .A(n1340), .B(n9000), .Y(n313) );
  NAND2X4 U347 ( .A(n254), .B(N154), .Y(n474) );
  XOR2X4 U348 ( .A(n556), .B(n622), .Y(indata3[18]) );
  BUFX4 U349 ( .A(indata2[2]), .Y(n9100) );
  INVX4 U350 ( .A(n392), .Y(n321) );
  INVX16 U351 ( .A(n254), .Y(n874) );
  INVX20 U352 ( .A(n1520), .Y(n1530) );
  NAND2X6 U353 ( .A(n491), .B(n729), .Y(n4901) );
  NAND2X2 U354 ( .A(n253), .B(n191), .Y(n869) );
  NAND3BX2 U355 ( .AN(n313), .B(n774), .C(n757), .Y(n854) );
  INVX1 U356 ( .A(n543), .Y(n547) );
  OA21X4 U357 ( .A0(n494), .A1(n493), .B0(n93), .Y(n495) );
  INVX1 U358 ( .A(n394), .Y(n322) );
  NAND2X2 U359 ( .A(n432), .B(n454), .Y(n417) );
  XNOR2X4 U360 ( .A(n353), .B(n194), .Y(n364) );
  NAND3X4 U361 ( .A(n479), .B(n755), .C(n4801), .Y(n8501) );
  MX2XL U362 ( .A(n793), .B(a7[2]), .S0(n833), .Y(n691) );
  OAI211X4 U363 ( .A0(n383), .A1(n98), .B0(n414), .C0(n538), .Y(n94) );
  NAND2X2 U364 ( .A(n823), .B(n100), .Y(n538) );
  NAND2X4 U365 ( .A(n95), .B(n290), .Y(n402) );
  AOI2BB2X4 U366 ( .B0(n838), .B1(n836), .A0N(n305), .A1N(n316), .Y(n96) );
  NAND2X1 U367 ( .A(n412), .B(n411), .Y(n413) );
  NAND2X2 U368 ( .A(n10), .B(n193), .Y(n288) );
  AND2X8 U369 ( .A(n527), .B(n526), .Y(n291) );
  NAND2XL U370 ( .A(n253), .B(Gxy_r_0__5_), .Y(n531) );
  CLKAND2X12 U371 ( .A(n637), .B(n190), .Y(n295) );
  INVX4 U372 ( .A(n844), .Y(n374) );
  NAND2X8 U373 ( .A(n442), .B(n256), .Y(n261) );
  INVXL U374 ( .A(n599), .Y(n97) );
  CLKINVX1 U375 ( .A(n523), .Y(n99) );
  CLKBUFX2 U376 ( .A(n21), .Y(n100) );
  INVX4 U377 ( .A(n424), .Y(n370) );
  CLKINVX16 U378 ( .A(n1590), .Y(n1600) );
  INVX8 U379 ( .A(n279), .Y(n1590) );
  XOR2X4 U380 ( .A(n491), .B(n729), .Y(add_3_root_sub_0_root_sub_2382_SUM_13_)
         );
  NAND3BX2 U381 ( .AN(n402), .B(n94), .C(n404), .Y(n187) );
  CLKAND2X2 U382 ( .A(n491), .B(n60), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_15_) );
  CLKBUFX6 U383 ( .A(indata2[13]), .Y(n236) );
  NAND2X8 U384 ( .A(n261), .B(n183), .Y(n168) );
  NAND2X2 U385 ( .A(n764), .B(n1520), .Y(n325) );
  NAND2X6 U386 ( .A(n173), .B(n326), .Y(n335) );
  INVX12 U387 ( .A(n462), .Y(n463) );
  NOR2BX4 U388 ( .AN(n5300), .B(n316), .Y(n315) );
  NAND2X1 U389 ( .A(n852), .B(n863), .Y(n862) );
  INVX4 U390 ( .A(n146), .Y(n1120) );
  NOR2X4 U391 ( .A(n191), .B(n9000), .Y(n1160) );
  AOI2BB1X2 U392 ( .A0N(n598), .A1N(n756), .B0(n851), .Y(n478) );
  INVX2 U393 ( .A(n1530), .Y(n1610) );
  INVX4 U394 ( .A(n376), .Y(n368) );
  OAI211X4 U395 ( .A0(n9000), .A1(n311), .B0(n356), .C0(n355), .Y(n376) );
  INVX3 U396 ( .A(n98), .Y(n1180) );
  BUFX20 U397 ( .A(n770), .Y(n254) );
  NAND2X2 U398 ( .A(n383), .B(n538), .Y(n412) );
  MXI2X4 U399 ( .A(n120), .B(n1290), .S0(n467), .Y(
        sub_1_root_sub_0_root_sub_2382_DIFF_11_) );
  NAND2X8 U400 ( .A(n189), .B(n389), .Y(n628) );
  OAI2BB2X4 U401 ( .B0(n1520), .B1(n305), .A0N(n857), .A1N(n858), .Y(n496) );
  CLKXOR2X1 U402 ( .A(n600), .B(n737), .Y(n624) );
  AO21X2 U403 ( .A0(n539), .A1(n538), .B0(n414), .Y(n416) );
  INVX12 U404 ( .A(n1300), .Y(n1310) );
  OAI211X2 U405 ( .A0(n351), .A1(n62), .B0(n3501), .C0(n453), .Y(n451) );
  AND2X8 U406 ( .A(n1530), .B(n1640), .Y(n310) );
  NAND2X6 U407 ( .A(n871), .B(n872), .Y(n5101) );
  NAND2X4 U408 ( .A(n7301), .B(n634), .Y(n872) );
  AOI21X2 U409 ( .A0(n729), .A1(n5300), .B0(n304), .Y(n312) );
  BUFX8 U410 ( .A(ans_11_), .Y(n257) );
  AOI21X4 U411 ( .A0(n277), .A1(n182), .B0(n343), .Y(n330) );
  INVX3 U412 ( .A(n328), .Y(n182) );
  INVX4 U413 ( .A(n142), .Y(n1330) );
  XNOR3X1 U414 ( .A(n1340), .B(n735), .C(n502), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_6_) );
  CLKINVX8 U415 ( .A(n339), .Y(n4601) );
  INVX6 U416 ( .A(n311), .Y(n1640) );
  MX2XL U417 ( .A(n760), .B(n631), .S0(n275), .Y(n658) );
  OAI2BB2X4 U418 ( .B0(n110), .B1(n769), .A0N(n249), .A1N(n1530), .Y(n338) );
  INVX20 U419 ( .A(n249), .Y(n347) );
  XOR2X1 U420 ( .A(n626), .B(n731), .Y(n126) );
  NAND2X8 U421 ( .A(n474), .B(n473), .Y(n626) );
  CLKINVX8 U422 ( .A(n496), .Y(n494) );
  NAND3X4 U423 ( .A(n199), .B(n418), .C(n200), .Y(n201) );
  OR2X8 U424 ( .A(n354), .B(n444), .Y(n418) );
  AOI2BB1X4 U425 ( .A0N(n98), .A1N(n352), .B0(n431), .Y(n354) );
  OAI2BB2X4 U426 ( .B0(n259), .B1(n1600), .A0N(n251), .A1N(n1600), .Y(n475) );
  INVX2 U427 ( .A(n250), .Y(n251) );
  NAND2X6 U428 ( .A(n818), .B(n874), .Y(n339) );
  NAND2X8 U429 ( .A(n814), .B(n1600), .Y(n486) );
  CLKINVX1 U430 ( .A(n142), .Y(n143) );
  AOI211X4 U431 ( .A0(n1170), .A1(n11), .B0(n4601), .C0(n13), .Y(n461) );
  NAND2X4 U432 ( .A(N155), .B(n254), .Y(n459) );
  NAND2X4 U433 ( .A(n827), .B(n254), .Y(n479) );
  CLKINVX8 U434 ( .A(n734), .Y(n1630) );
  INVX1 U435 ( .A(n143), .Y(n638) );
  CLKAND2X2 U436 ( .A(n731), .B(n592), .Y(n512) );
  INVX4 U437 ( .A(n1630), .Y(n166) );
  CLKINVX6 U438 ( .A(n308), .Y(n172) );
  NAND2X1 U439 ( .A(n190), .B(n1360), .Y(n859) );
  NAND2X2 U440 ( .A(n766), .B(n627), .Y(n513) );
  OA21X4 U441 ( .A0(n386), .A1(n100), .B0(n385), .Y(n267) );
  NAND2X2 U442 ( .A(n454), .B(n453), .Y(n457) );
  NAND3X6 U443 ( .A(n147), .B(n146), .C(n145), .Y(n148) );
  CLKINVX4 U444 ( .A(n334), .Y(n145) );
  AO22X2 U445 ( .A0(N132), .A1(n636), .B0(N86), .B1(n2200), .Y(temp_5[4]) );
  XOR2X4 U446 ( .A(n398), .B(n149), .Y(sub_1_root_sub_0_root_sub_2382_DIFF_18_) );
  CLKAND2X12 U447 ( .A(n223), .B(n151), .Y(n301) );
  INVX8 U448 ( .A(n548), .Y(n559) );
  BUFX16 U449 ( .A(res_2_10_), .Y(n150) );
  BUFX4 U450 ( .A(n150), .Y(n198) );
  AO22X1 U451 ( .A0(N69), .A1(n2200), .B0(N115), .B1(n636), .Y(temp_3[5]) );
  MX2XL U452 ( .A(n771), .B(n772), .S0(n275), .Y(n669) );
  NAND2X1 U453 ( .A(n538), .B(n98), .Y(n411) );
  CLKBUFX2 U454 ( .A(n763), .Y(n151) );
  CLKINVX4 U455 ( .A(n275), .Y(n167) );
  CLKINVX12 U456 ( .A(n736), .Y(n1520) );
  INVX1 U457 ( .A(n1610), .Y(n581) );
  INVX4 U458 ( .A(n855), .Y(n856) );
  NAND2X8 U459 ( .A(n310), .B(n853), .Y(n864) );
  INVXL U460 ( .A(n735), .Y(n523) );
  NAND2X2 U461 ( .A(n821), .B(n98), .Y(n526) );
  XOR3X1 U462 ( .A(n5300), .B(n737), .C(n496), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_10_) );
  AO21X2 U463 ( .A0(n518), .A1(n591), .B0(n733), .Y(n5301) );
  MX2XL U464 ( .A(n1370), .B(n3), .S0(n275), .Y(n642) );
  OR2X4 U465 ( .A(n309), .B(n1570), .Y(n1620) );
  AND2X1 U466 ( .A(n166), .B(n599), .Y(n302) );
  XNOR2XL U467 ( .A(Gxy_r_0__5_), .B(n165), .Y(n284) );
  NAND2X2 U468 ( .A(n773), .B(Gxy_r_0__8_), .Y(n543) );
  OAI211X4 U469 ( .A0(n867), .A1(n866), .B0(n865), .C0(n864), .Y(n497) );
  NAND2X4 U470 ( .A(n184), .B(n176), .Y(n432) );
  OAI21X2 U471 ( .A0(n98), .A1(n437), .B0(n260), .Y(n176) );
  CLKINVX1 U472 ( .A(n263), .Y(n262) );
  NAND2BX2 U473 ( .AN(n4701), .B(Gxy_r_0__3_), .Y(n469) );
  AOI2BB2X4 U474 ( .B0(n838), .B1(n836), .A0N(n305), .A1N(n316), .Y(n837) );
  CLKINVX1 U475 ( .A(n305), .Y(n171) );
  INVX1 U476 ( .A(n412), .Y(n382) );
  INVX8 U477 ( .A(N162), .Y(n386) );
  NAND2X6 U478 ( .A(n8501), .B(n842), .Y(n845) );
  NAND2X4 U479 ( .A(n450), .B(n184), .Y(n183) );
  INVX8 U480 ( .A(n172), .Y(n173) );
  OAI2BB1X4 U481 ( .A0N(n1180), .A1N(N158), .B0(n92), .Y(n175) );
  CLKINVX6 U482 ( .A(n253), .Y(n346) );
  OR2X8 U483 ( .A(n175), .B(n174), .Y(n442) );
  NAND2X2 U484 ( .A(n846), .B(n8501), .Y(n484) );
  INVXL U485 ( .A(n165), .Y(n639) );
  MX2XL U486 ( .A(n756), .B(n848), .S0(n275), .Y(n656) );
  XNOR2X4 U487 ( .A(n369), .B(n74), .Y(n427) );
  CLKINVX1 U488 ( .A(n179), .Y(n178) );
  OAI31X2 U489 ( .A0(n332), .A1(n1120), .A2(n334), .B0(n331), .Y(n226) );
  OAI2BB1X4 U490 ( .A0N(n109), .A1N(n173), .B0(n329), .Y(n4701) );
  OA21X4 U491 ( .A0(n764), .A1(n1520), .B0(n347), .Y(n327) );
  INVX16 U492 ( .A(n235), .Y(n249) );
  XNOR2X4 U493 ( .A(n185), .B(n450), .Y(n177) );
  XNOR2X4 U494 ( .A(n5201), .B(n125), .Y(indata3[10]) );
  NAND2X1 U495 ( .A(n1540), .B(n603), .Y(n546) );
  OA21X4 U496 ( .A0(n440), .A1(n441), .B0(n226), .Y(n180) );
  OR2X8 U497 ( .A(n4701), .B(n330), .Y(n344) );
  OAI2BB1X4 U498 ( .A0N(n109), .A1N(n173), .B0(n329), .Y(n224) );
  NAND2X2 U499 ( .A(n845), .B(n846), .Y(n847) );
  AOI221X4 U500 ( .A0(n278), .A1(n1600), .B0(n280), .B1(n770), .C0(n755), .Y(
        n276) );
  NAND2X8 U501 ( .A(n486), .B(n485), .Y(n598) );
  AOI2BB2X4 U502 ( .B0(n305), .B1(n1610), .A0N(n855), .A1N(n2150), .Y(n858) );
  NAND2X4 U503 ( .A(n867), .B(n856), .Y(n857) );
  MX2XL U504 ( .A(n819), .B(Gxy_temp[5]), .S0(n275), .Y(n718) );
  AND3X2 U505 ( .A(n388), .B(n188), .C(n601), .Y(n629) );
  AO22X1 U506 ( .A0(N70), .A1(n2200), .B0(N116), .B1(n636), .Y(temp_3[6]) );
  NOR3X4 U507 ( .A(n338), .B(n337), .C(n327), .Y(n186) );
  NAND2X6 U508 ( .A(n202), .B(n455), .Y(n453) );
  XOR3X2 U509 ( .A(n249), .B(n737), .C(n5001), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_8_) );
  AOI2BB1X2 U510 ( .A0N(n837), .A1N(n295), .B0(n304), .Y(n367) );
  OA21X4 U511 ( .A0(n291), .A1(n366), .B0(n443), .Y(n447) );
  NAND2X4 U512 ( .A(n637), .B(n179), .Y(n852) );
  NAND3BX4 U513 ( .AN(n343), .B(n459), .C(n224), .Y(n468) );
  AOI2BB1X2 U514 ( .A0N(n499), .A1N(n498), .B0(n310), .Y(n5001) );
  OAI33X2 U515 ( .A0(n323), .A1(n322), .A2(n393), .B0(n321), .B1(n301), .B2(
        n320), .Y(n390) );
  OAI211X4 U516 ( .A0(n1550), .A1(n396), .B0(n387), .C0(n404), .Y(n388) );
  AO22X2 U517 ( .A0(N137), .A1(n636), .B0(N91), .B1(n2200), .Y(temp_5[9]) );
  INVX2 U518 ( .A(Gxy_temp[12]), .Y(n641) );
  CLKMX2X6 U519 ( .A(N217), .B(sobel_result[12]), .S0(n102), .Y(n922) );
  AOI21X4 U520 ( .A0(n376), .A1(n375), .B0(n377), .Y(n194) );
  NOR2X8 U521 ( .A(n186), .B(n333), .Y(n195) );
  OAI31X2 U522 ( .A0(n338), .A1(n173), .A2(n327), .B0(n339), .Y(n332) );
  AOI2BB1X4 U523 ( .A0N(n403), .A1N(n402), .B0(n410), .Y(n407) );
  MX2X1 U524 ( .A(n597), .B(n774), .S0(n167), .Y(n672) );
  AND2X6 U525 ( .A(N53), .B(n275), .Y(temp_1[7]) );
  XOR2X4 U526 ( .A(n1520), .B(n249), .Y(n326) );
  OAI2BB1X4 U527 ( .A0N(n737), .A1N(n1530), .B0(n8401), .Y(n838) );
  INVX8 U528 ( .A(n246), .Y(n247) );
  AND2X1 U529 ( .A(n776), .B(n275), .Y(temp_6[1]) );
  AND2X1 U530 ( .A(n775), .B(n275), .Y(temp_6[0]) );
  AO21X4 U531 ( .A0(N157), .A1(n11), .B0(n452), .Y(Gxy_r_0__5_) );
  NAND2X4 U532 ( .A(n249), .B(n450), .Y(n534) );
  AND2X1 U533 ( .A(N52), .B(n275), .Y(temp_1[6]) );
  CLKAND2X3 U534 ( .A(N54), .B(n275), .Y(temp_1[8]) );
  OA21X4 U535 ( .A0(n290), .A1(n420), .B0(n419), .Y(n421) );
  NOR2BX4 U536 ( .AN(n5300), .B(n305), .Y(n304) );
  INVXL U537 ( .A(n203), .Y(n204) );
  INVXL U538 ( .A(n2050), .Y(n2060) );
  CLKINVX1 U539 ( .A(n61), .Y(n2080) );
  NOR2BX1 U540 ( .AN(n106), .B(n237), .Y(N220) );
  INVX20 U541 ( .A(n829), .Y(n726) );
  INVX3 U542 ( .A(i_rst_n), .Y(n829) );
  CLKBUFX4 U543 ( .A(indata2[18]), .Y(n2140) );
  CLKBUFX2 U544 ( .A(indata2[11]), .Y(n227) );
  OAI31X2 U545 ( .A0(n194), .A1(n844), .A2(n318), .B0(n317), .Y(n319) );
  BUFX6 U546 ( .A(indata2[7]), .Y(n219) );
  CLKINVX2 U547 ( .A(n615), .Y(n617) );
  CLKINVX8 U548 ( .A(n252), .Y(n253) );
  INVX8 U549 ( .A(Gxy_r_0__4_), .Y(n591) );
  AO21X4 U550 ( .A0(n254), .A1(N156), .B0(n4601), .Y(Gxy_r_0__4_) );
  AO21X4 U551 ( .A0(n293), .A1(n384), .B0(n292), .Y(n323) );
  BUFX20 U552 ( .A(n832), .Y(n222) );
  OAI31X2 U553 ( .A0(n194), .A1(n844), .A2(n318), .B0(n317), .Y(n223) );
  OA21X4 U554 ( .A0(n318), .A1(n312), .B0(n2070), .Y(n317) );
  NAND2BX4 U555 ( .AN(n834), .B(n836), .Y(n835) );
  INVXL U556 ( .A(n243), .Y(n231) );
  MX2XL U557 ( .A(n228), .B(Gxy_temp[1]), .S0(n275), .Y(n714) );
  AND2XL U558 ( .A(n98), .B(n552), .Y(n232) );
  INVX1 U559 ( .A(indata4[20]), .Y(n613) );
  CLKBUFX3 U560 ( .A(indata2[15]), .Y(n266) );
  BUFX6 U561 ( .A(indata2[19]), .Y(n233) );
  INVXL U562 ( .A(indata2[8]), .Y(n240) );
  INVX3 U563 ( .A(n240), .Y(n241) );
  MX2XL U564 ( .A(n109), .B(n8301), .S0(n275), .Y(n662) );
  CLKBUFX2 U565 ( .A(indata2[9]), .Y(n242) );
  MX2XL U566 ( .A(n807), .B(a3[1]), .S0(n833), .Y(n706) );
  AOI211X2 U567 ( .A0(n293), .A1(n384), .B0(n403), .C0(n292), .Y(n387) );
  AOI31X2 U568 ( .A0(n94), .A1(n396), .A2(n404), .B0(n395), .Y(n397) );
  OAI211X4 U569 ( .A0(n383), .A1(n98), .B0(n414), .C0(n538), .Y(n415) );
  XOR2X4 U570 ( .A(n4901), .B(n1360), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_14_) );
  AO22X1 U571 ( .A0(n800), .A1(n2200), .B0(n784), .B1(n636), .Y(temp_4[2]) );
  MX2X1 U572 ( .A(Gxy_r_0__12_), .B(n151), .S0(n167), .Y(n661) );
  OAI221X2 U573 ( .A0(n875), .A1(n620), .B0(n107), .B1(n619), .C0(n618), .Y(
        NMS_direction[1]) );
  AO21X4 U574 ( .A0(n534), .A1(n528), .B0(n303), .Y(n294) );
  NAND2X2 U575 ( .A(Gxy_r_0__3_), .B(Gxy_r_0__4_), .Y(n587) );
  CLKMX2X4 U576 ( .A(n620), .B(n614), .S0(smallest_r[1]), .Y(n873) );
  NAND2X2 U577 ( .A(n616), .B(n615), .Y(n614) );
  OR2X8 U578 ( .A(n455), .B(n363), .Y(n454) );
  XOR2X2 U579 ( .A(n626), .B(n754), .Y(n299) );
  INVX6 U580 ( .A(n626), .Y(n592) );
  NAND2XL U581 ( .A(n8201), .B(n1600), .Y(n521) );
  CLKXOR2X2 U582 ( .A(n524), .B(n284), .Y(indata3[12]) );
  NOR2BX4 U583 ( .AN(n1640), .B(n9000), .Y(n308) );
  OAI21X4 U584 ( .A0(n462), .A1(n341), .B0(n477), .Y(n441) );
  INVX1 U585 ( .A(n25), .Y(n365) );
  AO22X4 U586 ( .A0(n325), .A1(n347), .B0(n249), .B1(n324), .Y(n336) );
  INVX4 U587 ( .A(n427), .Y(n380) );
  AOI2BB1X2 U588 ( .A0N(n98), .A1N(n362), .B0(n452), .Y(n363) );
  NAND2X1 U589 ( .A(n477), .B(n476), .Y(n300) );
  INVX4 U590 ( .A(n393), .Y(n401) );
  NAND2X4 U591 ( .A(n817), .B(n874), .Y(n458) );
  MX2XL U592 ( .A(n251), .B(Gxy_temp[0]), .S0(n275), .Y(n713) );
  AO21X4 U593 ( .A0(n188), .A1(n388), .B0(n601), .Y(n389) );
  AO21X4 U594 ( .A0(n190), .A1(n179), .B0(n295), .Y(n844) );
  MX2X6 U595 ( .A(n484), .B(n483), .S0(n482), .Y(
        sub_1_root_sub_0_root_sub_2382_DIFF_8_) );
  OR2X8 U596 ( .A(n1580), .B(n478), .Y(n481) );
  OAI32X2 U597 ( .A0(n410), .A1(n409), .A2(n408), .B0(n407), .B1(n406), .Y(
        sub_1_root_sub_0_root_sub_2382_DIFF_17_) );
  INVX3 U598 ( .A(n264), .Y(n265) );
  OAI211X4 U599 ( .A0(n98), .A1(n386), .B0(n385), .C0(n393), .Y(n404) );
  NAND2X6 U600 ( .A(n459), .B(n458), .Y(Gxy_r_0__3_) );
  CLKINVX1 U601 ( .A(n871), .Y(n8701) );
  AO22X1 U602 ( .A0(n801), .A1(n2200), .B0(n785), .B1(n636), .Y(temp_4[3]) );
  CLKINVX1 U603 ( .A(n481), .Y(n482) );
  OAI31X4 U604 ( .A0(n494), .A1(n862), .A2(n489), .B0(n8601), .Y(n491) );
  OAI221X4 U605 ( .A0(n816), .A1(n254), .B0(N154), .B1(n874), .C0(n754), .Y(
        n476) );
  NAND3BX4 U606 ( .AN(n276), .B(n845), .C(n476), .Y(n438) );
  XOR2X4 U607 ( .A(n23), .B(n551), .Y(indata3[17]) );
  AOI2BB1X4 U608 ( .A0N(n553), .A1N(n559), .B0(n5501), .Y(n551) );
  OAI211X2 U609 ( .A0(n1110), .A1(n617), .B0(smallest_r[1]), .C0(n616), .Y(
        n618) );
  AND4X8 U610 ( .A(n533), .B(n532), .C(n531), .D(n5301), .Y(n535) );
  NAND2X4 U611 ( .A(Gxy_r_0__9_), .B(n637), .Y(n549) );
  MX2X1 U612 ( .A(n799), .B(a6[0]), .S0(n833), .Y(n697) );
  NAND3BX4 U613 ( .AN(n544), .B(n543), .C(n542), .Y(n545) );
  OAI31X2 U614 ( .A0(n365), .A1(n431), .A2(n364), .B0(n434), .Y(n372) );
  NAND2X4 U615 ( .A(N158), .B(n11), .Y(n522) );
  OAI211X2 U616 ( .A0(n529), .A1(n98), .B0(n427), .C0(n426), .Y(n424) );
  CLKMX2X8 U617 ( .A(n892), .B(n529), .S0(n1180), .Y(n600) );
  NAND2X8 U618 ( .A(n106), .B(n237), .Y(n831) );
  NOR2X6 U619 ( .A(n244), .B(n247), .Y(n106) );
  OAI221X2 U620 ( .A0(n377), .A1(n376), .B0(n377), .B1(n375), .C0(n374), .Y(
        n378) );
  INVX2 U621 ( .A(n476), .Y(n464) );
  NAND2X2 U622 ( .A(n768), .B(Gxy_r_0__3_), .Y(n518) );
  CLKINVX4 U623 ( .A(Gxy_r_0__7_), .Y(n603) );
  AOI21X4 U624 ( .A0(n371), .A1(n372), .B0(n370), .Y(n290) );
  CLKINVX6 U625 ( .A(N155), .Y(n328) );
  NAND3BX4 U626 ( .AN(n739), .B(n758), .C(n244), .Y(n832) );
  OAI221X4 U627 ( .A0(n822), .A1(n1180), .B0(N160), .B1(n98), .C0(n380), .Y(
        n425) );
  NAND2X1 U628 ( .A(n600), .B(n599), .Y(n610) );
  MX2XL U629 ( .A(n810), .B(a3[4]), .S0(n833), .Y(n709) );
  MX2XL U630 ( .A(n809), .B(a3[3]), .S0(n833), .Y(n708) );
  MX2XL U631 ( .A(n808), .B(a3[2]), .S0(n833), .Y(n707) );
  OAI22X1 U632 ( .A0(n8500), .A1(n831), .B0(n8600), .B1(n222), .Y(temp_2[7])
         );
  OAI22X1 U633 ( .A0(n8200), .A1(n831), .B0(n80), .B1(n222), .Y(temp_2[5]) );
  OAI22X1 U634 ( .A0(n79), .A1(n831), .B0(n75), .B1(n222), .Y(temp_2[4]) );
  OAI22X1 U635 ( .A0(n7200), .A1(n831), .B0(n6900), .B1(n222), .Y(temp_2[3])
         );
  OAI22X1 U636 ( .A0(n7100), .A1(n831), .B0(n7000), .B1(n222), .Y(temp_2[2])
         );
  OAI22X1 U637 ( .A0(n2170), .A1(n831), .B0(n221), .B1(n222), .Y(temp_2[1]) );
  INVX4 U638 ( .A(n831), .Y(n635) );
  CLKBUFX2 U639 ( .A(n268), .Y(n270) );
  CLKINVX1 U640 ( .A(n524), .Y(n525) );
  NAND2X6 U641 ( .A(n64), .B(n533), .Y(n524) );
  OAI211X4 U642 ( .A0(Gxy_r_0__4_), .A1(n1340), .B0(n5201), .C0(n519), .Y(n533) );
  AND2XL U643 ( .A(n601), .B(n151), .Y(n271) );
  OR2X8 U644 ( .A(n570), .B(n271), .Y(indata3[20]) );
  INVX1 U645 ( .A(n595), .Y(n272) );
  NAND2XL U646 ( .A(n98), .B(n167), .Y(n273) );
  INVX3 U647 ( .A(n612), .Y(n616) );
  INVX4 U648 ( .A(n843), .Y(n318) );
  OAI31X2 U649 ( .A0(n368), .A1(n835), .A2(n295), .B0(n367), .Y(n369) );
  OAI2BB1XL U650 ( .A0N(n287), .A1N(n605), .B0(n507), .Y(n575) );
  OAI32X2 U651 ( .A0(n448), .A1(n449), .A2(n168), .B0(n446), .B1(n447), .Y(
        sub_1_root_sub_0_root_sub_2382_DIFF_14_) );
  AOI2BB1X4 U652 ( .A0N(n169), .A1N(n445), .B0(n168), .Y(n446) );
  XOR2X4 U653 ( .A(n267), .B(n401), .Y(n408) );
  INVXL U654 ( .A(n623), .Y(n625) );
  NAND2XL U655 ( .A(n591), .B(n593), .Y(n604) );
  AND2XL U656 ( .A(n574), .B(n596), .Y(n505) );
  INVXL U657 ( .A(n518), .Y(n516) );
  NAND3X1 U658 ( .A(n560), .B(n554), .C(n561), .Y(n556) );
  NOR4XL U659 ( .A(n125), .B(n126), .C(n127), .D(n1280), .Y(n124) );
  AND3XL U660 ( .A(n23), .B(n622), .C(n621), .Y(n121) );
  XOR2XL U661 ( .A(n3), .B(n56), .Y(n1280) );
  NAND2XL U662 ( .A(n626), .B(Gxy_r_0__4_), .Y(n596) );
  AOI211X2 U663 ( .A0(Gxy_r_0__12_), .A1(n1360), .B0(n569), .C0(n568), .Y(n570) );
  INVX1 U664 ( .A(n863), .Y(n493) );
  AO22X1 U665 ( .A0(N129), .A1(n636), .B0(N83), .B1(n2200), .Y(temp_5[1]) );
  AO22XL U666 ( .A0(n803), .A1(n2200), .B0(n787), .B1(n636), .Y(temp_4[5]) );
  AO22XL U667 ( .A0(n804), .A1(n2200), .B0(n788), .B1(n636), .Y(temp_4[6]) );
  XOR2XL U668 ( .A(n627), .B(n7301), .Y(n127) );
  MXI2XL U669 ( .A(n599), .B(n639), .S0(n167), .Y(n649) );
  MX2XL U670 ( .A(n450), .B(n99), .S0(n167), .Y(n6501) );
  MX2XL U671 ( .A(n592), .B(n765), .S0(n167), .Y(n663) );
  MX2XL U672 ( .A(n595), .B(n768), .S0(n167), .Y(n666) );
  MX2XL U673 ( .A(n599), .B(n253), .S0(n167), .Y(n668) );
  INVXL U674 ( .A(a4[2]), .Y(n917) );
  INVXL U675 ( .A(a1[4]), .Y(n899) );
  INVXL U676 ( .A(a1[5]), .Y(n898) );
  INVXL U677 ( .A(a1[7]), .Y(n896) );
  INVXL U678 ( .A(a2[1]), .Y(n9101) );
  INVXL U679 ( .A(a2[2]), .Y(n909) );
  INVXL U680 ( .A(a2[3]), .Y(n908) );
  INVXL U681 ( .A(a2[4]), .Y(n907) );
  INVXL U682 ( .A(a2[5]), .Y(n906) );
  INVXL U683 ( .A(a2[7]), .Y(n904) );
  INVXL U684 ( .A(a1[6]), .Y(n897) );
  INVXL U685 ( .A(a4[3]), .Y(n916) );
  INVXL U686 ( .A(a4[4]), .Y(n915) );
  INVXL U687 ( .A(a4[5]), .Y(n914) );
  INVXL U688 ( .A(a4[6]), .Y(n913) );
  INVXL U689 ( .A(a4[7]), .Y(n912) );
  INVXL U690 ( .A(a2[6]), .Y(n905) );
  MX2X1 U691 ( .A(n780), .B(a9[5]), .S0(n833), .Y(n678) );
  MX2X1 U692 ( .A(n782), .B(a9[7]), .S0(n833), .Y(n6801) );
  MX2X1 U693 ( .A(n785), .B(a8[2]), .S0(n833), .Y(n683) );
  MX2X1 U694 ( .A(n786), .B(a8[3]), .S0(n833), .Y(n684) );
  MX2X1 U695 ( .A(n787), .B(a8[4]), .S0(n833), .Y(n685) );
  MX2X1 U696 ( .A(n788), .B(a8[5]), .S0(n833), .Y(n686) );
  MX2X1 U697 ( .A(n790), .B(a8[7]), .S0(n833), .Y(n688) );
  MX2X1 U698 ( .A(n801), .B(a6[2]), .S0(n833), .Y(n699) );
  MX2X1 U699 ( .A(n781), .B(a9[6]), .S0(n833), .Y(n679) );
  MX2X1 U700 ( .A(n789), .B(a8[6]), .S0(n833), .Y(n687) );
  MX2X1 U701 ( .A(n802), .B(a6[3]), .S0(n833), .Y(n7001) );
  MX2X1 U702 ( .A(n803), .B(a6[4]), .S0(n833), .Y(n701) );
  MX2X1 U703 ( .A(n804), .B(a6[5]), .S0(n833), .Y(n702) );
  MX2X1 U704 ( .A(n805), .B(a6[6]), .S0(n833), .Y(n703) );
  MX2X1 U705 ( .A(n806), .B(a6[7]), .S0(n833), .Y(n704) );
  MX2XL U706 ( .A(n796), .B(a7[5]), .S0(n833), .Y(n694) );
  MX2XL U707 ( .A(n798), .B(a7[7]), .S0(n833), .Y(n696) );
  MX2XL U708 ( .A(n811), .B(a3[5]), .S0(n833), .Y(n7101) );
  MX2XL U709 ( .A(n813), .B(a3[7]), .S0(n833), .Y(n712) );
  MX2XL U710 ( .A(n797), .B(a7[6]), .S0(n833), .Y(n695) );
  MX2XL U711 ( .A(n812), .B(a3[6]), .S0(n833), .Y(n711) );
  NAND2XL U712 ( .A(n105), .B(n247), .Y(n103) );
  NAND2X1 U713 ( .A(n595), .B(n634), .Y(n605) );
  NAND2X1 U714 ( .A(n592), .B(n632), .Y(n606) );
  AND2X2 U715 ( .A(n582), .B(n2080), .Y(n286) );
  NAND2X1 U716 ( .A(n595), .B(n592), .Y(n578) );
  OAI2BB1X4 U717 ( .A0N(n420), .A1N(n94), .B0(n416), .Y(n410) );
  CLKINVX1 U718 ( .A(Gxy_temp[1]), .Y(n894) );
  NAND3XL U719 ( .A(n606), .B(n578), .C(n627), .Y(n582) );
  NAND2XL U720 ( .A(n591), .B(n595), .Y(n588) );
  NAND2XL U721 ( .A(n591), .B(n592), .Y(n574) );
  XOR2XL U722 ( .A(n270), .B(n634), .Y(n631) );
  CLKINVX1 U723 ( .A(n596), .Y(n503) );
  AND2XL U724 ( .A(n606), .B(n627), .Y(n571) );
  NAND2XL U725 ( .A(n272), .B(n627), .Y(n507) );
  AND2XL U726 ( .A(n626), .B(n3), .Y(n287) );
  AO22X1 U727 ( .A0(N136), .A1(n636), .B0(N90), .B1(n2200), .Y(temp_5[8]) );
  CLKINVX1 U728 ( .A(n102), .Y(o_sobel_finish) );
  CLKBUFX8 U729 ( .A(N35), .Y(n833) );
  NAND2X1 U730 ( .A(n392), .B(n391), .Y(n399) );
  XOR2X1 U731 ( .A(n6), .B(n413), .Y(n423) );
  INVXL U732 ( .A(indata2[20]), .Y(n611) );
  CLKINVX1 U733 ( .A(n391), .Y(n320) );
  NAND2XL U734 ( .A(n552), .B(n98), .Y(n391) );
  NAND2X2 U735 ( .A(n536), .B(n5401), .Y(n537) );
  NAND2XL U736 ( .A(n546), .B(n2160), .Y(n536) );
  CLKXOR2X2 U737 ( .A(n296), .B(n126), .Y(indata3[9]) );
  CLKAND2X3 U738 ( .A(n5101), .B(n513), .Y(n296) );
  NAND3X1 U739 ( .A(n1130), .B(n1140), .C(n1150), .Y(n612) );
  NAND4X2 U740 ( .A(n121), .B(n122), .C(n123), .D(n124), .Y(n1130) );
  AND3XL U741 ( .A(n297), .B(n22), .C(n284), .Y(n123) );
  OA21XL U742 ( .A0(n1130), .A1(n1110), .B0(n1140), .Y(n107) );
  NOR2XL U743 ( .A(Gxy_r_0__11_), .B(Gxy_r_0__10_), .Y(n607) );
  NOR3X1 U744 ( .A(n606), .B(n605), .C(n604), .Y(n608) );
  NAND3XL U745 ( .A(n603), .B(n602), .C(n601), .Y(n609) );
  MX2XL U746 ( .A(Gxy_r_0__7_), .B(n581), .S0(n167), .Y(n651) );
  OAI21XL U747 ( .A0(n106), .A1(n237), .B0(n831), .Y(state_r[1]) );
  AND3X6 U748 ( .A(n246), .B(i_start), .C(n105), .Y(N35) );
  CLKINVX1 U749 ( .A(n103), .Y(sobel1U80_Y_INV) );
  INVXL U750 ( .A(n1130), .Y(n876) );
  CLKINVX1 U751 ( .A(n1110), .Y(n875) );
  INVXL U752 ( .A(n1150), .Y(n619) );
  NAND2XL U753 ( .A(n824), .B(n98), .Y(n385) );
  NAND2XL U754 ( .A(n822), .B(n98), .Y(n426) );
  OAI22XL U755 ( .A0(n8400), .A1(n831), .B0(n8300), .B1(n222), .Y(temp_2[6])
         );
  AO22X1 U756 ( .A0(N135), .A1(n636), .B0(N89), .B1(n2200), .Y(temp_5[7]) );
  AND2XL U757 ( .A(n782), .B(n275), .Y(temp_6[7]) );
  AO22X1 U758 ( .A0(N134), .A1(n636), .B0(N88), .B1(n2200), .Y(temp_5[6]) );
  AND2XL U759 ( .A(n781), .B(n275), .Y(temp_6[6]) );
  AO22X1 U760 ( .A0(N130), .A1(n636), .B0(N84), .B1(n2200), .Y(temp_5[2]) );
  AND2XL U761 ( .A(n777), .B(n275), .Y(temp_6[2]) );
  AO22X1 U762 ( .A0(N131), .A1(n636), .B0(N85), .B1(n2200), .Y(temp_5[3]) );
  AND2XL U763 ( .A(n778), .B(n275), .Y(temp_6[3]) );
  AND2XL U764 ( .A(n779), .B(n275), .Y(temp_6[4]) );
  AND2XL U765 ( .A(n780), .B(n275), .Y(temp_6[5]) );
  CLKMX2X2 U766 ( .A(N218), .B(sobel_result[13]), .S0(n102), .Y(n921) );
  CLKMX2X2 U767 ( .A(N216), .B(sobel_result[11]), .S0(n102), .Y(n923) );
  AO22X1 U768 ( .A0(n806), .A1(n2200), .B0(n790), .B1(n636), .Y(temp_4[8]) );
  AO22X1 U769 ( .A0(n805), .A1(n2200), .B0(n789), .B1(n636), .Y(temp_4[7]) );
  AO22X1 U770 ( .A0(N71), .A1(n2200), .B0(N117), .B1(n636), .Y(temp_3[7]) );
  AO22X1 U771 ( .A0(N65), .A1(n2200), .B0(N111), .B1(n636), .Y(temp_3[1]) );
  CLKMX2X2 U772 ( .A(N215), .B(sobel_result[10]), .S0(n102), .Y(n924) );
  CLKMX2X2 U773 ( .A(N214), .B(sobel_result[9]), .S0(n102), .Y(n925) );
  MX2XL U774 ( .A(N153), .B(n827), .S0(n167), .Y(n727) );
  MX2X1 U775 ( .A(n586), .B(n754), .S0(n167), .Y(n654) );
  XOR3XL U776 ( .A(n591), .B(n599), .C(n585), .Y(n586) );
  AOI2BB1XL U777 ( .A0N(n286), .A1N(n584), .B0(n583), .Y(n585) );
  CLKMX2X2 U778 ( .A(N213), .B(sobel_result[8]), .S0(n102), .Y(n926) );
  MX3XL U779 ( .A(n590), .B(n589), .C(n230), .S0(n286), .S1(n167), .Y(n655) );
  XOR2XL U780 ( .A(n591), .B(n595), .Y(n589) );
  NAND2XL U781 ( .A(n588), .B(n587), .Y(n590) );
  MX2XL U782 ( .A(Gxy_r_0__10_), .B(n5300), .S0(n167), .Y(n643) );
  MX2XL U783 ( .A(Gxy_r_0__11_), .B(n729), .S0(n167), .Y(n644) );
  MX2XL U784 ( .A(Gxy_r_0__4_), .B(n733), .S0(n167), .Y(n648) );
  CLKMX2X2 U785 ( .A(Gxy_r_0__9_), .B(n171), .S0(n167), .Y(n653) );
  MX2XL U786 ( .A(n604), .B(n762), .S0(n167), .Y(n6601) );
  MX2XL U787 ( .A(N152), .B(n826), .S0(n167), .Y(n725) );
  MX2XL U788 ( .A(n593), .B(n249), .S0(n167), .Y(n667) );
  MX2XL U789 ( .A(n600), .B(n773), .S0(n167), .Y(n671) );
  AO22X1 U790 ( .A0(n596), .A1(n595), .B0(n594), .B1(n599), .Y(n597) );
  NAND2XL U791 ( .A(n61), .B(Gxy_r_0__4_), .Y(n594) );
  CLKMX2X2 U792 ( .A(N212), .B(sobel_result[7]), .S0(n102), .Y(n927) );
  MXI2XL U793 ( .A(n600), .B(n316), .S0(n167), .Y(n652) );
  MXI2XL U794 ( .A(n592), .B(n638), .S0(n167), .Y(n646) );
  MXI2XL U795 ( .A(n595), .B(n8700), .S0(n167), .Y(n647) );
  XNOR3XL U796 ( .A(n595), .B(n599), .C(n504), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_5_) );
  OAI22XL U797 ( .A0(n243), .A1(n831), .B0(n245), .B1(n222), .Y(temp_2[0]) );
  CLKMX2X2 U798 ( .A(N211), .B(sobel_result[6]), .S0(n102), .Y(n928) );
  OAI211XL U799 ( .A0(n580), .A1(n582), .B0(n587), .C0(n579), .Y(n8301) );
  AO21XL U800 ( .A0(n2080), .A1(n591), .B0(n599), .Y(n579) );
  AOI2BB1XL U801 ( .A0N(n599), .A1N(n595), .B0(Gxy_r_0__4_), .Y(n580) );
  MXI2X1 U802 ( .A(n506), .B(n505), .S0(n575), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_4_) );
  XOR2XL U803 ( .A(n626), .B(n591), .Y(n506) );
  OAI211XL U804 ( .A0(n272), .A1(n97), .B0(n575), .C0(n574), .Y(n868) );
  CLKMX2X2 U805 ( .A(N210), .B(sobel_result[5]), .S0(n102), .Y(n929) );
  XOR3XL U806 ( .A(n592), .B(n488), .C(n487), .Y(
        sub_1_root_sub_0_root_sub_2382_DIFF_6_) );
  NAND2XL U807 ( .A(n627), .B(n632), .Y(n487) );
  NAND2XL U808 ( .A(n631), .B(n632), .Y(n488) );
  CLKMX2X2 U809 ( .A(n573), .B(n572), .S0(n571), .Y(n848) );
  XOR2XL U810 ( .A(n595), .B(n592), .Y(n572) );
  NAND2XL U811 ( .A(n578), .B(n2080), .Y(n573) );
  XOR2XL U812 ( .A(n272), .B(n577), .Y(n841) );
  NAND2XL U813 ( .A(n576), .B(n606), .Y(n577) );
  XOR2XL U814 ( .A(n634), .B(n592), .Y(n576) );
  CLKMX2X2 U815 ( .A(N209), .B(sobel_result[4]), .S0(n102), .Y(n930) );
  MX2XL U816 ( .A(n509), .B(n508), .S0(n287), .Y(
        add_3_root_sub_0_root_sub_2382_SUM_3_) );
  XOR2XL U817 ( .A(n634), .B(n595), .Y(n509) );
  NAND2XL U818 ( .A(n507), .B(n605), .Y(n508) );
  CLKMX2X2 U819 ( .A(N208), .B(sobel_result[3]), .S0(n102), .Y(n931) );
  CLKMX2X2 U820 ( .A(N207), .B(sobel_result[2]), .S0(n102), .Y(n932) );
  CLKMX2X2 U821 ( .A(N206), .B(sobel_result[1]), .S0(n102), .Y(n933) );
  CLKMX2X2 U822 ( .A(N205), .B(sobel_result[0]), .S0(n102), .Y(n934) );
  INVXL U823 ( .A(a4[1]), .Y(n918) );
  INVXL U824 ( .A(a4[0]), .Y(n919) );
  INVXL U825 ( .A(a2[0]), .Y(n911) );
  INVXL U826 ( .A(a1[0]), .Y(n903) );
  INVXL U827 ( .A(a1[1]), .Y(n902) );
  INVXL U828 ( .A(a1[2]), .Y(n901) );
  INVXL U829 ( .A(a1[3]), .Y(n9001) );
  NAND3XL U830 ( .A(n222), .B(n103), .C(n104), .Y(state_r[0]) );
  AOI32XL U831 ( .A0(n759), .A1(n238), .A2(n247), .B0(i_start), .B1(n105), .Y(
        n104) );
  NOR4XL U832 ( .A(n171), .B(n108), .C(n1540), .D(n735), .Y(n141) );
  NAND4X1 U833 ( .A(n138), .B(n139), .C(n140), .D(n141), .Y(n1140) );
  NOR3XL U834 ( .A(n151), .B(n143), .C(n7301), .Y(n139) );
  NOR3XL U835 ( .A(n732), .B(n166), .C(n733), .Y(n140) );
  NOR3XL U836 ( .A(n56), .B(n729), .C(n5300), .Y(n138) );
  NOR2X1 U837 ( .A(n759), .B(n238), .Y(n105) );
  OAI22X1 U838 ( .A0(n237), .A1(n244), .B0(n759), .B1(n246), .Y(state_r[2]) );
  XOR2X1 U839 ( .A(n772), .B(n771), .Y(n1110) );
  INVX4 U840 ( .A(n818), .Y(n893) );
  AOI21X4 U841 ( .A0(n514), .A1(n513), .B0(n512), .Y(n5201) );
  AO21X4 U842 ( .A0(n525), .A1(n531), .B0(n302), .Y(n528) );
  NAND2X2 U843 ( .A(Gxy_r_0__7_), .B(n1610), .Y(n5401) );
  OAI31X2 U844 ( .A0(n535), .A1(n303), .A2(n302), .B0(n534), .Y(n541) );
  NAND2X2 U845 ( .A(n729), .B(n562), .Y(n563) );
  NAND2X2 U846 ( .A(n564), .B(n563), .Y(n566) );
  XOR2X2 U847 ( .A(n621), .B(n565), .Y(n630) );
  NAND2X2 U848 ( .A(smallest_r[0]), .B(n613), .Y(n615) );
  MXI2X1 U849 ( .A(n8800), .B(n634), .S0(n275), .Y(n645) );
  CLKMX2X2 U850 ( .A(n757), .B(n868), .S0(n275), .Y(n657) );
  CLKMX2X2 U851 ( .A(n761), .B(n841), .S0(n275), .Y(n659) );
  CLKMX2X2 U852 ( .A(n766), .B(n634), .S0(n275), .Y(n664) );
  MXI2X1 U853 ( .A(n640), .B(n270), .S0(n275), .Y(n665) );
  CLKINVX1 U854 ( .A(n767), .Y(n640) );
  CLKMX2X2 U855 ( .A(n775), .B(a9[0]), .S0(n833), .Y(n673) );
  CLKMX2X2 U856 ( .A(n776), .B(a9[1]), .S0(n833), .Y(n674) );
  CLKMX2X2 U857 ( .A(n777), .B(a9[2]), .S0(n833), .Y(n675) );
  CLKMX2X2 U858 ( .A(n778), .B(a9[3]), .S0(n833), .Y(n676) );
  CLKMX2X2 U859 ( .A(n779), .B(a9[4]), .S0(n833), .Y(n677) );
  CLKMX2X2 U860 ( .A(n783), .B(a8[0]), .S0(n833), .Y(n681) );
  CLKMX2X2 U861 ( .A(n784), .B(a8[1]), .S0(n833), .Y(n682) );
  CLKMX2X2 U862 ( .A(n791), .B(a7[0]), .S0(n833), .Y(n689) );
  CLKMX2X2 U863 ( .A(n792), .B(a7[1]), .S0(n833), .Y(n6901) );
  CLKMX2X2 U864 ( .A(n794), .B(a7[3]), .S0(n833), .Y(n692) );
  CLKMX2X2 U865 ( .A(n795), .B(a7[4]), .S0(n833), .Y(n693) );
  CLKMX2X2 U866 ( .A(n800), .B(a6[1]), .S0(n833), .Y(n698) );
  CLKMX2X2 U867 ( .A(n231), .B(a3[0]), .S0(n833), .Y(n705) );
  CLKMX2X2 U868 ( .A(n817), .B(Gxy_temp[3]), .S0(n275), .Y(n716) );
  CLKMX2X2 U869 ( .A(n818), .B(Gxy_temp[4]), .S0(n275), .Y(n717) );
  CLKMX2X2 U870 ( .A(n8201), .B(Gxy_temp[6]), .S0(n275), .Y(n719) );
  CLKMX2X2 U871 ( .A(n821), .B(Gxy_temp[7]), .S0(n275), .Y(n7201) );
  CLKMX2X2 U872 ( .A(n822), .B(Gxy_temp[8]), .S0(n275), .Y(n721) );
  CLKMX2X2 U873 ( .A(n823), .B(Gxy_temp[9]), .S0(n275), .Y(n722) );
  CLKMX2X2 U874 ( .A(n824), .B(Gxy_temp[10]), .S0(n275), .Y(n723) );
  CLKMX2X2 U875 ( .A(n825), .B(Gxy_temp[11]), .S0(n275), .Y(n724) );
  NAND2X2 U876 ( .A(n179), .B(n1360), .Y(n843) );
endmodule


module Sobel_gradient_DW01_sub_8 ( A, DIFF, \B[20] , \B[19] , \B[18] , \B[17] , 
        \B[16] , \B[15] , \B[14] , \B[13] , \B[12] , \B[11] , \B[10] , \B[9] , 
        \B[8]  );
  input [20:0] A;
  output [20:0] DIFF;
  input \B[20] , \B[19] , \B[18] , \B[17] , \B[16] , \B[15] , \B[14] , \B[13] ,
         \B[12] , \B[11] , \B[10] , \B[9] , \B[8] ;
  wire   n1, n3, n4, n7, n8, n9, n10, n11, n12, n13, n15, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n28, n29, n30, n34, n37, n39, n41, n43,
         n45, n46, n48, n50, n52, n57, n63, n64, n65, n66, n67, n69, n71, n72,
         n74, n75, n76, n83, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n200;
  wire   [20:8] B;
  assign B[20] = \B[20] ;
  assign B[19] = \B[19] ;
  assign B[18] = \B[18] ;
  assign B[17] = \B[17] ;
  assign B[16] = \B[16] ;
  assign B[15] = \B[15] ;
  assign B[14] = \B[14] ;
  assign B[13] = \B[13] ;
  assign B[12] = \B[12] ;
  assign B[11] = \B[11] ;
  assign B[10] = \B[10] ;
  assign B[9] = \B[9] ;
  assign B[8] = \B[8] ;

  OR2X4 U114 ( .A(A[11]), .B(n94), .Y(n190) );
  OR2X6 U115 ( .A(A[13]), .B(n92), .Y(n186) );
  NAND2X2 U116 ( .A(n92), .B(A[13]), .Y(n52) );
  INVX6 U117 ( .A(n39), .Y(n37) );
  NAND2X8 U118 ( .A(n184), .B(n15), .Y(n176) );
  INVX3 U119 ( .A(n163), .Y(n160) );
  CLKINVX4 U120 ( .A(n171), .Y(n163) );
  AND2X8 U121 ( .A(n186), .B(n189), .Y(n161) );
  AOI21X2 U122 ( .A0(n46), .A1(n188), .B0(n43), .Y(n162) );
  OR2X8 U123 ( .A(A[14]), .B(n91), .Y(n188) );
  INVX1 U124 ( .A(n65), .Y(n83) );
  AND2X8 U125 ( .A(A[12]), .B(n93), .Y(n170) );
  NAND2X2 U126 ( .A(n160), .B(n10), .Y(n165) );
  NAND2X6 U127 ( .A(n163), .B(n164), .Y(n166) );
  NAND2X8 U128 ( .A(n165), .B(n166), .Y(DIFF[12]) );
  INVX2 U129 ( .A(n10), .Y(n164) );
  NAND2X2 U130 ( .A(n57), .B(n189), .Y(n10) );
  XNOR2X2 U131 ( .A(n8), .B(n46), .Y(DIFF[14]) );
  NAND2X6 U132 ( .A(n200), .B(n187), .Y(n29) );
  XOR2X2 U133 ( .A(n19), .B(n3), .Y(DIFF[19]) );
  CLKBUFX2 U134 ( .A(n23), .Y(n174) );
  XNOR2X4 U135 ( .A(n173), .B(n7), .Y(DIFF[15]) );
  XOR2X2 U136 ( .A(n13), .B(n72), .Y(DIFF[9]) );
  INVX1 U137 ( .A(n170), .Y(n57) );
  INVX16 U138 ( .A(n185), .Y(DIFF[20]) );
  CLKBUFX3 U139 ( .A(A[4]), .Y(DIFF[4]) );
  AND2X4 U140 ( .A(n76), .B(n26), .Y(n180) );
  INVX2 U141 ( .A(n25), .Y(n76) );
  CLKINVX1 U142 ( .A(B[10]), .Y(n95) );
  AOI21X1 U143 ( .A0(n191), .A1(n1), .B0(n69), .Y(n167) );
  CLKINVX6 U144 ( .A(n71), .Y(n69) );
  NAND2X6 U145 ( .A(n161), .B(n171), .Y(n179) );
  NOR2X6 U146 ( .A(A[10]), .B(n95), .Y(n65) );
  CLKBUFX2 U147 ( .A(n187), .Y(n168) );
  OR2X6 U148 ( .A(A[15]), .B(n90), .Y(n187) );
  XOR2X1 U149 ( .A(n12), .B(n167), .Y(DIFF[10]) );
  NAND2X8 U150 ( .A(A[17]), .B(n88), .Y(n26) );
  INVXL U151 ( .A(B[12]), .Y(n93) );
  NAND2X6 U152 ( .A(A[9]), .B(n96), .Y(n71) );
  CLKBUFX2 U153 ( .A(n97), .Y(n169) );
  INVX1 U154 ( .A(B[15]), .Y(n90) );
  NAND2X6 U155 ( .A(A[10]), .B(n95), .Y(n66) );
  INVXL U156 ( .A(B[8]), .Y(n97) );
  NAND2X4 U157 ( .A(n85), .B(A[20]), .Y(n15) );
  INVXL U158 ( .A(B[13]), .Y(n92) );
  NOR2X8 U159 ( .A(A[17]), .B(n88), .Y(n25) );
  OR2X8 U160 ( .A(A[12]), .B(n93), .Y(n189) );
  NAND2X6 U161 ( .A(A[15]), .B(n90), .Y(n39) );
  NAND2X4 U162 ( .A(n83), .B(n66), .Y(n12) );
  INVX1 U163 ( .A(B[9]), .Y(n96) );
  INVXL U164 ( .A(n22), .Y(n75) );
  OAI2BB1X4 U165 ( .A0N(n190), .A1N(n64), .B0(n63), .Y(n171) );
  NAND2X2 U166 ( .A(A[11]), .B(n94), .Y(n63) );
  NAND2X2 U167 ( .A(A[18]), .B(n87), .Y(n23) );
  OA21X4 U168 ( .A0(n29), .A1(n162), .B0(n30), .Y(n172) );
  XOR2X4 U169 ( .A(n182), .B(n183), .Y(DIFF[16]) );
  AO21X4 U170 ( .A0(n188), .A1(n46), .B0(n43), .Y(n173) );
  NAND2X8 U171 ( .A(n179), .B(n48), .Y(n46) );
  CLKINVX6 U172 ( .A(n45), .Y(n43) );
  NAND2XL U173 ( .A(n71), .B(n191), .Y(n13) );
  NAND2X4 U174 ( .A(A[14]), .B(n91), .Y(n45) );
  OAI21X2 U175 ( .A0(n172), .A1(n25), .B0(n26), .Y(n24) );
  AND2X8 U176 ( .A(n28), .B(n20), .Y(n178) );
  NOR2X8 U177 ( .A(n178), .B(n21), .Y(n19) );
  AO21X2 U178 ( .A0(n171), .A1(n189), .B0(n170), .Y(n181) );
  BUFX2 U179 ( .A(A[2]), .Y(DIFF[2]) );
  AND2X4 U180 ( .A(A[16]), .B(n89), .Y(n177) );
  XNOR2X4 U181 ( .A(n24), .B(n4), .Y(DIFF[18]) );
  AND2X1 U182 ( .A(n200), .B(n34), .Y(n183) );
  INVX4 U183 ( .A(n177), .Y(n34) );
  NAND2X1 U184 ( .A(n186), .B(n52), .Y(n9) );
  XOR2X4 U185 ( .A(n175), .B(n176), .Y(n185) );
  OAI21X4 U186 ( .A0(n19), .A1(n17), .B0(n18), .Y(n175) );
  NOR2X6 U187 ( .A(n22), .B(n25), .Y(n20) );
  OR2X8 U188 ( .A(A[16]), .B(n89), .Y(n200) );
  AOI21X4 U189 ( .A0(n191), .A1(n1), .B0(n69), .Y(n67) );
  INVX4 U190 ( .A(n72), .Y(n1) );
  NOR2X8 U191 ( .A(A[8]), .B(n169), .Y(n72) );
  OR2X8 U192 ( .A(A[9]), .B(n96), .Y(n191) );
  NAND2X2 U193 ( .A(n75), .B(n174), .Y(n4) );
  XNOR2X4 U194 ( .A(n172), .B(n180), .Y(DIFF[17]) );
  NAND2X4 U195 ( .A(A[19]), .B(n86), .Y(n18) );
  NOR2X6 U196 ( .A(A[19]), .B(n86), .Y(n17) );
  INVX3 U197 ( .A(n52), .Y(n50) );
  OR2X8 U198 ( .A(A[20]), .B(n85), .Y(n184) );
  NAND2X2 U199 ( .A(n190), .B(n63), .Y(n11) );
  NOR2X8 U200 ( .A(A[18]), .B(n87), .Y(n22) );
  AOI21X4 U201 ( .A0(n186), .A1(n170), .B0(n50), .Y(n48) );
  AO21X4 U202 ( .A0(n173), .A1(n168), .B0(n37), .Y(n182) );
  NAND2X1 U203 ( .A(n188), .B(n45), .Y(n8) );
  OAI21X4 U204 ( .A0(n26), .A1(n22), .B0(n23), .Y(n21) );
  OAI21X4 U205 ( .A0(n41), .A1(n29), .B0(n30), .Y(n28) );
  AOI21X4 U206 ( .A0(n46), .A1(n188), .B0(n43), .Y(n41) );
  CLKBUFX2 U207 ( .A(A[0]), .Y(DIFF[0]) );
  AOI21X4 U208 ( .A0(n200), .A1(n37), .B0(n177), .Y(n30) );
  OAI21X4 U209 ( .A0(n67), .A1(n65), .B0(n66), .Y(n64) );
  XNOR2X4 U210 ( .A(n181), .B(n9), .Y(DIFF[13]) );
  NAND2X2 U211 ( .A(n74), .B(n18), .Y(n3) );
  INVX3 U212 ( .A(n17), .Y(n74) );
  INVXL U213 ( .A(B[11]), .Y(n94) );
  INVXL U214 ( .A(B[14]), .Y(n91) );
  INVXL U215 ( .A(B[20]), .Y(n85) );
  NAND2X1 U216 ( .A(n187), .B(n39), .Y(n7) );
  XNOR2X1 U217 ( .A(n11), .B(n64), .Y(DIFF[11]) );
  XNOR2X1 U218 ( .A(A[8]), .B(n169), .Y(DIFF[8]) );
  INVXL U219 ( .A(B[16]), .Y(n89) );
  INVX1 U220 ( .A(B[18]), .Y(n87) );
  INVX1 U221 ( .A(B[17]), .Y(n88) );
  INVX1 U222 ( .A(B[19]), .Y(n86) );
  BUFX2 U223 ( .A(A[7]), .Y(DIFF[7]) );
  CLKBUFX3 U224 ( .A(A[6]), .Y(DIFF[6]) );
  CLKBUFX3 U225 ( .A(A[5]), .Y(DIFF[5]) );
  CLKBUFX3 U226 ( .A(A[3]), .Y(DIFF[3]) );
  CLKBUFX3 U227 ( .A(A[1]), .Y(DIFF[1]) );
endmodule


module Sobel_gradient_DW01_sub_7 ( DIFF, sobel1U120_Y, i_rst_n_INV, i_clk, 
        \A[20] , \A[19] , \A[18] , \A[17] , \A[16] , \A[15] , \A[14] , \A[13] , 
        \A[12] , \A[11] , \A[10] , \A[9] , \A[8] , \A[7] , \A[6] , \A[5] , 
        \A[4] , \B[15] , \B[14] , \B[13] , \B[12] , \B[11] , \B[10] , \B[9] , 
        \B[8] , \B[7] , \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0] 
 );
  output [20:0] DIFF;
  input sobel1U120_Y, i_rst_n_INV, i_clk, \A[20] , \A[19] , \A[18] , \A[17] ,
         \A[16] , \A[15] , \A[14] , \A[13] , \A[12] , \A[11] , \A[10] , \A[9] ,
         \A[8] , \A[7] , \A[6] , \A[5] , \A[4] , \B[15] , \B[14] , \B[13] ,
         \B[12] , \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , \B[6] , \B[5] ,
         \B[4] , \B[3] , \B[2] , \B[1] , \B[0] ;
  wire   n1, n7, n9, n11, n12, n13, n14, n15, n16, n17, n21, n22, n29, n33,
         n34, n35, n36, n37, n39, n41, n43, n46, n48, n50, n51, n52, n53, n54,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n76, n78, n79, n80, n81, n82, n84, n86, n90,
         n91, n92, n97, n98, n100, n101, n103, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n229, n230, n231, n232, n233, n234, n235,
         n236;
  wire   [20:4] A;
  wire   [15:0] B;
  assign A[20] = \A[20] ;
  assign A[19] = \A[19] ;
  assign A[18] = \A[18] ;
  assign A[17] = \A[17] ;
  assign A[16] = \A[16] ;
  assign A[15] = \A[15] ;
  assign A[14] = \A[14] ;
  assign A[13] = \A[13] ;
  assign A[12] = \A[12] ;
  assign A[11] = \A[11] ;
  assign A[10] = \A[10] ;
  assign A[9] = \A[9] ;
  assign A[8] = \A[8] ;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign B[15] = \B[15] ;
  assign B[14] = \B[14] ;
  assign B[13] = \B[13] ;
  assign B[12] = \B[12] ;
  assign B[11] = \B[11] ;
  assign B[10] = \B[10] ;
  assign B[9] = \B[9] ;
  assign B[8] = \B[8] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  XNOR2X4 U13 ( .A(n210), .B(n212), .Y(DIFF[17]) );
  AOI21X4 U52 ( .A0(n51), .A1(n59), .B0(n52), .Y(n50) );
  OAI21X4 U67 ( .A0(n62), .A1(n60), .B0(n61), .Y(n59) );
  XNOR2X4 U72 ( .A(n67), .B(n12), .Y(DIFF[9]) );
  DFFSX1 i_clk_r_REG231_S7 ( .D(n230), .CK(i_clk), .SN(i_rst_n_INV), .Q(n234)
         );
  DFFRX1 i_clk_r_REG233_S7 ( .D(n232), .CK(i_clk), .RN(i_rst_n_INV), .Q(n236)
         );
  DFFRX1 i_clk_r_REG203_S7 ( .D(n231), .CK(i_clk), .RN(i_rst_n_INV), .Q(n235), 
        .QN(n190) );
  DFFSX2 i_clk_r_REG230_S7 ( .D(n229), .CK(i_clk), .SN(i_rst_n_INV), .Q(n233)
         );
  INVX3 U140 ( .A(n59), .Y(n58) );
  INVX3 U141 ( .A(n213), .Y(n34) );
  BUFX4 U142 ( .A(n62), .Y(n188) );
  NAND2X8 U143 ( .A(n109), .B(A[11]), .Y(n57) );
  NAND2X6 U144 ( .A(A[12]), .B(n108), .Y(n54) );
  CLKBUFX2 U145 ( .A(n82), .Y(n187) );
  NAND2X4 U146 ( .A(A[10]), .B(n110), .Y(n61) );
  NOR2X6 U147 ( .A(A[12]), .B(n108), .Y(n53) );
  BUFX8 U148 ( .A(A[17]), .Y(n212) );
  INVX2 U149 ( .A(A[16]), .Y(n196) );
  NAND2X2 U150 ( .A(n213), .B(n35), .Y(n207) );
  INVX16 U151 ( .A(n222), .Y(DIFF[20]) );
  INVX6 U152 ( .A(B[11]), .Y(n109) );
  INVX8 U153 ( .A(n50), .Y(n203) );
  NOR2X8 U154 ( .A(A[16]), .B(n198), .Y(n197) );
  CLKINVX3 U155 ( .A(n56), .Y(n97) );
  BUFX8 U156 ( .A(A[18]), .Y(n208) );
  INVX6 U157 ( .A(n71), .Y(n70) );
  NAND2X8 U158 ( .A(n22), .B(n29), .Y(n21) );
  NAND2X6 U159 ( .A(A[15]), .B(n105), .Y(n35) );
  NAND2X1 U160 ( .A(n43), .B(n201), .Y(n7) );
  CLKINVX6 U161 ( .A(n57), .Y(n215) );
  BUFX4 U162 ( .A(n36), .Y(n199) );
  BUFX8 U163 ( .A(n69), .Y(n189) );
  AND2X8 U164 ( .A(n190), .B(n90), .Y(n221) );
  XNOR2X2 U165 ( .A(n17), .B(n194), .Y(DIFF[4]) );
  NOR2X6 U166 ( .A(n68), .B(n65), .Y(n63) );
  INVX6 U167 ( .A(B[8]), .Y(n112) );
  OR2X8 U168 ( .A(n211), .B(n106), .Y(n224) );
  CLKINVX6 U169 ( .A(n210), .Y(n29) );
  NAND2X8 U170 ( .A(n204), .B(n39), .Y(n37) );
  NOR2X8 U171 ( .A(A[19]), .B(n21), .Y(n220) );
  NOR2X4 U172 ( .A(n113), .B(A[7]), .Y(n72) );
  INVX3 U173 ( .A(B[6]), .Y(n114) );
  INVX6 U174 ( .A(B[9]), .Y(n111) );
  INVX4 U175 ( .A(n48), .Y(n46) );
  XOR2X1 U176 ( .A(n14), .B(n192), .Y(DIFF[7]) );
  INVX3 U177 ( .A(n68), .Y(n100) );
  CLKINVX1 U178 ( .A(B[4]), .Y(n116) );
  CLKBUFX2 U179 ( .A(n79), .Y(n191) );
  CLKBUFX2 U180 ( .A(n74), .Y(n192) );
  XOR2X4 U181 ( .A(n188), .B(n11), .Y(DIFF[10]) );
  XNOR2X1 U182 ( .A(B[2]), .B(n91), .Y(DIFF[2]) );
  INVX8 U183 ( .A(n91), .Y(n1) );
  ADDHX4 U184 ( .A(n117), .B(n92), .CO(n91), .S(DIFF[1]) );
  INVX8 U185 ( .A(B[13]), .Y(n107) );
  INVXL U186 ( .A(n221), .Y(n193) );
  INVX1 U187 ( .A(n193), .Y(n194) );
  NOR2X4 U188 ( .A(n58), .B(n56), .Y(n214) );
  XOR2X1 U189 ( .A(n16), .B(n187), .Y(DIFF[5]) );
  NOR2X6 U190 ( .A(A[18]), .B(n212), .Y(n22) );
  NAND2X6 U191 ( .A(n97), .B(n200), .Y(n206) );
  NAND2BX2 U192 ( .AN(n195), .B(n54), .Y(n9) );
  NAND2XL U193 ( .A(n225), .B(n78), .Y(n15) );
  INVX4 U194 ( .A(n78), .Y(n76) );
  NOR2X8 U195 ( .A(B[2]), .B(n1), .Y(n90) );
  NOR2X4 U196 ( .A(n214), .B(n215), .Y(n209) );
  CLKINVX12 U197 ( .A(B[1]), .Y(n117) );
  CLKINVX8 U198 ( .A(B[0]), .Y(n92) );
  INVX4 U199 ( .A(B[10]), .Y(n110) );
  INVX6 U200 ( .A(n43), .Y(n41) );
  OR2X2 U201 ( .A(n233), .B(A[4]), .Y(n226) );
  INVX6 U202 ( .A(n35), .Y(n198) );
  NOR2X6 U203 ( .A(A[12]), .B(n108), .Y(n195) );
  XOR2X4 U204 ( .A(n33), .B(n196), .Y(DIFF[16]) );
  NAND2X4 U205 ( .A(n113), .B(A[7]), .Y(n73) );
  NAND2X1 U206 ( .A(n233), .B(A[4]), .Y(n86) );
  MX2X1 U207 ( .A(n233), .B(n116), .S0(sobel1U120_Y), .Y(n229) );
  NAND2XL U208 ( .A(n226), .B(n86), .Y(n17) );
  NAND2X8 U209 ( .A(n202), .B(n203), .Y(n204) );
  INVX8 U210 ( .A(n215), .Y(n200) );
  OR2X8 U211 ( .A(n211), .B(n106), .Y(n201) );
  NAND2X2 U212 ( .A(n103), .B(n81), .Y(n16) );
  AND2X8 U213 ( .A(n224), .B(n223), .Y(n202) );
  NOR2X6 U214 ( .A(n195), .B(n56), .Y(n51) );
  INVX4 U215 ( .A(n60), .Y(n98) );
  AND2X8 U216 ( .A(n223), .B(n48), .Y(n205) );
  INVX8 U217 ( .A(n37), .Y(n36) );
  NAND2X6 U218 ( .A(A[13]), .B(n107), .Y(n48) );
  INVX8 U219 ( .A(n217), .Y(DIFF[18]) );
  XOR2X4 U220 ( .A(n203), .B(n205), .Y(DIFF[13]) );
  XOR2X4 U221 ( .A(n58), .B(n206), .Y(DIFF[11]) );
  XOR2X4 U222 ( .A(n199), .B(n207), .Y(DIFF[15]) );
  INVX8 U223 ( .A(B[14]), .Y(n106) );
  OAI2BB1X4 U224 ( .A0N(n213), .A1N(n37), .B0(n197), .Y(n210) );
  XOR2X4 U225 ( .A(n209), .B(n9), .Y(DIFF[12]) );
  AOI21X4 U226 ( .A0(n225), .A1(n79), .B0(n76), .Y(n74) );
  OR2X4 U227 ( .A(n114), .B(n236), .Y(n225) );
  BUFX8 U228 ( .A(A[14]), .Y(n211) );
  NAND2X4 U229 ( .A(n98), .B(n61), .Y(n11) );
  NOR2X8 U230 ( .A(n112), .B(A[8]), .Y(n68) );
  NOR2X8 U231 ( .A(A[11]), .B(n109), .Y(n56) );
  INVX8 U232 ( .A(B[12]), .Y(n108) );
  NAND2X4 U233 ( .A(A[9]), .B(n111), .Y(n66) );
  NOR2X8 U234 ( .A(n111), .B(A[9]), .Y(n65) );
  AOI21X4 U235 ( .A0(n221), .A1(n226), .B0(n84), .Y(n82) );
  AO21X4 U236 ( .A0(n203), .A1(n223), .B0(n46), .Y(n216) );
  INVX3 U237 ( .A(A[20]), .Y(n219) );
  NOR2X8 U238 ( .A(A[10]), .B(n110), .Y(n60) );
  NAND2BX2 U239 ( .AN(n65), .B(n66), .Y(n12) );
  NAND2X6 U240 ( .A(n112), .B(A[8]), .Y(n69) );
  XNOR2X4 U241 ( .A(A[19]), .B(n21), .Y(DIFF[19]) );
  OR2X8 U242 ( .A(n210), .B(n212), .Y(n218) );
  OAI21X4 U243 ( .A0(n65), .A1(n69), .B0(n66), .Y(n64) );
  OAI21X4 U244 ( .A0(n70), .A1(n68), .B0(n189), .Y(n67) );
  OAI21X4 U245 ( .A0(n36), .A1(n34), .B0(n35), .Y(n33) );
  XOR2X4 U246 ( .A(n70), .B(n13), .Y(DIFF[8]) );
  NAND2X2 U247 ( .A(n100), .B(n189), .Y(n13) );
  OR2X8 U248 ( .A(A[15]), .B(n105), .Y(n213) );
  XOR2X4 U249 ( .A(n220), .B(n219), .Y(n222) );
  OAI21X4 U250 ( .A0(n72), .A1(n74), .B0(n73), .Y(n71) );
  OAI21X4 U251 ( .A0(n82), .A1(n80), .B0(n81), .Y(n79) );
  OR2X8 U252 ( .A(A[13]), .B(n107), .Y(n223) );
  AOI21X4 U253 ( .A0(n63), .A1(n71), .B0(n64), .Y(n62) );
  OAI21X4 U254 ( .A0(n57), .A1(n53), .B0(n54), .Y(n52) );
  AOI21X4 U255 ( .A0(n201), .A1(n46), .B0(n41), .Y(n39) );
  NAND2X4 U256 ( .A(n106), .B(n211), .Y(n43) );
  XNOR2X4 U257 ( .A(n216), .B(n7), .Y(DIFF[14]) );
  XOR2X4 U258 ( .A(n218), .B(n208), .Y(n217) );
  INVX3 U259 ( .A(B[15]), .Y(n105) );
  NAND2X1 U260 ( .A(n234), .B(A[5]), .Y(n81) );
  NAND2X1 U261 ( .A(n101), .B(n73), .Y(n14) );
  CLKINVX1 U262 ( .A(n72), .Y(n101) );
  CLKINVX1 U263 ( .A(n86), .Y(n84) );
  CLKINVX1 U264 ( .A(n80), .Y(n103) );
  XNOR2X1 U265 ( .A(n15), .B(n191), .Y(DIFF[6]) );
  NAND2X2 U266 ( .A(n114), .B(n236), .Y(n78) );
  INVX3 U267 ( .A(B[7]), .Y(n113) );
  NOR2X2 U268 ( .A(n234), .B(A[5]), .Y(n80) );
  CLKINVX1 U269 ( .A(B[5]), .Y(n115) );
  XNOR2X1 U270 ( .A(n235), .B(n90), .Y(DIFF[3]) );
  CLKBUFX2 U271 ( .A(B[0]), .Y(DIFF[0]) );
  CLKMX2X2 U272 ( .A(n234), .B(n115), .S0(sobel1U120_Y), .Y(n230) );
  CLKMX2X2 U273 ( .A(n235), .B(B[3]), .S0(sobel1U120_Y), .Y(n231) );
  CLKMX2X2 U274 ( .A(n236), .B(A[6]), .S0(sobel1U120_Y), .Y(n232) );
endmodule


module Sobel_gradient_DW01_add_3_DW01_add_25 ( A, B, SUM );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  wire   n1;
  wire   [12:1] carry;

  ADDFHX4 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX4 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  XOR2X4 U1 ( .A(B[12]), .B(A[12]), .Y(n1) );
  XOR2X4 U2 ( .A(carry[12]), .B(n1), .Y(SUM[12]) );
  AND2X1 U3 ( .A(A[0]), .B(B[0]), .Y(carry[1]) );
  XOR2X1 U4 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module Sobel_gradient_DW01_add_4_DW01_add_26 ( A, SUM, \B[11] , \B[10] , 
        \B[9] , \B[8] , \B[7] , \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] 
 );
  input [11:0] A;
  output [11:0] SUM;
  input \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , \B[6] , \B[5] , \B[4] ,
         \B[3] , \B[2] , \B[1] ;

  wire   [11:1] B;
  wire   [11:2] carry;
  assign B[11] = \B[11] ;
  assign B[10] = \B[10] ;
  assign B[9] = \B[9] ;
  assign B[8] = \B[8] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;

  XOR3X4 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X2 U1 ( .A(A[1]), .B(B[1]), .Y(carry[2]) );
  XOR2X2 U2 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  BUFX4 U3 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Sobel_gradient_DW01_add_5_DW01_add_27 ( A, SUM, \B[7] , \B[6] , \B[5] , 
        \B[4] , \B[3] , \B[2] , \B[1] , \B[0]  );
  input [10:0] A;
  output [10:0] SUM;
  input \B[7] , \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0] ;
  wire   n1;
  wire   [7:0] B;
  wire   [9:1] carry;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X4 U1 ( .A(carry[8]), .B(A[8]), .Y(carry[9]) );
  NAND2X2 U2 ( .A(carry[9]), .B(A[9]), .Y(n1) );
  XOR2X2 U3 ( .A(A[9]), .B(carry[9]), .Y(SUM[9]) );
  XOR2X2 U4 ( .A(A[8]), .B(carry[8]), .Y(SUM[8]) );
  XNOR2X4 U5 ( .A(A[10]), .B(n1), .Y(SUM[10]) );
  AND2X2 U6 ( .A(A[0]), .B(B[0]), .Y(carry[1]) );
  XOR2X1 U7 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module Sobel_gradient_DW01_add_6_DW01_add_28 ( \A[10] , \A[9] , \A[8] , \A[7] , 
        \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \B[8] , \B[7] , \B[6] , 
        \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \SUM[10] , \SUM[9] , \SUM[8] , 
        \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] , \SUM[3] , \SUM[2] , \SUM[1] 
 );
  input \A[10] , \A[9] , \A[8] , \A[7] , \A[6] , \A[5] , \A[4] , \A[3] ,
         \A[2] , \A[1] , \B[8] , \B[7] , \B[6] , \B[5] , \B[4] , \B[3] ,
         \B[2] , \B[1] ;
  output \SUM[10] , \SUM[9] , \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] ,
         \SUM[3] , \SUM[2] , \SUM[1] ;
  wire   n1;
  wire   [10:1] A;
  wire   [8:1] B;
  wire   [10:1] SUM;
  wire   [9:2] carry;
  assign A[10] = \A[10] ;
  assign A[9] = \A[9] ;
  assign A[8] = \A[8] ;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign B[8] = \B[8] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign \SUM[10]  = SUM[10];
  assign \SUM[9]  = SUM[9];
  assign \SUM[8]  = SUM[8];
  assign \SUM[7]  = SUM[7];
  assign \SUM[6]  = SUM[6];
  assign \SUM[5]  = SUM[5];
  assign \SUM[4]  = SUM[4];
  assign \SUM[3]  = SUM[3];
  assign \SUM[2]  = SUM[2];
  assign \SUM[1]  = SUM[1];

  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  AND2X2 U1 ( .A(A[1]), .B(B[1]), .Y(carry[2]) );
  XOR2X4 U2 ( .A(A[9]), .B(carry[9]), .Y(SUM[9]) );
  NAND2X2 U3 ( .A(carry[9]), .B(A[9]), .Y(n1) );
  XNOR2X4 U4 ( .A(A[10]), .B(n1), .Y(SUM[10]) );
  XOR2X1 U5 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
endmodule


module Sobel_gradient_DW01_add_7_DW01_add_29 ( A, SUM, \B[7] , \B[6] , \B[5] , 
        \B[4] , \B[3] , \B[2] , \B[1] , \B[0]  );
  input [10:0] A;
  output [10:0] SUM;
  input \B[7] , \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0] ;
  wire   n1, n2;
  wire   [7:0] B;
  wire   [9:1] carry;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFHX4 U1_6 ( .A(B[6]), .B(A[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X4 U1 ( .A(carry[8]), .B(A[8]), .Y(carry[9]) );
  AND2X4 U2 ( .A(A[0]), .B(n1), .Y(carry[1]) );
  CLKBUFX3 U3 ( .A(B[0]), .Y(n1) );
  XOR2XL U4 ( .A(n1), .B(A[0]), .Y(SUM[0]) );
  XOR2X1 U5 ( .A(A[8]), .B(carry[8]), .Y(SUM[8]) );
  XOR2X2 U6 ( .A(A[9]), .B(carry[9]), .Y(SUM[9]) );
  NAND2X2 U7 ( .A(carry[9]), .B(A[9]), .Y(n2) );
  XNOR2X1 U8 ( .A(A[10]), .B(n2), .Y(SUM[10]) );
endmodule


module Sobel_gradient_DW01_inc_5_DW01_inc_17 ( SUM, sobel1U79_Y, i_rst_n_INV, 
        i_clk, \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] 
 );
  output [9:0] SUM;
  input sobel1U79_Y, i_rst_n_INV, i_clk, \A[7] , \A[6] , \A[5] , \A[4] ,
         \A[3] , \A[2] , \A[1] , \A[0] ;
  wire   n1, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20;
  wire   [7:0] A;
  wire   [8:2] carry;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign A[0] = \A[0] ;

  DFFSX1 i_clk_r_REG561_S13 ( .D(n12), .CK(i_clk), .SN(i_rst_n_INV), .Q(n20)
         );
  DFFSX1 i_clk_r_REG535_S13 ( .D(n11), .CK(i_clk), .SN(i_rst_n_INV), .Q(n19)
         );
  DFFSX1 i_clk_r_REG509_S13 ( .D(n10), .CK(i_clk), .SN(i_rst_n_INV), .Q(n18)
         );
  DFFSX1 i_clk_r_REG483_S13 ( .D(n9), .CK(i_clk), .SN(i_rst_n_INV), .Q(n17) );
  DFFSX1 i_clk_r_REG457_S13 ( .D(n8), .CK(i_clk), .SN(i_rst_n_INV), .Q(n16) );
  DFFSX1 i_clk_r_REG431_S13 ( .D(n7), .CK(i_clk), .SN(i_rst_n_INV), .Q(n15) );
  ADDHX2 U1_1_1 ( .A(n14), .B(n13), .CO(carry[2]), .S(SUM[1]) );
  DFFSX1 i_clk_r_REG379_S13 ( .D(n5), .CK(i_clk), .SN(i_rst_n_INV), .Q(n13), 
        .QN(SUM[0]) );
  ADDHX1 U1_1_6 ( .A(n19), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(n18), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX2 U1_1_7 ( .A(n20), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  DFFSX2 i_clk_r_REG405_S13 ( .D(n6), .CK(i_clk), .SN(i_rst_n_INV), .Q(n14) );
  ADDHX4 U1_1_4 ( .A(n17), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CMPR22X2 U1_1_2 ( .A(n15), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  XOR2X1 U1 ( .A(n16), .B(carry[3]), .Y(SUM[3]) );
  INVX3 U2 ( .A(n1), .Y(carry[4]) );
  NAND2X4 U3 ( .A(n16), .B(carry[3]), .Y(n1) );
  BUFX6 U4 ( .A(SUM[8]), .Y(SUM[9]) );
  MX2XL U5 ( .A(n13), .B(A[0]), .S0(sobel1U79_Y), .Y(n5) );
  INVX1 U6 ( .A(carry[8]), .Y(SUM[8]) );
  CLKMX2X2 U7 ( .A(n14), .B(A[1]), .S0(sobel1U79_Y), .Y(n6) );
  CLKMX2X2 U8 ( .A(n15), .B(A[2]), .S0(sobel1U79_Y), .Y(n7) );
  CLKMX2X2 U9 ( .A(n16), .B(A[3]), .S0(sobel1U79_Y), .Y(n8) );
  CLKMX2X2 U10 ( .A(n17), .B(A[4]), .S0(sobel1U79_Y), .Y(n9) );
  CLKMX2X2 U11 ( .A(n18), .B(A[5]), .S0(sobel1U79_Y), .Y(n10) );
  CLKMX2X2 U12 ( .A(n19), .B(A[6]), .S0(sobel1U79_Y), .Y(n11) );
  CLKMX2X2 U13 ( .A(n20), .B(A[7]), .S0(sobel1U79_Y), .Y(n12) );
endmodule


module Sobel_gradient_DW01_inc_4_DW01_inc_16 ( sobel1U79_Y, i_rst_n_INV, i_clk, 
        \A[8] , \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , 
        \SUM[9] , \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] , \SUM[3] , 
        \SUM[2] , \SUM[1]  );
  input sobel1U79_Y, i_rst_n_INV, i_clk, \A[8] , \A[7] , \A[6] , \A[5] ,
         \A[4] , \A[3] , \A[2] , \A[1] ;
  output \SUM[9] , \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] , \SUM[3] ,
         \SUM[2] , \SUM[1] ;
  wire   carry_9_, carry_8_, carry_7_, carry_6_, carry_5_, carry_4_, carry_3_,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18;
  wire   [8:1] A;
  wire   [9:1] SUM;
  assign A[8] = \A[8] ;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign \SUM[9]  = SUM[9];
  assign \SUM[8]  = SUM[8];
  assign \SUM[7]  = SUM[7];
  assign \SUM[6]  = SUM[6];
  assign \SUM[5]  = SUM[5];
  assign \SUM[4]  = SUM[4];
  assign \SUM[3]  = SUM[3];
  assign \SUM[2]  = SUM[2];
  assign \SUM[1]  = SUM[1];

  DFFSX1 i_clk_r_REG553_S10 ( .D(n10), .CK(i_clk), .SN(i_rst_n_INV), .Q(n18)
         );
  DFFSX1 i_clk_r_REG527_S10 ( .D(n9), .CK(i_clk), .SN(i_rst_n_INV), .Q(n17) );
  DFFSX1 i_clk_r_REG501_S10 ( .D(n8), .CK(i_clk), .SN(i_rst_n_INV), .Q(n16) );
  DFFSX1 i_clk_r_REG475_S10 ( .D(n7), .CK(i_clk), .SN(i_rst_n_INV), .Q(n15) );
  DFFSX1 i_clk_r_REG449_S10 ( .D(n6), .CK(i_clk), .SN(i_rst_n_INV), .Q(n14) );
  DFFSX1 i_clk_r_REG423_S10 ( .D(n5), .CK(i_clk), .SN(i_rst_n_INV), .Q(n13) );
  DFFSX1 i_clk_r_REG397_S10 ( .D(n4), .CK(i_clk), .SN(i_rst_n_INV), .Q(n12) );
  ADDHXL U1_1_3 ( .A(n13), .B(carry_3_), .CO(carry_4_), .S(SUM[3]) );
  ADDHX2 U1_1_7 ( .A(n17), .B(carry_7_), .CO(carry_8_), .S(SUM[7]) );
  ADDHX2 U1_1_8 ( .A(n18), .B(carry_8_), .CO(carry_9_), .S(SUM[8]) );
  ADDHX2 U1_1_6 ( .A(n16), .B(carry_6_), .CO(carry_7_), .S(SUM[6]) );
  DFFSX2 i_clk_r_REG371_S10 ( .D(n3), .CK(i_clk), .SN(i_rst_n_INV), .Q(n11), 
        .QN(SUM[1]) );
  ADDHX1 U1_1_4 ( .A(n14), .B(carry_4_), .CO(carry_5_), .S(SUM[4]) );
  ADDHX1 U1_1_5 ( .A(n15), .B(carry_5_), .CO(carry_6_), .S(SUM[5]) );
  ADDHX1 U1_1_2 ( .A(n12), .B(n11), .CO(carry_3_), .S(SUM[2]) );
  CLKMX2X2 U1 ( .A(n11), .B(A[1]), .S0(sobel1U79_Y), .Y(n3) );
  CLKMX2X2 U2 ( .A(n12), .B(A[2]), .S0(sobel1U79_Y), .Y(n4) );
  CLKMX2X2 U3 ( .A(n13), .B(A[3]), .S0(sobel1U79_Y), .Y(n5) );
  CLKMX2X2 U4 ( .A(n14), .B(A[4]), .S0(sobel1U79_Y), .Y(n6) );
  CLKMX2X2 U5 ( .A(n15), .B(A[5]), .S0(sobel1U79_Y), .Y(n7) );
  CLKMX2X2 U6 ( .A(n16), .B(A[6]), .S0(sobel1U79_Y), .Y(n8) );
  CLKMX2X2 U7 ( .A(n17), .B(A[7]), .S0(sobel1U79_Y), .Y(n9) );
  CLKMX2X2 U8 ( .A(n18), .B(A[8]), .S0(sobel1U79_Y), .Y(n10) );
  CLKINVX1 U9 ( .A(carry_9_), .Y(SUM[9]) );
endmodule


module Sobel_gradient_DW01_inc_3_DW01_inc_15 ( SUM, \A[7] , \A[6] , \A[5] , 
        \A[4] , \A[3] , \A[2] , \A[1] , \A[0]  );
  output [9:0] SUM;
  input \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] ;

  wire   [7:0] A;
  wire   [8:2] carry;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign A[0] = \A[0] ;

  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX2 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKBUFX3 U1 ( .A(SUM[8]), .Y(SUM[9]) );
  CLKINVX1 U2 ( .A(carry[8]), .Y(SUM[8]) );
  CLKINVX1 U3 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Sobel_gradient_DW01_inc_2_DW01_inc_14 ( sobel1U79_Y, i_rst_n_INV, i_clk, 
        \A[8] , \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , 
        \SUM[9] , \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] , \SUM[3] , 
        \SUM[2] , \SUM[1]  );
  input sobel1U79_Y, i_rst_n_INV, i_clk, \A[8] , \A[7] , \A[6] , \A[5] ,
         \A[4] , \A[3] , \A[2] , \A[1] ;
  output \SUM[9] , \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] , \SUM[3] ,
         \SUM[2] , \SUM[1] ;
  wire   carry_9_, carry_8_, carry_7_, carry_6_, carry_5_, carry_4_, carry_3_,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18;
  wire   [8:1] A;
  wire   [9:1] SUM;
  assign A[8] = \A[8] ;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign \SUM[9]  = SUM[9];
  assign \SUM[8]  = SUM[8];
  assign \SUM[7]  = SUM[7];
  assign \SUM[6]  = SUM[6];
  assign \SUM[5]  = SUM[5];
  assign \SUM[4]  = SUM[4];
  assign \SUM[3]  = SUM[3];
  assign \SUM[2]  = SUM[2];
  assign \SUM[1]  = SUM[1];

  DFFSX1 i_clk_r_REG559_S12 ( .D(n10), .CK(i_clk), .SN(i_rst_n_INV), .Q(n18)
         );
  DFFSX1 i_clk_r_REG533_S12 ( .D(n9), .CK(i_clk), .SN(i_rst_n_INV), .Q(n17) );
  DFFSX1 i_clk_r_REG507_S12 ( .D(n8), .CK(i_clk), .SN(i_rst_n_INV), .Q(n16) );
  DFFSX1 i_clk_r_REG481_S12 ( .D(n7), .CK(i_clk), .SN(i_rst_n_INV), .Q(n15) );
  DFFSX1 i_clk_r_REG455_S12 ( .D(n6), .CK(i_clk), .SN(i_rst_n_INV), .Q(n14) );
  DFFSX1 i_clk_r_REG429_S12 ( .D(n5), .CK(i_clk), .SN(i_rst_n_INV), .Q(n13) );
  DFFSX1 i_clk_r_REG403_S12 ( .D(n4), .CK(i_clk), .SN(i_rst_n_INV), .Q(n12) );
  ADDHXL U1_1_3 ( .A(n13), .B(carry_3_), .CO(carry_4_), .S(SUM[3]) );
  ADDHX2 U1_1_2 ( .A(n12), .B(n11), .CO(carry_3_), .S(SUM[2]) );
  ADDHX1 U1_1_8 ( .A(n18), .B(carry_8_), .CO(carry_9_), .S(SUM[8]) );
  ADDHX2 U1_1_6 ( .A(n16), .B(carry_6_), .CO(carry_7_), .S(SUM[6]) );
  ADDHX2 U1_1_7 ( .A(n17), .B(carry_7_), .CO(carry_8_), .S(SUM[7]) );
  CMPR22X2 U1_1_4 ( .A(n14), .B(carry_4_), .CO(carry_5_), .S(SUM[4]) );
  ADDHX2 U1_1_5 ( .A(n15), .B(carry_5_), .CO(carry_6_), .S(SUM[5]) );
  DFFSX1 i_clk_r_REG377_S12 ( .D(n3), .CK(i_clk), .SN(i_rst_n_INV), .Q(n11), 
        .QN(SUM[1]) );
  MX2X1 U1 ( .A(n11), .B(A[1]), .S0(sobel1U79_Y), .Y(n3) );
  INVX1 U2 ( .A(carry_9_), .Y(SUM[9]) );
  CLKMX2X2 U3 ( .A(n12), .B(A[2]), .S0(sobel1U79_Y), .Y(n4) );
  CLKMX2X2 U4 ( .A(n13), .B(A[3]), .S0(sobel1U79_Y), .Y(n5) );
  CLKMX2X2 U5 ( .A(n14), .B(A[4]), .S0(sobel1U79_Y), .Y(n6) );
  CLKMX2X2 U6 ( .A(n15), .B(A[5]), .S0(sobel1U79_Y), .Y(n7) );
  CLKMX2X2 U7 ( .A(n16), .B(A[6]), .S0(sobel1U79_Y), .Y(n8) );
  CLKMX2X2 U8 ( .A(n17), .B(A[7]), .S0(sobel1U79_Y), .Y(n9) );
  CLKMX2X2 U9 ( .A(n18), .B(A[8]), .S0(sobel1U79_Y), .Y(n10) );
endmodule


module Sobel_gradient_DW01_inc_1_DW01_inc_13 ( SUM, \A[7] , \A[6] , \A[5] , 
        \A[4] , \A[3] , \A[2] , \A[1] , \A[0]  );
  output [9:0] SUM;
  input \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] ;

  wire   [7:0] A;
  wire   [8:2] carry;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign A[0] = \A[0] ;

  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX2 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX2 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CLKBUFX3 U1 ( .A(SUM[8]), .Y(SUM[9]) );
  CLKINVX1 U2 ( .A(carry[8]), .Y(SUM[8]) );
  CLKINVX1 U3 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Sobel_gradient_DW01_inc_0_DW01_inc_12 ( A, SUM, sobel1U120_Y, 
        i_rst_n_INV, i_clk );
  input [12:0] A;
  output [12:0] SUM;
  input sobel1U120_Y, i_rst_n_INV, i_clk;
  wire   n1, n2, n4, n5;
  wire   [12:2] carry;

  ADDHX4 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHX4 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX4 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHX4 U1_1_3 ( .A(A[3]), .B(n1), .CO(carry[4]), .S(SUM[3]) );
  ADDHX4 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX4 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX4 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX4 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX4 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  DFFRX4 i_clk_r_REG200_S6 ( .D(n4), .CK(i_clk), .RN(i_rst_n_INV), .Q(n5), 
        .QN(n2) );
  XOR2X2 U1 ( .A(carry[12]), .B(A[12]), .Y(SUM[12]) );
  XNOR2X2 U2 ( .A(A[2]), .B(n2), .Y(SUM[2]) );
  NOR2BX4 U3 ( .AN(A[2]), .B(n2), .Y(n1) );
  MX2XL U4 ( .A(n5), .B(carry[2]), .S0(sobel1U120_Y), .Y(n4) );
  CLKINVX1 U5 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Sobel_gradient_DW01_add_0_DW01_add_14 ( SUM, \A[12] , \A[11] , \A[10] , 
        \A[9] , \A[8] , \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , 
        \A[0] , \B[12] , \B[11] , \B[10] , \B[9] , \B[8] , \B[7] , \B[6] , 
        \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0]  );
  output [13:0] SUM;
  input \A[12] , \A[11] , \A[10] , \A[9] , \A[8] , \A[7] , \A[6] , \A[5] ,
         \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , \B[12] , \B[11] , \B[10] ,
         \B[9] , \B[8] , \B[7] , \B[6] , \B[5] , \B[4] , \B[3] , \B[2] ,
         \B[1] , \B[0] ;

  wire   [12:0] A;
  wire   [12:0] B;
  wire   [12:1] carry;
  assign A[12] = \A[12] ;
  assign A[11] = \A[11] ;
  assign A[10] = \A[10] ;
  assign A[9] = \A[9] ;
  assign A[8] = \A[8] ;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign A[0] = \A[0] ;
  assign B[12] = \B[12] ;
  assign B[11] = \B[11] ;
  assign B[10] = \B[10] ;
  assign B[9] = \B[9] ;
  assign B[8] = \B[8] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  ADDFHX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFHX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(SUM[13]), .S(
        SUM[12]) );
  ADDFHX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX1 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  AND2X4 U1 ( .A(A[0]), .B(B[0]), .Y(carry[1]) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module comparator ( a1, a2, a3, a4, smallest, sobel1U82_Y, i_rst_n_INV, i_clk
 );
  input [20:0] a1;
  input [20:0] a2;
  input [20:0] a3;
  input [20:0] a4;
  output [1:0] smallest;
  input sobel1U82_Y, i_rst_n_INV, i_clk;
  wire   N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N73, N74, N75, N76, N77, N78, N79,
         N80, N81, N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93,
         temp2_1_, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N159, N160, N161, N162, N163, N164, N165, N166, N167, N168, N169,
         N170, N171, N172, N173, N174, N175, N176, N177, N178, N179, comp3_3,
         N158, N157, N156, N155, N154, N153, N152, N151, N150, N149, N148,
         N147, N146, N145, N144, N143, N142, N141, N140, N139, N138, N99, N98,
         N97, N96, N95, N115, N114, N113, N112, N111, N110, N109, N108, N107,
         N106, N105, N104, N103, N102, N101, N100, N72, N71, N70, N69, N68,
         N67, N66, N65, N64, N63, N62, N61, N600, N580, N570, N560, N550, N540,
         N530, N9, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18,
         N17, N16, N15, N14, N13, N12, N11, N10, n1, n2, n3, n4, n5, n6, n7,
         n8, n940, n1010, n1110, n1210, n1370, n1410, n1510, n1610, n1710,
         n180, n190, n200, n210, n220, n230, n240, n250, n260, n270, n280,
         n290, n300, n310, n320, n330, n340, n350, n360, n370, n380, n390,
         n400, n410, n420, n430, n440, n450, n460, n470, n480, n610, n620,
         n630, n640, n650, n660, n670, n680, n690, n700, n710, n720, n730,
         n740, n750, n760, n770, n780, n790, n800, n810, n820, n830, n840,
         n850, n860, n870, n880, n890, n900, n910, n920, n930, n941, n950,
         n960, n970, n980, n990, n1000, n1011, n1020, n1030, n1040, n1050,
         n1060, n1070, n1080, n1090, n1100, n1111, n1120, n1130, n1140, n1150,
         n1160, n1170, n1180, n1190, n1200, n1211, n1220, n1230, n1240, n1250,
         n1260, n1270, n1280, n1290, n1300, n1310, n1320, n1330, n1340, n1350,
         n1360, n1371, n1380, n1390, n1400, n1411, n1420, n1430, n1440, n1450,
         n1460, n1470, n1480, n1490, n1500, n1511, n1520, n1560, n1570, n1580,
         n1590, n1600, n1611, n1620, n1630, n1640, n1650;
  wire   [11:0] temp3;
  wire   [14:0] temp4;
  wire   [3:1] comp1;
  wire   [3:2] comp2;

  comparator_DW01_inc_2_DW01_inc_21 add_0_root_add_2210_ni ( .A({N95, N96, N97, 
        N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, 
        N110, N111, N112, N113, N114, N115}), .SUM({N136, N135, N134, N133, 
        N132, N131, N130, N129, N128, N127, N126, N125, N124, N123, N122, N121, 
        N120, N119, N118, N117, N116}) );
  comparator_DW01_inc_0_DW01_inc_19 add_0_root_add_2208_ni ( .A({N9, N10, N11, 
        N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, 
        N26, N27, N28, N29}), .SUM({N50, N49, N48, N47, N46, N45, N44, N43, 
        N42, N41, N40, N39, N38, N37, N36, N35, N34, N33, N32, N31, N30}) );
  comparator_DW_cmp_10 gt_2220 ( .A({n440, n1120, n1210, n860, n1060, n1040, 
        n1050, n420, n1110, n800, n940, n870, n880, n1070, n1090, n1100, n1111, 
        n890, n1080, temp2_1_, n1010}), .B({n1130, n1240, n1170, n1150, n1211, 
        n1160, n1190, n1180, n1230, temp3[11], n1200, temp3[9], n1220, n1140, 
        n4, temp3[5], n3, n5, temp3[2:0]}), .GE_LT_GT_LE(comp2[2]) );
  comparator_DW_cmp_9 gt_2214 ( .A({n1000, n1510, n1410, n1370, n941, n910, 
        n980, n990, n930, n900, n970, n920, n960, n950, n1270, n1280, n1290, 
        n1260, n1250, n1300, n1310}), .B({n440, n1120, n1210, n860, n1060, 
        n1040, n1050, n420, n1110, n800, n940, n870, n880, n1070, n1090, n1100, 
        n1111, n890, n1080, temp2_1_, n1010}), .GE_LT_GT_LE(comp1[1]) );
  comparator_DW_cmp_11 gt_2215 ( .A({n1000, n1510, n1410, n1370, n941, n910, 
        n980, n990, n930, n900, n970, n920, n960, n950, n1270, n1280, n1290, 
        n1260, n1250, n1300, n1310}), .B({n1130, n1240, n1170, n1150, n1211, 
        n1160, n1190, n1180, n1230, temp3[11], n1200, temp3[9], n1220, n1140, 
        n4, temp3[5], n3, n5, temp3[2:0]}), .GE_LT_GT_LE(comp1[2]) );
  comparator_DW01_inc_7 add_0_root_add_2209_ni ( .A({n1650, N530, N540, N550, 
        N560, N570, N580, n1570, N600, N61, N62, N63, N64, N65, N66, N67, N68, 
        N69, N70, N71, N72}), .SUM({N93, N92, N91, N90, N89, N88, N87, N86, 
        N85, N84, N83, N82, N81, N80, N79, N78, N77, N76, N75, N74, N73}) );
  comparator_DW_cmp_14 gt_2216 ( .A({n1000, n1510, n1410, n1370, n941, n910, 
        n980, n990, n930, n900, n970, n920, n960, n950, n1270, n1280, n1290, 
        n1260, n1250, n1300, n1310}), .B({n1430, n1420, n1590, n1411, n1030, 
        n1600, n330, n690, n700, n480, n640, n400, n380, n1611, n470, n1560, 
        n290, n620, n730, n680, n770}), .GE_LT_GT_LE(comp1[3]), .sobel1U82_Y(
        sobel1U82_Y), .i_rst_n_INV(i_rst_n_INV), .i_clk(i_clk) );
  comparator_DW_cmp_12 gt_2226 ( .A({n1130, n1240, n1170, n1150, n1211, n1160, 
        n1190, n1180, n1230, temp3[11], n1200, temp3[9], n1220, n1140, n4, 
        temp3[5], n3, n5, temp3[2:0]}), .B({n1430, n250, n1590, n320, n1030, 
        n1600, n330, n690, n700, n480, n640, n400, n380, n1611, n470, n1560, 
        n290, n620, n730, n680, n770}), .GE_LT_GT_LE(comp3_3), .sobel1U82_Y(
        sobel1U82_Y), .i_rst_n_INV(i_rst_n_INV), .i_clk(i_clk) );
  comparator_DW_cmp_22 gt_2221 ( .A({n440, n1120, n1210, n860, n1060, n1040, 
        n1050, n420, n1110, n800, n940, n870, n880, n1070, n1090, n1100, n1111, 
        n890, n1080, temp2_1_, n1010}), .B({n1430, n250, n1590, n1580, n1030, 
        n1600, temp4[14], n690, n700, n480, n640, n1630, temp4[8], n340, n470, 
        n1560, temp4[4], n710, temp4[2:0]}), .GE_LT_GT_LE(comp2[3]), 
        .sobel1U82_Y(sobel1U82_Y), .i_rst_n_INV(i_rst_n_INV), .i_clk(i_clk) );
  comparator_DW01_inc_8 add_0_root_add_2211_ni ( .A({n2, N139, N140, N141, 
        N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152, N153, 
        N154, N155, N156, N157, N158}), .SUM({N179, N178, N177, N176, N175, 
        N174, N173, N172, N171, N170, N169, N168, N167, N166, N165, N164, N163, 
        N162, N161, N160, N159}) );
  DFFSX1 i_clk_r_REG215_S8 ( .D(n1460), .CK(i_clk), .SN(n1470), .Q(n1511) );
  DFFSX1 i_clk_r_REG204_S8 ( .D(n1450), .CK(i_clk), .SN(n1470), .Q(n1500), 
        .QN(n1610) );
  DFFSX1 i_clk_r_REG241_S7 ( .D(n1440), .CK(i_clk), .SN(n1470), .Q(n1490), 
        .QN(n1710) );
  DFFRX1 i_clk_r_REG216_S8 ( .D(n1480), .CK(i_clk), .RN(n1470), .Q(n1520), 
        .QN(n8) );
  CLKMX2X4 U8 ( .A(a1[12]), .B(N42), .S0(a1[20]), .Y(n930) );
  INVX6 U9 ( .A(n740), .Y(n750) );
  INVX3 U10 ( .A(a2[20]), .Y(n1650) );
  BUFX4 U11 ( .A(n240), .Y(n1) );
  BUFX16 U12 ( .A(n450), .Y(n240) );
  INVX16 U13 ( .A(n810), .Y(n410) );
  INVX6 U14 ( .A(n740), .Y(n2) );
  MX2X4 U15 ( .A(a2[9]), .B(N82), .S0(a2[20]), .Y(n870) );
  CLKMX2X2 U16 ( .A(a3[4]), .B(N120), .S0(n370), .Y(n3) );
  CLKMX2X2 U17 ( .A(a3[6]), .B(N122), .S0(n370), .Y(n4) );
  CLKMX2X2 U18 ( .A(a3[3]), .B(N119), .S0(n370), .Y(n5) );
  MX2X8 U19 ( .A(a1[15]), .B(N45), .S0(a1[20]), .Y(n910) );
  MX2X8 U27 ( .A(a3[19]), .B(N135), .S0(n370), .Y(n1240) );
  INVX4 U28 ( .A(a3[11]), .Y(N104) );
  NAND2X4 U29 ( .A(n460), .B(n190), .Y(n820) );
  INVXL U30 ( .A(N145), .Y(n6) );
  INVX3 U31 ( .A(N139), .Y(n7) );
  INVX4 U32 ( .A(a4[19]), .Y(N139) );
  NAND2X8 U33 ( .A(N179), .B(n1), .Y(n1380) );
  INVX3 U34 ( .A(a2[14]), .Y(N580) );
  CLKINVX6 U35 ( .A(a4[14]), .Y(N144) );
  INVX12 U36 ( .A(a4[18]), .Y(N140) );
  AND2X8 U37 ( .A(n720), .B(a4[17]), .Y(n1011) );
  CLKMX2X4 U38 ( .A(n1500), .B(comp1[1]), .S0(sobel1U82_Y), .Y(n1450) );
  INVX1 U39 ( .A(a2[3]), .Y(N69) );
  INVX16 U40 ( .A(n720), .Y(n450) );
  INVX8 U41 ( .A(a3[10]), .Y(N105) );
  CLKINVX8 U42 ( .A(a4[12]), .Y(N146) );
  CLKMX2X12 U43 ( .A(a2[7]), .B(N80), .S0(a2[20]), .Y(n1070) );
  INVX12 U44 ( .A(n780), .Y(n1560) );
  MX2X6 U45 ( .A(a1[14]), .B(N44), .S0(a1[20]), .Y(n980) );
  CLKMX2X8 U46 ( .A(a2[13]), .B(N86), .S0(a2[20]), .Y(n420) );
  INVX3 U47 ( .A(a4[3]), .Y(N155) );
  INVX3 U48 ( .A(a3[15]), .Y(N100) );
  CLKINVX1 U49 ( .A(N77), .Y(n300) );
  CLKINVX1 U50 ( .A(a4[8]), .Y(N150) );
  INVX3 U51 ( .A(a4[11]), .Y(N147) );
  MX2X1 U52 ( .A(a1[17]), .B(N47), .S0(a1[20]), .Y(n1370) );
  MX2X1 U53 ( .A(a1[18]), .B(N48), .S0(a1[20]), .Y(n1410) );
  MX2X1 U54 ( .A(a1[16]), .B(N46), .S0(a1[20]), .Y(n941) );
  INVX3 U55 ( .A(a2[11]), .Y(N61) );
  CLKINVX1 U56 ( .A(a2[1]), .Y(N71) );
  CLKINVX3 U57 ( .A(a2[10]), .Y(N62) );
  INVX3 U58 ( .A(a2[9]), .Y(N63) );
  INVX3 U59 ( .A(a4[2]), .Y(N156) );
  CLKINVX1 U60 ( .A(N166), .Y(n670) );
  CLKINVX1 U61 ( .A(a3[9]), .Y(N106) );
  INVX3 U62 ( .A(a3[13]), .Y(N102) );
  INVX3 U63 ( .A(a3[16]), .Y(N99) );
  INVX3 U64 ( .A(a2[8]), .Y(N64) );
  INVX3 U65 ( .A(a4[15]), .Y(N143) );
  CLKINVX1 U66 ( .A(a4[1]), .Y(N157) );
  CLKINVX1 U67 ( .A(N162), .Y(n630) );
  INVX16 U68 ( .A(a3[20]), .Y(N95) );
  CLKINVX1 U69 ( .A(a3[19]), .Y(N96) );
  MX2X6 U70 ( .A(a3[15]), .B(N131), .S0(a3[20]), .Y(n1160) );
  CLKMX2X2 U71 ( .A(a1[13]), .B(N43), .S0(a1[20]), .Y(n990) );
  BUFX16 U72 ( .A(n1620), .Y(n480) );
  CLKINVX1 U73 ( .A(N170), .Y(n650) );
  INVX3 U74 ( .A(N172), .Y(n660) );
  CLKINVX1 U75 ( .A(N171), .Y(n390) );
  CLKINVX1 U76 ( .A(N164), .Y(n790) );
  CLKMX2X2 U77 ( .A(a1[19]), .B(N49), .S0(a1[20]), .Y(n1510) );
  CLKMX2X12 U78 ( .A(a4[15]), .B(N174), .S0(a4[20]), .Y(n1600) );
  MX2X1 U79 ( .A(a1[9]), .B(N39), .S0(a1[20]), .Y(n920) );
  CLKMX2X8 U80 ( .A(a2[10]), .B(N83), .S0(a2[20]), .Y(n940) );
  CLKMX2X8 U81 ( .A(a2[0]), .B(N73), .S0(a2[20]), .Y(n1010) );
  CLKMX2X8 U82 ( .A(n200), .B(N85), .S0(a2[20]), .Y(n1110) );
  INVX3 U83 ( .A(a2[16]), .Y(N560) );
  INVX8 U84 ( .A(a4[17]), .Y(N141) );
  CLKMX2X12 U85 ( .A(a2[18]), .B(N91), .S0(a2[20]), .Y(n1210) );
  CLKMX2X12 U86 ( .A(N84), .B(a2[11]), .S0(n1650), .Y(n800) );
  CLKINVX1 U87 ( .A(N149), .Y(n180) );
  MX2X4 U88 ( .A(a2[17]), .B(N90), .S0(a2[20]), .Y(n860) );
  INVX3 U89 ( .A(a2[5]), .Y(N67) );
  CLKINVX6 U90 ( .A(a4[9]), .Y(N149) );
  CLKMX2X12 U91 ( .A(n350), .B(N124), .S0(a3[20]), .Y(n1220) );
  AND2X8 U92 ( .A(N136), .B(n370), .Y(n1130) );
  CLKMX2X8 U93 ( .A(a2[19]), .B(N92), .S0(a2[20]), .Y(n1120) );
  CLKMX2X8 U94 ( .A(a2[14]), .B(N87), .S0(a2[20]), .Y(n1050) );
  CLKINVX8 U95 ( .A(a4[13]), .Y(N145) );
  INVX1 U96 ( .A(n360), .Y(n190) );
  CLKMX2X6 U97 ( .A(a3[16]), .B(N132), .S0(n370), .Y(n1211) );
  INVXL U98 ( .A(N600), .Y(n200) );
  INVX6 U99 ( .A(a2[12]), .Y(N600) );
  CLKMX2X12 U100 ( .A(a2[15]), .B(N88), .S0(a2[20]), .Y(n1040) );
  INVX4 U101 ( .A(a3[17]), .Y(N98) );
  MX2X4 U102 ( .A(a2[8]), .B(N81), .S0(a2[20]), .Y(n880) );
  MX2X1 U103 ( .A(N71), .B(n260), .S0(a2[20]), .Y(n1320) );
  OAI2BB2X4 U104 ( .B0(N156), .B1(n740), .A0N(N161), .A1N(n740), .Y(temp4[2])
         );
  INVX20 U105 ( .A(n810), .Y(n360) );
  CLKINVX1 U106 ( .A(N74), .Y(n260) );
  INVX12 U107 ( .A(a4[16]), .Y(N142) );
  BUFX20 U108 ( .A(temp4[6]), .Y(n470) );
  AND2X6 U109 ( .A(N138), .B(n7), .Y(n1020) );
  INVX16 U110 ( .A(n210), .Y(n1590) );
  INVX12 U111 ( .A(n280), .Y(n290) );
  AOI2BB2X4 U112 ( .B0(N177), .B1(n450), .A0N(N140), .A1N(n360), .Y(n210) );
  CLKINVX4 U113 ( .A(a2[18]), .Y(N540) );
  INVX6 U114 ( .A(n1020), .Y(n460) );
  NAND2X8 U115 ( .A(n220), .B(n230), .Y(temp4[0]) );
  NAND2X4 U116 ( .A(N159), .B(n740), .Y(n220) );
  NAND2X2 U117 ( .A(n810), .B(a4[0]), .Y(n230) );
  BUFX12 U118 ( .A(temp4[8]), .Y(n380) );
  BUFX20 U119 ( .A(n1640), .Y(n250) );
  CLKMX2X8 U120 ( .A(a2[3]), .B(N76), .S0(a2[20]), .Y(n890) );
  OAI2BB2XL U121 ( .B0(N157), .B1(n1), .A0N(N160), .A1N(n1), .Y(n270) );
  CLKINVX8 U122 ( .A(temp4[4]), .Y(n280) );
  MXI2X4 U123 ( .A(n300), .B(N68), .S0(n310), .Y(n1111) );
  INVX2 U124 ( .A(a2[4]), .Y(N68) );
  BUFX6 U125 ( .A(n1650), .Y(n310) );
  AO21X4 U126 ( .A0(N176), .A1(n450), .B0(n1011), .Y(n320) );
  BUFX16 U127 ( .A(temp4[14]), .Y(n330) );
  NAND2X8 U128 ( .A(n850), .B(n840), .Y(n1030) );
  NAND2X2 U129 ( .A(n720), .B(a4[16]), .Y(n840) );
  BUFX12 U130 ( .A(temp4[12]), .Y(n700) );
  OAI2BB2X2 U131 ( .B0(n390), .B1(N138), .A0N(a4[12]), .A1N(n810), .Y(
        temp4[12]) );
  OAI2BB2X4 U132 ( .B0(n750), .B1(n670), .A0N(n720), .A1N(a4[7]), .Y(n1611) );
  OAI2BB2X4 U133 ( .B0(n670), .B1(n2), .A0N(a4[7]), .A1N(n720), .Y(n340) );
  OAI2BB1X4 U134 ( .A0N(N178), .A1N(n450), .B0(n460), .Y(n1640) );
  INVXL U135 ( .A(N107), .Y(n350) );
  CLKINVX20 U136 ( .A(a4[20]), .Y(n810) );
  OAI2BB2X4 U137 ( .B0(n450), .B1(N157), .A0N(N160), .A1N(n360), .Y(temp4[1])
         );
  OA22X4 U138 ( .A0(n240), .A1(n1011), .B0(N176), .B1(n1011), .Y(n1411) );
  CLKINVX20 U139 ( .A(N95), .Y(n370) );
  NAND2X2 U140 ( .A(n360), .B(N175), .Y(n850) );
  OR2X4 U141 ( .A(N178), .B(n1020), .Y(n830) );
  INVX16 U142 ( .A(a4[20]), .Y(N138) );
  AO22X4 U143 ( .A0(n360), .A1(N168), .B0(n810), .B1(n180), .Y(n400) );
  INVX8 U144 ( .A(a2[13]), .Y(n1570) );
  INVXL U145 ( .A(N144), .Y(n430) );
  NOR2BX4 U146 ( .AN(N93), .B(n310), .Y(n440) );
  INVX20 U147 ( .A(a4[20]), .Y(n720) );
  CLKMX2X6 U148 ( .A(a3[14]), .B(N130), .S0(n370), .Y(n1190) );
  CLKMX2X8 U149 ( .A(a2[2]), .B(N75), .S0(a2[20]), .Y(n1080) );
  INVX16 U150 ( .A(n1380), .Y(n1430) );
  INVXL U151 ( .A(n710), .Y(n610) );
  CLKINVX1 U152 ( .A(n610), .Y(n620) );
  OAI22X4 U153 ( .A0(N155), .A1(n740), .B0(n630), .B1(n720), .Y(n710) );
  BUFX20 U154 ( .A(temp4[10]), .Y(n640) );
  OAI2BB2X4 U155 ( .B0(n650), .B1(n720), .A0N(a4[11]), .A1N(n810), .Y(n1620)
         );
  CLKMX2X8 U156 ( .A(a2[16]), .B(N89), .S0(a2[20]), .Y(n1060) );
  INVX20 U157 ( .A(N138), .Y(n740) );
  OAI2BB2X4 U158 ( .B0(n660), .B1(n720), .A0N(n6), .A1N(n810), .Y(temp4[13])
         );
  INVX8 U159 ( .A(a3[14]), .Y(N101) );
  MX2X6 U160 ( .A(a3[17]), .B(N133), .S0(n370), .Y(n1150) );
  CLKBUFX2 U161 ( .A(n270), .Y(n680) );
  AND2X8 U162 ( .A(n820), .B(n830), .Y(n1420) );
  MX2X2 U163 ( .A(a2[5]), .B(N78), .S0(a2[20]), .Y(n1100) );
  CLKMX2X8 U164 ( .A(a2[6]), .B(N79), .S0(a2[20]), .Y(n1090) );
  CLKMX2X3 U165 ( .A(a3[12]), .B(N128), .S0(a3[20]), .Y(n1230) );
  CLKMX2X6 U166 ( .A(a3[10]), .B(N126), .S0(n370), .Y(n1200) );
  CLKMX2X6 U167 ( .A(a3[7]), .B(N123), .S0(n370), .Y(n1140) );
  INVX4 U168 ( .A(a4[10]), .Y(N148) );
  AO22X4 U169 ( .A0(N127), .A1(n370), .B0(a3[11]), .B1(N95), .Y(temp3[11]) );
  INVX3 U170 ( .A(a3[8]), .Y(N107) );
  MX2X6 U171 ( .A(a3[18]), .B(N134), .S0(n370), .Y(n1170) );
  BUFX16 U172 ( .A(temp4[13]), .Y(n690) );
  AO22X4 U173 ( .A0(n410), .A1(N163), .B0(n810), .B1(a4[4]), .Y(temp4[4]) );
  CLKINVX3 U174 ( .A(a4[0]), .Y(N158) );
  CLKBUFX2 U175 ( .A(temp4[2]), .Y(n730) );
  INVX3 U176 ( .A(n1320), .Y(temp2_1_) );
  INVXL U177 ( .A(temp4[0]), .Y(n760) );
  CLKINVX1 U178 ( .A(n760), .Y(n770) );
  AOI2BB2X4 U179 ( .B0(a4[5]), .B1(n720), .A0N(n810), .A1N(n790), .Y(n780) );
  AO22X4 U180 ( .A0(N125), .A1(n370), .B0(a3[9]), .B1(N95), .Y(temp3[9]) );
  INVX2 U181 ( .A(a2[17]), .Y(N550) );
  CLKINVX3 U182 ( .A(a2[19]), .Y(N530) );
  AO22X4 U183 ( .A0(n410), .A1(N165), .B0(a4[6]), .B1(n810), .Y(temp4[6]) );
  INVX6 U184 ( .A(a2[15]), .Y(N570) );
  MX2X6 U185 ( .A(a3[13]), .B(N129), .S0(a3[20]), .Y(n1180) );
  AO22X4 U186 ( .A0(n360), .A1(N173), .B0(n430), .B1(N138), .Y(temp4[14]) );
  AO22X4 U187 ( .A0(n1520), .A1(n1371), .B0(comp2[2]), .B1(sobel1U82_Y), .Y(
        n1480) );
  AO22X4 U188 ( .A0(n1371), .A1(n1511), .B0(comp2[2]), .B1(sobel1U82_Y), .Y(
        n1460) );
  INVX4 U189 ( .A(a3[18]), .Y(N97) );
  CLKINVX4 U190 ( .A(a3[7]), .Y(N108) );
  CLKINVX4 U191 ( .A(a4[7]), .Y(N151) );
  INVX1 U192 ( .A(a2[0]), .Y(N72) );
  CLKINVX3 U193 ( .A(a4[6]), .Y(N152) );
  INVXL U194 ( .A(a1[19]), .Y(N10) );
  INVXL U195 ( .A(a1[15]), .Y(N14) );
  MX2X1 U196 ( .A(a1[11]), .B(N41), .S0(a1[20]), .Y(n900) );
  MX2X1 U197 ( .A(a1[7]), .B(N37), .S0(a1[20]), .Y(n950) );
  MX2X1 U198 ( .A(a1[8]), .B(N38), .S0(a1[20]), .Y(n960) );
  MX2X1 U199 ( .A(a1[10]), .B(N40), .S0(a1[20]), .Y(n970) );
  NOR2BX1 U200 ( .AN(N50), .B(N9), .Y(n1000) );
  CLKINVX1 U201 ( .A(n1350), .Y(temp3[1]) );
  CLKINVX1 U202 ( .A(n1340), .Y(temp3[2]) );
  CLKINVX1 U203 ( .A(n1330), .Y(temp3[5]) );
  CLKINVX1 U204 ( .A(n1360), .Y(temp3[0]) );
  CLKINVX1 U205 ( .A(a2[7]), .Y(N65) );
  CLKINVX1 U206 ( .A(a4[4]), .Y(N154) );
  CLKINVX1 U207 ( .A(a4[5]), .Y(N153) );
  CLKINVX1 U208 ( .A(a3[12]), .Y(N103) );
  CLKINVX1 U209 ( .A(a2[2]), .Y(N70) );
  CLKINVX1 U210 ( .A(a2[6]), .Y(N66) );
  CLKINVX1 U211 ( .A(sobel1U82_Y), .Y(n1371) );
  INVXL U212 ( .A(a1[10]), .Y(N19) );
  INVXL U213 ( .A(a1[9]), .Y(N20) );
  INVXL U214 ( .A(a1[8]), .Y(N21) );
  INVXL U215 ( .A(a1[13]), .Y(N16) );
  INVXL U216 ( .A(a1[14]), .Y(N15) );
  INVXL U217 ( .A(a1[16]), .Y(N13) );
  INVXL U218 ( .A(a1[17]), .Y(N12) );
  INVXL U219 ( .A(a1[18]), .Y(N11) );
  INVXL U220 ( .A(a1[7]), .Y(N22) );
  INVXL U221 ( .A(a1[11]), .Y(N18) );
  INVXL U222 ( .A(a1[12]), .Y(N17) );
  OAI31X1 U223 ( .A0(comp2[3]), .A1(n1610), .A2(n1511), .B0(n1400), .Y(
        smallest[0]) );
  NAND3BX1 U224 ( .AN(n1390), .B(comp1[3]), .C(comp2[3]), .Y(n1400) );
  CLKINVX1 U225 ( .A(comp3_3), .Y(n1390) );
  OAI31X1 U226 ( .A0(comp3_3), .A1(n8), .A2(n1710), .B0(n1400), .Y(smallest[1]) );
  MXI2XL U227 ( .A(a3[0]), .B(N116), .S0(n370), .Y(n1360) );
  MXI2XL U228 ( .A(a3[1]), .B(N117), .S0(n370), .Y(n1350) );
  MXI2XL U229 ( .A(a3[2]), .B(N118), .S0(n370), .Y(n1340) );
  MXI2XL U230 ( .A(a3[5]), .B(N121), .S0(n370), .Y(n1330) );
  CLKMX2X2 U231 ( .A(a1[2]), .B(N32), .S0(a1[20]), .Y(n1250) );
  CLKMX2X2 U232 ( .A(a1[3]), .B(N33), .S0(a1[20]), .Y(n1260) );
  CLKMX2X2 U233 ( .A(a1[6]), .B(N36), .S0(a1[20]), .Y(n1270) );
  CLKMX2X2 U234 ( .A(a1[5]), .B(N35), .S0(a1[20]), .Y(n1280) );
  CLKMX2X2 U235 ( .A(a1[4]), .B(N34), .S0(a1[20]), .Y(n1290) );
  CLKMX2X2 U236 ( .A(a1[1]), .B(N31), .S0(a1[20]), .Y(n1300) );
  CLKINVX1 U237 ( .A(a1[20]), .Y(N9) );
  CLKMX2X2 U238 ( .A(a1[0]), .B(N30), .S0(a1[20]), .Y(n1310) );
  CLKINVX1 U239 ( .A(a3[3]), .Y(N112) );
  CLKINVX1 U240 ( .A(a1[3]), .Y(N26) );
  CLKINVX1 U241 ( .A(a3[4]), .Y(N111) );
  CLKINVX1 U242 ( .A(a1[4]), .Y(N25) );
  CLKINVX1 U243 ( .A(a3[5]), .Y(N110) );
  CLKINVX1 U244 ( .A(a1[5]), .Y(N24) );
  CLKINVX1 U245 ( .A(a3[6]), .Y(N109) );
  CLKINVX1 U246 ( .A(a1[6]), .Y(N23) );
  CLKINVX1 U247 ( .A(a3[2]), .Y(N113) );
  CLKINVX1 U248 ( .A(a1[2]), .Y(N27) );
  CLKINVX1 U249 ( .A(a3[0]), .Y(N115) );
  CLKINVX1 U250 ( .A(a1[0]), .Y(N29) );
  CLKINVX1 U251 ( .A(a3[1]), .Y(N114) );
  CLKINVX1 U252 ( .A(a1[1]), .Y(N28) );
  AO21X4 U253 ( .A0(n240), .A1(N176), .B0(n1011), .Y(n1580) );
  AO22X4 U254 ( .A0(n410), .A1(N169), .B0(n720), .B1(a4[10]), .Y(temp4[10]) );
  AO22X4 U255 ( .A0(n360), .A1(N168), .B0(n180), .B1(n720), .Y(n1630) );
  AO22X4 U256 ( .A0(n360), .A1(N167), .B0(a4[8]), .B1(n720), .Y(temp4[8]) );
  CLKMX2X2 U257 ( .A(n1490), .B(comp1[2]), .S0(sobel1U82_Y), .Y(n1440) );
  CLKINVX1 U258 ( .A(i_rst_n_INV), .Y(n1470) );
endmodule


module comparator_DW01_inc_8 ( A, SUM );
  input [20:0] A;
  output [20:0] SUM;
  wire   n1, n7, n10, n11, n16, n17, n18, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n34, n35, n36, n39, n40, n41, n42, n43, n44, n45,
         n93, n94, n95, n96, n97, n98;

  ADDHX4 U63 ( .A(n40), .B(A[7]), .CO(n39), .S(SUM[7]) );
  CMPR22X2 U64 ( .A(A[3]), .B(n44), .CO(n43), .S(SUM[3]) );
  NAND2X1 U65 ( .A(n94), .B(n95), .Y(SUM[9]) );
  INVX4 U66 ( .A(A[9]), .Y(n35) );
  NAND2X2 U67 ( .A(n35), .B(n93), .Y(n94) );
  NAND2XL U68 ( .A(A[9]), .B(n36), .Y(n95) );
  INVXL U69 ( .A(n36), .Y(n93) );
  NAND2X6 U70 ( .A(A[8]), .B(n39), .Y(n36) );
  XOR2X4 U71 ( .A(A[15]), .B(n21), .Y(SUM[15]) );
  CLKINVX8 U72 ( .A(n29), .Y(n28) );
  INVX3 U73 ( .A(A[14]), .Y(n22) );
  XOR2X1 U74 ( .A(n30), .B(n31), .Y(SUM[11]) );
  CLKAND2X3 U75 ( .A(n10), .B(n97), .Y(n98) );
  CMPR22X2 U76 ( .A(A[6]), .B(n41), .CO(n40), .S(SUM[6]) );
  NAND2X8 U77 ( .A(n21), .B(A[15]), .Y(n18) );
  CLKINVX6 U78 ( .A(A[11]), .Y(n30) );
  INVX6 U79 ( .A(n18), .Y(n17) );
  INVX2 U80 ( .A(A[20]), .Y(n1) );
  NOR2X8 U81 ( .A(n23), .B(n22), .Y(n21) );
  NOR2X8 U82 ( .A(n25), .B(n27), .Y(n24) );
  INVX12 U83 ( .A(A[13]), .Y(n25) );
  INVX12 U84 ( .A(A[12]), .Y(n27) );
  CLKAND2X3 U85 ( .A(A[18]), .B(A[19]), .Y(n97) );
  NAND2X6 U86 ( .A(A[16]), .B(n17), .Y(n96) );
  CMPR22X4 U87 ( .A(n45), .B(A[2]), .CO(n44), .S(SUM[2]) );
  NAND2X6 U88 ( .A(A[18]), .B(n10), .Y(n7) );
  XNOR2X4 U89 ( .A(n96), .B(A[17]), .Y(SUM[17]) );
  ADDHX2 U90 ( .A(n42), .B(A[5]), .CO(n41), .S(SUM[5]) );
  ADDHX2 U91 ( .A(n43), .B(A[4]), .CO(n42), .S(SUM[4]) );
  XOR2X1 U92 ( .A(n22), .B(n23), .Y(SUM[14]) );
  NAND2X8 U93 ( .A(A[17]), .B(A[16]), .Y(n11) );
  INVX3 U94 ( .A(A[16]), .Y(n16) );
  XOR2X4 U95 ( .A(A[18]), .B(n10), .Y(SUM[18]) );
  NOR2X8 U96 ( .A(n30), .B(n31), .Y(n29) );
  XOR2X4 U97 ( .A(n27), .B(n28), .Y(SUM[12]) );
  NOR2X4 U98 ( .A(n27), .B(n28), .Y(n26) );
  NAND2X6 U99 ( .A(A[10]), .B(n34), .Y(n31) );
  XNOR2X4 U100 ( .A(n98), .B(n1), .Y(SUM[20]) );
  NOR2X8 U101 ( .A(n11), .B(n18), .Y(n10) );
  XNOR2X4 U102 ( .A(n16), .B(n17), .Y(SUM[16]) );
  XNOR2X2 U103 ( .A(n25), .B(n26), .Y(SUM[13]) );
  NAND2X6 U104 ( .A(n24), .B(n29), .Y(n23) );
  XNOR2X4 U105 ( .A(n7), .B(A[19]), .Y(SUM[19]) );
  ADDHX2 U106 ( .A(A[0]), .B(A[1]), .CO(n45), .S(SUM[1]) );
  NOR2X4 U107 ( .A(n35), .B(n36), .Y(n34) );
  XOR2XL U108 ( .A(A[8]), .B(n39), .Y(SUM[8]) );
  XOR2XL U109 ( .A(A[10]), .B(n34), .Y(SUM[10]) );
  CLKINVX1 U110 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module comparator_DW_cmp_22 ( A, B, GE_LT_GT_LE, sobel1U82_Y, i_rst_n_INV, 
        i_clk );
  input [20:0] A;
  input [20:0] B;
  input sobel1U82_Y, i_rst_n_INV, i_clk;
  output GE_LT_GT_LE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n34, n35, n44, n45, n46,
         n47, n56, n57, n66, n67, n68, n69, n70, n79, n80, n89, n90, n91, n100,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n874, n875, n876, n877, n878, n879, n880, n881, n882, n883,
         n884, n885, n886, n887, n888, n889, n890, n891, n892, n893, n894,
         n895, n896, n897, n898, n899, n900, n901, n902, n903, n904, n905,
         n906, n907, n908, n909, n910, n911, n912, n913, n914, n915, n916,
         n917, n918;

  DFFRX2 i_clk_r_REG225_S8 ( .D(n912), .CK(i_clk), .RN(n914), .Q(n916) );
  DFFSX4 i_clk_r_REG217_S8 ( .D(n913), .CK(i_clk), .SN(n914), .Q(n917) );
  DFFRX2 i_clk_r_REG218_S8 ( .D(n915), .CK(i_clk), .RN(n914), .Q(n918) );
  NAND2X4 U494 ( .A(n916), .B(n894), .Y(n877) );
  AOI21XL U495 ( .A0(n916), .A1(n918), .B0(n917), .Y(GE_LT_GT_LE) );
  NOR2X6 U496 ( .A(n897), .B(n8), .Y(n6) );
  CLKINVX1 U497 ( .A(A[20]), .Y(n128) );
  OR2X4 U498 ( .A(B[8]), .B(n116), .Y(n893) );
  CLKAND2X3 U499 ( .A(B[9]), .B(n117), .Y(n904) );
  CLKINVX1 U500 ( .A(A[3]), .Y(n111) );
  CLKMX2X4 U501 ( .A(n2), .B(n917), .S0(n874), .Y(n913) );
  CLKINVX20 U502 ( .A(sobel1U82_Y), .Y(n874) );
  OR2X6 U503 ( .A(B[9]), .B(n117), .Y(n903) );
  AND2X6 U504 ( .A(B[5]), .B(n113), .Y(n890) );
  OR2X8 U505 ( .A(B[10]), .B(n118), .Y(n881) );
  NAND2X4 U506 ( .A(n903), .B(n893), .Y(n56) );
  NAND2X8 U507 ( .A(n883), .B(n911), .Y(n90) );
  NAND2X4 U508 ( .A(n44), .B(n22), .Y(n20) );
  CLKAND2X12 U509 ( .A(B[6]), .B(n114), .Y(n892) );
  CLKAND2X2 U510 ( .A(B[7]), .B(n115), .Y(n878) );
  NAND2X6 U511 ( .A(B[16]), .B(n124), .Y(n18) );
  NOR2X2 U512 ( .A(B[16]), .B(n124), .Y(n17) );
  OR2X8 U513 ( .A(B[6]), .B(n114), .Y(n884) );
  NAND2X6 U514 ( .A(n876), .B(n877), .Y(n912) );
  AND2X6 U515 ( .A(B[4]), .B(n112), .Y(n896) );
  CLKAND2X3 U516 ( .A(B[14]), .B(n122), .Y(n902) );
  NAND2X6 U517 ( .A(n19), .B(n875), .Y(n876) );
  CLKINVX1 U518 ( .A(n894), .Y(n875) );
  INVX3 U519 ( .A(sobel1U82_Y), .Y(n894) );
  NAND2X6 U520 ( .A(n106), .B(n107), .Y(n886) );
  INVX1 U521 ( .A(A[7]), .Y(n115) );
  OR2X6 U522 ( .A(B[13]), .B(n121), .Y(n900) );
  NOR2X6 U523 ( .A(B[20]), .B(n128), .Y(n3) );
  CLKINVX1 U524 ( .A(A[0]), .Y(n108) );
  CLKINVX1 U525 ( .A(A[13]), .Y(n121) );
  CLKINVX1 U526 ( .A(A[10]), .Y(n118) );
  INVX1 U527 ( .A(A[1]), .Y(n109) );
  CLKINVX1 U528 ( .A(A[17]), .Y(n125) );
  CLKINVX1 U529 ( .A(A[18]), .Y(n126) );
  CLKINVX1 U530 ( .A(A[12]), .Y(n120) );
  CLKAND2X3 U531 ( .A(B[15]), .B(n123), .Y(n879) );
  NAND2X4 U532 ( .A(B[18]), .B(n126), .Y(n12) );
  NAND2X2 U533 ( .A(B[19]), .B(n127), .Y(n10) );
  NOR2X8 U534 ( .A(B[19]), .B(n127), .Y(n9) );
  NAND2X8 U535 ( .A(n881), .B(n908), .Y(n46) );
  AND2X4 U536 ( .A(B[8]), .B(n116), .Y(n899) );
  AND2X8 U537 ( .A(B[12]), .B(n120), .Y(n909) );
  NAND2X6 U538 ( .A(n882), .B(n900), .Y(n34) );
  CLKINVX4 U539 ( .A(A[19]), .Y(n127) );
  OR2X8 U540 ( .A(B[5]), .B(n113), .Y(n910) );
  CLKINVX1 U541 ( .A(A[5]), .Y(n113) );
  OR2X8 U542 ( .A(B[11]), .B(n891), .Y(n908) );
  OR2X4 U543 ( .A(B[4]), .B(n112), .Y(n898) );
  NAND2X2 U544 ( .A(n898), .B(n910), .Y(n79) );
  AND2X6 U545 ( .A(n110), .B(B[2]), .Y(n880) );
  OR2X8 U546 ( .A(B[15]), .B(n123), .Y(n907) );
  CLKAND2X12 U547 ( .A(B[10]), .B(n118), .Y(n901) );
  INVX1 U548 ( .A(A[9]), .Y(n117) );
  OR2X6 U549 ( .A(B[12]), .B(n120), .Y(n882) );
  OR2X6 U550 ( .A(B[2]), .B(n110), .Y(n883) );
  AND2X2 U551 ( .A(B[3]), .B(n111), .Y(n895) );
  NOR2X8 U552 ( .A(B[0]), .B(n108), .Y(n106) );
  OR2X6 U553 ( .A(B[1]), .B(n109), .Y(n887) );
  AND2X6 U554 ( .A(B[1]), .B(n109), .Y(n888) );
  NAND2X8 U555 ( .A(n884), .B(n905), .Y(n69) );
  NOR2X4 U556 ( .A(n79), .B(n69), .Y(n67) );
  NOR2X8 U557 ( .A(n24), .B(n34), .Y(n22) );
  NAND2X6 U558 ( .A(n885), .B(n907), .Y(n24) );
  OR2X4 U559 ( .A(B[14]), .B(n122), .Y(n885) );
  OAI21X4 U560 ( .A0(n46), .A1(n57), .B0(n47), .Y(n45) );
  AND2X4 U561 ( .A(B[11]), .B(n891), .Y(n889) );
  OAI21X4 U562 ( .A0(n35), .A1(n24), .B0(n25), .Y(n23) );
  AND2X4 U563 ( .A(B[13]), .B(n121), .Y(n906) );
  AOI21X4 U564 ( .A0(n887), .A1(n886), .B0(n888), .Y(n100) );
  AOI21X4 U565 ( .A0(n902), .A1(n907), .B0(n879), .Y(n25) );
  NOR2X4 U566 ( .A(n46), .B(n56), .Y(n44) );
  NOR2X6 U567 ( .A(B[18]), .B(n126), .Y(n11) );
  NAND2X4 U568 ( .A(B[20]), .B(n128), .Y(n4) );
  OAI21X4 U569 ( .A0(n6), .A1(n3), .B0(n4), .Y(n2) );
  NOR2X6 U570 ( .A(n5), .B(n3), .Y(n1) );
  NAND2X6 U571 ( .A(B[0]), .B(n108), .Y(n107) );
  NOR2X6 U572 ( .A(B[17]), .B(n125), .Y(n15) );
  INVX1 U573 ( .A(A[16]), .Y(n124) );
  OAI21X4 U574 ( .A0(n80), .A1(n69), .B0(n70), .Y(n68) );
  AOI21X4 U575 ( .A0(n903), .A1(n899), .B0(n904), .Y(n57) );
  AOI21X4 U576 ( .A0(n901), .A1(n908), .B0(n889), .Y(n47) );
  OAI21X4 U577 ( .A0(n15), .A1(n18), .B0(n16), .Y(n14) );
  NAND2X2 U578 ( .A(B[17]), .B(n125), .Y(n16) );
  AOI21X4 U579 ( .A0(n900), .A1(n909), .B0(n906), .Y(n35) );
  NOR2X8 U580 ( .A(n9), .B(n11), .Y(n7) );
  OR2X6 U581 ( .A(B[7]), .B(n115), .Y(n905) );
  CLKMX2X6 U582 ( .A(n918), .B(n1), .S0(sobel1U82_Y), .Y(n915) );
  NAND2X4 U583 ( .A(n7), .B(n13), .Y(n5) );
  AOI21X4 U584 ( .A0(n45), .A1(n22), .B0(n23), .Y(n21) );
  BUFX6 U585 ( .A(n119), .Y(n891) );
  NOR2X2 U586 ( .A(n15), .B(n17), .Y(n13) );
  AOI21X4 U587 ( .A0(n910), .A1(n896), .B0(n890), .Y(n80) );
  AND2X8 U588 ( .A(n14), .B(n7), .Y(n897) );
  OAI21X4 U589 ( .A0(n12), .A1(n9), .B0(n10), .Y(n8) );
  INVX1 U590 ( .A(A[14]), .Y(n122) );
  INVX1 U591 ( .A(A[15]), .Y(n123) );
  OR2X6 U592 ( .A(B[3]), .B(n111), .Y(n911) );
  INVX1 U593 ( .A(A[4]), .Y(n112) );
  AOI21X4 U594 ( .A0(n911), .A1(n880), .B0(n895), .Y(n91) );
  INVX1 U595 ( .A(A[6]), .Y(n114) );
  OAI21X4 U596 ( .A0(n66), .A1(n20), .B0(n21), .Y(n19) );
  AOI21X4 U597 ( .A0(n67), .A1(n89), .B0(n68), .Y(n66) );
  OAI21X4 U598 ( .A0(n100), .A1(n90), .B0(n91), .Y(n89) );
  AOI21X4 U599 ( .A0(n892), .A1(n905), .B0(n878), .Y(n70) );
  INVX1 U600 ( .A(A[11]), .Y(n119) );
  CLKINVX1 U601 ( .A(A[2]), .Y(n110) );
  CLKINVX1 U602 ( .A(A[8]), .Y(n116) );
  CLKINVX1 U603 ( .A(i_rst_n_INV), .Y(n914) );
endmodule


module comparator_DW_cmp_12 ( A, B, GE_LT_GT_LE, sobel1U82_Y, i_rst_n_INV, 
        i_clk );
  input [20:0] A;
  input [20:0] B;
  input sobel1U82_Y, i_rst_n_INV, i_clk;
  output GE_LT_GT_LE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n22, n23, n24, n25, n34, n35, n42, n44, n45, n46, n47,
         n56, n57, n61, n65, n67, n68, n69, n70, n77, n79, n80, n87, n89, n90,
         n91, n98, n100, n103, n104, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n123, n124,
         n125, n126, n127, n128, n874, n875, n876, n877, n878, n879, n880,
         n881, n882, n883, n884, n885, n886, n887, n888, n889, n890, n891,
         n892, n893, n894, n895, n896, n897, n898, n899, n900, n901, n902,
         n903, n904, n905, n906, n907, n908, n909, n910, n911, n912, n913,
         n914, n915, n916;

  DFFRX1 i_clk_r_REG222_S8 ( .D(n911), .CK(i_clk), .RN(n910), .Q(n916) );
  DFFSX4 i_clk_r_REG223_S8 ( .D(n906), .CK(i_clk), .SN(n910), .Q(n912), .QN(
        n892) );
  DFFSX4 i_clk_r_REG226_S8 ( .D(n907), .CK(i_clk), .SN(n910), .Q(n913) );
  DFFRX2 i_clk_r_REG227_S8 ( .D(n909), .CK(i_clk), .RN(n910), .Q(n915), .QN(
        n885) );
  DFFSX2 i_clk_r_REG221_S8 ( .D(n908), .CK(i_clk), .SN(n910), .Q(n914) );
  NAND2BX2 U494 ( .AN(n42), .B(n894), .Y(n34) );
  NOR2BX1 U495 ( .AN(B[15]), .B(A[15]), .Y(n888) );
  OR2X4 U496 ( .A(B[15]), .B(n123), .Y(n895) );
  NOR2X6 U497 ( .A(B[20]), .B(n128), .Y(n3) );
  INVX4 U498 ( .A(B[14]), .Y(n880) );
  INVX8 U499 ( .A(n897), .Y(n893) );
  CLKAND2X3 U500 ( .A(B[5]), .B(n113), .Y(n903) );
  CLKINVX1 U501 ( .A(A[10]), .Y(n118) );
  CLKAND2X3 U502 ( .A(B[12]), .B(n120), .Y(n874) );
  CLKMX2X4 U503 ( .A(n914), .B(n2), .S0(sobel1U82_Y), .Y(n908) );
  NAND2X1 U504 ( .A(n117), .B(B[9]), .Y(n61) );
  AND2X4 U505 ( .A(B[10]), .B(n118), .Y(n889) );
  CLKAND2X2 U506 ( .A(B[7]), .B(n115), .Y(n879) );
  INVX1 U507 ( .A(A[9]), .Y(n117) );
  INVXL U508 ( .A(A[13]), .Y(n121) );
  CLKINVX1 U509 ( .A(A[15]), .Y(n123) );
  OR2X4 U510 ( .A(B[13]), .B(n121), .Y(n894) );
  CLKINVX1 U511 ( .A(A[5]), .Y(n113) );
  CLKINVX4 U512 ( .A(A[19]), .Y(n127) );
  INVX1 U513 ( .A(A[17]), .Y(n125) );
  INVX1 U514 ( .A(A[16]), .Y(n124) );
  CLKINVX1 U515 ( .A(A[18]), .Y(n126) );
  CLKINVX1 U516 ( .A(sobel1U82_Y), .Y(n883) );
  CLKINVX1 U517 ( .A(sobel1U82_Y), .Y(n887) );
  CLKINVX1 U518 ( .A(sobel1U82_Y), .Y(n890) );
  AND2X2 U519 ( .A(B[3]), .B(n111), .Y(n875) );
  CLKAND2X3 U520 ( .A(B[11]), .B(n119), .Y(n876) );
  AND2X2 U521 ( .A(B[13]), .B(n121), .Y(n877) );
  AND2X2 U522 ( .A(B[2]), .B(n110), .Y(n878) );
  NAND2X4 U523 ( .A(B[8]), .B(n116), .Y(n65) );
  NAND2X4 U524 ( .A(B[16]), .B(n124), .Y(n18) );
  OA21X4 U525 ( .A0(n65), .A1(n893), .B0(n61), .Y(n57) );
  OAI2BB1X4 U526 ( .A0N(A[14]), .A1N(n880), .B0(n895), .Y(n24) );
  CLKAND2X12 U527 ( .A(B[4]), .B(n112), .Y(n901) );
  CLKAND2X12 U528 ( .A(B[6]), .B(n114), .Y(n902) );
  NOR2X6 U529 ( .A(n34), .B(n24), .Y(n22) );
  NOR2BX4 U530 ( .AN(B[14]), .B(A[14]), .Y(n881) );
  OR2XL U531 ( .A(B[5]), .B(n113), .Y(n904) );
  NAND2BX2 U532 ( .AN(B[10]), .B(A[10]), .Y(n882) );
  NOR2X8 U533 ( .A(n126), .B(B[18]), .Y(n11) );
  NOR2X8 U534 ( .A(B[19]), .B(n127), .Y(n9) );
  NAND2X4 U535 ( .A(n126), .B(B[18]), .Y(n12) );
  NOR2X6 U536 ( .A(B[17]), .B(n125), .Y(n15) );
  NAND2X6 U537 ( .A(n882), .B(n896), .Y(n46) );
  NOR2X8 U538 ( .A(n11), .B(n9), .Y(n7) );
  AOI21X4 U539 ( .A0(n899), .A1(n902), .B0(n879), .Y(n70) );
  MXI2X4 U540 ( .A(n886), .B(n885), .S0(n883), .Y(n909) );
  NOR2X4 U541 ( .A(n15), .B(n17), .Y(n13) );
  NAND2BX4 U542 ( .AN(B[7]), .B(A[7]), .Y(n899) );
  INVX1 U543 ( .A(A[7]), .Y(n115) );
  CLKMX2X4 U544 ( .A(n884), .B(n913), .S0(n887), .Y(n907) );
  CLKAND2X12 U545 ( .A(n22), .B(n44), .Y(n886) );
  NOR2X2 U546 ( .A(B[16]), .B(n124), .Y(n17) );
  NAND2X2 U547 ( .A(B[20]), .B(n128), .Y(n4) );
  AOI21X4 U548 ( .A0(n896), .A1(n889), .B0(n876), .Y(n47) );
  AOI21X4 U549 ( .A0(n45), .A1(n22), .B0(n23), .Y(n884) );
  OR2X4 U550 ( .A(B[8]), .B(n116), .Y(n898) );
  NAND2X2 U551 ( .A(B[17]), .B(n125), .Y(n16) );
  OAI21X4 U552 ( .A0(n15), .A1(n18), .B0(n16), .Y(n14) );
  OAI21X4 U553 ( .A0(n12), .A1(n9), .B0(n10), .Y(n8) );
  AOI21X4 U554 ( .A0(n874), .A1(n894), .B0(n877), .Y(n35) );
  NAND2X2 U555 ( .A(B[19]), .B(n127), .Y(n10) );
  OR2X8 U556 ( .A(B[11]), .B(n119), .Y(n896) );
  AOI21X4 U557 ( .A0(n904), .A1(n901), .B0(n903), .Y(n80) );
  MXI2X4 U558 ( .A(n891), .B(n892), .S0(n890), .Y(n906) );
  AO21X4 U559 ( .A0(n89), .A1(n67), .B0(n68), .Y(n891) );
  NAND2BXL U560 ( .AN(n87), .B(n904), .Y(n79) );
  NOR2X6 U561 ( .A(n5), .B(n3), .Y(n1) );
  OAI21X4 U562 ( .A0(n57), .A1(n46), .B0(n47), .Y(n45) );
  CLKMX2X6 U563 ( .A(n916), .B(n1), .S0(sobel1U82_Y), .Y(n911) );
  NOR2X2 U564 ( .A(B[12]), .B(n120), .Y(n42) );
  OAI21X4 U565 ( .A0(n35), .A1(n24), .B0(n25), .Y(n23) );
  NOR2X2 U566 ( .A(n46), .B(n56), .Y(n44) );
  NAND2X2 U567 ( .A(n898), .B(n897), .Y(n56) );
  OAI21X2 U568 ( .A0(n100), .A1(n90), .B0(n91), .Y(n89) );
  OAI21X4 U569 ( .A0(n6), .A1(n3), .B0(n4), .Y(n2) );
  NAND2X4 U570 ( .A(n7), .B(n13), .Y(n5) );
  AOI21X4 U571 ( .A0(n7), .A1(n14), .B0(n8), .Y(n6) );
  AOI21X4 U572 ( .A0(n881), .A1(n895), .B0(n888), .Y(n25) );
  OR2X8 U573 ( .A(B[9]), .B(n117), .Y(n897) );
  NOR2X2 U574 ( .A(n79), .B(n69), .Y(n67) );
  OAI21X2 U575 ( .A0(n80), .A1(n69), .B0(n70), .Y(n68) );
  NOR2XL U576 ( .A(B[6]), .B(n114), .Y(n77) );
  OA21XL U577 ( .A0(n900), .A1(n103), .B0(n104), .Y(n100) );
  AND2X2 U578 ( .A(n106), .B(n107), .Y(n900) );
  NAND2BX2 U579 ( .AN(n77), .B(n899), .Y(n69) );
  CLKINVX1 U580 ( .A(A[8]), .Y(n116) );
  CLKINVX1 U581 ( .A(A[11]), .Y(n119) );
  CLKINVX1 U582 ( .A(A[20]), .Y(n128) );
  CLKINVX1 U583 ( .A(A[12]), .Y(n120) );
  OR2XL U584 ( .A(B[3]), .B(n111), .Y(n905) );
  AOI21X1 U585 ( .A0(n905), .A1(n878), .B0(n875), .Y(n91) );
  NOR2XL U586 ( .A(B[1]), .B(n109), .Y(n103) );
  NAND2XL U587 ( .A(B[1]), .B(n109), .Y(n104) );
  NOR2XL U588 ( .A(n112), .B(B[4]), .Y(n87) );
  NAND2BX1 U589 ( .AN(n98), .B(n905), .Y(n90) );
  CLKINVX1 U590 ( .A(A[6]), .Y(n114) );
  CLKINVX1 U591 ( .A(A[4]), .Y(n112) );
  CLKINVX1 U592 ( .A(A[1]), .Y(n109) );
  CLKINVX1 U593 ( .A(A[0]), .Y(n108) );
  CLKINVX1 U594 ( .A(A[3]), .Y(n111) );
  CLKINVX1 U595 ( .A(A[2]), .Y(n110) );
  AOI21X1 U596 ( .A0(n19), .A1(n916), .B0(n914), .Y(GE_LT_GT_LE) );
  OAI21XL U597 ( .A0(n912), .A1(n915), .B0(n913), .Y(n19) );
  CLKINVX1 U598 ( .A(i_rst_n_INV), .Y(n910) );
  NOR2XL U599 ( .A(B[2]), .B(n110), .Y(n98) );
  NAND2XL U600 ( .A(B[0]), .B(n108), .Y(n107) );
  NOR2XL U601 ( .A(B[0]), .B(n108), .Y(n106) );
endmodule


module comparator_DW_cmp_14 ( A, B, GE_LT_GT_LE, sobel1U82_Y, i_rst_n_INV, 
        i_clk );
  input [20:0] A;
  input [20:0] B;
  input sobel1U82_Y, i_rst_n_INV, i_clk;
  output GE_LT_GT_LE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n34, n35, n42, n44, n45,
         n46, n47, n54, n56, n57, n65, n67, n68, n69, n70, n77, n79, n80, n87,
         n89, n90, n91, n98, n100, n103, n104, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n874, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n884, n885, n886, n887, n888,
         n889, n890, n891, n892, n893, n894, n895, n896, n897, n898, n899,
         n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, n910,
         n911, n912, n913, n914, n915;

  DFFSX4 i_clk_r_REG219_S8 ( .D(n905), .CK(i_clk), .SN(n909), .Q(n911) );
  DFFSX4 i_clk_r_REG224_S8 ( .D(n906), .CK(i_clk), .SN(n909), .Q(n912), .QN(
        n886) );
  DFFRX2 i_clk_r_REG220_S8 ( .D(n910), .CK(i_clk), .RN(n909), .Q(n915) );
  DFFSX4 i_clk_r_REG228_S8 ( .D(n907), .CK(i_clk), .SN(n909), .Q(n913) );
  DFFRX2 i_clk_r_REG229_S8 ( .D(n908), .CK(i_clk), .RN(n909), .Q(n914) );
  CLKAND2X2 U494 ( .A(B[15]), .B(n123), .Y(n891) );
  OR2X4 U495 ( .A(B[15]), .B(n123), .Y(n897) );
  OR2X6 U496 ( .A(B[9]), .B(n117), .Y(n898) );
  CLKAND2X4 U497 ( .A(B[12]), .B(n120), .Y(n876) );
  AND2X4 U498 ( .A(B[10]), .B(n118), .Y(n889) );
  NAND2BX1 U499 ( .AN(A[9]), .B(B[9]), .Y(n883) );
  NOR2X8 U500 ( .A(B[19]), .B(n127), .Y(n9) );
  INVX6 U501 ( .A(A[17]), .Y(n125) );
  MX2X4 U502 ( .A(n21), .B(n913), .S0(n880), .Y(n907) );
  NOR2X4 U503 ( .A(n79), .B(n69), .Y(n67) );
  NAND2BX2 U504 ( .AN(n87), .B(n903), .Y(n79) );
  INVX20 U505 ( .A(sobel1U82_Y), .Y(n880) );
  CLKAND2X8 U506 ( .A(B[6]), .B(n114), .Y(n896) );
  CLKAND2X3 U507 ( .A(B[5]), .B(n113), .Y(n901) );
  INVX3 U508 ( .A(A[15]), .Y(n123) );
  INVX3 U509 ( .A(n882), .Y(n878) );
  OR2XL U510 ( .A(B[5]), .B(n113), .Y(n903) );
  CLKAND2X2 U511 ( .A(B[7]), .B(n115), .Y(n875) );
  OR2X8 U512 ( .A(B[7]), .B(n115), .Y(n900) );
  AOI21X4 U513 ( .A0(n895), .A1(n903), .B0(n901), .Y(n80) );
  INVX4 U514 ( .A(A[18]), .Y(n126) );
  INVX4 U515 ( .A(A[19]), .Y(n127) );
  NOR2X1 U516 ( .A(B[20]), .B(n128), .Y(n3) );
  CLKINVX1 U517 ( .A(sobel1U82_Y), .Y(n884) );
  AND2X2 U518 ( .A(B[3]), .B(n111), .Y(n874) );
  AND2X2 U519 ( .A(B[2]), .B(n110), .Y(n877) );
  NAND2X6 U520 ( .A(n7), .B(n13), .Y(n5) );
  NOR2X4 U521 ( .A(n15), .B(n17), .Y(n13) );
  NOR2X4 U522 ( .A(n46), .B(n56), .Y(n44) );
  NAND2X4 U523 ( .A(B[8]), .B(n116), .Y(n65) );
  CLKMX2X4 U524 ( .A(n2), .B(n911), .S0(n880), .Y(n905) );
  NAND2X4 U525 ( .A(B[18]), .B(n126), .Y(n12) );
  NAND2X2 U526 ( .A(B[16]), .B(n124), .Y(n18) );
  INVX8 U527 ( .A(A[16]), .Y(n124) );
  CLKINVX8 U528 ( .A(n898), .Y(n882) );
  NOR2X8 U529 ( .A(n34), .B(n24), .Y(n22) );
  NAND2X8 U530 ( .A(n888), .B(n897), .Y(n24) );
  CLKAND2X8 U531 ( .A(B[14]), .B(n122), .Y(n879) );
  AOI21X4 U532 ( .A0(n899), .A1(n889), .B0(n890), .Y(n47) );
  NOR2X4 U533 ( .A(B[10]), .B(n118), .Y(n54) );
  AOI21X4 U534 ( .A0(n894), .A1(n876), .B0(n892), .Y(n35) );
  NOR2X4 U535 ( .A(B[19]), .B(n127), .Y(n881) );
  NAND2X6 U536 ( .A(n22), .B(n44), .Y(n20) );
  AOI21X4 U537 ( .A0(n896), .A1(n900), .B0(n875), .Y(n70) );
  AOI21X4 U538 ( .A0(n897), .A1(n879), .B0(n891), .Y(n25) );
  NOR2X8 U539 ( .A(n881), .B(n11), .Y(n7) );
  NOR2X4 U540 ( .A(B[18]), .B(n126), .Y(n11) );
  OR2X6 U541 ( .A(B[14]), .B(n122), .Y(n888) );
  OA21X4 U542 ( .A0(n882), .A1(n65), .B0(n883), .Y(n57) );
  CLKAND2X8 U543 ( .A(B[4]), .B(n112), .Y(n895) );
  OR2X6 U544 ( .A(B[11]), .B(n119), .Y(n899) );
  OR2X4 U545 ( .A(B[8]), .B(n116), .Y(n902) );
  INVX4 U546 ( .A(A[14]), .Y(n122) );
  NAND2X6 U547 ( .A(n887), .B(n10), .Y(n8) );
  NAND2X4 U548 ( .A(B[20]), .B(n128), .Y(n4) );
  NOR2BX2 U549 ( .AN(B[11]), .B(A[11]), .Y(n890) );
  NAND2X6 U550 ( .A(n902), .B(n878), .Y(n56) );
  OAI21X4 U551 ( .A0(n35), .A1(n24), .B0(n25), .Y(n23) );
  OAI21X4 U552 ( .A0(n15), .A1(n18), .B0(n16), .Y(n14) );
  NAND2X2 U553 ( .A(B[19]), .B(n127), .Y(n10) );
  CLKMX2X4 U554 ( .A(n914), .B(n20), .S0(sobel1U82_Y), .Y(n908) );
  OAI21X4 U555 ( .A0(n57), .A1(n46), .B0(n47), .Y(n45) );
  OR2X8 U556 ( .A(n9), .B(n12), .Y(n887) );
  CLKMX2X4 U557 ( .A(n915), .B(n1), .S0(sobel1U82_Y), .Y(n910) );
  MXI2X4 U558 ( .A(n885), .B(n886), .S0(n884), .Y(n906) );
  AO21X4 U559 ( .A0(n89), .A1(n67), .B0(n68), .Y(n885) );
  OR2X4 U560 ( .A(B[13]), .B(n121), .Y(n894) );
  NOR2X6 U561 ( .A(B[17]), .B(n125), .Y(n15) );
  NOR2X2 U562 ( .A(B[16]), .B(n124), .Y(n17) );
  NAND2X2 U563 ( .A(B[17]), .B(n125), .Y(n16) );
  NOR2X2 U564 ( .A(B[12]), .B(n120), .Y(n42) );
  NOR2BX2 U565 ( .AN(B[13]), .B(A[13]), .Y(n892) );
  NAND2BX4 U566 ( .AN(n42), .B(n894), .Y(n34) );
  NAND2BX4 U567 ( .AN(n54), .B(n899), .Y(n46) );
  INVX2 U568 ( .A(A[11]), .Y(n119) );
  NOR2X6 U569 ( .A(n5), .B(n3), .Y(n1) );
  INVX2 U570 ( .A(A[13]), .Y(n121) );
  OAI21X4 U571 ( .A0(n6), .A1(n3), .B0(n4), .Y(n2) );
  OAI21X2 U572 ( .A0(n100), .A1(n90), .B0(n91), .Y(n89) );
  AOI21X4 U573 ( .A0(n45), .A1(n22), .B0(n23), .Y(n21) );
  OAI21X2 U574 ( .A0(n80), .A1(n69), .B0(n70), .Y(n68) );
  AOI21X4 U575 ( .A0(n7), .A1(n14), .B0(n8), .Y(n6) );
  NOR2XL U576 ( .A(B[6]), .B(n114), .Y(n77) );
  OA21XL U577 ( .A0(n893), .A1(n103), .B0(n104), .Y(n100) );
  AND2X2 U578 ( .A(n106), .B(n107), .Y(n893) );
  NAND2BX2 U579 ( .AN(n77), .B(n900), .Y(n69) );
  OR2XL U580 ( .A(B[3]), .B(n111), .Y(n904) );
  AOI21X1 U581 ( .A0(n904), .A1(n877), .B0(n874), .Y(n91) );
  NOR2XL U582 ( .A(B[1]), .B(n109), .Y(n103) );
  NAND2XL U583 ( .A(B[1]), .B(n109), .Y(n104) );
  NOR2XL U584 ( .A(B[4]), .B(n112), .Y(n87) );
  NAND2BX1 U585 ( .AN(n98), .B(n904), .Y(n90) );
  CLKINVX1 U586 ( .A(A[10]), .Y(n118) );
  CLKINVX1 U587 ( .A(A[9]), .Y(n117) );
  CLKINVX1 U588 ( .A(A[8]), .Y(n116) );
  CLKINVX1 U589 ( .A(A[12]), .Y(n120) );
  CLKINVX1 U590 ( .A(A[7]), .Y(n115) );
  CLKINVX1 U591 ( .A(A[6]), .Y(n114) );
  CLKINVX1 U592 ( .A(A[4]), .Y(n112) );
  CLKINVX1 U593 ( .A(A[1]), .Y(n109) );
  CLKINVX1 U594 ( .A(A[5]), .Y(n113) );
  CLKINVX1 U595 ( .A(A[20]), .Y(n128) );
  CLKINVX1 U596 ( .A(A[3]), .Y(n111) );
  CLKINVX1 U597 ( .A(A[2]), .Y(n110) );
  CLKINVX1 U598 ( .A(A[0]), .Y(n108) );
  AOI21X1 U599 ( .A0(n19), .A1(n915), .B0(n911), .Y(GE_LT_GT_LE) );
  OAI21XL U600 ( .A0(n912), .A1(n914), .B0(n913), .Y(n19) );
  CLKINVX1 U601 ( .A(i_rst_n_INV), .Y(n909) );
  NOR2XL U602 ( .A(B[2]), .B(n110), .Y(n98) );
  NAND2XL U603 ( .A(B[0]), .B(n108), .Y(n107) );
  NOR2XL U604 ( .A(B[0]), .B(n108), .Y(n106) );
endmodule


module comparator_DW01_inc_7 ( A, SUM );
  input [20:0] A;
  output [20:0] SUM;
  wire   n1, n4, n5, n8, n9, n12, n13, n16, n17, n20, n21, n24, n25, n26, n28,
         n29, n31, n32, n34, n35, n37, n38, n40, n41, n42, n43, n44, n45, n46,
         n47, n88, n89;

  ADDHX4 U57 ( .A(n46), .B(A[3]), .CO(n45), .S(SUM[3]) );
  AND2X8 U58 ( .A(n38), .B(n40), .Y(n37) );
  XOR2X1 U59 ( .A(A[9]), .B(n40), .Y(SUM[9]) );
  MXI2XL U60 ( .A(n21), .B(n20), .S0(n40), .Y(SUM[10]) );
  ADDHX4 U61 ( .A(n45), .B(A[4]), .CO(n44), .S(SUM[4]) );
  MXI2X2 U62 ( .A(n13), .B(n12), .S0(n34), .Y(SUM[14]) );
  AND2X2 U63 ( .A(A[9]), .B(A[10]), .Y(n38) );
  AND2X4 U64 ( .A(A[16]), .B(A[15]), .Y(n29) );
  ADDHX4 U65 ( .A(A[5]), .B(n44), .CO(n43), .S(SUM[5]) );
  CMPR22X2 U66 ( .A(n47), .B(A[2]), .CO(n46), .S(SUM[2]) );
  ADDHX1 U67 ( .A(A[0]), .B(A[1]), .CO(n47), .S(SUM[1]) );
  ADDHX4 U68 ( .A(n42), .B(A[7]), .CO(n41), .S(SUM[7]) );
  ADDHX4 U69 ( .A(n43), .B(A[6]), .CO(n42), .S(SUM[6]) );
  MXI2X2 U70 ( .A(n17), .B(n16), .S0(n37), .Y(SUM[12]) );
  MXI2X2 U71 ( .A(n9), .B(n8), .S0(n31), .Y(SUM[16]) );
  XNOR2X4 U72 ( .A(A[16]), .B(A[15]), .Y(n8) );
  XNOR2X1 U73 ( .A(A[14]), .B(A[13]), .Y(n12) );
  AND2X1 U74 ( .A(A[14]), .B(A[13]), .Y(n32) );
  XNOR2X1 U75 ( .A(A[12]), .B(A[11]), .Y(n16) );
  MXI2X2 U76 ( .A(n89), .B(n1), .S0(n25), .Y(SUM[20]) );
  INVX4 U77 ( .A(n89), .Y(n88) );
  AND2X8 U78 ( .A(n29), .B(n31), .Y(n28) );
  CLKAND2X12 U79 ( .A(n26), .B(n28), .Y(n25) );
  INVX1 U80 ( .A(A[16]), .Y(n9) );
  ADDHX4 U81 ( .A(n41), .B(A[8]), .CO(n40), .S(SUM[8]) );
  AND2X8 U82 ( .A(n35), .B(n37), .Y(n34) );
  AND2X6 U83 ( .A(A[12]), .B(A[11]), .Y(n35) );
  XOR2X4 U84 ( .A(n31), .B(A[15]), .Y(SUM[15]) );
  XOR2X1 U85 ( .A(n34), .B(A[13]), .Y(SUM[13]) );
  XOR2X4 U86 ( .A(n88), .B(n24), .Y(n1) );
  XOR2X4 U87 ( .A(n28), .B(A[17]), .Y(SUM[17]) );
  AND2X8 U88 ( .A(n32), .B(n34), .Y(n31) );
  MXI2X4 U89 ( .A(n5), .B(n4), .S0(n28), .Y(SUM[18]) );
  XOR2X4 U90 ( .A(n25), .B(A[19]), .Y(SUM[19]) );
  AND2X2 U91 ( .A(A[18]), .B(A[17]), .Y(n26) );
  XNOR2X2 U92 ( .A(A[18]), .B(A[17]), .Y(n4) );
  INVXL U93 ( .A(A[14]), .Y(n13) );
  XOR2XL U94 ( .A(n37), .B(A[11]), .Y(SUM[11]) );
  INVXL U95 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U96 ( .A(A[19]), .Y(n24) );
  XNOR2XL U97 ( .A(A[9]), .B(A[10]), .Y(n20) );
  INVX3 U98 ( .A(A[20]), .Y(n89) );
  INVXL U99 ( .A(A[10]), .Y(n21) );
  INVX1 U100 ( .A(A[12]), .Y(n17) );
  CLKINVX1 U101 ( .A(A[18]), .Y(n5) );
endmodule


module comparator_DW_cmp_11 ( A, B, GE_LT_GT_LE );
  input [20:0] A;
  input [20:0] B;
  output GE_LT_GT_LE;
  wire   n1, n2, n3, n4, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n56, n57, n58, n61, n62, n64, n65, n66,
         n69, n70, n72, n73, n74, n77, n78, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n820, n821, n822, n823, n824, n825;

  NAND2X4 U421 ( .A(n9), .B(n825), .Y(n3) );
  OR2X8 U422 ( .A(B[20]), .B(n102), .Y(n825) );
  NOR2X4 U423 ( .A(B[9]), .B(n91), .Y(n47) );
  CLKINVX1 U424 ( .A(A[15]), .Y(n97) );
  NAND2XL U425 ( .A(B[14]), .B(n96), .Y(n28) );
  NOR2X1 U426 ( .A(B[15]), .B(n97), .Y(n25) );
  OAI21X1 U427 ( .A0(n19), .A1(n22), .B0(n20), .Y(n18) );
  NOR2X1 U428 ( .A(B[16]), .B(n98), .Y(n21) );
  NAND2X1 U429 ( .A(B[10]), .B(n92), .Y(n43) );
  NOR2X1 U430 ( .A(n49), .B(n47), .Y(n45) );
  OA21XL U431 ( .A0(n58), .A1(n56), .B0(n57), .Y(n820) );
  NAND2X1 U432 ( .A(B[15]), .B(n97), .Y(n26) );
  NAND2X2 U433 ( .A(B[19]), .B(n101), .Y(n12) );
  NOR2X8 U434 ( .A(B[19]), .B(n101), .Y(n11) );
  AOI21X4 U435 ( .A0(n24), .A1(n17), .B0(n18), .Y(n16) );
  OAI21X1 U436 ( .A0(n25), .A1(n28), .B0(n26), .Y(n24) );
  NOR2X4 U437 ( .A(n3), .B(n15), .Y(n1) );
  AOI21X4 U438 ( .A0(n1), .A1(n29), .B0(n2), .Y(GE_LT_GT_LE) );
  OAI21X4 U439 ( .A0(n3), .A1(n16), .B0(n4), .Y(n2) );
  OAI21X2 U440 ( .A0(n44), .A1(n30), .B0(n31), .Y(n29) );
  NAND2X1 U441 ( .A(n32), .B(n38), .Y(n30) );
  NAND2X2 U442 ( .A(n23), .B(n17), .Y(n15) );
  NOR2X1 U443 ( .A(n27), .B(n25), .Y(n23) );
  NOR2X2 U444 ( .A(n19), .B(n21), .Y(n17) );
  NOR2X1 U445 ( .A(B[8]), .B(n90), .Y(n49) );
  NOR2X2 U446 ( .A(B[10]), .B(n92), .Y(n42) );
  OAI21X1 U447 ( .A0(n40), .A1(n43), .B0(n41), .Y(n39) );
  NAND2X1 U448 ( .A(B[11]), .B(n93), .Y(n41) );
  NOR2X2 U449 ( .A(n11), .B(n13), .Y(n9) );
  NOR2X1 U450 ( .A(B[18]), .B(n100), .Y(n13) );
  NOR2X4 U451 ( .A(B[13]), .B(n95), .Y(n34) );
  NOR2X4 U452 ( .A(B[11]), .B(n93), .Y(n40) );
  NOR2X4 U453 ( .A(B[17]), .B(n99), .Y(n19) );
  AOI21X4 U454 ( .A0(n10), .A1(n825), .B0(n821), .Y(n4) );
  OAI21X2 U455 ( .A0(n11), .A1(n14), .B0(n12), .Y(n10) );
  OAI21X2 U456 ( .A0(n52), .A1(n820), .B0(n53), .Y(n51) );
  OAI21X1 U457 ( .A0(n47), .A1(n50), .B0(n48), .Y(n46) );
  NAND2XL U458 ( .A(B[17]), .B(n99), .Y(n20) );
  NAND2XL U459 ( .A(B[16]), .B(n98), .Y(n22) );
  AOI21X2 U460 ( .A0(n51), .A1(n45), .B0(n46), .Y(n44) );
  NAND2XL U461 ( .A(B[13]), .B(n95), .Y(n35) );
  NOR2XL U462 ( .A(B[14]), .B(n96), .Y(n27) );
  NOR2X1 U463 ( .A(n36), .B(n34), .Y(n32) );
  NAND2XL U464 ( .A(B[9]), .B(n91), .Y(n48) );
  NAND2XL U465 ( .A(B[7]), .B(n89), .Y(n53) );
  INVX1 U466 ( .A(A[19]), .Y(n101) );
  AND2X2 U467 ( .A(B[20]), .B(n102), .Y(n821) );
  AOI21X1 U468 ( .A0(n39), .A1(n32), .B0(n33), .Y(n31) );
  OAI21XL U469 ( .A0(n34), .A1(n37), .B0(n35), .Y(n33) );
  NOR2X1 U470 ( .A(B[12]), .B(n94), .Y(n36) );
  NAND2X1 U471 ( .A(B[18]), .B(n100), .Y(n14) );
  NOR2X1 U472 ( .A(B[7]), .B(n89), .Y(n52) );
  NOR2XL U473 ( .A(n42), .B(n40), .Y(n38) );
  NAND2X1 U474 ( .A(B[8]), .B(n90), .Y(n50) );
  NAND2X1 U475 ( .A(B[12]), .B(n94), .Y(n37) );
  OA21XL U476 ( .A0(n822), .A1(n77), .B0(n78), .Y(n74) );
  AND2X2 U477 ( .A(n80), .B(n81), .Y(n822) );
  OA21XL U478 ( .A0(n823), .A1(n69), .B0(n70), .Y(n66) );
  OA21XL U479 ( .A0(n74), .A1(n72), .B0(n73), .Y(n823) );
  OA21XL U480 ( .A0(n824), .A1(n61), .B0(n62), .Y(n58) );
  OA21XL U481 ( .A0(n66), .A1(n64), .B0(n65), .Y(n824) );
  CLKINVX1 U482 ( .A(A[17]), .Y(n99) );
  CLKINVX1 U483 ( .A(A[18]), .Y(n100) );
  CLKINVX1 U484 ( .A(A[11]), .Y(n93) );
  CLKINVX1 U485 ( .A(A[9]), .Y(n91) );
  CLKINVX1 U486 ( .A(A[10]), .Y(n92) );
  CLKINVX1 U487 ( .A(A[13]), .Y(n95) );
  CLKINVX1 U488 ( .A(A[8]), .Y(n90) );
  CLKINVX1 U489 ( .A(A[12]), .Y(n94) );
  CLKINVX1 U490 ( .A(A[16]), .Y(n98) );
  CLKINVX1 U491 ( .A(A[14]), .Y(n96) );
  CLKINVX1 U492 ( .A(A[7]), .Y(n89) );
  CLKINVX1 U493 ( .A(A[1]), .Y(n83) );
  CLKINVX1 U494 ( .A(A[2]), .Y(n84) );
  CLKINVX1 U495 ( .A(A[3]), .Y(n85) );
  CLKINVX1 U496 ( .A(A[4]), .Y(n86) );
  CLKINVX1 U497 ( .A(A[5]), .Y(n87) );
  CLKINVX1 U498 ( .A(A[6]), .Y(n88) );
  CLKINVX1 U499 ( .A(A[20]), .Y(n102) );
  CLKINVX1 U500 ( .A(A[0]), .Y(n82) );
  NOR2X1 U501 ( .A(n82), .B(B[0]), .Y(n80) );
  NOR2X1 U502 ( .A(n84), .B(B[2]), .Y(n72) );
  NOR2X1 U503 ( .A(n86), .B(B[4]), .Y(n64) );
  NOR2X1 U504 ( .A(n83), .B(B[1]), .Y(n77) );
  NOR2X1 U505 ( .A(n85), .B(B[3]), .Y(n69) );
  NOR2X1 U506 ( .A(n87), .B(B[5]), .Y(n61) );
  NAND2X1 U507 ( .A(n82), .B(B[0]), .Y(n81) );
  NAND2X1 U508 ( .A(n83), .B(B[1]), .Y(n78) );
  NAND2X1 U509 ( .A(n85), .B(B[3]), .Y(n70) );
  NAND2X1 U510 ( .A(n87), .B(B[5]), .Y(n62) );
  NAND2X1 U511 ( .A(n84), .B(B[2]), .Y(n73) );
  NAND2X1 U512 ( .A(n86), .B(B[4]), .Y(n65) );
  NAND2X1 U513 ( .A(n88), .B(B[6]), .Y(n57) );
  NOR2X1 U514 ( .A(n88), .B(B[6]), .Y(n56) );
endmodule


module comparator_DW_cmp_9 ( A, B, GE_LT_GT_LE );
  input [20:0] A;
  input [20:0] B;
  output GE_LT_GT_LE;
  wire   n1, n2, n7, n8, n9, n10, n11, n12, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n154, n155, n156, n157, n158, n159,
         n160;

  NOR2X2 U106 ( .A(n92), .B(A[12]), .Y(n38) );
  AOI21X2 U107 ( .A0(n64), .A1(n57), .B0(n58), .Y(n56) );
  OAI21X1 U108 ( .A0(n59), .A1(n62), .B0(n60), .Y(n58) );
  OAI21X1 U109 ( .A0(n65), .A1(n68), .B0(n66), .Y(n64) );
  OAI21X2 U110 ( .A0(n69), .A1(n55), .B0(n56), .Y(n54) );
  INVX8 U111 ( .A(B[7]), .Y(n87) );
  AOI21X4 U112 ( .A0(n54), .A1(n24), .B0(n25), .Y(n23) );
  NAND2X1 U113 ( .A(n95), .B(A[15]), .Y(n31) );
  NAND2X1 U114 ( .A(n94), .B(A[14]), .Y(n33) );
  INVX4 U115 ( .A(B[11]), .Y(n91) );
  INVX3 U116 ( .A(B[10]), .Y(n90) );
  NOR2X4 U117 ( .A(n99), .B(A[19]), .Y(n9) );
  AOI21X1 U118 ( .A0(n70), .A1(n76), .B0(n71), .Y(n69) );
  INVX3 U119 ( .A(B[13]), .Y(n93) );
  NOR2X4 U120 ( .A(n95), .B(A[15]), .Y(n30) );
  NOR2X1 U121 ( .A(n87), .B(A[7]), .Y(n59) );
  INVX3 U122 ( .A(B[9]), .Y(n89) );
  CLKINVX1 U123 ( .A(B[12]), .Y(n92) );
  NAND2X1 U124 ( .A(n90), .B(A[10]), .Y(n47) );
  NOR2X1 U125 ( .A(n61), .B(n59), .Y(n57) );
  NAND2X4 U126 ( .A(n96), .B(A[16]), .Y(n22) );
  AND2X4 U127 ( .A(n98), .B(A[18]), .Y(n154) );
  CLKAND2X4 U128 ( .A(n100), .B(A[20]), .Y(n155) );
  NAND2XL U129 ( .A(n86), .B(A[6]), .Y(n62) );
  OR2X4 U130 ( .A(n98), .B(A[18]), .Y(n160) );
  NOR2X6 U131 ( .A(n93), .B(A[13]), .Y(n36) );
  AOI21X4 U132 ( .A0(n42), .A1(n49), .B0(n43), .Y(n41) );
  NOR2X6 U133 ( .A(n46), .B(n44), .Y(n42) );
  NOR2X6 U134 ( .A(n97), .B(A[17]), .Y(n19) );
  NAND2X2 U135 ( .A(n97), .B(A[17]), .Y(n20) );
  OAI21X4 U136 ( .A0(n44), .A1(n47), .B0(n45), .Y(n43) );
  NAND2X6 U137 ( .A(n34), .B(n28), .Y(n26) );
  INVX4 U138 ( .A(B[19]), .Y(n99) );
  INVX3 U139 ( .A(n157), .Y(n156) );
  CLKINVX8 U140 ( .A(n30), .Y(n157) );
  INVXL U141 ( .A(B[4]), .Y(n84) );
  INVXL U142 ( .A(B[5]), .Y(n85) );
  INVX4 U143 ( .A(B[8]), .Y(n88) );
  INVXL U144 ( .A(B[6]), .Y(n86) );
  AND2X8 U145 ( .A(n157), .B(n158), .Y(n28) );
  OR2X2 U146 ( .A(n94), .B(A[14]), .Y(n158) );
  OAI21X4 U147 ( .A0(n19), .A1(n22), .B0(n20), .Y(n18) );
  NAND2X1 U148 ( .A(n91), .B(A[11]), .Y(n45) );
  NAND2X2 U149 ( .A(n93), .B(A[13]), .Y(n37) );
  NAND2X2 U150 ( .A(n92), .B(A[12]), .Y(n39) );
  NOR2X1 U151 ( .A(n50), .B(n52), .Y(n48) );
  INVX2 U152 ( .A(B[16]), .Y(n96) );
  NAND2X4 U153 ( .A(n17), .B(n160), .Y(n11) );
  NOR2X4 U154 ( .A(n19), .B(n21), .Y(n17) );
  NAND2X4 U155 ( .A(n7), .B(n159), .Y(n1) );
  OR2X8 U156 ( .A(n100), .B(A[20]), .Y(n159) );
  NAND2X2 U157 ( .A(n99), .B(A[19]), .Y(n10) );
  AOI21X4 U158 ( .A0(n35), .A1(n28), .B0(n29), .Y(n27) );
  OAI21X1 U159 ( .A0(n50), .A1(n53), .B0(n51), .Y(n49) );
  NOR2X1 U160 ( .A(n96), .B(A[16]), .Y(n21) );
  OAI21X4 U161 ( .A0(n12), .A1(n9), .B0(n10), .Y(n8) );
  OAI21X2 U162 ( .A0(n41), .A1(n26), .B0(n27), .Y(n25) );
  AOI21X4 U163 ( .A0(n8), .A1(n159), .B0(n155), .Y(n2) );
  INVX2 U164 ( .A(B[14]), .Y(n94) );
  INVXL U165 ( .A(B[3]), .Y(n83) );
  OAI21X2 U166 ( .A0(n36), .A1(n39), .B0(n37), .Y(n35) );
  OAI21X2 U167 ( .A0(n156), .A1(n33), .B0(n31), .Y(n29) );
  INVX2 U168 ( .A(B[15]), .Y(n95) );
  NOR2X2 U169 ( .A(n40), .B(n26), .Y(n24) );
  NAND2X2 U170 ( .A(n42), .B(n48), .Y(n40) );
  INVX4 U171 ( .A(B[18]), .Y(n98) );
  AOI21X4 U172 ( .A0(n18), .A1(n160), .B0(n154), .Y(n12) );
  NOR2X4 U173 ( .A(n91), .B(A[11]), .Y(n44) );
  INVX4 U174 ( .A(B[20]), .Y(n100) );
  NOR2X4 U175 ( .A(n36), .B(n38), .Y(n34) );
  OAI21X4 U176 ( .A0(n23), .A1(n1), .B0(n2), .Y(GE_LT_GT_LE) );
  NOR2X4 U177 ( .A(n11), .B(n9), .Y(n7) );
  INVX2 U178 ( .A(B[17]), .Y(n97) );
  NOR2X2 U179 ( .A(n89), .B(A[9]), .Y(n50) );
  NOR2X1 U180 ( .A(n90), .B(A[10]), .Y(n46) );
  NAND2XL U181 ( .A(n89), .B(A[9]), .Y(n51) );
  NAND2XL U182 ( .A(n88), .B(A[8]), .Y(n53) );
  CLKINVX1 U183 ( .A(B[2]), .Y(n82) );
  NAND2X1 U184 ( .A(n57), .B(n63), .Y(n55) );
  INVXL U185 ( .A(B[1]), .Y(n81) );
  INVXL U186 ( .A(B[0]), .Y(n80) );
  NOR2XL U187 ( .A(n88), .B(A[8]), .Y(n52) );
  NAND2XL U188 ( .A(n87), .B(A[7]), .Y(n60) );
  NAND2X1 U189 ( .A(n85), .B(A[5]), .Y(n66) );
  NAND2X1 U190 ( .A(n84), .B(A[4]), .Y(n68) );
  OAI21XL U191 ( .A0(n77), .A1(n79), .B0(n78), .Y(n76) );
  NAND2X1 U192 ( .A(n80), .B(A[0]), .Y(n79) );
  NAND2X1 U193 ( .A(n81), .B(A[1]), .Y(n78) );
  NOR2X1 U194 ( .A(n81), .B(A[1]), .Y(n77) );
  OAI21XL U195 ( .A0(n72), .A1(n75), .B0(n73), .Y(n71) );
  NAND2X1 U196 ( .A(n83), .B(A[3]), .Y(n73) );
  NAND2X1 U197 ( .A(n82), .B(A[2]), .Y(n75) );
  NOR2X1 U198 ( .A(n83), .B(A[3]), .Y(n72) );
  NOR2X1 U199 ( .A(n85), .B(A[5]), .Y(n65) );
  NOR2X1 U200 ( .A(n86), .B(A[6]), .Y(n61) );
  NOR2X1 U201 ( .A(n65), .B(n67), .Y(n63) );
  NOR2X1 U202 ( .A(n84), .B(A[4]), .Y(n67) );
  NOR2X1 U203 ( .A(n72), .B(n74), .Y(n70) );
  NOR2X1 U204 ( .A(n82), .B(A[2]), .Y(n74) );
endmodule


module comparator_DW_cmp_10 ( A, B, GE_LT_GT_LE );
  input [20:0] A;
  input [20:0] B;
  output GE_LT_GT_LE;
  wire   n1, n2, n7, n8, n9, n10, n11, n12, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n154, n155, n156, n157, n158, n159;

  NAND2X1 U106 ( .A(A[9]), .B(n89), .Y(n51) );
  INVX3 U107 ( .A(B[20]), .Y(n100) );
  NAND2X6 U108 ( .A(n157), .B(n7), .Y(n1) );
  NOR2X4 U109 ( .A(A[15]), .B(n95), .Y(n154) );
  AND2X2 U110 ( .A(A[18]), .B(n98), .Y(n155) );
  NOR2X6 U111 ( .A(n46), .B(n44), .Y(n42) );
  OAI21X4 U112 ( .A0(n50), .A1(n53), .B0(n51), .Y(n49) );
  INVX12 U113 ( .A(B[19]), .Y(n99) );
  NOR2X6 U114 ( .A(A[7]), .B(n87), .Y(n59) );
  OAI21X4 U115 ( .A0(n44), .A1(n47), .B0(n45), .Y(n43) );
  INVX4 U116 ( .A(B[15]), .Y(n95) );
  NOR2X4 U117 ( .A(A[13]), .B(n93), .Y(n36) );
  NAND2X2 U118 ( .A(A[13]), .B(n93), .Y(n37) );
  INVX3 U119 ( .A(B[13]), .Y(n93) );
  NAND2X2 U120 ( .A(n57), .B(n63), .Y(n55) );
  NOR2X4 U121 ( .A(n61), .B(n59), .Y(n57) );
  INVX3 U122 ( .A(B[11]), .Y(n91) );
  CLKINVX6 U123 ( .A(B[14]), .Y(n94) );
  CLKINVX1 U124 ( .A(B[3]), .Y(n83) );
  CLKINVX1 U125 ( .A(B[5]), .Y(n85) );
  NOR2XL U126 ( .A(A[3]), .B(n83), .Y(n72) );
  NOR2X1 U127 ( .A(A[5]), .B(n85), .Y(n65) );
  NOR2X4 U128 ( .A(A[14]), .B(n94), .Y(n32) );
  NOR2X1 U129 ( .A(n65), .B(n67), .Y(n63) );
  NOR2X1 U130 ( .A(n72), .B(n74), .Y(n70) );
  NAND2X6 U131 ( .A(n156), .B(n2), .Y(GE_LT_GT_LE) );
  CLKAND2X2 U132 ( .A(A[20]), .B(n100), .Y(n158) );
  NOR2X8 U133 ( .A(n154), .B(n32), .Y(n28) );
  NAND2X2 U134 ( .A(A[14]), .B(n94), .Y(n33) );
  CLKINVX8 U135 ( .A(B[8]), .Y(n88) );
  NOR2X8 U136 ( .A(n11), .B(n9), .Y(n7) );
  NOR2X6 U137 ( .A(A[19]), .B(n99), .Y(n9) );
  INVX6 U138 ( .A(B[9]), .Y(n89) );
  OR2X6 U139 ( .A(A[20]), .B(n100), .Y(n157) );
  NOR2X6 U140 ( .A(A[11]), .B(n91), .Y(n44) );
  NAND2X2 U141 ( .A(A[17]), .B(n97), .Y(n20) );
  OAI21X2 U142 ( .A0(n72), .A1(n75), .B0(n73), .Y(n71) );
  NAND2X4 U143 ( .A(n34), .B(n28), .Y(n26) );
  OAI21X2 U144 ( .A0(n77), .A1(n79), .B0(n78), .Y(n76) );
  OAI21X4 U145 ( .A0(n154), .A1(n33), .B0(n31), .Y(n29) );
  NAND2X4 U146 ( .A(A[19]), .B(n99), .Y(n10) );
  NAND2X2 U147 ( .A(A[11]), .B(n91), .Y(n45) );
  NOR2X4 U148 ( .A(A[17]), .B(n97), .Y(n19) );
  OAI21X2 U149 ( .A0(n19), .A1(n22), .B0(n20), .Y(n18) );
  NAND2X2 U150 ( .A(A[4]), .B(n84), .Y(n68) );
  NAND2X4 U151 ( .A(A[2]), .B(n82), .Y(n75) );
  NAND2XL U152 ( .A(A[3]), .B(n83), .Y(n73) );
  NAND2X2 U153 ( .A(A[10]), .B(n90), .Y(n47) );
  NAND2X1 U154 ( .A(A[15]), .B(n95), .Y(n31) );
  NAND2X4 U155 ( .A(n17), .B(n159), .Y(n11) );
  NOR2X4 U156 ( .A(A[12]), .B(n92), .Y(n38) );
  CLKINVX4 U157 ( .A(B[12]), .Y(n92) );
  NOR2X2 U158 ( .A(n19), .B(n21), .Y(n17) );
  OR2X6 U159 ( .A(n23), .B(n1), .Y(n156) );
  OAI21X4 U160 ( .A0(n12), .A1(n9), .B0(n10), .Y(n8) );
  NAND2X2 U161 ( .A(A[12]), .B(n92), .Y(n39) );
  CLKINVX6 U162 ( .A(B[10]), .Y(n90) );
  OR2X8 U163 ( .A(A[18]), .B(n98), .Y(n159) );
  INVX6 U164 ( .A(B[7]), .Y(n87) );
  OAI21X4 U165 ( .A0(n41), .A1(n26), .B0(n27), .Y(n25) );
  AOI21X4 U166 ( .A0(n35), .A1(n28), .B0(n29), .Y(n27) );
  AOI21X4 U167 ( .A0(n49), .A1(n42), .B0(n43), .Y(n41) );
  OAI21X2 U168 ( .A0(n36), .A1(n39), .B0(n37), .Y(n35) );
  AOI21X4 U169 ( .A0(n18), .A1(n159), .B0(n155), .Y(n12) );
  NOR2X2 U170 ( .A(n50), .B(n52), .Y(n48) );
  NOR2X2 U171 ( .A(A[8]), .B(n88), .Y(n52) );
  OAI21X4 U172 ( .A0(n65), .A1(n68), .B0(n66), .Y(n64) );
  AOI21X4 U173 ( .A0(n70), .A1(n76), .B0(n71), .Y(n69) );
  AOI21X4 U174 ( .A0(n64), .A1(n57), .B0(n58), .Y(n56) );
  NOR2X4 U175 ( .A(A[9]), .B(n89), .Y(n50) );
  NAND2X2 U176 ( .A(A[8]), .B(n88), .Y(n53) );
  NOR2X4 U177 ( .A(n40), .B(n26), .Y(n24) );
  NAND2X2 U178 ( .A(n42), .B(n48), .Y(n40) );
  INVX4 U179 ( .A(B[18]), .Y(n98) );
  AOI21X4 U180 ( .A0(n8), .A1(n157), .B0(n158), .Y(n2) );
  AOI21X4 U181 ( .A0(n54), .A1(n24), .B0(n25), .Y(n23) );
  OAI21X4 U182 ( .A0(n69), .A1(n55), .B0(n56), .Y(n54) );
  NOR2XL U183 ( .A(A[6]), .B(n86), .Y(n61) );
  OAI21X2 U184 ( .A0(n59), .A1(n62), .B0(n60), .Y(n58) );
  NAND2X2 U185 ( .A(A[7]), .B(n87), .Y(n60) );
  NOR2X2 U186 ( .A(A[10]), .B(n90), .Y(n46) );
  CLKINVX4 U187 ( .A(B[17]), .Y(n97) );
  NAND2X1 U188 ( .A(A[0]), .B(n80), .Y(n79) );
  NAND2X1 U189 ( .A(A[1]), .B(n81), .Y(n78) );
  CLKINVX4 U190 ( .A(B[16]), .Y(n96) );
  NAND2X1 U191 ( .A(A[16]), .B(n96), .Y(n22) );
  NOR2X2 U192 ( .A(n36), .B(n38), .Y(n34) );
  NOR2X1 U193 ( .A(A[16]), .B(n96), .Y(n21) );
  NAND2X1 U194 ( .A(A[6]), .B(n86), .Y(n62) );
  NOR2X1 U195 ( .A(A[1]), .B(n81), .Y(n77) );
  NAND2XL U196 ( .A(A[5]), .B(n85), .Y(n66) );
  NOR2XL U197 ( .A(A[4]), .B(n84), .Y(n67) );
  NOR2XL U198 ( .A(A[2]), .B(n82), .Y(n74) );
  CLKINVX1 U199 ( .A(B[1]), .Y(n81) );
  CLKINVX1 U200 ( .A(B[2]), .Y(n82) );
  CLKINVX1 U201 ( .A(B[6]), .Y(n86) );
  CLKINVX1 U202 ( .A(B[4]), .Y(n84) );
  CLKINVX1 U203 ( .A(B[0]), .Y(n80) );
endmodule


module comparator_DW01_inc_0_DW01_inc_19 ( A, SUM );
  input [20:0] A;
  output [20:0] SUM;

  wire   [20:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADDHXL U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADDHXL U1_1_19 ( .A(A[19]), .B(carry[19]), .CO(carry[20]), .S(SUM[19]) );
  ADDHXL U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADDHXL U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADDHXL U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHXL U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X1 U1 ( .A(carry[20]), .B(A[20]), .Y(SUM[20]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module comparator_DW01_inc_2_DW01_inc_21 ( A, SUM );
  input [20:0] A;
  output [20:0] SUM;

  wire   [20:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX2 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX4 U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHX4 U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADDHX4 U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADDHX4 U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHX4 U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHX4 U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADDHX4 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHX4 U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADDHX2 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  CMPR22X2 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX4 U1_1_19 ( .A(A[19]), .B(carry[19]), .CO(carry[20]), .S(SUM[19]) );
  ADDHX4 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  XOR2X4 U1 ( .A(carry[20]), .B(A[20]), .Y(SUM[20]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module median_filter ( i_clk, i_rst_n, i_start, a1, a2, a3, a4, a5, a6, a7, a8, 
        a9, o_median_finish, median_result );
  input [7:0] a1;
  input [7:0] a2;
  input [7:0] a3;
  input [7:0] a4;
  input [7:0] a5;
  input [7:0] a6;
  input [7:0] a7;
  input [7:0] a8;
  input [7:0] a9;
  output [13:0] median_result;
  input i_clk, i_rst_n, i_start;
  output o_median_finish;
  wire   mem_r_0__7_, mem_r_0__6_, mem_r_0__5_, mem_r_0__4_, mem_r_0__3_,
         mem_r_0__2_, mem_r_0__1_, mem_r_0__0_, mem_r_1__7_, mem_r_1__6_,
         mem_r_1__5_, mem_r_1__4_, mem_r_1__3_, mem_r_1__2_, mem_r_1__1_,
         mem_r_1__0_, mem_r_2__7_, mem_r_2__6_, mem_r_2__5_, mem_r_2__4_,
         mem_r_2__3_, mem_r_2__2_, mem_r_2__1_, mem_r_2__0_, mem_r_3__7_,
         mem_r_3__6_, mem_r_3__5_, mem_r_3__4_, mem_r_3__3_, mem_r_3__2_,
         mem_r_3__1_, mem_r_3__0_, mem_r_5__7_, mem_r_5__6_, mem_r_5__5_,
         mem_r_5__4_, mem_r_5__3_, mem_r_5__2_, mem_r_5__1_, mem_r_5__0_,
         mem_r_6__7_, mem_r_6__6_, mem_r_6__5_, mem_r_6__4_, mem_r_6__3_,
         mem_r_6__2_, mem_r_6__1_, mem_r_6__0_, mem_r_7__7_, mem_r_7__6_,
         mem_r_7__5_, mem_r_7__4_, mem_r_7__3_, mem_r_7__2_, mem_r_7__1_,
         mem_r_7__0_, mem_r_8__7_, mem_r_8__6_, mem_r_8__5_, mem_r_8__4_,
         mem_r_8__3_, mem_r_8__2_, mem_r_8__1_, mem_r_8__0_, state_r_0_, N141,
         N142, N143, N322, N331, N332, N333, N335, N336, N337, N338, N577,
         N580, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n120, n121, n123, n124, n125, n126, n127,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n1410, n1420, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n168, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n195, n196, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         gt_2164_B_6_, gt_2164_B_5_, gt_2164_B_4_, gt_2164_B_3_, gt_2164_B_2_,
         gt_2164_B_1_, gt_2164_B_0_, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n119, n122, n128, n1430, n167, n169, n180, n194, n197, n208,
         n221, n234, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n3220, n323, n324, n325, n326, n327, n328, n329, n330, n3310, n3320,
         n3330, n334, n3350, n3360, n3370, n3380, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, n475,
         n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486,
         n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497,
         n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, n508,
         n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519,
         n520, n521, n522, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n5770, n578, n579, n5800, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728,
         n729, n730, n731, n732, n733, n734, n735, n736, n737, n738, n739,
         n740, n741, n742, n743, n744, n745, n746, n747, n748, n749, n750,
         n751, n752, n753, n754, n755, n756, n757, n758, n759, n760, n761,
         n762, n763, n764, n765, n766, n767, n768, n769, n770, n771, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n783,
         n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, n794,
         n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805,
         n806, n807, n808, n809, n810, n811, n812, n813, n814, n815;
  wire   [3:0] cnt1_r;
  wire   [3:0] cnt2_r;
  wire   [3:2] r414_carry;

  OAI21X4 U33 ( .A0(n562), .A1(n109), .B0(n802), .Y(N580) );
  OAI221X2 U103 ( .A0(n33), .A1(n35), .B0(n586), .B1(n170), .C0(n175), .Y(
        mem_r_3__4_) );
  OAI221X2 U130 ( .A0(n729), .A1(n183), .B0(n583), .B1(n184), .C0(n192), .Y(
        median_result[1]) );
  OAI221X2 U170 ( .A0(n729), .A1(n210), .B0(n583), .B1(n211), .C0(n219), .Y(
        mem_r_6__1_) );
  OAI31X2 U223 ( .A0(n735), .A1(n564), .A2(n24), .B0(n138), .Y(n239) );
  DFFSX1 i_clk_r_REG666_S1 ( .D(n400), .CK(i_clk), .SN(n119), .Q(n595) );
  DFFRX4 i_clk_r_REG668_S1 ( .D(n397), .CK(i_clk), .RN(n83), .Q(n592) );
  DFFRX4 i_clk_r_REG669_S1 ( .D(n396), .CK(i_clk), .RN(n83), .Q(n591) );
  DFFRX4 i_clk_r_REG672_S1 ( .D(n384), .CK(i_clk), .RN(n83), .Q(n579) );
  DFFRX4 i_clk_r_REG673_S1 ( .D(n383), .CK(i_clk), .RN(n83), .Q(n578), .QN(n21) );
  DFFRX1 i_clk_r_REG538_S5 ( .D(n409), .CK(i_clk), .RN(n82), .Q(n604) );
  DFFRX1 i_clk_r_REG115_S8 ( .D(n296), .CK(i_clk), .RN(n85), .Q(n491) );
  DFFRX1 i_clk_r_REG691_S1 ( .D(n365), .CK(i_clk), .RN(n91), .Q(n560) );
  DFFRX1 i_clk_r_REG558_S12 ( .D(n465), .CK(i_clk), .RN(n77), .Q(n660) );
  DFFRX1 i_clk_r_REG110_S7 ( .D(n352), .CK(i_clk), .RN(n90), .Q(n547) );
  DFFRX1 i_clk_r_REG547_S8 ( .D(n433), .CK(i_clk), .RN(n80), .Q(n628) );
  DFFRX1 i_clk_r_REG552_S10 ( .D(n449), .CK(i_clk), .RN(n79), .Q(n644) );
  DFFRX1 i_clk_r_REG118_S8 ( .D(n320), .CK(i_clk), .RN(n87), .Q(n515) );
  DFFRX1 i_clk_r_REG541_S6 ( .D(n417), .CK(i_clk), .RN(n81), .Q(n612) );
  DFFRX1 i_clk_r_REG120_S8 ( .D(n3360), .CK(i_clk), .RN(n89), .Q(n531) );
  DFFRX1 i_clk_r_REG116_S8 ( .D(n304), .CK(i_clk), .RN(n86), .Q(n499) );
  DFFRX1 i_clk_r_REG112_S8 ( .D(n360), .CK(i_clk), .RN(n91), .Q(n555) );
  DFFRX1 i_clk_r_REG560_S13 ( .D(n474), .CK(i_clk), .RN(n84), .Q(n669) );
  DFFRX1 i_clk_r_REG555_S11 ( .D(n457), .CK(i_clk), .RN(n78), .Q(n652) );
  DFFRX1 i_clk_r_REG544_S7 ( .D(n425), .CK(i_clk), .RN(n81), .Q(n620) );
  DFFRX1 i_clk_r_REG121_S8 ( .D(n344), .CK(i_clk), .RN(n90), .Q(n539) );
  DFFRX1 i_clk_r_REG117_S8 ( .D(n312), .CK(i_clk), .RN(n87), .Q(n507) );
  DFFRX1 i_clk_r_REG550_S9 ( .D(n441), .CK(i_clk), .RN(n79), .Q(n636) );
  DFFRX1 i_clk_r_REG119_S8 ( .D(n328), .CK(i_clk), .RN(n88), .Q(n523) );
  DFFRX1 i_clk_r_REG113_S7 ( .D(n286), .CK(i_clk), .RN(n85), .Q(n481), .QN(n25) );
  DFFRX1 i_clk_r_REG512_S5 ( .D(n408), .CK(i_clk), .RN(n82), .Q(n603) );
  DFFRX1 i_clk_r_REG127_S8 ( .D(n295), .CK(i_clk), .RN(n85), .Q(n490) );
  DFFRX1 i_clk_r_REG106_S5 ( .D(n402), .CK(i_clk), .RN(n82), .Q(n597) );
  DFFRX1 i_clk_r_REG107_S6 ( .D(n289), .CK(i_clk), .RN(n85), .Q(n484) );
  DFFRX1 i_clk_r_REG408_S5 ( .D(n404), .CK(i_clk), .RN(n82), .Q(n599) );
  DFFRX1 i_clk_r_REG171_S8 ( .D(n291), .CK(i_clk), .RN(n85), .Q(n486) );
  DFFRX1 i_clk_r_REG434_S5 ( .D(n405), .CK(i_clk), .RN(n82), .Q(n600) );
  DFFRX1 i_clk_r_REG160_S8 ( .D(n292), .CK(i_clk), .RN(n85), .Q(n487) );
  DFFRX1 i_clk_r_REG532_S12 ( .D(n464), .CK(i_clk), .RN(n77), .Q(n659) );
  DFFRX1 i_clk_r_REG486_S5 ( .D(n407), .CK(i_clk), .RN(n82), .Q(n602) );
  DFFRX1 i_clk_r_REG382_S5 ( .D(n403), .CK(i_clk), .RN(n82), .Q(n598) );
  DFFRX1 i_clk_r_REG526_S10 ( .D(n448), .CK(i_clk), .RN(n79), .Q(n643) );
  DFFRX1 i_clk_r_REG138_S8 ( .D(n294), .CK(i_clk), .RN(n85), .Q(n489) );
  DFFRX1 i_clk_r_REG122_S7 ( .D(n351), .CK(i_clk), .RN(n90), .Q(n546) );
  DFFRX1 i_clk_r_REG515_S6 ( .D(n416), .CK(i_clk), .RN(n81), .Q(n611) );
  DFFRX1 i_clk_r_REG182_S8 ( .D(n290), .CK(i_clk), .RN(n85), .Q(n485) );
  DFFRX1 i_clk_r_REG521_S8 ( .D(n432), .CK(i_clk), .RN(n80), .Q(n627) );
  DFFRX1 i_clk_r_REG132_S8 ( .D(n3350), .CK(i_clk), .RN(n89), .Q(n530) );
  DFFRX1 i_clk_r_REG128_S8 ( .D(n303), .CK(i_clk), .RN(n86), .Q(n498) );
  DFFRX1 i_clk_r_REG130_S8 ( .D(n319), .CK(i_clk), .RN(n87), .Q(n514) );
  DFFRX1 i_clk_r_REG376_S12 ( .D(n458), .CK(i_clk), .RN(n78), .Q(n653) );
  DFFRX1 i_clk_r_REG370_S10 ( .D(n442), .CK(i_clk), .RN(n79), .Q(n637) );
  DFFRX1 i_clk_r_REG189_S7 ( .D(n345), .CK(i_clk), .RN(n90), .Q(n540) );
  DFFRX1 i_clk_r_REG356_S6 ( .D(n410), .CK(i_clk), .RN(n82), .Q(n605) );
  DFFRX1 i_clk_r_REG365_S8 ( .D(n426), .CK(i_clk), .RN(n80), .Q(n621) );
  DFFRX1 i_clk_r_REG195_S8 ( .D(n329), .CK(i_clk), .RN(n88), .Q(n524) );
  DFFRX1 i_clk_r_REG191_S8 ( .D(n297), .CK(i_clk), .RN(n86), .Q(n492) );
  DFFRX1 i_clk_r_REG193_S8 ( .D(n313), .CK(i_clk), .RN(n87), .Q(n508) );
  DFFRX1 i_clk_r_REG125_S8 ( .D(n359), .CK(i_clk), .RN(n91), .Q(n554) );
  DFFRX1 i_clk_r_REG460_S5 ( .D(n406), .CK(i_clk), .RN(n82), .Q(n601) );
  DFFRX1 i_clk_r_REG534_S13 ( .D(n472), .CK(i_clk), .RN(n77), .Q(n667) );
  DFFRX1 i_clk_r_REG149_S8 ( .D(n293), .CK(i_clk), .RN(n85), .Q(n488) );
  DFFRX1 i_clk_r_REG518_S7 ( .D(n424), .CK(i_clk), .RN(n81), .Q(n619) );
  DFFRX1 i_clk_r_REG529_S11 ( .D(n456), .CK(i_clk), .RN(n78), .Q(n651) );
  DFFRX1 i_clk_r_REG129_S8 ( .D(n311), .CK(i_clk), .RN(n87), .Q(n506) );
  DFFRX1 i_clk_r_REG133_S8 ( .D(n343), .CK(i_clk), .RN(n89), .Q(n538) );
  DFFRX1 i_clk_r_REG454_S12 ( .D(n461), .CK(i_clk), .RN(n78), .Q(n656) );
  DFFRX1 i_clk_r_REG422_S10 ( .D(n444), .CK(i_clk), .RN(n79), .Q(n639) );
  DFFRX1 i_clk_r_REG524_S9 ( .D(n440), .CK(i_clk), .RN(n79), .Q(n635) );
  DFFRX1 i_clk_r_REG402_S12 ( .D(n459), .CK(i_clk), .RN(n78), .Q(n654) );
  DFFRX1 i_clk_r_REG428_S12 ( .D(n460), .CK(i_clk), .RN(n78), .Q(n655) );
  DFFRX1 i_clk_r_REG156_S7 ( .D(n348), .CK(i_clk), .RN(n90), .Q(n543) );
  DFFRX1 i_clk_r_REG506_S12 ( .D(n463), .CK(i_clk), .RN(n77), .Q(n658) );
  DFFRX1 i_clk_r_REG411_S6 ( .D(n412), .CK(i_clk), .RN(n82), .Q(n607) );
  DFFRX1 i_clk_r_REG443_S8 ( .D(n429), .CK(i_clk), .RN(n80), .Q(n624) );
  DFFRX1 i_clk_r_REG176_S8 ( .D(n3310), .CK(i_clk), .RN(n88), .Q(n526) );
  DFFRX1 i_clk_r_REG131_S8 ( .D(n327), .CK(i_clk), .RN(n88), .Q(n522) );
  DFFRX1 i_clk_r_REG396_S10 ( .D(n443), .CK(i_clk), .RN(n79), .Q(n638) );
  DFFRX1 i_clk_r_REG178_S7 ( .D(n346), .CK(i_clk), .RN(n90), .Q(n541) );
  DFFRX1 i_clk_r_REG134_S7 ( .D(n350), .CK(i_clk), .RN(n90), .Q(n545) );
  DFFRX1 i_clk_r_REG167_S7 ( .D(n347), .CK(i_clk), .RN(n90), .Q(n542) );
  DFFRX1 i_clk_r_REG197_S8 ( .D(n353), .CK(i_clk), .RN(n90), .Q(n548) );
  DFFRX1 i_clk_r_REG391_S8 ( .D(n427), .CK(i_clk), .RN(n80), .Q(n622) );
  DFFRX1 i_clk_r_REG163_S8 ( .D(n316), .CK(i_clk), .RN(n87), .Q(n511) );
  DFFRX1 i_clk_r_REG359_S7 ( .D(n418), .CK(i_clk), .RN(n81), .Q(n613) );
  DFFRX1 i_clk_r_REG417_S8 ( .D(n428), .CK(i_clk), .RN(n80), .Q(n623) );
  DFFRX1 i_clk_r_REG373_S11 ( .D(n450), .CK(i_clk), .RN(n78), .Q(n645) );
  DFFRX1 i_clk_r_REG385_S6 ( .D(n411), .CK(i_clk), .RN(n82), .Q(n606) );
  DFFRX1 i_clk_r_REG187_S8 ( .D(n330), .CK(i_clk), .RN(n88), .Q(n525) );
  DFFRX1 i_clk_r_REG448_S10 ( .D(n445), .CK(i_clk), .RN(n79), .Q(n640) );
  DFFRX1 i_clk_r_REG172_S8 ( .D(n299), .CK(i_clk), .RN(n86), .Q(n494) );
  DFFRX1 i_clk_r_REG495_S8 ( .D(n431), .CK(i_clk), .RN(n80), .Q(n626) );
  DFFRX1 i_clk_r_REG378_S13 ( .D(n466), .CK(i_clk), .RN(n77), .Q(n661) );
  DFFRX1 i_clk_r_REG126_S7 ( .D(n285), .CK(i_clk), .RN(n85), .Q(n480) );
  DFFRX1 i_clk_r_REG437_S6 ( .D(n413), .CK(i_clk), .RN(n82), .Q(n608) );
  DFFRX1 i_clk_r_REG165_S8 ( .D(n3320), .CK(i_clk), .RN(n89), .Q(n527) );
  DFFRX1 i_clk_r_REG183_S8 ( .D(n298), .CK(i_clk), .RN(n86), .Q(n493) );
  DFFRX1 i_clk_r_REG141_S8 ( .D(n318), .CK(i_clk), .RN(n87), .Q(n513) );
  DFFRX1 i_clk_r_REG185_S8 ( .D(n314), .CK(i_clk), .RN(n87), .Q(n509) );
  DFFRX1 i_clk_r_REG192_S8 ( .D(n305), .CK(i_clk), .RN(n86), .Q(n500) );
  DFFRX1 i_clk_r_REG174_S8 ( .D(n315), .CK(i_clk), .RN(n87), .Q(n510) );
  DFFRX1 i_clk_r_REG500_S10 ( .D(n447), .CK(i_clk), .RN(n79), .Q(n642) );
  DFFRX1 i_clk_r_REG196_S8 ( .D(n3370), .CK(i_clk), .RN(n89), .Q(n532) );
  DFFRX1 i_clk_r_REG161_S8 ( .D(n300), .CK(i_clk), .RN(n86), .Q(n495) );
  DFFRX1 i_clk_r_REG368_S9 ( .D(n434), .CK(i_clk), .RN(n80), .Q(n629) );
  DFFRX1 i_clk_r_REG489_S6 ( .D(n415), .CK(i_clk), .RN(n81), .Q(n610) );
  DFFRX1 i_clk_r_REG143_S8 ( .D(n334), .CK(i_clk), .RN(n89), .Q(n529) );
  DFFRX1 i_clk_r_REG139_S8 ( .D(n302), .CK(i_clk), .RN(n86), .Q(n497) );
  DFFRX1 i_clk_r_REG194_S8 ( .D(n321), .CK(i_clk), .RN(n88), .Q(n516) );
  DFFRX1 i_clk_r_REG158_S8 ( .D(n356), .CK(i_clk), .RN(n91), .Q(n551) );
  DFFRX1 i_clk_r_REG456_S13 ( .D(n469), .CK(i_clk), .RN(n77), .Q(n664) );
  DFFRX1 i_clk_r_REG190_S7 ( .D(n281), .CK(i_clk), .RN(n88), .Q(n476) );
  DFFRX1 i_clk_r_REG440_S7 ( .D(n421), .CK(i_clk), .RN(n81), .Q(n616) );
  DFFRX1 i_clk_r_REG451_S11 ( .D(n453), .CK(i_clk), .RN(n78), .Q(n648) );
  DFFRX1 i_clk_r_REG162_S8 ( .D(n308), .CK(i_clk), .RN(n86), .Q(n503) );
  DFFRX1 i_clk_r_REG480_S12 ( .D(n462), .CK(i_clk), .RN(n77), .Q(n657) );
  DFFRX1 i_clk_r_REG446_S9 ( .D(n437), .CK(i_clk), .RN(n80), .Q(n632) );
  DFFRX1 i_clk_r_REG166_S8 ( .D(n340), .CK(i_clk), .RN(n89), .Q(n535) );
  DFFRX1 i_clk_r_REG136_S8 ( .D(n358), .CK(i_clk), .RN(n91), .Q(n553) );
  DFFRX1 i_clk_r_REG474_S10 ( .D(n446), .CK(i_clk), .RN(n79), .Q(n641) );
  DFFRX1 i_clk_r_REG492_S7 ( .D(n423), .CK(i_clk), .RN(n81), .Q(n618) );
  DFFRX1 i_clk_r_REG503_S11 ( .D(n455), .CK(i_clk), .RN(n78), .Q(n650) );
  DFFRX1 i_clk_r_REG145_S7 ( .D(n349), .CK(i_clk), .RN(n90), .Q(n544) );
  DFFRX1 i_clk_r_REG508_S13 ( .D(n471), .CK(i_clk), .RN(n77), .Q(n666) );
  DFFRX1 i_clk_r_REG463_S6 ( .D(n414), .CK(i_clk), .RN(n81), .Q(n609) );
  DFFRX1 i_clk_r_REG414_S7 ( .D(n420), .CK(i_clk), .RN(n81), .Q(n615) );
  DFFRX1 i_clk_r_REG425_S11 ( .D(n452), .CK(i_clk), .RN(n78), .Q(n647) );
  DFFRX1 i_clk_r_REG164_S8 ( .D(n324), .CK(i_clk), .RN(n88), .Q(n519) );
  DFFRX1 i_clk_r_REG469_S8 ( .D(n430), .CK(i_clk), .RN(n80), .Q(n625) );
  DFFRX1 i_clk_r_REG180_S8 ( .D(n354), .CK(i_clk), .RN(n90), .Q(n549) );
  DFFRX1 i_clk_r_REG154_S8 ( .D(n3330), .CK(i_clk), .RN(n89), .Q(n528) );
  DFFRX1 i_clk_r_REG140_S8 ( .D(n310), .CK(i_clk), .RN(n87), .Q(n505) );
  DFFRX1 i_clk_r_REG144_S8 ( .D(n342), .CK(i_clk), .RN(n89), .Q(n537) );
  DFFRX1 i_clk_r_REG388_S7 ( .D(n419), .CK(i_clk), .RN(n81), .Q(n614) );
  DFFRX1 i_clk_r_REG399_S11 ( .D(n451), .CK(i_clk), .RN(n78), .Q(n646) );
  DFFRX1 i_clk_r_REG498_S9 ( .D(n439), .CK(i_clk), .RN(n79), .Q(n634) );
  DFFRX1 i_clk_r_REG404_S13 ( .D(n467), .CK(i_clk), .RN(n77), .Q(n662) );
  DFFRX1 i_clk_r_REG150_S8 ( .D(n301), .CK(i_clk), .RN(n86), .Q(n496) );
  DFFRX1 i_clk_r_REG173_S8 ( .D(n307), .CK(i_clk), .RN(n86), .Q(n502) );
  DFFRX1 i_clk_r_REG177_S8 ( .D(n339), .CK(i_clk), .RN(n89), .Q(n534) );
  DFFRX1 i_clk_r_REG430_S13 ( .D(n468), .CK(i_clk), .RN(n77), .Q(n663) );
  DFFRX1 i_clk_r_REG152_S8 ( .D(n317), .CK(i_clk), .RN(n87), .Q(n512) );
  DFFRX1 i_clk_r_REG184_S8 ( .D(n306), .CK(i_clk), .RN(n86), .Q(n501) );
  DFFRX1 i_clk_r_REG188_S8 ( .D(n3380), .CK(i_clk), .RN(n89), .Q(n533) );
  DFFRX1 i_clk_r_REG142_S8 ( .D(n326), .CK(i_clk), .RN(n88), .Q(n521) );
  DFFRX1 i_clk_r_REG394_S9 ( .D(n435), .CK(i_clk), .RN(n80), .Q(n630) );
  DFFRX1 i_clk_r_REG420_S9 ( .D(n436), .CK(i_clk), .RN(n80), .Q(n631) );
  DFFRX1 i_clk_r_REG159_S7 ( .D(n283), .CK(i_clk), .RN(n84), .Q(n478) );
  DFFRX1 i_clk_r_REG186_S8 ( .D(n3220), .CK(i_clk), .RN(n88), .Q(n517) );
  DFFRX1 i_clk_r_REG175_S8 ( .D(n323), .CK(i_clk), .RN(n88), .Q(n518) );
  DFFRX1 i_clk_r_REG137_S7 ( .D(n284), .CK(i_clk), .RN(n84), .Q(n479) );
  DFFRX1 i_clk_r_REG181_S7 ( .D(n282), .CK(i_clk), .RN(n84), .Q(n477) );
  DFFRX1 i_clk_r_REG170_S7 ( .D(n287), .CK(i_clk), .RN(n85), .Q(n482), .QN(n31) );
  DFFRX1 i_clk_r_REG147_S8 ( .D(n357), .CK(i_clk), .RN(n91), .Q(n552) );
  DFFRX1 i_clk_r_REG466_S7 ( .D(n422), .CK(i_clk), .RN(n81), .Q(n617) );
  DFFRX1 i_clk_r_REG477_S11 ( .D(n454), .CK(i_clk), .RN(n78), .Q(n649) );
  DFFRX1 i_clk_r_REG482_S13 ( .D(n470), .CK(i_clk), .RN(n77), .Q(n665) );
  DFFRX1 i_clk_r_REG151_S8 ( .D(n309), .CK(i_clk), .RN(n87), .Q(n504) );
  DFFRX1 i_clk_r_REG472_S9 ( .D(n438), .CK(i_clk), .RN(n79), .Q(n633) );
  DFFRX1 i_clk_r_REG153_S8 ( .D(n325), .CK(i_clk), .RN(n88), .Q(n520) );
  DFFRX1 i_clk_r_REG148_S7 ( .D(n386), .CK(i_clk), .RN(n83), .Q(n581) );
  DFFRX1 i_clk_r_REG677_S1 ( .D(n379), .CK(i_clk), .RN(n84), .Q(n574) );
  DFFRX1 i_clk_r_REG687_S1 ( .D(n369), .CK(i_clk), .RN(n119), .Q(n564) );
  DFFRX1 i_clk_r_REG690_S1 ( .D(n366), .CK(i_clk), .RN(n119), .Q(n561) );
  DFFRX1 i_clk_r_REG678_S1 ( .D(n378), .CK(i_clk), .RN(n84), .Q(n573) );
  DFFRX1 i_clk_r_REG683_S1 ( .D(n373), .CK(i_clk), .RN(n84), .Q(n568), .QN(n49) );
  DFFRX1 i_clk_r_REG680_S1 ( .D(n376), .CK(i_clk), .RN(n84), .Q(n571), .QN(n53) );
  DFFRX1 i_clk_r_REG685_S1 ( .D(n371), .CK(i_clk), .RN(n119), .Q(n566), .QN(
        n45) );
  DFFRX1 i_clk_r_REG682_S1 ( .D(n374), .CK(i_clk), .RN(n84), .Q(n569), .QN(n51) );
  DFFRX1 i_clk_r_REG684_S1 ( .D(n372), .CK(i_clk), .RN(n91), .Q(n567), .QN(n47) );
  DFFRX1 i_clk_r_REG679_S1 ( .D(n377), .CK(i_clk), .RN(n84), .Q(n572), .QN(n55) );
  DFFRX2 i_clk_r_REG681_S1 ( .D(n375), .CK(i_clk), .RN(n84), .Q(n570) );
  ADDHX1 r414_U1_1_3 ( .A(n579), .B(r414_carry[3]), .CO(N322), .S(N143) );
  DFFRX1 i_clk_r_REG694_S1 ( .D(n362), .CK(i_clk), .RN(n91), .Q(n557) );
  DFFRX1 i_clk_r_REG692_S1 ( .D(n364), .CK(i_clk), .RN(n91), .Q(n559) );
  DFFRX1 i_clk_r_REG693_S1 ( .D(n363), .CK(i_clk), .RN(n91), .Q(n558) );
  DFFRX1 i_clk_r_REG671_S1 ( .D(n385), .CK(i_clk), .RN(n83), .Q(n5800), .QN(
        n43) );
  DFFRX1 i_clk_r_REG689_S1 ( .D(n367), .CK(i_clk), .RN(n119), .Q(n562) );
  ADDHXL r414_U1_1_2 ( .A(n578), .B(r414_carry[2]), .CO(r414_carry[3]), .S(
        N142) );
  ADDHXL r414_U1_1_1 ( .A(n5770), .B(n576), .CO(r414_carry[2]), .S(N141) );
  DFFRX1 i_clk_r_REG169_S8 ( .D(n355), .CK(i_clk), .RN(n90), .Q(n550) );
  DFFRX1 i_clk_r_REG155_S8 ( .D(n341), .CK(i_clk), .RN(n89), .Q(n536) );
  DFFRX1 i_clk_r_REG688_S1 ( .D(n368), .CK(i_clk), .RN(n91), .Q(n563) );
  DFFRX1 i_clk_r_REG124_S7 ( .D(n280), .CK(i_clk), .RN(n77), .Q(n475) );
  DFFSX2 i_clk_r_REG146_S7 ( .D(n391), .CK(i_clk), .SN(n119), .Q(n586) );
  DFFSX2 i_clk_r_REG179_S7 ( .D(n388), .CK(i_clk), .SN(n119), .Q(n583) );
  DFFSX2 i_clk_r_REG157_S7 ( .D(n390), .CK(i_clk), .SN(n119), .Q(n585) );
  DFFSX2 i_clk_r_REG135_S7 ( .D(n392), .CK(i_clk), .SN(n119), .Q(n587) );
  DFFSX2 i_clk_r_REG108_S6 ( .D(n387), .CK(i_clk), .SN(n119), .Q(n582) );
  DFFSX2 i_clk_r_REG168_S7 ( .D(n389), .CK(i_clk), .SN(n119), .Q(n584) );
  DFFRX2 i_clk_r_REG667_S1 ( .D(n398), .CK(i_clk), .RN(n83), .Q(n593), .QN(n38) );
  DFFRX2 i_clk_r_REG676_S1 ( .D(n380), .CK(i_clk), .RN(n84), .Q(n575) );
  DFFRX2 i_clk_r_REG665_S1 ( .D(n401), .CK(i_clk), .RN(n83), .Q(n596) );
  DFFRX2 i_clk_r_REG695_S1 ( .D(n361), .CK(i_clk), .RN(n91), .Q(n556), .QN(n26) );
  DFFRX2 i_clk_r_REG670_S1 ( .D(n395), .CK(i_clk), .RN(n83), .Q(n590), .QN(n24) );
  DFFRX2 i_clk_r_REG674_S1 ( .D(n382), .CK(i_clk), .RN(n83), .Q(n5770), .QN(
        n23) );
  DFFSX2 i_clk_r_REG111_S7 ( .D(n394), .CK(i_clk), .SN(n119), .Q(n589), .QN(
        n22) );
  DFFRX2 i_clk_r_REG675_S1 ( .D(n381), .CK(i_clk), .RN(n83), .Q(n576), .QN(n56) );
  DFFRX2 i_clk_r_REG114_S7 ( .D(n399), .CK(i_clk), .RN(n83), .Q(n594) );
  DFFRX2 i_clk_r_REG686_S1 ( .D(n370), .CK(i_clk), .RN(n119), .Q(n565) );
  DFFSX2 i_clk_r_REG123_S7 ( .D(n393), .CK(i_clk), .SN(n119), .Q(n588) );
  DFFRX2 i_clk_r_REG109_S6 ( .D(n288), .CK(i_clk), .RN(n85), .Q(n483) );
  CLKINVX1 U3 ( .A(1'b1), .Y(median_result[13]) );
  CLKINVX1 U5 ( .A(1'b1), .Y(median_result[12]) );
  CLKINVX1 U7 ( .A(1'b1), .Y(median_result[11]) );
  CLKINVX1 U9 ( .A(1'b1), .Y(median_result[10]) );
  CLKINVX1 U11 ( .A(1'b1), .Y(median_result[9]) );
  CLKINVX1 U13 ( .A(1'b1), .Y(median_result[8]) );
  AOI2BB1X4 U15 ( .A0N(n22), .A1N(n594), .B0(n28), .Y(n27) );
  NAND2X6 U16 ( .A(n561), .B(n27), .Y(n138) );
  OAI221X4 U17 ( .A0(n34), .A1(n210), .B0(n587), .B1(n211), .C0(n215), .Y(
        mem_r_6__5_) );
  MX2X1 U18 ( .A(mem_r_0__4_), .B(n552), .S0(n62), .Y(n357) );
  NAND2BX2 U19 ( .AN(gt_2164_B_4_), .B(n670), .Y(n736) );
  NOR4X2 U20 ( .A(n260), .B(n261), .C(n262), .D(n263), .Y(n123) );
  OAI22X2 U21 ( .A0(n721), .A1(n781), .B0(n722), .B1(n773), .Y(n260) );
  OAI22X2 U22 ( .A0(n235), .A1(n797), .B0(n723), .B1(n789), .Y(n261) );
  INVX3 U23 ( .A(N337), .Y(n750) );
  MX2XL U24 ( .A(N337), .B(n477), .S0(n58), .Y(n282) );
  CLKINVX1 U25 ( .A(median_result[0]), .Y(n769) );
  OAI221X1 U26 ( .A0(n715), .A1(n700), .B0(n713), .B1(n699), .C0(n698), .Y(
        N333) );
  AO22X4 U27 ( .A0(mem_r_6__5_), .A1(n719), .B0(mem_r_2__5_), .B1(n720), .Y(
        n697) );
  OAI221X4 U28 ( .A0(n34), .A1(n156), .B0(n587), .B1(n157), .C0(n161), .Y(
        mem_r_2__5_) );
  CLKINVX4 U29 ( .A(n111), .Y(n809) );
  AOI22X1 U30 ( .A0(n641), .A1(n734), .B0(n172), .B1(n528), .Y(n175) );
  NAND2X4 U31 ( .A(n581), .B(n139), .Y(n33) );
  OAI22X1 U32 ( .A0(n725), .A1(n765), .B0(n726), .B1(n757), .Y(n263) );
  CLKINVX1 U34 ( .A(mem_r_3__4_), .Y(n757) );
  MX2XL U35 ( .A(n129), .B(n584), .S0(n73), .Y(n389) );
  CLKINVX6 U36 ( .A(n129), .Y(gt_2164_B_2_) );
  INVX1 U37 ( .A(mem_r_3__2_), .Y(n759) );
  OAI22X4 U38 ( .A0(n742), .A1(n741), .B0(n740), .B1(n751), .Y(n745) );
  INVX3 U39 ( .A(N335), .Y(n751) );
  CLKINVX4 U40 ( .A(n126), .Y(gt_2164_B_3_) );
  AND2X2 U41 ( .A(mem_r_1__1_), .B(n717), .Y(n13) );
  AND2X1 U42 ( .A(mem_r_5__1_), .B(n718), .Y(n14) );
  NOR3X1 U43 ( .A(n13), .B(n14), .C(n676), .Y(n680) );
  OAI221X4 U44 ( .A0(n729), .A1(n36), .B0(n583), .B1(n144), .C0(n152), .Y(
        mem_r_1__1_) );
  BUFX4 U45 ( .A(n711), .Y(n717) );
  OAI221X4 U46 ( .A0(n729), .A1(n37), .B0(n583), .B1(n198), .C0(n206), .Y(
        mem_r_5__1_) );
  BUFX4 U47 ( .A(n710), .Y(n718) );
  AO22X1 U48 ( .A0(median_result[1]), .A1(n719), .B0(mem_r_0__1_), .B1(n720), 
        .Y(n676) );
  OAI221X2 U49 ( .A0(n715), .A1(n680), .B0(n713), .B1(n679), .C0(n678), .Y(
        N337) );
  AND2X2 U50 ( .A(mem_r_1__0_), .B(n717), .Y(n15) );
  AND2X2 U51 ( .A(mem_r_5__0_), .B(n718), .Y(n16) );
  NOR3X1 U52 ( .A(n15), .B(n16), .C(n671), .Y(n675) );
  OAI221X4 U53 ( .A0(n728), .A1(n36), .B0(n582), .B1(n144), .C0(n153), .Y(
        mem_r_1__0_) );
  OAI221X4 U54 ( .A0(n728), .A1(n37), .B0(n582), .B1(n198), .C0(n207), .Y(
        mem_r_5__0_) );
  AND2XL U55 ( .A(mem_r_3__4_), .B(n717), .Y(n17) );
  AND2XL U56 ( .A(mem_r_7__4_), .B(n718), .Y(n18) );
  NOR3X1 U57 ( .A(n17), .B(n18), .C(n692), .Y(n694) );
  OAI221X4 U58 ( .A0(n33), .A1(n223), .B0(n586), .B1(n224), .C0(n229), .Y(
        mem_r_7__4_) );
  AO22XL U59 ( .A0(mem_r_6__4_), .A1(n719), .B0(mem_r_2__4_), .B1(n720), .Y(
        n692) );
  OR2XL U60 ( .A(gt_2164_B_3_), .B(n751), .Y(n19) );
  OR2X1 U61 ( .A(gt_2164_B_3_), .B(n740), .Y(n20) );
  NAND2X1 U62 ( .A(n19), .B(n20), .Y(n746) );
  NAND2BX2 U63 ( .AN(gt_2164_B_2_), .B(N336), .Y(n740) );
  OAI221X4 U64 ( .A0(n30), .A1(n183), .B0(n584), .B1(n184), .C0(n191), .Y(
        median_result[2]) );
  BUFX4 U65 ( .A(n116), .Y(n731) );
  OAI221X4 U66 ( .A0(n730), .A1(n37), .B0(n585), .B1(n198), .C0(n204), .Y(
        mem_r_5__3_) );
  OAI221X4 U67 ( .A0(n34), .A1(n183), .B0(n587), .B1(n184), .C0(n188), .Y(
        median_result[5]) );
  NAND3X4 U68 ( .A(n139), .B(n183), .C(n569), .Y(n184) );
  NAND2X4 U69 ( .A(n479), .B(n139), .Y(n34) );
  OAI31X4 U70 ( .A0(n735), .A1(n572), .A2(n807), .B0(n138), .Y(n159) );
  OAI221X4 U71 ( .A0(n730), .A1(n183), .B0(n585), .B1(n184), .C0(n190), .Y(
        median_result[3]) );
  INVX8 U72 ( .A(n32), .Y(n139) );
  AO22X2 U73 ( .A0(mem_r_6__1_), .A1(n719), .B0(mem_r_2__1_), .B1(n720), .Y(
        n677) );
  OAI22XL U74 ( .A0(n721), .A1(n783), .B0(n722), .B1(n775), .Y(n268) );
  OAI22XL U75 ( .A0(n235), .A1(n799), .B0(n723), .B1(n791), .Y(n269) );
  OAI22XL U76 ( .A0(n725), .A1(n768), .B0(n726), .B1(n760), .Y(n275) );
  OAI221X1 U77 ( .A0(n110), .A1(n210), .B0(n589), .B1(n211), .C0(n212), .Y(
        mem_r_6__7_) );
  OAI221X1 U78 ( .A0(n110), .A1(n223), .B0(n589), .B1(n224), .C0(n225), .Y(
        mem_r_7__7_) );
  OAI22XL U79 ( .A0(n235), .A1(n796), .B0(n723), .B1(n788), .Y(n257) );
  NOR2BX2 U80 ( .AN(gt_2164_B_2_), .B(N336), .Y(n738) );
  AOI2BB2X2 U81 ( .B0(n739), .B1(N338), .A0N(gt_2164_B_1_), .A1N(n750), .Y(
        n741) );
  OAI221X1 U82 ( .A0(n33), .A1(n210), .B0(n586), .B1(n211), .C0(n216), .Y(
        mem_r_6__4_) );
  OAI221XL U83 ( .A0(n111), .A1(n33), .B0(n586), .B1(n113), .C0(n124), .Y(
        mem_r_0__4_) );
  OAI221X1 U84 ( .A0(n729), .A1(n156), .B0(n583), .B1(n157), .C0(n165), .Y(
        mem_r_2__1_) );
  OAI221X1 U85 ( .A0(n33), .A1(n37), .B0(n586), .B1(n198), .C0(n203), .Y(
        mem_r_5__4_) );
  OAI221X1 U86 ( .A0(n30), .A1(n156), .B0(n584), .B1(n157), .C0(n164), .Y(
        mem_r_2__2_) );
  OAI221X1 U87 ( .A0(n30), .A1(n210), .B0(n584), .B1(n211), .C0(n218), .Y(
        mem_r_6__2_) );
  AOI22X1 U88 ( .A0(n609), .A1(n591), .B0(n226), .B1(n496), .Y(n229) );
  OAI221X1 U89 ( .A0(n33), .A1(n36), .B0(n586), .B1(n144), .C0(n149), .Y(
        mem_r_1__4_) );
  OAI221X1 U90 ( .A0(n111), .A1(n34), .B0(n587), .B1(n113), .C0(n121), .Y(
        mem_r_0__5_) );
  OAI221X1 U91 ( .A0(n730), .A1(n156), .B0(n585), .B1(n157), .C0(n163), .Y(
        mem_r_2__3_) );
  OAI221X1 U92 ( .A0(n730), .A1(n210), .B0(n585), .B1(n211), .C0(n217), .Y(
        mem_r_6__3_) );
  OAI221X1 U93 ( .A0(n34), .A1(n223), .B0(n587), .B1(n224), .C0(n228), .Y(
        mem_r_7__5_) );
  AOI22X1 U94 ( .A0(n610), .A1(n592), .B0(n226), .B1(n497), .Y(n228) );
  AOI22X1 U95 ( .A0(n642), .A1(n734), .B0(n172), .B1(n529), .Y(n174) );
  OAI221X1 U96 ( .A0(n730), .A1(n223), .B0(n585), .B1(n224), .C0(n230), .Y(
        mem_r_7__3_) );
  AOI22X1 U97 ( .A0(n608), .A1(n591), .B0(n226), .B1(n495), .Y(n230) );
  OAI221X1 U98 ( .A0(n728), .A1(n156), .B0(n582), .B1(n157), .C0(n166), .Y(
        mem_r_2__0_) );
  OAI221X1 U99 ( .A0(n30), .A1(n37), .B0(n584), .B1(n198), .C0(n205), .Y(
        mem_r_5__2_) );
  OAI221X1 U100 ( .A0(n728), .A1(n210), .B0(n582), .B1(n211), .C0(n220), .Y(
        mem_r_6__0_) );
  OAI221X1 U101 ( .A0(n34), .A1(n37), .B0(n587), .B1(n198), .C0(n202), .Y(
        mem_r_5__5_) );
  OAI221X1 U102 ( .A0(n729), .A1(n223), .B0(n583), .B1(n224), .C0(n232), .Y(
        mem_r_7__1_) );
  AOI22X1 U104 ( .A0(n606), .A1(n592), .B0(n226), .B1(n493), .Y(n232) );
  OAI221X1 U105 ( .A0(n30), .A1(n223), .B0(n584), .B1(n224), .C0(n231), .Y(
        mem_r_7__2_) );
  AOI22X1 U106 ( .A0(n607), .A1(n591), .B0(n226), .B1(n494), .Y(n231) );
  OAI221XL U107 ( .A0(n111), .A1(n728), .B0(n582), .B1(n113), .C0(n136), .Y(
        mem_r_0__0_) );
  OAI221X1 U108 ( .A0(n731), .A1(n156), .B0(n588), .B1(n157), .C0(n160), .Y(
        mem_r_2__6_) );
  OAI221X1 U109 ( .A0(n731), .A1(n210), .B0(n588), .B1(n211), .C0(n214), .Y(
        mem_r_6__6_) );
  OAI221XL U110 ( .A0(n111), .A1(n731), .B0(n588), .B1(n113), .C0(n118), .Y(
        mem_r_0__6_) );
  OAI221X1 U111 ( .A0(n728), .A1(n223), .B0(n582), .B1(n224), .C0(n233), .Y(
        mem_r_7__0_) );
  AOI22X1 U112 ( .A0(n605), .A1(n591), .B0(n226), .B1(n492), .Y(n233) );
  OAI221X1 U113 ( .A0(n731), .A1(n223), .B0(n588), .B1(n224), .C0(n227), .Y(
        mem_r_7__6_) );
  OAI221X1 U114 ( .A0(n30), .A1(n590), .B0(n584), .B1(n237), .C0(n244), .Y(
        mem_r_8__2_) );
  OAI221X1 U115 ( .A0(n728), .A1(n590), .B0(n582), .B1(n237), .C0(n246), .Y(
        mem_r_8__0_) );
  OAI221XL U116 ( .A0(n110), .A1(n111), .B0(n589), .B1(n113), .C0(n114), .Y(
        mem_r_0__7_) );
  CLKINVX1 U117 ( .A(N331), .Y(n753) );
  AOI221XL U118 ( .A0(mem_r_3__7_), .A1(n717), .B0(mem_r_7__7_), .B1(n718), 
        .C0(n709), .Y(n714) );
  OAI221X1 U119 ( .A0(n110), .A1(n183), .B0(n589), .B1(n184), .C0(n185), .Y(
        median_result[7]) );
  OAI221X1 U120 ( .A0(n731), .A1(n183), .B0(n588), .B1(n184), .C0(n187), .Y(
        median_result[6]) );
  OAI221X1 U121 ( .A0(n728), .A1(n183), .B0(n582), .B1(n184), .C0(n193), .Y(
        median_result[0]) );
  CLKMX2X2 U122 ( .A(n748), .B(n475), .S0(n72), .Y(n280) );
  CLKBUFX3 U123 ( .A(n74), .Y(n73) );
  CLKBUFX3 U124 ( .A(n73), .Y(n67) );
  INVX3 U125 ( .A(n41), .Y(n223) );
  MX2X4 U126 ( .A(n747), .B(n483), .S0(n58), .Y(n288) );
  CLKINVX3 U127 ( .A(n35), .Y(n806) );
  OAI221X4 U128 ( .A0(n34), .A1(n35), .B0(n587), .B1(n170), .C0(n174), .Y(
        mem_r_3__5_) );
  OAI221XL U129 ( .A0(n30), .A1(n35), .B0(n584), .B1(n170), .C0(n177), .Y(
        mem_r_3__2_) );
  OAI221X1 U131 ( .A0(n731), .A1(n35), .B0(n588), .B1(n170), .C0(n173), .Y(
        mem_r_3__6_) );
  OAI22X1 U132 ( .A0(n743), .A1(n752), .B0(gt_2164_B_5_), .B1(n743), .Y(n744)
         );
  OAI221X2 U133 ( .A0(n715), .A1(n695), .B0(n713), .B1(n694), .C0(n693), .Y(
        n670) );
  AOI221X1 U134 ( .A0(mem_r_1__4_), .A1(n717), .B0(mem_r_5__4_), .B1(n718), 
        .C0(n691), .Y(n695) );
  OAI31X4 U135 ( .A0(n735), .A1(n568), .A2(n804), .B0(n138), .Y(n200) );
  OAI221X1 U136 ( .A0(n715), .A1(n675), .B0(n713), .B1(n674), .C0(n673), .Y(
        N338) );
  AOI221X4 U137 ( .A0(mem_r_1__5_), .A1(n717), .B0(mem_r_5__5_), .B1(n718), 
        .C0(n696), .Y(n700) );
  AO22X4 U138 ( .A0(median_result[5]), .A1(n719), .B0(mem_r_0__5_), .B1(n720), 
        .Y(n696) );
  OA22X2 U139 ( .A0(n738), .A1(gt_2164_B_3_), .B0(n738), .B1(n751), .Y(n742)
         );
  NAND3X4 U140 ( .A(n556), .B(n575), .C(n570), .Y(n156) );
  AND3X2 U141 ( .A(n593), .B(n556), .C(n565), .Y(n41) );
  CLKINVX1 U142 ( .A(mem_r_7__2_), .Y(n791) );
  OAI221X2 U143 ( .A0(N332), .A1(n749), .B0(n746), .B1(n745), .C0(n744), .Y(
        n747) );
  NOR4X2 U144 ( .A(n268), .B(n269), .C(n270), .D(n271), .Y(n129) );
  MX2X1 U145 ( .A(a1[2]), .B(n663), .S0(n66), .Y(n468) );
  AOI22X4 U146 ( .A0(n594), .A1(n22), .B0(n475), .B1(n483), .Y(n28) );
  AOI22X1 U147 ( .A0(n653), .A1(n732), .B0(n146), .B1(n540), .Y(n153) );
  OAI31X4 U148 ( .A0(n735), .A1(n573), .A2(n808), .B0(n138), .Y(n146) );
  OAI31X4 U149 ( .A0(n735), .A1(n566), .A2(n41), .B0(n138), .Y(n226) );
  AO22X4 U150 ( .A0(median_result[2]), .A1(n719), .B0(mem_r_0__2_), .B1(n720), 
        .Y(n681) );
  INVXL U151 ( .A(n759), .Y(n29) );
  OAI31X4 U152 ( .A0(n735), .A1(n567), .A2(n803), .B0(n138), .Y(n213) );
  BUFX20 U153 ( .A(n732), .Y(n735) );
  AOI22X1 U154 ( .A0(n638), .A1(n734), .B0(n172), .B1(n525), .Y(n178) );
  AOI22X1 U155 ( .A0(n637), .A1(n734), .B0(n172), .B1(n524), .Y(n179) );
  AOI22X1 U156 ( .A0(n640), .A1(n734), .B0(n172), .B1(n527), .Y(n176) );
  OAI31X4 U157 ( .A0(n735), .A1(n571), .A2(n806), .B0(n138), .Y(n172) );
  AOI22X1 U158 ( .A0(n631), .A1(n733), .B0(n186), .B1(n518), .Y(n191) );
  AOI22X1 U159 ( .A0(n630), .A1(n733), .B0(n186), .B1(n517), .Y(n192) );
  AOI22X1 U160 ( .A0(n629), .A1(n733), .B0(n186), .B1(n516), .Y(n193) );
  AOI22X1 U161 ( .A0(n632), .A1(n733), .B0(n186), .B1(n519), .Y(n190) );
  AOI22X1 U162 ( .A0(n634), .A1(n733), .B0(n186), .B1(n521), .Y(n188) );
  OAI31X4 U163 ( .A0(n735), .A1(n569), .A2(n805), .B0(n138), .Y(n186) );
  OAI222X2 U164 ( .A0(N332), .A1(n737), .B0(n749), .B1(n737), .C0(N332), .C1(
        n749), .Y(n748) );
  OAI222X4 U165 ( .A0(gt_2164_B_5_), .A1(n752), .B0(gt_2164_B_5_), .B1(n736), 
        .C0(n752), .C1(n736), .Y(n737) );
  MX2XL U166 ( .A(a1[1]), .B(n662), .S0(n66), .Y(n467) );
  MX2X1 U167 ( .A(a6[0]), .B(n621), .S0(n63), .Y(n426) );
  OAI221X4 U168 ( .A0(n715), .A1(n690), .B0(n713), .B1(n689), .C0(n688), .Y(
        N335) );
  OAI221X4 U169 ( .A0(n715), .A1(n685), .B0(n713), .B1(n684), .C0(n683), .Y(
        N336) );
  OAI221X4 U171 ( .A0(n715), .A1(n705), .B0(n713), .B1(n704), .C0(n703), .Y(
        N332) );
  OR2X2 U172 ( .A(n5770), .B(n579), .Y(n715) );
  OAI221X2 U173 ( .A0(n111), .A1(n30), .B0(n584), .B1(n113), .C0(n130), .Y(
        mem_r_0__2_) );
  OAI221X4 U174 ( .A0(n730), .A1(n35), .B0(n585), .B1(n170), .C0(n176), .Y(
        mem_r_3__3_) );
  OAI221X4 U175 ( .A0(n111), .A1(n730), .B0(n585), .B1(n113), .C0(n127), .Y(
        mem_r_0__3_) );
  OAI221X4 U176 ( .A0(n729), .A1(n35), .B0(n583), .B1(n170), .C0(n178), .Y(
        mem_r_3__1_) );
  OAI221X4 U177 ( .A0(n111), .A1(n729), .B0(n583), .B1(n113), .C0(n133), .Y(
        mem_r_0__1_) );
  OAI221X2 U178 ( .A0(n33), .A1(n156), .B0(n586), .B1(n157), .C0(n162), .Y(
        mem_r_2__4_) );
  OAI221X4 U179 ( .A0(n33), .A1(n183), .B0(n586), .B1(n184), .C0(n189), .Y(
        median_result[4]) );
  OAI221X4 U180 ( .A0(n110), .A1(n156), .B0(n589), .B1(n157), .C0(n158), .Y(
        mem_r_2__7_) );
  CLKBUFX2 U181 ( .A(n74), .Y(n72) );
  INVX1 U182 ( .A(N333), .Y(n752) );
  CLKBUFX4 U183 ( .A(n732), .Y(n734) );
  INVX3 U184 ( .A(n183), .Y(n805) );
  NAND3X4 U185 ( .A(n556), .B(n575), .C(n565), .Y(n210) );
  NAND3X4 U186 ( .A(n593), .B(n596), .C(n570), .Y(n36) );
  NAND3X2 U187 ( .A(n593), .B(n556), .C(n570), .Y(n35) );
  INVX1 U188 ( .A(n98), .Y(n810) );
  INVX1 U189 ( .A(n100), .Y(n811) );
  AOI22XL U190 ( .A0(n616), .A1(n592), .B0(n213), .B1(n503), .Y(n217) );
  INVX3 U191 ( .A(n42), .Y(n110) );
  CLKINVX1 U192 ( .A(mem_r_8__2_), .Y(n799) );
  BUFX3 U193 ( .A(n123), .Y(n727) );
  CLKINVX1 U194 ( .A(mem_r_8__4_), .Y(n797) );
  CLKINVX1 U195 ( .A(mem_r_8__5_), .Y(n796) );
  INVXL U196 ( .A(mem_r_6__2_), .Y(n783) );
  OAI22XL U197 ( .A0(n235), .A1(n801), .B0(n723), .B1(n793), .Y(n277) );
  INVX1 U198 ( .A(mem_r_7__0_), .Y(n793) );
  CLKINVX1 U199 ( .A(mem_r_3__0_), .Y(n761) );
  CLKINVX1 U200 ( .A(mem_r_8__1_), .Y(n800) );
  CLKINVX1 U201 ( .A(mem_r_8__3_), .Y(n798) );
  CLKINVX1 U202 ( .A(mem_r_8__0_), .Y(n801) );
  NOR2BXL U203 ( .AN(n94), .B(n95), .Y(n92) );
  AOI22X1 U204 ( .A0(n626), .A1(n733), .B0(n200), .B1(n513), .Y(n202) );
  BUFX8 U205 ( .A(n125), .Y(n730) );
  BUFX8 U206 ( .A(n131), .Y(n729) );
  AOI21X2 U207 ( .A0(n43), .A1(i_start), .B0(n40), .Y(n39) );
  CLKINVX6 U208 ( .A(n39), .Y(N577) );
  CLKINVX1 U209 ( .A(n802), .Y(n40) );
  NAND3XL U210 ( .A(n56), .B(n814), .C(n5770), .Y(n168) );
  AOI21XL U211 ( .A0(n558), .A1(n811), .B0(n98), .Y(n99) );
  AOI21XL U212 ( .A0(n557), .A1(n102), .B0(n100), .Y(n101) );
  INVX1 U213 ( .A(mem_r_5__2_), .Y(n775) );
  INVXL U214 ( .A(mem_r_7__1_), .Y(n792) );
  OAI22X1 U215 ( .A0(n721), .A1(n784), .B0(n722), .B1(n776), .Y(n272) );
  OAI22X1 U216 ( .A0(n235), .A1(n800), .B0(n723), .B1(n792), .Y(n273) );
  INVXL U217 ( .A(mem_r_5__1_), .Y(n776) );
  INVXL U218 ( .A(mem_r_7__5_), .Y(n788) );
  INVXL U219 ( .A(mem_r_5__5_), .Y(n772) );
  INVXL U220 ( .A(mem_r_7__3_), .Y(n790) );
  OAI22X1 U221 ( .A0(n235), .A1(n798), .B0(n723), .B1(n790), .Y(n265) );
  INVX1 U222 ( .A(mem_r_5__0_), .Y(n777) );
  INVXL U224 ( .A(mem_r_5__3_), .Y(n774) );
  INVXL U225 ( .A(mem_r_3__1_), .Y(n760) );
  INVXL U226 ( .A(mem_r_3__5_), .Y(n756) );
  INVXL U227 ( .A(mem_r_3__3_), .Y(n758) );
  INVXL U228 ( .A(mem_r_6__0_), .Y(n785) );
  INVXL U229 ( .A(mem_r_6__5_), .Y(n780) );
  INVXL U230 ( .A(mem_r_6__3_), .Y(n782) );
  INVXL U231 ( .A(mem_r_7__6_), .Y(n787) );
  INVXL U232 ( .A(mem_r_5__6_), .Y(n771) );
  INVX1 U233 ( .A(mem_r_8__6_), .Y(n795) );
  INVXL U234 ( .A(mem_r_6__6_), .Y(n779) );
  INVXL U235 ( .A(mem_r_5__7_), .Y(n770) );
  INVXL U236 ( .A(mem_r_6__7_), .Y(n778) );
  BUFX4 U237 ( .A(n221), .Y(n57) );
  NAND2BX2 U238 ( .AN(n31), .B(n139), .Y(n30) );
  OR2X4 U239 ( .A(n27), .B(n591), .Y(n32) );
  NAND3X2 U240 ( .A(n139), .B(n156), .C(n572), .Y(n157) );
  INVX3 U241 ( .A(n156), .Y(n807) );
  NAND3X2 U242 ( .A(n139), .B(n210), .C(n567), .Y(n211) );
  AOI22XL U243 ( .A0(n624), .A1(n733), .B0(n200), .B1(n511), .Y(n204) );
  AOI22XL U244 ( .A0(n549), .A1(n115), .B0(n662), .B1(n735), .Y(n133) );
  AOI22XL U245 ( .A0(n550), .A1(n115), .B0(n663), .B1(n735), .Y(n130) );
  AOI22XL U246 ( .A0(n614), .A1(n592), .B0(n213), .B1(n501), .Y(n219) );
  AOI22XL U247 ( .A0(n598), .A1(n591), .B0(n239), .B1(n485), .Y(n245) );
  BUFX4 U248 ( .A(n595), .Y(n732) );
  NAND3BX4 U249 ( .AN(n38), .B(n596), .C(n565), .Y(n37) );
  NAND2X2 U250 ( .A(n570), .B(n563), .Y(n111) );
  MX2XL U251 ( .A(a9[5]), .B(n602), .S0(n63), .Y(n407) );
  MX2XL U252 ( .A(a9[6]), .B(n603), .S0(n63), .Y(n408) );
  MX2XL U253 ( .A(a9[7]), .B(n604), .S0(n63), .Y(n409) );
  MX2XL U254 ( .A(a8[2]), .B(n607), .S0(n63), .Y(n412) );
  MX2XL U255 ( .A(a8[3]), .B(n608), .S0(n64), .Y(n413) );
  MX2XL U256 ( .A(a8[4]), .B(n609), .S0(n64), .Y(n414) );
  MX2XL U257 ( .A(a8[5]), .B(n610), .S0(n64), .Y(n415) );
  MX2XL U258 ( .A(a8[6]), .B(n611), .S0(n64), .Y(n416) );
  MX2XL U259 ( .A(a8[7]), .B(n612), .S0(n64), .Y(n417) );
  MX2XL U260 ( .A(a7[5]), .B(n618), .S0(n68), .Y(n423) );
  MX2XL U261 ( .A(a7[6]), .B(n619), .S0(n64), .Y(n424) );
  MX2XL U262 ( .A(a7[7]), .B(n620), .S0(n65), .Y(n425) );
  MX2XL U263 ( .A(a6[2]), .B(n623), .S0(n68), .Y(n428) );
  MX2XL U264 ( .A(a6[3]), .B(n624), .S0(n71), .Y(n429) );
  MX2XL U265 ( .A(a6[4]), .B(n625), .S0(n70), .Y(n430) );
  MX2XL U266 ( .A(a6[5]), .B(n626), .S0(n75), .Y(n431) );
  MX2XL U267 ( .A(a6[6]), .B(n627), .S0(n75), .Y(n432) );
  MX2XL U268 ( .A(a6[7]), .B(n628), .S0(n64), .Y(n433) );
  MX2XL U269 ( .A(a5[0]), .B(n629), .S0(n68), .Y(n434) );
  MX2XL U270 ( .A(a5[1]), .B(n630), .S0(n75), .Y(n435) );
  MX2XL U271 ( .A(a5[2]), .B(n631), .S0(n64), .Y(n436) );
  MX2XL U272 ( .A(a5[3]), .B(n632), .S0(n65), .Y(n437) );
  MX2XL U273 ( .A(a5[4]), .B(n633), .S0(n65), .Y(n438) );
  MX2XL U274 ( .A(a5[5]), .B(n634), .S0(n65), .Y(n439) );
  MX2XL U275 ( .A(a5[6]), .B(n635), .S0(n65), .Y(n440) );
  MX2XL U276 ( .A(a5[7]), .B(n636), .S0(n65), .Y(n441) );
  MX2XL U277 ( .A(a4[3]), .B(n640), .S0(n65), .Y(n445) );
  MX2XL U278 ( .A(a4[4]), .B(n641), .S0(n65), .Y(n446) );
  MX2XL U279 ( .A(a4[5]), .B(n642), .S0(n65), .Y(n447) );
  MX2XL U280 ( .A(a4[6]), .B(n643), .S0(n65), .Y(n448) );
  MX2XL U281 ( .A(a1[7]), .B(n669), .S0(n58), .Y(n474) );
  MX2XL U282 ( .A(a4[7]), .B(n644), .S0(n66), .Y(n449) );
  MX2XL U283 ( .A(a3[5]), .B(n650), .S0(n73), .Y(n455) );
  MX2XL U284 ( .A(a3[6]), .B(n651), .S0(n73), .Y(n456) );
  MX2XL U285 ( .A(a3[7]), .B(n652), .S0(n71), .Y(n457) );
  MX2XL U286 ( .A(a2[3]), .B(n656), .S0(n73), .Y(n461) );
  MX2XL U287 ( .A(a2[5]), .B(n658), .S0(n71), .Y(n463) );
  MX2XL U288 ( .A(a1[6]), .B(n667), .S0(n75), .Y(n472) );
  MX2XL U289 ( .A(a2[4]), .B(n657), .S0(n66), .Y(n462) );
  MX2XL U290 ( .A(a2[6]), .B(n659), .S0(n66), .Y(n464) );
  MX2XL U291 ( .A(a2[7]), .B(n660), .S0(n66), .Y(n465) );
  MX2XL U292 ( .A(a1[5]), .B(n666), .S0(n66), .Y(n471) );
  NOR2XL U293 ( .A(n578), .B(n576), .Y(n707) );
  NOR2XL U294 ( .A(n56), .B(n578), .Y(n711) );
  INVX1 U295 ( .A(n578), .Y(n814) );
  NOR3XL U296 ( .A(n5770), .B(n578), .C(n56), .Y(n155) );
  NAND3XL U297 ( .A(n56), .B(n23), .C(n578), .Y(n195) );
  NAND3XL U298 ( .A(n5770), .B(n814), .C(n576), .Y(n181) );
  NAND3XL U299 ( .A(n5770), .B(n56), .C(n578), .Y(n222) );
  NAND3XL U300 ( .A(n578), .B(n23), .C(n576), .Y(n209) );
  NAND3X2 U301 ( .A(n578), .B(n5770), .C(n576), .Y(n235) );
  NOR2XL U302 ( .A(i_start), .B(n5800), .Y(n109) );
  NOR2XL U303 ( .A(n103), .B(n576), .Y(cnt1_r[0]) );
  NOR2BXL U304 ( .AN(n576), .B(N141), .Y(n1420) );
  CLKBUFX3 U305 ( .A(n68), .Y(n65) );
  CLKBUFX3 U306 ( .A(n69), .Y(n64) );
  CLKBUFX3 U307 ( .A(n69), .Y(n63) );
  CLKBUFX3 U308 ( .A(n67), .Y(n66) );
  CLKBUFX3 U309 ( .A(n72), .Y(n68) );
  CLKBUFX3 U310 ( .A(n72), .Y(n69) );
  CLKBUFX3 U311 ( .A(n75), .Y(n58) );
  CLKBUFX3 U312 ( .A(n71), .Y(n60) );
  CLKBUFX3 U313 ( .A(n71), .Y(n59) );
  CLKBUFX3 U314 ( .A(n70), .Y(n61) );
  CLKBUFX3 U315 ( .A(n70), .Y(n62) );
  CLKBUFX3 U316 ( .A(n128), .Y(n85) );
  CLKBUFX3 U317 ( .A(n128), .Y(n86) );
  CLKBUFX3 U318 ( .A(n122), .Y(n87) );
  CLKBUFX3 U319 ( .A(n122), .Y(n88) );
  CLKBUFX3 U320 ( .A(n208), .Y(n89) );
  CLKBUFX3 U321 ( .A(n76), .Y(n90) );
  CLKBUFX3 U322 ( .A(n208), .Y(n91) );
  CLKBUFX3 U323 ( .A(n1430), .Y(n83) );
  CLKBUFX3 U324 ( .A(n1430), .Y(n84) );
  CLKBUFX3 U325 ( .A(n473), .Y(n119) );
  CLKBUFX3 U326 ( .A(n75), .Y(n71) );
  CLKBUFX3 U327 ( .A(n75), .Y(n70) );
  CLKBUFX3 U328 ( .A(n167), .Y(n82) );
  CLKBUFX3 U329 ( .A(n167), .Y(n81) );
  CLKBUFX3 U330 ( .A(n169), .Y(n80) );
  CLKBUFX3 U331 ( .A(n169), .Y(n79) );
  CLKBUFX3 U332 ( .A(n180), .Y(n78) );
  CLKBUFX3 U333 ( .A(n180), .Y(n77) );
  CLKBUFX3 U334 ( .A(n197), .Y(n128) );
  CLKBUFX3 U335 ( .A(n197), .Y(n122) );
  CLKBUFX3 U336 ( .A(n197), .Y(n1430) );
  CLKINVX1 U337 ( .A(n727), .Y(gt_2164_B_4_) );
  CLKINVX1 U338 ( .A(n120), .Y(gt_2164_B_5_) );
  CLKINVX1 U339 ( .A(n132), .Y(gt_2164_B_1_) );
  CLKINVX1 U340 ( .A(n135), .Y(gt_2164_B_0_) );
  CLKINVX1 U341 ( .A(gt_2164_B_6_), .Y(n749) );
  CLKINVX1 U342 ( .A(n117), .Y(gt_2164_B_6_) );
  INVX3 U343 ( .A(n140), .Y(n813) );
  CLKBUFX3 U344 ( .A(n57), .Y(n74) );
  CLKBUFX3 U345 ( .A(n57), .Y(n75) );
  NOR2BX1 U346 ( .AN(n92), .B(n802), .Y(o_median_finish) );
  CLKBUFX3 U347 ( .A(n194), .Y(n167) );
  CLKBUFX3 U348 ( .A(n194), .Y(n169) );
  CLKBUFX3 U349 ( .A(n194), .Y(n180) );
  CLKBUFX3 U350 ( .A(n208), .Y(n197) );
  AO22X1 U351 ( .A0(n724), .A1(mem_r_2__4_), .B0(n813), .B1(mem_r_1__4_), .Y(
        n262) );
  INVXL U352 ( .A(median_result[4]), .Y(n765) );
  INVXL U353 ( .A(mem_r_7__4_), .Y(n789) );
  AO22X1 U354 ( .A0(n724), .A1(mem_r_2__2_), .B0(n813), .B1(mem_r_1__2_), .Y(
        n270) );
  OAI22X1 U355 ( .A0(n725), .A1(n767), .B0(n726), .B1(n759), .Y(n271) );
  INVXL U356 ( .A(median_result[2]), .Y(n767) );
  INVXL U357 ( .A(mem_r_5__4_), .Y(n773) );
  INVXL U358 ( .A(mem_r_6__4_), .Y(n781) );
  NOR4X1 U359 ( .A(n256), .B(n257), .C(n258), .D(n259), .Y(n120) );
  OAI22XL U360 ( .A0(n721), .A1(n780), .B0(n722), .B1(n772), .Y(n256) );
  AO22X1 U361 ( .A0(n724), .A1(mem_r_2__5_), .B0(n813), .B1(mem_r_1__5_), .Y(
        n258) );
  OAI22X1 U362 ( .A0(n725), .A1(n764), .B0(n726), .B1(n756), .Y(n259) );
  INVXL U363 ( .A(median_result[5]), .Y(n764) );
  AO22X1 U364 ( .A0(n724), .A1(mem_r_2__1_), .B0(n813), .B1(mem_r_1__1_), .Y(
        n274) );
  NOR4X1 U365 ( .A(n272), .B(n273), .C(n274), .D(n275), .Y(n132) );
  INVXL U366 ( .A(median_result[1]), .Y(n768) );
  AO22X1 U367 ( .A0(n724), .A1(mem_r_2__0_), .B0(n813), .B1(mem_r_1__0_), .Y(
        n278) );
  NOR4X1 U368 ( .A(n276), .B(n277), .C(n278), .D(n279), .Y(n135) );
  OAI22XL U369 ( .A0(n721), .A1(n785), .B0(n722), .B1(n777), .Y(n276) );
  OAI22X1 U370 ( .A0(n725), .A1(n769), .B0(n726), .B1(n761), .Y(n279) );
  AO22X1 U371 ( .A0(n724), .A1(mem_r_2__3_), .B0(n813), .B1(mem_r_1__3_), .Y(
        n266) );
  NOR4X1 U372 ( .A(n264), .B(n265), .C(n266), .D(n267), .Y(n126) );
  OAI22XL U373 ( .A0(n721), .A1(n782), .B0(n722), .B1(n774), .Y(n264) );
  OAI22X1 U374 ( .A0(n725), .A1(n766), .B0(n726), .B1(n758), .Y(n267) );
  INVXL U375 ( .A(median_result[3]), .Y(n766) );
  INVXL U376 ( .A(mem_r_6__1_), .Y(n784) );
  OAI22XL U377 ( .A0(n725), .A1(n763), .B0(n726), .B1(n755), .Y(n255) );
  CLKINVX1 U378 ( .A(mem_r_3__6_), .Y(n755) );
  CLKINVX1 U379 ( .A(median_result[6]), .Y(n763) );
  NOR4X1 U380 ( .A(n252), .B(n253), .C(n254), .D(n255), .Y(n117) );
  OAI22XL U381 ( .A0(n721), .A1(n779), .B0(n722), .B1(n771), .Y(n252) );
  OAI22XL U382 ( .A0(n235), .A1(n795), .B0(n723), .B1(n787), .Y(n253) );
  AO22X1 U383 ( .A0(n724), .A1(mem_r_2__6_), .B0(n813), .B1(mem_r_1__6_), .Y(
        n254) );
  AO22X1 U384 ( .A0(n724), .A1(mem_r_2__7_), .B0(n813), .B1(mem_r_1__7_), .Y(
        n250) );
  OAI22XL U385 ( .A0(n725), .A1(n762), .B0(n726), .B1(n754), .Y(n251) );
  CLKINVX1 U386 ( .A(mem_r_3__7_), .Y(n754) );
  CLKINVX1 U387 ( .A(median_result[7]), .Y(n762) );
  OAI22XL U388 ( .A0(n235), .A1(n794), .B0(n723), .B1(n786), .Y(n249) );
  CLKINVX1 U389 ( .A(mem_r_8__7_), .Y(n794) );
  CLKINVX1 U390 ( .A(mem_r_7__7_), .Y(n786) );
  CLKBUFX3 U391 ( .A(n595), .Y(n733) );
  NOR2X1 U392 ( .A(n56), .B(n21), .Y(n710) );
  NAND3X1 U393 ( .A(n23), .B(n814), .C(n56), .Y(n140) );
  INVX3 U394 ( .A(n104), .Y(n802) );
  OR2X1 U395 ( .A(n95), .B(n94), .Y(n102) );
  NAND2X1 U396 ( .A(n104), .B(n95), .Y(n103) );
  NOR2X1 U397 ( .A(N143), .B(N322), .Y(n182) );
  CLKINVX1 U398 ( .A(N142), .Y(n812) );
  CLKINVX1 U399 ( .A(N141), .Y(n815) );
  CLKBUFX3 U400 ( .A(n76), .Y(n208) );
  CLKBUFX3 U401 ( .A(n76), .Y(n194) );
  AOI22X1 U402 ( .A0(n633), .A1(n733), .B0(n186), .B1(n520), .Y(n189) );
  AOI22X1 U403 ( .A0(n649), .A1(n734), .B0(n159), .B1(n536), .Y(n162) );
  CLKINVX1 U404 ( .A(n210), .Y(n803) );
  AOI22X1 U405 ( .A0(n617), .A1(n592), .B0(n213), .B1(n504), .Y(n216) );
  AOI22X1 U406 ( .A0(n552), .A1(n115), .B0(n665), .B1(n735), .Y(n124) );
  AOI22X1 U407 ( .A0(n646), .A1(n734), .B0(n159), .B1(n533), .Y(n165) );
  CLKINVX1 U408 ( .A(n37), .Y(n804) );
  AOI22X1 U409 ( .A0(n625), .A1(n733), .B0(n200), .B1(n512), .Y(n203) );
  AOI22X1 U410 ( .A0(n647), .A1(n734), .B0(n159), .B1(n534), .Y(n164) );
  AOI22X1 U411 ( .A0(n615), .A1(n592), .B0(n213), .B1(n502), .Y(n218) );
  AOI22X1 U412 ( .A0(n650), .A1(n735), .B0(n159), .B1(n537), .Y(n161) );
  AOI22X1 U413 ( .A0(n618), .A1(n592), .B0(n213), .B1(n505), .Y(n215) );
  CLKINVX1 U414 ( .A(n36), .Y(n808) );
  AOI22X1 U415 ( .A0(n657), .A1(n735), .B0(n146), .B1(n544), .Y(n149) );
  AOI22X1 U416 ( .A0(n648), .A1(n734), .B0(n159), .B1(n535), .Y(n163) );
  AOI22XL U417 ( .A0(n645), .A1(n734), .B0(n159), .B1(n532), .Y(n166) );
  AOI22X1 U418 ( .A0(n623), .A1(n592), .B0(n200), .B1(n510), .Y(n205) );
  AOI22XL U419 ( .A0(n613), .A1(n733), .B0(n213), .B1(n500), .Y(n220) );
  AOI22X1 U420 ( .A0(n622), .A1(n592), .B0(n200), .B1(n509), .Y(n206) );
  AOI22XL U421 ( .A0(n553), .A1(n115), .B0(n666), .B1(n735), .Y(n121) );
  OAI221X1 U422 ( .A0(n30), .A1(n36), .B0(n584), .B1(n144), .C0(n151), .Y(
        mem_r_1__2_) );
  AOI22X1 U423 ( .A0(n655), .A1(n734), .B0(n146), .B1(n542), .Y(n151) );
  AOI22X1 U424 ( .A0(n654), .A1(n732), .B0(n146), .B1(n541), .Y(n152) );
  AOI22XL U425 ( .A0(n635), .A1(n733), .B0(n186), .B1(n522), .Y(n187) );
  AOI22X1 U426 ( .A0(n639), .A1(n734), .B0(n172), .B1(n526), .Y(n177) );
  NAND3X2 U427 ( .A(n139), .B(n223), .C(n566), .Y(n224) );
  NAND3X2 U428 ( .A(n139), .B(n111), .C(n574), .Y(n113) );
  NAND3X2 U429 ( .A(n139), .B(n35), .C(n571), .Y(n170) );
  AOI22XL U430 ( .A0(n551), .A1(n115), .B0(n664), .B1(n735), .Y(n127) );
  OAI221X1 U431 ( .A0(n34), .A1(n36), .B0(n587), .B1(n144), .C0(n148), .Y(
        mem_r_1__5_) );
  AOI22X1 U432 ( .A0(n658), .A1(n732), .B0(n146), .B1(n545), .Y(n148) );
  AOI22XL U433 ( .A0(n651), .A1(n732), .B0(n159), .B1(n538), .Y(n160) );
  NAND2XL U434 ( .A(n478), .B(n139), .Y(n125) );
  AOI22XL U435 ( .A0(n619), .A1(n592), .B0(n213), .B1(n506), .Y(n214) );
  NAND3X2 U436 ( .A(n139), .B(n37), .C(n568), .Y(n198) );
  NAND2XL U437 ( .A(n477), .B(n139), .Y(n131) );
  OAI221X1 U438 ( .A0(n730), .A1(n36), .B0(n585), .B1(n144), .C0(n150), .Y(
        mem_r_1__3_) );
  AOI22X1 U439 ( .A0(n656), .A1(n735), .B0(n146), .B1(n543), .Y(n150) );
  OAI221X1 U440 ( .A0(n33), .A1(n590), .B0(n586), .B1(n237), .C0(n242), .Y(
        mem_r_8__4_) );
  AOI22X1 U441 ( .A0(n601), .A1(n591), .B0(n239), .B1(n488), .Y(n242) );
  NAND3X2 U442 ( .A(n139), .B(n36), .C(n573), .Y(n144) );
  AOI22XL U443 ( .A0(n548), .A1(n115), .B0(n661), .B1(n732), .Y(n136) );
  AOI22XL U444 ( .A0(n621), .A1(n592), .B0(n200), .B1(n508), .Y(n207) );
  OAI221X1 U445 ( .A0(n728), .A1(n35), .B0(n582), .B1(n170), .C0(n179), .Y(
        mem_r_3__0_) );
  OAI221X1 U446 ( .A0(n731), .A1(n37), .B0(n588), .B1(n198), .C0(n201), .Y(
        mem_r_5__6_) );
  AOI22XL U447 ( .A0(n627), .A1(n733), .B0(n200), .B1(n514), .Y(n201) );
  AOI22XL U448 ( .A0(n611), .A1(n592), .B0(n226), .B1(n498), .Y(n227) );
  AOI22XL U449 ( .A0(n554), .A1(n115), .B0(n667), .B1(n735), .Y(n118) );
  AOI22XL U450 ( .A0(n643), .A1(n734), .B0(n172), .B1(n530), .Y(n173) );
  OAI221X1 U451 ( .A0(n729), .A1(n590), .B0(n583), .B1(n237), .C0(n245), .Y(
        mem_r_8__1_) );
  OAI221X1 U452 ( .A0(n731), .A1(n36), .B0(n588), .B1(n144), .C0(n147), .Y(
        mem_r_1__6_) );
  AOI22XL U453 ( .A0(n659), .A1(n732), .B0(n146), .B1(n546), .Y(n147) );
  OAI221X1 U454 ( .A0(n34), .A1(n590), .B0(n587), .B1(n237), .C0(n241), .Y(
        mem_r_8__5_) );
  AOI22XL U455 ( .A0(n602), .A1(n591), .B0(n239), .B1(n489), .Y(n241) );
  NAND3X2 U456 ( .A(n139), .B(n590), .C(n564), .Y(n237) );
  AOI22XL U457 ( .A0(n599), .A1(n591), .B0(n239), .B1(n486), .Y(n244) );
  OAI221X1 U458 ( .A0(n730), .A1(n590), .B0(n585), .B1(n237), .C0(n243), .Y(
        mem_r_8__3_) );
  AOI22XL U459 ( .A0(n600), .A1(n591), .B0(n239), .B1(n487), .Y(n243) );
  NAND2XL U460 ( .A(n480), .B(n139), .Y(n116) );
  AOI22XL U461 ( .A0(n597), .A1(n591), .B0(n239), .B1(n484), .Y(n246) );
  BUFX4 U462 ( .A(n134), .Y(n728) );
  NAND2XL U463 ( .A(n476), .B(n139), .Y(n134) );
  OAI221X1 U464 ( .A0(n731), .A1(n590), .B0(n588), .B1(n237), .C0(n240), .Y(
        mem_r_8__6_) );
  AOI22XL U465 ( .A0(n603), .A1(n591), .B0(n239), .B1(n490), .Y(n240) );
  AOI22XL U466 ( .A0(n636), .A1(n733), .B0(n186), .B1(n523), .Y(n185) );
  AOI22XL U467 ( .A0(n620), .A1(n592), .B0(n213), .B1(n507), .Y(n212) );
  AOI22XL U468 ( .A0(n652), .A1(n734), .B0(n159), .B1(n539), .Y(n158) );
  NAND2X6 U469 ( .A(n565), .B(n563), .Y(n183) );
  OAI221X1 U470 ( .A0(n110), .A1(n37), .B0(n589), .B1(n198), .C0(n199), .Y(
        mem_r_5__7_) );
  AOI22XL U471 ( .A0(n628), .A1(n733), .B0(n200), .B1(n515), .Y(n199) );
  AOI22XL U472 ( .A0(n612), .A1(n592), .B0(n226), .B1(n499), .Y(n225) );
  AOI22XL U473 ( .A0(n555), .A1(n115), .B0(n669), .B1(n732), .Y(n114) );
  OAI221X1 U474 ( .A0(n110), .A1(n35), .B0(n589), .B1(n170), .C0(n171), .Y(
        mem_r_3__7_) );
  AOI22XL U475 ( .A0(n644), .A1(n734), .B0(n172), .B1(n531), .Y(n171) );
  OAI221X1 U476 ( .A0(n110), .A1(n36), .B0(n589), .B1(n144), .C0(n145), .Y(
        mem_r_1__7_) );
  AOI22XL U477 ( .A0(n660), .A1(n732), .B0(n146), .B1(n547), .Y(n145) );
  AND2XL U478 ( .A(n481), .B(n139), .Y(n42) );
  OAI221X1 U479 ( .A0(n110), .A1(n590), .B0(n589), .B1(n237), .C0(n238), .Y(
        mem_r_8__7_) );
  AOI22XL U480 ( .A0(n604), .A1(n591), .B0(n239), .B1(n491), .Y(n238) );
  NOR4X1 U481 ( .A(n248), .B(n249), .C(n250), .D(n251), .Y(n112) );
  OAI22XL U482 ( .A0(n721), .A1(n778), .B0(n722), .B1(n770), .Y(n248) );
  CLKBUFX3 U483 ( .A(n708), .Y(n719) );
  NOR2X1 U484 ( .A(n21), .B(n576), .Y(n708) );
  CLKBUFX3 U485 ( .A(n707), .Y(n720) );
  NAND2BX2 U486 ( .AN(n579), .B(n5770), .Y(n713) );
  CLKBUFX3 U487 ( .A(n168), .Y(n726) );
  CLKBUFX3 U488 ( .A(n222), .Y(n723) );
  CLKBUFX3 U489 ( .A(n155), .Y(n724) );
  CLKBUFX3 U490 ( .A(n195), .Y(n722) );
  CLKBUFX3 U491 ( .A(n181), .Y(n725) );
  CLKBUFX3 U492 ( .A(n209), .Y(n721) );
  AND2X2 U493 ( .A(n562), .B(n43), .Y(n104) );
  NAND4BX1 U494 ( .AN(N322), .B(n1420), .C(N143), .D(n812), .Y(n236) );
  NOR2BX1 U495 ( .AN(n182), .B(n812), .Y(n196) );
  NOR2BX1 U496 ( .AN(n182), .B(N142), .Y(n1410) );
  NOR2BX1 U497 ( .AN(n579), .B(n140), .Y(n247) );
  MXI2X1 U498 ( .A(n44), .B(n45), .S0(n63), .Y(n371) );
  OR2X1 U499 ( .A(n235), .B(n579), .Y(n44) );
  MXI2X1 U500 ( .A(n46), .B(n47), .S0(n64), .Y(n372) );
  OR2X1 U501 ( .A(n723), .B(n579), .Y(n46) );
  MXI2X1 U502 ( .A(n48), .B(n49), .S0(n69), .Y(n373) );
  OR2X1 U503 ( .A(n721), .B(n579), .Y(n48) );
  MXI2X1 U504 ( .A(n50), .B(n51), .S0(n65), .Y(n374) );
  OR2X1 U505 ( .A(n722), .B(n579), .Y(n50) );
  MXI2X1 U506 ( .A(n52), .B(n53), .S0(n68), .Y(n376) );
  OR2X1 U507 ( .A(n725), .B(n579), .Y(n52) );
  MXI2X1 U508 ( .A(n54), .B(n55), .S0(n71), .Y(n377) );
  OR2X1 U509 ( .A(n726), .B(n579), .Y(n54) );
  NOR2BXL U510 ( .AN(n724), .B(n579), .Y(n154) );
  NOR2XL U511 ( .A(n140), .B(n579), .Y(n137) );
  XOR2X1 U512 ( .A(n557), .B(n56), .Y(n105) );
  NAND4X1 U513 ( .A(n105), .B(n106), .C(n107), .D(n108), .Y(n95) );
  XOR2X1 U514 ( .A(n558), .B(n23), .Y(n107) );
  XOR2X1 U515 ( .A(n559), .B(n814), .Y(n106) );
  XNOR2XL U516 ( .A(n560), .B(n579), .Y(n108) );
  NOR2X1 U517 ( .A(n810), .B(n559), .Y(n96) );
  NOR2X1 U518 ( .A(n811), .B(n558), .Y(n98) );
  NOR2X1 U519 ( .A(n102), .B(n557), .Y(n100) );
  OAI21XL U520 ( .A0(n97), .A1(n802), .B0(n93), .Y(cnt2_r[2]) );
  AOI21X1 U521 ( .A0(n559), .A1(n810), .B0(n96), .Y(n97) );
  NOR3BXL U522 ( .AN(n560), .B(n802), .C(n96), .Y(cnt2_r[3]) );
  OAI21XL U523 ( .A0(n99), .A1(n802), .B0(n93), .Y(cnt2_r[1]) );
  NOR2BX1 U524 ( .AN(N143), .B(n103), .Y(cnt1_r[3]) );
  OAI21XL U525 ( .A0(n101), .A1(n802), .B0(n93), .Y(cnt2_r[0]) );
  OAI21XL U526 ( .A0(n92), .A1(n802), .B0(n93), .Y(state_r_0_) );
  NOR2X1 U527 ( .A(n103), .B(n815), .Y(cnt1_r[1]) );
  NOR2X1 U528 ( .A(n103), .B(n812), .Y(cnt1_r[2]) );
  MX2XL U529 ( .A(n593), .B(n56), .S0(N577), .Y(n398) );
  NOR4X1 U530 ( .A(n557), .B(n558), .C(n559), .D(n560), .Y(n94) );
  OR2X1 U531 ( .A(n5800), .B(n562), .Y(n93) );
  CLKBUFX3 U532 ( .A(n473), .Y(n76) );
  CLKINVX1 U533 ( .A(i_rst_n), .Y(n668) );
  CLKMX2X2 U534 ( .A(N338), .B(n476), .S0(n58), .Y(n281) );
  CLKMX2X2 U535 ( .A(N335), .B(n478), .S0(n58), .Y(n283) );
  CLKMX2X2 U536 ( .A(N333), .B(n479), .S0(n58), .Y(n284) );
  CLKMX2X2 U537 ( .A(N332), .B(n480), .S0(n58), .Y(n285) );
  MXI2X1 U538 ( .A(n25), .B(n753), .S0(N577), .Y(n286) );
  CLKMX2X2 U539 ( .A(N336), .B(n482), .S0(n58), .Y(n287) );
  CLKMX2X2 U540 ( .A(mem_r_8__0_), .B(n484), .S0(n58), .Y(n289) );
  CLKMX2X2 U541 ( .A(mem_r_8__1_), .B(n485), .S0(n58), .Y(n290) );
  CLKMX2X2 U542 ( .A(mem_r_8__2_), .B(n486), .S0(n58), .Y(n291) );
  CLKMX2X2 U543 ( .A(mem_r_8__3_), .B(n487), .S0(n58), .Y(n292) );
  CLKMX2X2 U544 ( .A(mem_r_8__4_), .B(n488), .S0(n58), .Y(n293) );
  CLKMX2X2 U545 ( .A(mem_r_8__5_), .B(n489), .S0(n75), .Y(n294) );
  CLKMX2X2 U546 ( .A(mem_r_8__6_), .B(n490), .S0(n65), .Y(n295) );
  CLKMX2X2 U547 ( .A(mem_r_8__7_), .B(n491), .S0(n70), .Y(n296) );
  CLKMX2X2 U548 ( .A(mem_r_7__0_), .B(n492), .S0(n71), .Y(n297) );
  CLKMX2X2 U549 ( .A(mem_r_7__1_), .B(n493), .S0(n73), .Y(n298) );
  CLKMX2X2 U550 ( .A(mem_r_7__2_), .B(n494), .S0(n70), .Y(n299) );
  CLKMX2X2 U551 ( .A(mem_r_7__3_), .B(n495), .S0(n71), .Y(n300) );
  CLKMX2X2 U552 ( .A(mem_r_7__4_), .B(n496), .S0(n62), .Y(n301) );
  CLKMX2X2 U553 ( .A(mem_r_7__5_), .B(n497), .S0(n61), .Y(n302) );
  CLKMX2X2 U554 ( .A(mem_r_7__6_), .B(n498), .S0(n59), .Y(n303) );
  CLKMX2X2 U555 ( .A(mem_r_7__7_), .B(n499), .S0(n60), .Y(n304) );
  CLKMX2X2 U556 ( .A(mem_r_6__0_), .B(n500), .S0(n75), .Y(n305) );
  CLKMX2X2 U557 ( .A(mem_r_6__1_), .B(n501), .S0(n73), .Y(n306) );
  CLKMX2X2 U558 ( .A(mem_r_6__2_), .B(n502), .S0(n59), .Y(n307) );
  CLKMX2X2 U559 ( .A(mem_r_6__3_), .B(n503), .S0(n59), .Y(n308) );
  CLKMX2X2 U560 ( .A(mem_r_6__4_), .B(n504), .S0(n59), .Y(n309) );
  CLKMX2X2 U561 ( .A(mem_r_6__5_), .B(n505), .S0(n59), .Y(n310) );
  CLKMX2X2 U562 ( .A(mem_r_6__6_), .B(n506), .S0(n59), .Y(n311) );
  CLKMX2X2 U563 ( .A(mem_r_6__7_), .B(n507), .S0(n59), .Y(n312) );
  CLKMX2X2 U564 ( .A(mem_r_5__0_), .B(n508), .S0(n59), .Y(n313) );
  CLKMX2X2 U565 ( .A(mem_r_5__1_), .B(n509), .S0(n59), .Y(n314) );
  CLKMX2X2 U566 ( .A(mem_r_5__2_), .B(n510), .S0(n59), .Y(n315) );
  CLKMX2X2 U567 ( .A(mem_r_5__3_), .B(n511), .S0(n59), .Y(n316) );
  CLKMX2X2 U568 ( .A(mem_r_5__4_), .B(n512), .S0(n59), .Y(n317) );
  CLKMX2X2 U569 ( .A(mem_r_5__5_), .B(n513), .S0(n59), .Y(n318) );
  CLKMX2X2 U570 ( .A(mem_r_5__6_), .B(n514), .S0(n59), .Y(n319) );
  CLKMX2X2 U571 ( .A(mem_r_5__7_), .B(n515), .S0(n60), .Y(n320) );
  CLKMX2X2 U572 ( .A(median_result[0]), .B(n516), .S0(n60), .Y(n321) );
  CLKMX2X2 U573 ( .A(median_result[1]), .B(n517), .S0(n60), .Y(n3220) );
  CLKMX2X2 U574 ( .A(median_result[2]), .B(n518), .S0(n60), .Y(n323) );
  CLKMX2X2 U575 ( .A(median_result[3]), .B(n519), .S0(n60), .Y(n324) );
  CLKMX2X2 U576 ( .A(median_result[4]), .B(n520), .S0(n60), .Y(n325) );
  CLKMX2X2 U577 ( .A(median_result[5]), .B(n521), .S0(n60), .Y(n326) );
  CLKMX2X2 U578 ( .A(median_result[6]), .B(n522), .S0(n60), .Y(n327) );
  CLKMX2X2 U579 ( .A(median_result[7]), .B(n523), .S0(n60), .Y(n328) );
  CLKMX2X2 U580 ( .A(mem_r_3__0_), .B(n524), .S0(n60), .Y(n329) );
  CLKMX2X2 U581 ( .A(mem_r_3__1_), .B(n525), .S0(n60), .Y(n330) );
  CLKMX2X2 U582 ( .A(n29), .B(n526), .S0(n60), .Y(n3310) );
  CLKMX2X2 U583 ( .A(mem_r_3__3_), .B(n527), .S0(n60), .Y(n3320) );
  CLKMX2X2 U584 ( .A(mem_r_3__4_), .B(n528), .S0(n61), .Y(n3330) );
  CLKMX2X2 U585 ( .A(mem_r_3__5_), .B(n529), .S0(n61), .Y(n334) );
  CLKMX2X2 U586 ( .A(mem_r_3__6_), .B(n530), .S0(n61), .Y(n3350) );
  CLKMX2X2 U587 ( .A(mem_r_3__7_), .B(n531), .S0(n61), .Y(n3360) );
  CLKMX2X2 U588 ( .A(mem_r_2__0_), .B(n532), .S0(n61), .Y(n3370) );
  CLKMX2X2 U589 ( .A(mem_r_2__1_), .B(n533), .S0(n61), .Y(n3380) );
  CLKMX2X2 U590 ( .A(mem_r_2__2_), .B(n534), .S0(n61), .Y(n339) );
  CLKMX2X2 U591 ( .A(mem_r_2__3_), .B(n535), .S0(n61), .Y(n340) );
  CLKMX2X2 U592 ( .A(mem_r_2__4_), .B(n536), .S0(n61), .Y(n341) );
  CLKMX2X2 U593 ( .A(mem_r_2__5_), .B(n537), .S0(n61), .Y(n342) );
  CLKMX2X2 U594 ( .A(mem_r_2__6_), .B(n538), .S0(n61), .Y(n343) );
  CLKMX2X2 U595 ( .A(mem_r_2__7_), .B(n539), .S0(n61), .Y(n344) );
  CLKMX2X2 U596 ( .A(mem_r_1__0_), .B(n540), .S0(n61), .Y(n345) );
  CLKMX2X2 U597 ( .A(mem_r_1__1_), .B(n541), .S0(n62), .Y(n346) );
  CLKMX2X2 U598 ( .A(mem_r_1__2_), .B(n542), .S0(n62), .Y(n347) );
  CLKMX2X2 U599 ( .A(mem_r_1__3_), .B(n543), .S0(n62), .Y(n348) );
  CLKMX2X2 U600 ( .A(mem_r_1__4_), .B(n544), .S0(n62), .Y(n349) );
  CLKMX2X2 U601 ( .A(mem_r_1__5_), .B(n545), .S0(n62), .Y(n350) );
  CLKMX2X2 U602 ( .A(mem_r_1__6_), .B(n546), .S0(n62), .Y(n351) );
  CLKMX2X2 U603 ( .A(mem_r_1__7_), .B(n547), .S0(n62), .Y(n352) );
  CLKMX2X2 U604 ( .A(mem_r_0__0_), .B(n548), .S0(n62), .Y(n353) );
  CLKMX2X2 U605 ( .A(mem_r_0__1_), .B(n549), .S0(n62), .Y(n354) );
  CLKMX2X2 U606 ( .A(mem_r_0__2_), .B(n550), .S0(n62), .Y(n355) );
  CLKMX2X2 U607 ( .A(mem_r_0__3_), .B(n551), .S0(n62), .Y(n356) );
  CLKMX2X2 U608 ( .A(mem_r_0__5_), .B(n553), .S0(n62), .Y(n358) );
  CLKMX2X2 U609 ( .A(mem_r_0__6_), .B(n554), .S0(n69), .Y(n359) );
  CLKMX2X2 U610 ( .A(mem_r_0__7_), .B(n555), .S0(n75), .Y(n360) );
  MXI2X1 U611 ( .A(n26), .B(n815), .S0(N577), .Y(n361) );
  CLKMX2X2 U612 ( .A(n557), .B(cnt2_r[0]), .S0(N580), .Y(n362) );
  CLKMX2X2 U613 ( .A(n558), .B(cnt2_r[1]), .S0(N580), .Y(n363) );
  CLKMX2X2 U614 ( .A(n559), .B(cnt2_r[2]), .S0(N580), .Y(n364) );
  CLKMX2X2 U615 ( .A(n560), .B(cnt2_r[3]), .S0(N580), .Y(n365) );
  CLKMX2X2 U616 ( .A(n562), .B(n561), .S0(n61), .Y(n366) );
  CLKMX2X2 U617 ( .A(n562), .B(state_r_0_), .S0(N580), .Y(n367) );
  CLKMX2X2 U618 ( .A(n1420), .B(n563), .S0(n70), .Y(n368) );
  CLKMX2X2 U619 ( .A(n247), .B(n564), .S0(n62), .Y(n369) );
  CLKMX2X2 U620 ( .A(n196), .B(n565), .S0(n75), .Y(n370) );
  CLKMX2X2 U621 ( .A(n1410), .B(n570), .S0(n72), .Y(n375) );
  CLKMX2X2 U622 ( .A(n154), .B(n573), .S0(n58), .Y(n378) );
  CLKMX2X2 U623 ( .A(n137), .B(n574), .S0(n58), .Y(n379) );
  CLKMX2X2 U624 ( .A(n576), .B(n575), .S0(n64), .Y(n380) );
  CLKMX2X2 U625 ( .A(n576), .B(cnt1_r[0]), .S0(N580), .Y(n381) );
  CLKMX2X2 U626 ( .A(n5770), .B(cnt1_r[1]), .S0(N580), .Y(n382) );
  CLKMX2X2 U627 ( .A(n578), .B(cnt1_r[2]), .S0(N580), .Y(n383) );
  CLKMX2X2 U628 ( .A(n579), .B(cnt1_r[3]), .S0(N580), .Y(n384) );
  CLKMX2X2 U629 ( .A(n5800), .B(o_median_finish), .S0(N580), .Y(n385) );
  CLKMX2X2 U630 ( .A(n670), .B(n581), .S0(n58), .Y(n386) );
  CLKMX2X2 U631 ( .A(n135), .B(n582), .S0(n65), .Y(n387) );
  CLKMX2X2 U632 ( .A(n132), .B(n583), .S0(n73), .Y(n388) );
  CLKMX2X2 U633 ( .A(n126), .B(n585), .S0(n69), .Y(n390) );
  CLKMX2X2 U634 ( .A(n727), .B(n586), .S0(n73), .Y(n391) );
  CLKMX2X2 U635 ( .A(n120), .B(n587), .S0(n73), .Y(n392) );
  CLKMX2X2 U636 ( .A(n117), .B(n588), .S0(n58), .Y(n393) );
  CLKMX2X2 U637 ( .A(n112), .B(n589), .S0(n67), .Y(n394) );
  CLKMX2X2 U638 ( .A(n236), .B(n590), .S0(n63), .Y(n395) );
  AO21X1 U639 ( .A0(n591), .A1(n66), .B0(n234), .Y(n396) );
  AO21X1 U640 ( .A0(n592), .A1(n66), .B0(n234), .Y(n397) );
  CLKMX2X2 U641 ( .A(n753), .B(n594), .S0(n63), .Y(n399) );
  AO21X1 U642 ( .A0(n595), .A1(n66), .B0(n234), .Y(n400) );
  NOR2X1 U643 ( .A(n66), .B(n562), .Y(n234) );
  CLKMX2X2 U644 ( .A(n815), .B(n596), .S0(n63), .Y(n401) );
  CLKMX2X2 U645 ( .A(a9[0]), .B(n597), .S0(n63), .Y(n402) );
  CLKMX2X2 U646 ( .A(a9[1]), .B(n598), .S0(n63), .Y(n403) );
  CLKMX2X2 U647 ( .A(a9[2]), .B(n599), .S0(n63), .Y(n404) );
  CLKMX2X2 U648 ( .A(a9[3]), .B(n600), .S0(n63), .Y(n405) );
  CLKMX2X2 U649 ( .A(a9[4]), .B(n601), .S0(n63), .Y(n406) );
  CLKMX2X2 U650 ( .A(a8[0]), .B(n605), .S0(n64), .Y(n410) );
  CLKMX2X2 U651 ( .A(a8[1]), .B(n606), .S0(n64), .Y(n411) );
  CLKMX2X2 U652 ( .A(a7[0]), .B(n613), .S0(n63), .Y(n418) );
  CLKMX2X2 U653 ( .A(a7[1]), .B(n614), .S0(n64), .Y(n419) );
  CLKMX2X2 U654 ( .A(a7[2]), .B(n615), .S0(n64), .Y(n420) );
  CLKMX2X2 U655 ( .A(a7[3]), .B(n616), .S0(n64), .Y(n421) );
  CLKMX2X2 U656 ( .A(a7[4]), .B(n617), .S0(n64), .Y(n422) );
  CLKMX2X2 U657 ( .A(a6[1]), .B(n622), .S0(n68), .Y(n427) );
  CLKMX2X2 U658 ( .A(a4[0]), .B(n637), .S0(n65), .Y(n442) );
  CLKMX2X2 U659 ( .A(a4[1]), .B(n638), .S0(n65), .Y(n443) );
  CLKMX2X2 U660 ( .A(a4[2]), .B(n639), .S0(n65), .Y(n444) );
  CLKMX2X2 U661 ( .A(a3[0]), .B(n645), .S0(n39), .Y(n450) );
  CLKMX2X2 U662 ( .A(a3[1]), .B(n646), .S0(n65), .Y(n451) );
  CLKMX2X2 U663 ( .A(a3[2]), .B(n647), .S0(n39), .Y(n452) );
  CLKMX2X2 U664 ( .A(a3[3]), .B(n648), .S0(n39), .Y(n453) );
  CLKMX2X2 U665 ( .A(a3[4]), .B(n649), .S0(n69), .Y(n454) );
  CLKMX2X2 U666 ( .A(a2[0]), .B(n653), .S0(n63), .Y(n458) );
  CLKMX2X2 U667 ( .A(a2[1]), .B(n654), .S0(n68), .Y(n459) );
  CLKMX2X2 U668 ( .A(a2[2]), .B(n655), .S0(n57), .Y(n460) );
  CLKMX2X2 U669 ( .A(a1[0]), .B(n661), .S0(n66), .Y(n466) );
  CLKMX2X2 U670 ( .A(a1[3]), .B(n664), .S0(n66), .Y(n469) );
  CLKMX2X2 U671 ( .A(a1[4]), .B(n665), .S0(n66), .Y(n470) );
  CLKINVX1 U672 ( .A(N577), .Y(n221) );
  CLKINVX1 U673 ( .A(n668), .Y(n473) );
  AO22X1 U674 ( .A0(median_result[0]), .A1(n719), .B0(mem_r_0__0_), .B1(n720), 
        .Y(n671) );
  AO22X1 U675 ( .A0(mem_r_6__0_), .A1(n719), .B0(mem_r_2__0_), .B1(n720), .Y(
        n672) );
  AOI221XL U676 ( .A0(mem_r_3__0_), .A1(n717), .B0(mem_r_7__0_), .B1(n718), 
        .C0(n672), .Y(n674) );
  NAND2X1 U677 ( .A(mem_r_8__0_), .B(n579), .Y(n673) );
  AOI221XL U678 ( .A0(mem_r_3__1_), .A1(n717), .B0(mem_r_7__1_), .B1(n718), 
        .C0(n677), .Y(n679) );
  NAND2X1 U679 ( .A(mem_r_8__1_), .B(n579), .Y(n678) );
  AOI221XL U680 ( .A0(mem_r_1__2_), .A1(n717), .B0(mem_r_5__2_), .B1(n718), 
        .C0(n681), .Y(n685) );
  AO22X1 U681 ( .A0(mem_r_6__2_), .A1(n719), .B0(mem_r_2__2_), .B1(n720), .Y(
        n682) );
  AOI221XL U682 ( .A0(mem_r_3__2_), .A1(n717), .B0(mem_r_7__2_), .B1(n718), 
        .C0(n682), .Y(n684) );
  NAND2X1 U683 ( .A(mem_r_8__2_), .B(n579), .Y(n683) );
  AO22X1 U684 ( .A0(median_result[3]), .A1(n719), .B0(mem_r_0__3_), .B1(n720), 
        .Y(n686) );
  AOI221XL U685 ( .A0(mem_r_1__3_), .A1(n717), .B0(mem_r_5__3_), .B1(n718), 
        .C0(n686), .Y(n690) );
  AO22X1 U686 ( .A0(mem_r_6__3_), .A1(n719), .B0(mem_r_2__3_), .B1(n720), .Y(
        n687) );
  AOI221XL U687 ( .A0(mem_r_3__3_), .A1(n717), .B0(mem_r_7__3_), .B1(n718), 
        .C0(n687), .Y(n689) );
  NAND2X1 U688 ( .A(mem_r_8__3_), .B(n579), .Y(n688) );
  AO22X1 U689 ( .A0(median_result[4]), .A1(n719), .B0(mem_r_0__4_), .B1(n720), 
        .Y(n691) );
  NAND2X1 U690 ( .A(mem_r_8__4_), .B(n579), .Y(n693) );
  AOI221XL U691 ( .A0(mem_r_3__5_), .A1(n717), .B0(mem_r_7__5_), .B1(n718), 
        .C0(n697), .Y(n699) );
  NAND2X1 U692 ( .A(mem_r_8__5_), .B(n579), .Y(n698) );
  AO22X1 U693 ( .A0(median_result[6]), .A1(n719), .B0(mem_r_0__6_), .B1(n720), 
        .Y(n701) );
  AOI221XL U694 ( .A0(mem_r_1__6_), .A1(n717), .B0(mem_r_5__6_), .B1(n718), 
        .C0(n701), .Y(n705) );
  AO22X1 U695 ( .A0(mem_r_6__6_), .A1(n719), .B0(mem_r_2__6_), .B1(n720), .Y(
        n702) );
  AOI221XL U696 ( .A0(mem_r_3__6_), .A1(n717), .B0(mem_r_7__6_), .B1(n718), 
        .C0(n702), .Y(n704) );
  NAND2X1 U697 ( .A(mem_r_8__6_), .B(n579), .Y(n703) );
  AO22X1 U698 ( .A0(median_result[7]), .A1(n719), .B0(mem_r_0__7_), .B1(n720), 
        .Y(n706) );
  AOI221XL U699 ( .A0(mem_r_1__7_), .A1(n717), .B0(mem_r_5__7_), .B1(n718), 
        .C0(n706), .Y(n716) );
  AO22X1 U700 ( .A0(mem_r_6__7_), .A1(n719), .B0(mem_r_2__7_), .B1(n720), .Y(
        n709) );
  NAND2X1 U701 ( .A(mem_r_8__7_), .B(n579), .Y(n712) );
  OAI221XL U702 ( .A0(n716), .A1(n715), .B0(n714), .B1(n713), .C0(n712), .Y(
        N331) );
  OAI31X4 U703 ( .A0(n735), .A1(n574), .A2(n809), .B0(n138), .Y(n115) );
  AOI21X1 U704 ( .A0(gt_2164_B_1_), .A1(n750), .B0(gt_2164_B_0_), .Y(n739) );
  NOR2BX1 U705 ( .AN(gt_2164_B_4_), .B(n670), .Y(n743) );
endmodule


module convolution ( a1, a2, a3, a4, a5, a6, a7, a8, a9, conv_result, 
        i_rst_n_INV, i_clk );
  input [7:0] a1;
  input [7:0] a2;
  input [7:0] a3;
  input [7:0] a4;
  input [7:0] a5;
  input [7:0] a6;
  input [7:0] a7;
  input [7:0] a8;
  input [7:0] a9;
  output [11:0] conv_result;
  input i_rst_n_INV, i_clk;
  wire   N8, N75, N74, N73, N72, N71, N70, N7, N69, N68, N67, N66, N64, N63,
         N62, N61, N60, N6, N59, N58, N57, N54, N53, N52, N51, N50, N5, N49,
         N48, N47, N46, N45, N44, N42, N41, N40, N4, N39, N38, N37, N36, N35,
         N34, N33, N30, N3, N29, N28, N27, N26, N25, N24, N23, N2, N19, N18,
         N17, N16, N15, N14, N13, N12, N11, N10, N1,
         add_0_root_add_0_root_add_2063_7_carry_2_,
         add_0_root_add_0_root_add_2063_7_carry_3_,
         add_0_root_add_0_root_add_2063_7_carry_4_,
         add_0_root_add_0_root_add_2063_7_carry_5_,
         add_0_root_add_0_root_add_2063_7_carry_6_,
         add_0_root_add_0_root_add_2063_7_carry_7_,
         add_0_root_add_0_root_add_2063_7_carry_8_,
         add_0_root_add_0_root_add_2063_4_carry_3_,
         add_0_root_add_0_root_add_2063_4_carry_4_,
         add_0_root_add_0_root_add_2063_4_carry_5_,
         add_0_root_add_0_root_add_2063_4_carry_6_,
         add_0_root_add_0_root_add_2063_4_carry_7_,
         add_0_root_add_0_root_add_2063_4_carry_8_,
         add_0_root_add_0_root_add_2063_4_carry_9_,
         add_0_root_add_0_root_add_2063_2_carry_2_,
         add_0_root_add_0_root_add_2063_2_carry_3_,
         add_0_root_add_0_root_add_2063_2_carry_4_,
         add_0_root_add_0_root_add_2063_2_carry_5_,
         add_0_root_add_0_root_add_2063_2_carry_6_,
         add_0_root_add_0_root_add_2063_2_carry_7_,
         add_0_root_add_0_root_add_2063_2_carry_8_, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3;
  wire   [8:2] add_1_root_add_0_root_add_2063_4_carry;

  convolution_DW01_add_7_DW01_add_24 add_1_root_add_0_root_add_2063_2 ( 
        .\A[7] (a1[7]), .\A[6] (a1[6]), .\A[5] (a1[5]), .\A[4] (a1[4]), 
        .\A[3] (a1[3]), .\A[2] (a1[2]), .\A[1] (a1[1]), .\A[0] (a1[0]), 
        .\B[7] (a3[7]), .\B[6] (a3[6]), .\B[5] (a3[5]), .\B[4] (a3[4]), 
        .\B[3] (a3[3]), .\B[2] (a3[2]), .\B[1] (a3[1]), .\B[0] (a3[0]), 
        .\SUM[8] (N8), .\SUM[7] (N7), .\SUM[6] (N6), .\SUM[5] (N5), .\SUM[4] (
        N4), .\SUM[3] (N3), .\SUM[2] (N2), .\SUM[1] (N1), .\SUM[0] (N10) );
  convolution_DW01_add_5_DW01_add_22 add_1_root_add_0_root_add_2063_7 ( 
        .\A[7] (a9[7]), .\A[6] (a9[6]), .\A[5] (a9[5]), .\A[4] (a9[4]), 
        .\A[3] (a9[3]), .\A[2] (a9[2]), .\A[1] (a9[1]), .\A[0] (a9[0]), 
        .\B[7] (a7[7]), .\B[6] (a7[6]), .\B[5] (a7[5]), .\B[4] (a7[4]), 
        .\B[3] (a7[3]), .\B[2] (a7[2]), .\B[1] (a7[1]), .\B[0] (a7[0]), 
        .\SUM[8] (N64), .\SUM[7] (N63), .\SUM[6] (N62), .\SUM[5] (N61), 
        .\SUM[4] (N60), .\SUM[3] (N59), .\SUM[2] (N58), .\SUM[1] (N57), 
        .\SUM[0] (N66) );
  convolution_DW01_add_1_DW01_add_18 add_1_root_add_0_root_add_2063_8 ( 
        .\A[9] (N19), .\A[8] (N18), .\A[7] (N17), .\A[6] (N16), .\A[5] (N15), 
        .\A[4] (N14), .\A[3] (N13), .\A[2] (N12), .\A[1] (N11), .\A[0] (N10), 
        .\B[9] (N75), .\B[8] (N74), .\B[7] (N73), .\B[6] (N72), .\B[5] (N71), 
        .\B[4] (N70), .\B[3] (N69), .\B[2] (N68), .\B[1] (N67), .\B[0] (N66), 
        .\SUM[10] (N54), .\SUM[9] (N53), .\SUM[8] (N52), .\SUM[7] (N51), 
        .\SUM[6] (N50), .\SUM[5] (N49), .\SUM[4] (N48), .\SUM[3] (N47), 
        .\SUM[2] (N46), .\SUM[1] (N45), .\SUM[0] (N44) );
  convolution_DW01_add_0_DW01_add_17 add_0_root_add_0_root_add_2063_8 ( .SUM(
        conv_result), .i_rst_n_INV(i_rst_n_INV), .i_clk(i_clk), .\A[10] (N42), 
        .\A[9] (N41), .\A[8] (N40), .\A[7] (N39), .\A[6] (N38), .\A[5] (N37), 
        .\A[4] (N36), .\A[3] (N35), .\A[2] (N34), .\A[1] (N33), .\B[10] (N54), 
        .\B[9] (N53), .\B[8] (N52), .\B[7] (N51), .\B[6] (N50), .\B[5] (N49), 
        .\B[4] (N48), .\B[3] (N47), .\B[2] (N46), .\B[1] (N45), .\B[0] (N44)
         );
  CMPR32X2 add_0_root_add_0_root_add_2063_2_U1_5 ( .A(a2[4]), .B(N5), .C(
        add_0_root_add_0_root_add_2063_2_carry_5_), .CO(
        add_0_root_add_0_root_add_2063_2_carry_6_), .S(N15) );
  ADDFHX4 add_1_root_add_0_root_add_2063_4_U1_3 ( .A(a6[2]), .B(a4[2]), .CI(
        add_1_root_add_0_root_add_2063_4_carry[3]), .CO(
        add_1_root_add_0_root_add_2063_4_carry[4]), .S(N24) );
  ADDFHX4 add_0_root_add_0_root_add_2063_4_U1_3 ( .A(a5[1]), .B(N24), .CI(
        add_0_root_add_0_root_add_2063_4_carry_3_), .CO(
        add_0_root_add_0_root_add_2063_4_carry_4_), .S(N35) );
  ADDFHX4 add_0_root_add_0_root_add_2063_7_U1_3 ( .A(a8[2]), .B(N59), .CI(
        add_0_root_add_0_root_add_2063_7_carry_3_), .CO(
        add_0_root_add_0_root_add_2063_7_carry_4_), .S(N69) );
  ADDFHX4 add_0_root_add_0_root_add_2063_2_U1_6 ( .A(a2[5]), .B(N6), .CI(
        add_0_root_add_0_root_add_2063_2_carry_6_), .CO(
        add_0_root_add_0_root_add_2063_2_carry_7_), .S(N16) );
  ADDFHX4 add_0_root_add_0_root_add_2063_2_U1_4 ( .A(a2[3]), .B(N4), .CI(
        add_0_root_add_0_root_add_2063_2_carry_4_), .CO(
        add_0_root_add_0_root_add_2063_2_carry_5_), .S(N14) );
  ADDFHX4 add_0_root_add_0_root_add_2063_7_U1_6 ( .A(a8[5]), .B(N62), .CI(
        add_0_root_add_0_root_add_2063_7_carry_6_), .CO(
        add_0_root_add_0_root_add_2063_7_carry_7_), .S(N72) );
  ADDFHX2 add_0_root_add_0_root_add_2063_2_U1_2 ( .A(a2[1]), .B(N2), .CI(
        add_0_root_add_0_root_add_2063_2_carry_2_), .CO(
        add_0_root_add_0_root_add_2063_2_carry_3_), .S(N12) );
  ADDFHX2 add_0_root_add_0_root_add_2063_2_U1_3 ( .A(a2[2]), .B(N3), .CI(
        add_0_root_add_0_root_add_2063_2_carry_3_), .CO(
        add_0_root_add_0_root_add_2063_2_carry_4_), .S(N13) );
  ADDFX1 add_0_root_add_0_root_add_2063_4_U1_9 ( .A(a5[7]), .B(N30), .CI(
        add_0_root_add_0_root_add_2063_4_carry_9_), .CO(N42), .S(N41) );
  ADDFX2 add_0_root_add_0_root_add_2063_4_U1_7 ( .A(a5[5]), .B(N28), .CI(
        add_0_root_add_0_root_add_2063_4_carry_7_), .CO(
        add_0_root_add_0_root_add_2063_4_carry_8_), .S(N39) );
  ADDFHX1 add_0_root_add_0_root_add_2063_4_U1_4 ( .A(a5[2]), .B(N25), .CI(
        add_0_root_add_0_root_add_2063_4_carry_4_), .CO(
        add_0_root_add_0_root_add_2063_4_carry_5_), .S(N36) );
  ADDFX2 add_0_root_add_0_root_add_2063_7_U1_8 ( .A(a8[7]), .B(N64), .CI(
        add_0_root_add_0_root_add_2063_7_carry_8_), .CO(N75), .S(N74) );
  ADDFHX2 add_0_root_add_0_root_add_2063_7_U1_2 ( .A(a8[1]), .B(N58), .CI(
        add_0_root_add_0_root_add_2063_7_carry_2_), .CO(
        add_0_root_add_0_root_add_2063_7_carry_3_), .S(N68) );
  ADDFXL add_1_root_add_0_root_add_2063_4_U1_7 ( .A(a6[6]), .B(a4[6]), .CI(
        add_1_root_add_0_root_add_2063_4_carry[7]), .CO(
        add_1_root_add_0_root_add_2063_4_carry[8]), .S(N28) );
  ADDFHX2 add_0_root_add_0_root_add_2063_7_U1_7 ( .A(a8[6]), .B(N63), .CI(
        add_0_root_add_0_root_add_2063_7_carry_7_), .CO(
        add_0_root_add_0_root_add_2063_7_carry_8_), .S(N73) );
  ADDFX2 add_0_root_add_0_root_add_2063_2_U1_7 ( .A(a2[6]), .B(N7), .CI(
        add_0_root_add_0_root_add_2063_2_carry_7_), .CO(
        add_0_root_add_0_root_add_2063_2_carry_8_), .S(N17) );
  ADDFX2 add_1_root_add_0_root_add_2063_4_U1_4 ( .A(a6[3]), .B(a4[3]), .CI(
        add_1_root_add_0_root_add_2063_4_carry[4]), .CO(
        add_1_root_add_0_root_add_2063_4_carry[5]), .S(N25) );
  ADDFHX2 add_0_root_add_0_root_add_2063_7_U1_4 ( .A(a8[3]), .B(N60), .CI(
        add_0_root_add_0_root_add_2063_7_carry_4_), .CO(
        add_0_root_add_0_root_add_2063_7_carry_5_), .S(N70) );
  ADDFHX4 add_1_root_add_0_root_add_2063_4_U1_2 ( .A(a6[1]), .B(a4[1]), .CI(
        add_1_root_add_0_root_add_2063_4_carry[2]), .CO(
        add_1_root_add_0_root_add_2063_4_carry[3]), .S(N23) );
  ADDFHX2 add_1_root_add_0_root_add_2063_4_U1_8 ( .A(a6[7]), .B(a4[7]), .CI(
        add_1_root_add_0_root_add_2063_4_carry[8]), .CO(N30), .S(N29) );
  ADDFHX4 add_0_root_add_0_root_add_2063_4_U1_8 ( .A(a5[6]), .B(N29), .CI(
        add_0_root_add_0_root_add_2063_4_carry_8_), .CO(
        add_0_root_add_0_root_add_2063_4_carry_9_), .S(N40) );
  ADDFX2 add_0_root_add_0_root_add_2063_4_U1_5 ( .A(a5[3]), .B(N26), .CI(
        add_0_root_add_0_root_add_2063_4_carry_5_), .CO(
        add_0_root_add_0_root_add_2063_4_carry_6_), .S(N37) );
  ADDFHX2 add_1_root_add_0_root_add_2063_4_U1_6 ( .A(a6[5]), .B(a4[5]), .CI(
        add_1_root_add_0_root_add_2063_4_carry[6]), .CO(
        add_1_root_add_0_root_add_2063_4_carry[7]), .S(N27) );
  ADDFHX2 add_0_root_add_0_root_add_2063_4_U1_6 ( .A(a5[4]), .B(N27), .CI(
        add_0_root_add_0_root_add_2063_4_carry_6_), .CO(
        add_0_root_add_0_root_add_2063_4_carry_7_), .S(N38) );
  ADDFX2 add_1_root_add_0_root_add_2063_4_U1_5 ( .A(a6[4]), .B(a4[4]), .CI(
        add_1_root_add_0_root_add_2063_4_carry[5]), .CO(
        add_1_root_add_0_root_add_2063_4_carry[6]), .S(N26) );
  ADDFHX2 add_0_root_add_0_root_add_2063_7_U1_5 ( .A(a8[4]), .B(N61), .CI(
        add_0_root_add_0_root_add_2063_7_carry_5_), .CO(
        add_0_root_add_0_root_add_2063_7_carry_6_), .S(N71) );
  ADDFHX4 add_0_root_add_0_root_add_2063_2_U1_8 ( .A(a2[7]), .B(N8), .CI(
        add_0_root_add_0_root_add_2063_2_carry_8_), .CO(N19), .S(N18) );
  AND2X2 U2 ( .A(a6[0]), .B(a4[0]), .Y(
        add_1_root_add_0_root_add_2063_4_carry[2]) );
  AND2X2 U3 ( .A(a2[0]), .B(N1), .Y(add_0_root_add_0_root_add_2063_2_carry_2_)
         );
  XOR2XL U4 ( .A(a4[0]), .B(a6[0]), .Y(N33) );
  AND2X1 U5 ( .A(a8[0]), .B(N57), .Y(add_0_root_add_0_root_add_2063_7_carry_2_) );
  XOR2X1 U6 ( .A(N57), .B(a8[0]), .Y(N67) );
  XOR2X1 U7 ( .A(N1), .B(a2[0]), .Y(N11) );
  AND2X1 U8 ( .A(a5[0]), .B(N23), .Y(add_0_root_add_0_root_add_2063_4_carry_3_) );
  XOR2X1 U9 ( .A(N23), .B(a5[0]), .Y(N34) );
endmodule


module convolution_DW01_add_0_DW01_add_17 ( SUM, i_rst_n_INV, i_clk, \A[10] , 
        \A[9] , \A[8] , \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , 
        \B[10] , \B[9] , \B[8] , \B[7] , \B[6] , \B[5] , \B[4] , \B[3] , 
        \B[2] , \B[1] , \B[0]  );
  output [11:0] SUM;
  input i_rst_n_INV, i_clk, \A[10] , \A[9] , \A[8] , \A[7] , \A[6] , \A[5] ,
         \A[4] , \A[3] , \A[2] , \A[1] , \B[10] , \B[9] , \B[8] , \B[7] ,
         \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0] ;
  wire   carry_10_, carry_9_, carry_8_, carry_7_, carry_6_, carry_5_, carry_4_,
         carry_3_, carry_2_, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [10:1] A;
  wire   [10:0] B;
  assign A[10] = \A[10] ;
  assign A[9] = \A[9] ;
  assign A[8] = \A[8] ;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign B[10] = \B[10] ;
  assign B[9] = \B[9] ;
  assign B[8] = \B[8] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  CMPR32X2 U1_10 ( .A(n9), .B(n6), .C(carry_10_), .CO(SUM[11]), .S(SUM[10]) );
  ADDFX2 U1_8 ( .A(n7), .B(n4), .CI(n3), .CO(carry_9_), .S(SUM[8]) );
  CMPR32X2 U1_9 ( .A(n8), .B(n5), .C(carry_9_), .CO(carry_10_), .S(SUM[9]) );
  DFFRX2 i_clk_r_REG104_S5 ( .D(B[9]), .CK(i_clk), .RN(n2), .Q(n5) );
  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry_7_), .CO(carry_8_), .S(SUM[7])
         );
  DFFRX2 i_clk_r_REG105_S5 ( .D(B[10]), .CK(i_clk), .RN(n2), .Q(n6) );
  DFFRX1 i_clk_r_REG362_S8 ( .D(A[8]), .CK(i_clk), .RN(n2), .Q(n7) );
  DFFRX1 i_clk_r_REG364_S8 ( .D(A[10]), .CK(i_clk), .RN(n2), .Q(n9) );
  ADDFHX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry_2_), .CO(carry_3_), .S(SUM[2])
         );
  DFFRX1 i_clk_r_REG363_S8 ( .D(A[9]), .CK(i_clk), .RN(n2), .Q(n8) );
  DFFRX1 i_clk_r_REG101_S5 ( .D(carry_8_), .CK(i_clk), .RN(n2), .Q(n3) );
  DFFRX1 i_clk_r_REG103_S5 ( .D(B[8]), .CK(i_clk), .RN(n2), .Q(n4) );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry_6_), .CO(carry_7_), .S(SUM[6])
         );
  ADDFHX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry_4_), .CO(carry_5_), .S(SUM[4])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry_3_), .CO(carry_4_), .S(SUM[3])
         );
  ADDFHX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry_5_), .CO(carry_6_), .S(SUM[5])
         );
  INVX3 U1 ( .A(i_rst_n_INV), .Y(n2) );
  CLKBUFX3 U2 ( .A(B[0]), .Y(SUM[0]) );
  AND2X1 U3 ( .A(A[1]), .B(B[1]), .Y(carry_2_) );
  XOR2X1 U4 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
endmodule


module convolution_DW01_add_1_DW01_add_18 ( \A[9] , \A[8] , \A[7] , \A[6] , 
        \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , \B[9] , \B[8] , \B[7] , 
        \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0] , \SUM[10] , 
        \SUM[9] , \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] , \SUM[3] , 
        \SUM[2] , \SUM[1] , \SUM[0]  );
  input \A[9] , \A[8] , \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] ,
         \A[0] , \B[9] , \B[8] , \B[7] , \B[6] , \B[5] , \B[4] , \B[3] ,
         \B[2] , \B[1] , \B[0] ;
  output \SUM[10] , \SUM[9] , \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] ,
         \SUM[3] , \SUM[2] , \SUM[1] , \SUM[0] ;
  wire   carry_9_, carry_8_, carry_7_, carry_6_, carry_5_, carry_4_, carry_3_,
         carry_2_, carry_1_;
  wire   [9:0] A;
  wire   [9:0] B;
  wire   [10:0] SUM;
  assign A[9] = \A[9] ;
  assign A[8] = \A[8] ;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign A[0] = \A[0] ;
  assign B[9] = \B[9] ;
  assign B[8] = \B[8] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;
  assign \SUM[10]  = SUM[10];
  assign \SUM[9]  = SUM[9];
  assign \SUM[8]  = SUM[8];
  assign \SUM[7]  = SUM[7];
  assign \SUM[6]  = SUM[6];
  assign \SUM[5]  = SUM[5];
  assign \SUM[4]  = SUM[4];
  assign \SUM[3]  = SUM[3];
  assign \SUM[2]  = SUM[2];
  assign \SUM[1]  = SUM[1];
  assign \SUM[0]  = SUM[0];

  ADDFHX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry_5_), .CO(carry_6_), .S(SUM[5])
         );
  ADDFHX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry_7_), .CO(carry_8_), .S(SUM[7])
         );
  ADDFHX4 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry_8_), .CO(carry_9_), .S(SUM[8])
         );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry_9_), .CO(SUM[10]), .S(SUM[9])
         );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry_6_), .CO(carry_7_), .S(SUM[6])
         );
  ADDFHX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry_2_), .CO(carry_3_), .S(SUM[2])
         );
  ADDFHX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry_4_), .CO(carry_5_), .S(SUM[4])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry_3_), .CO(carry_4_), .S(SUM[3])
         );
  ADDFHX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry_1_), .CO(carry_2_), .S(SUM[1])
         );
  AND2X1 U1 ( .A(A[0]), .B(B[0]), .Y(carry_1_) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module convolution_DW01_add_5_DW01_add_22 ( \A[7] , \A[6] , \A[5] , \A[4] , 
        \A[3] , \A[2] , \A[1] , \A[0] , \B[7] , \B[6] , \B[5] , \B[4] , \B[3] , 
        \B[2] , \B[1] , \B[0] , \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , 
        \SUM[4] , \SUM[3] , \SUM[2] , \SUM[1] , \SUM[0]  );
  input \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , \B[7] ,
         \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0] ;
  output \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] , \SUM[3] , \SUM[2] ,
         \SUM[1] , \SUM[0] ;

  wire   [7:0] A;
  wire   [7:0] B;
  wire   [8:0] SUM;
  wire   [7:1] carry;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign A[0] = \A[0] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;
  assign \SUM[8]  = SUM[8];
  assign \SUM[7]  = SUM[7];
  assign \SUM[6]  = SUM[6];
  assign \SUM[5]  = SUM[5];
  assign \SUM[4]  = SUM[4];
  assign \SUM[3]  = SUM[3];
  assign \SUM[2]  = SUM[2];
  assign \SUM[1]  = SUM[1];
  assign \SUM[0]  = SUM[0];

  CMPR32X2 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFHX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X1 U1 ( .A(A[0]), .B(B[0]), .Y(carry[1]) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module convolution_DW01_add_7_DW01_add_24 ( \A[7] , \A[6] , \A[5] , \A[4] , 
        \A[3] , \A[2] , \A[1] , \A[0] , \B[7] , \B[6] , \B[5] , \B[4] , \B[3] , 
        \B[2] , \B[1] , \B[0] , \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , 
        \SUM[4] , \SUM[3] , \SUM[2] , \SUM[1] , \SUM[0]  );
  input \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , \B[7] ,
         \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0] ;
  output \SUM[8] , \SUM[7] , \SUM[6] , \SUM[5] , \SUM[4] , \SUM[3] , \SUM[2] ,
         \SUM[1] , \SUM[0] ;

  wire   [7:0] A;
  wire   [7:0] B;
  wire   [8:0] SUM;
  wire   [7:1] carry;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign A[0] = \A[0] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;
  assign \SUM[8]  = SUM[8];
  assign \SUM[7]  = SUM[7];
  assign \SUM[6]  = SUM[6];
  assign \SUM[5]  = SUM[5];
  assign \SUM[4]  = SUM[4];
  assign \SUM[3]  = SUM[3];
  assign \SUM[2]  = SUM[2];
  assign \SUM[1]  = SUM[1];
  assign \SUM[0]  = SUM[0];

  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  AND2X8 U1 ( .A(A[0]), .B(B[0]), .Y(carry[1]) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule

