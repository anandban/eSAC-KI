%

function[p,ic] = He_par()

% Chosen parameters

CycBM  = 50; % conc in nM
Cdc20T = 25;  % conc in nM
Mad2T  = 50; % conc in nM 
CAPPT  = 50; % conc in nM
BubR1T = 80; % conc in nM
PhosT  = 200; % conc in nM   

% Parameters
prob = 1;  %% *0

kdic1   =  1; 
kscyc   =  0.001*CycBM;
kdcyc   =  0.001;
kdcyc20 =  1/Cdc20T; 
kancyc  =  1; 
kincapp =  1; 
kimad20 =  0.2/Cdc20T; 
kasmcc1 =  0.15/BubR1T; 
kdimcc  =  0.2/10;      
kacapp  =  0.1; 
kicapp  =  1/CycBM; 
kases2  =  0.4/BubR1T; %% *0
kdies2  =  1; 
kfcdc   =  3/Cdc20T; 
krcdc   =  5;
kasmcc2 =  0.5*prob; 
kasc1p  =  0.5*(1-prob);
kasc1   =  0.5;



% Initial conditions

CycB         = 45; % conc in nM
eSAC1I_Cdc20 = 0;
eSAC1A       = 0;
eSAC1A_Cdc20 = 0;
eSAC2I       = 0;
eSAC2I_Cdc20 = 0;
eSAC2A       = 0;
eSAC2A_Cdc20 = 0;
C1           = 0; % Mad2A:Cdc20
MCC          = 25; % conc in nM
CAPP         = 5; % conc in nM
BubR1_Bub1X  = 0;
Cdc20_Bub1X  = 0;
Cdc20_BubR1_Bub1X = 0;


% Parameter values for deterministic simulation
    
    ic(1)  = CycB;
    ic(2)  = eSAC1I_Cdc20;
    ic(3)  = eSAC1A;
    ic(4)  = eSAC1A_Cdc20;
    ic(5)  = eSAC2I;
    ic(6)  = eSAC2I_Cdc20;
    ic(7)  = eSAC2A;
    ic(8)  = eSAC2A_Cdc20;    
    ic(9)  = C1;
    ic(10) = MCC;
    ic(11) = CAPP;
    ic(12) = BubR1_Bub1X;
    ic(13) = Cdc20_Bub1X;
    ic(14) = Cdc20_BubR1_Bub1X;
    
    p.Cdc20T  =  Cdc20T;
    p.Mad2T   =  Mad2T;
    p.CycBM   =  CycBM;
    p.CAPPT   =  CAPPT;
    p.PhosT   =  PhosT;
    p.BubR1T  =  BubR1T;    
    p.kscyc   =  kscyc;
    p.kdcyc   =  kdcyc;
    p.kdcyc20 =  kdcyc20;
    p.kancyc  =  kancyc;
    p.kincapp =  kincapp;
    p.kimad20 =  kimad20;
    p.kasmcc1 =  kasmcc1;
    p.kdimcc  =  kdimcc;
    p.kacapp  =  kacapp;
    p.kicapp  =  kicapp;
    p.kases2  =  kases2;
    p.kdies2  =  kdies2;
    p.kdic1   =  kdic1;
    p.kfcdc   =  kfcdc;
    p.krcdc   =  krcdc; 
    p.kasmcc2 =  kasmcc2;
    p.kasc1p =   kasc1p;
    p.kasc1 =    kasc1;
