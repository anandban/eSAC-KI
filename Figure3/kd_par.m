%
% Forward and backward rates for Bub and BubR1 binding

function[p] = kd_par(k1,k2,BubR_tot)

Bub1_tot = 100; % in nM 
%BubR_tot = 100;


% Bub1 binding to MELT
Bf1 = 1;  Bf2 = 1; Bf3 = 1; Bf4 = 1;
Br1 = 0.1; Br2 = 0.1; Br3 = 1; Br4 = 0.1;
 
% BubR1 binding to Bub1
Rf1 = 1;  Rf2 = 1; Rf3 = 1; Rf4 = 1;
Rr1 = 0.1; Rr2 = 0.1; Rr3 = 0.1; Rr4 = 0.1;


% Bub1 and BubR1 binding to KI
Bfki = k1; Brki = 5/8; % 5/8 Bub1 KI1 binding
Rfki = k2; Rrki = 5/8; %  5/8 BubR1 KI2 binding
Bfki2 = 0*k2; Brki2 = 5; % Bub1 KI2 binding     


p.BT = Bub1_tot;
p.RT = BubR_tot;

p.Bf1 = Bf1;  
p.Bf2 = Bf2; 
p.Bf3 = Bf3; 
p.Bf4 = Bf4;  
p.Br1 = Br1; 
p.Br2 = Br2; 
p.Br3 = Br3; 
p.Br4 = Br4; 

p.Rf1 = Rf1;  
p.Rf2 = Rf2; 
p.Rf3 = Rf3; 
p.Rf4 = Rf4;  
p.Rr1 = Rr1; 
p.Rr2 = Rr2; 
p.Rr3 = Rr3; 
p.Rr4 = Rr4; 

p.Bfki = Bfki; 
p.Brki = Brki;
p.Rfki = Rfki; 
p.Rrki = Rrki;
p.Brki2 = Brki2;
p.Bfki2 = Bfki2;


% Bub1_tot = 100; % in nM 
% %BubR_tot = 100;
% 
% 
% % Bub1 binding to MELT
% Bf1 = 1;  Bf2 = 1; Bf3 = 1; Bf4 = 1;
% Br1 = 0.1; Br2 = 0.1; Br3 = 1; Br4 = 0.1;
%  
% % BubR1 binding to Bub1
% Rf1 = 1;  Rf2 = 1; Rf3 = 1; Rf4 = 1;
% Rr1 = 0.1/10; Rr2 = 0.1/10; Rr3 = 0.1/10; Rr4 = 0.1/10;
% 
% 
% % Bub1 and BubR1 binding to KI
% Bfki = k1; Brki = 4.5; % 7.5 Bub1 KI1 binding
% Rfki = k2; Rrki = 7; %  5 BubR1 KI2 binding
% Bfki2 = k2; Brki2 = 50; % Bub1 KI2 binding     

