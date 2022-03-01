% Fig 3D

clear all

T = load('contourdata.txt');

kasmcc_ratio = 0.1:0.05:1;
BubR1_tot = 50:10:300;
Bub1_tot = 100;

v = 1:0.1:1.4;
v = [v,1.45];

[c,h] = contour(BubR1_tot/Bub1_tot,1./kasmcc_ratio,T',v);
clabel(c,h);
h.LineWidth = 2;

set(gca,'FontSize',18,'Position',[0.1488    0.1706    0.8226    0.8024],'LineWidth',1);
xlabel('BubR1:Bub1 stochiometry')
ylabel('k''_{MCC}/k_{MCC}')