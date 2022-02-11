% This function outputs K = the kamad values for eSAC will different MELT
% occupancy. 0000 = no Bub1 or 
% km1 = Mad2 activation rate of Bub1, relative to Bub1:BubR1
% km2 = Mad2 activation rate of Bub1:BubR1, set to 1.

function[K] = km_par(km1,km2,coop)


k1 = km1; k2 = km2;

km0000 = 0;
km0001 = k1; 
km0010 = k1;
km0100 = k1;
km1000 = k1;
km0011 = 2*k1;
km0101 = 2*k1;
km0110 = 2*k1;
km1001 = 2*k1;
km1010 = 2*k1; %10
km1100 = 2*k1;
km0111 = 3*k1;
km1011 = 3*k1;
km1101 = 3*k1;
km1110 = 3*k1;
km1111 = 4*k1;
km0002 = k2;
km0020 = k2;
km0200 = k2;
km2000 = k2; % 20
km0012 = k1+k2;
km0021 = k1+k2;
km0102 = k1+k2;
km0120 = k1+k2;
km0201 = k1+k2;
km0210 = k1+k2;
km1002 = k1+k2;
km1020 = k1+k2;
km1200 = k1+k2;
km2001 = k1+k2; % 30
km2010 = k1+k2;
km2100 = k1+k2;
km0112 = 2*k1+k2;
km0121 = 2*k1+k2;
km0211 = 2*k1+k2;
km1012 = 2*k1+k2;
km1021 = 2*k1+k2;
km1102 = 2*k1+k2;
km1120 = 2*k1+k2;
km1201 = 2*k1+k2; % 40
km1210 = 2*k1+k2; 
km2011 = 2*k1+k2;
km2101 = 2*k1+k2;
km2110 = 2*k1+k2;
km1112 = 3*k1+k2;
km1121 = 3*k1+k2;
km1211 = 3*k1+k2;
km2111 = 3*k1+k2;
km0022 = 2*k2;
km0202 = 2*k2; % 50
km0220 = 2*k2;
km2002 = 2*k2;
km2020 = 2*k2;
km2200 = 2*k2;
km0122 = k1+2*k2;
km0212 = k1+2*k2;
km0221 = k1+2*k2;
km1022 = k1+2*k2;
km1202 = k1+2*k2;
km1220 = k1+2*k2; % 60
km2012 = k1+2*k2;
km2021 = k1+2*k2;
km2102 = k1+2*k2;
km2120 = k1+2*k2;
km2201 = k1+2*k2;
km2210 = k1+2*k2;
km1122 = 2*k1+2*k2;
km1212 = 2*k1+2*k2;
km1221 = 2*k1+2*k2;
km2112 = 2*k1+2*k2; % 70
km2121 = 2*k1+2*k2;
km2211 = 2*k1+2*k2;
km0222 = 3*k2*coop;
km2022 = 3*k2*coop;
km2202 = 3*k2*coop;
km2220 = 3*k2*coop;
km1222 = k1+3*k2*coop;
km2122 = k1+3*k2*coop;
km2212 = k1+3*k2*coop;
km2221 = k1+3*k2*coop; % 80
km2222 = 4*k2*coop;


K = [km0000,km0001,km0010,km0100,km1000,km0011,km0101,km0110,km1001,km1010...
km1100,km0111,km1011,km1101,km1110,km1111,km0002,km0020,km0200,km2000,km0012...
km0021,km0102,km0120,km0201,km0210,km1002,km1020,km1200,km2001,km2010...
km2100,km0112,km0121,km0211,km1012,km1021,km1102,km1120,km1201,km1210...
km2011,km2101,km2110,km1112,km1121,km1211,km2111,km0022,km0202,km0220...
km2002,km2020,km2200,km0122,km0212,km0221,km1022,km1202,km1220,km2012...
km2021,km2102,km2120,km2201,km2210,km1122,km1212,km1221,km2112,km2121...
km2211,km0222,km2022,km2202,km2220,km1222,km2122,km2212,km2221,km2222];

