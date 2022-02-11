% This function plots the produces the data for ratio of saturation response for 1X and X1
% eSAC in contour format. 

% x axis = [BubR1]/[Bub1], y axis = k'_mcc/k_mcc 

%function[x,y,rat] = saturation_contourmap()

kamad_ratio = 0.1:0.05:1;
BubR1_tot = 50:10:300;
Bub1_tot = 100;

rat = zeros(length(BubR1_tot),length(kamad_ratio));


xt = 200;

for i = 1:length(BubR1_tot)
    
   for j = 1:length(kamad_ratio)
      
       [n1,k1] = kamad(xt,1,0,kamad_ratio(j),1,BubR1_tot(i));
       
       s = exit_time(n1,80*k1/1000); 
       
       tm1 = s.xe;
       
       
       [n2,k2] = kamad(xt,0,1,kamad_ratio(j),1,BubR1_tot(i));
       
       s = exit_time(n2,80*k2/1000); 
       
       tm2 = s.xe;
       
      
       rat(i,j) = tm1/tm2;
       x(i,j) = Bub1_tot/BubR1_tot(i);
       y(i,j) = 1/kamad_ratio(j);
              
   end
   
end

dlmwrite('contourdata.txt',rat);

v = 1:0.1:1.5;
[c,h] = contour(1./x,y,rat,v);
clabel(c,h);
h.LineWidth = 2;

set(gca,'FontSize',18,'Position',[0.1488    0.1706    0.8226    0.8024],'LineWidth',1);
xlabel('BubR1:Bub1 stochiometry')
ylabel('k''_{MCC}/k_{MCC}')
