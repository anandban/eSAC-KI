%

function[p,ic] = esac2_par()

% Chosen parameters

CycBM  = 50; % conc in nM
Cdc20T = 25;  % conc in nM
Mad2T  = 50; % conc in nM 
CAPPT  = 50; % conc in nM

% Parameters from He model (PNAS)

kscyc   =  0.001*CycBM;
kdcyc   =  0.001; 
kdcyc20 =  0.1/Cdc20T; 
kancyc  =  1;
kincapp =  1;
kimad   =  0.1;
kdimcc  =  1;
kacapp  =  0.1;
kicapp  =  1/CycBM;
kimad20 =  0.25/Cdc20T; 


% Initial conditions

CycB   = 45; % conc in nM
eSACA  = 0;
MCC    = 25; % conc in nM
CAPP   = 5; % conc in nM

% CycB   = 34.1; % conc in nM
% eSACA  = 1;
% Mad2AT = 35; % conc in nM
% MCC    = 24.9; % conc in nM
% CAPP   = 6.4; % conc in nM


% Parameter values for deterministic simulation
    
    ic(1) = CycB;
    ic(2) = eSACA;
    ic(3) = MCC;
    ic(4) = CAPP;
    
    p.Cdc20T  =  Cdc20T;
    p.Mad2T   =  Mad2T;
    p.CycBM   =  CycBM;
    p.CAPPT   =  CAPPT;
    p.kscyc   =  kscyc;
    p.kdcyc   =  kdcyc;
    p.kdcyc20 =  kdcyc20;
    p.kancyc  =  kancyc;
    p.kincapp =  kincapp;
    p.kimad   =  kimad;
    p.kimad20 =  kimad20;
    p.kdimcc  =  kdimcc;
    p.kacapp  =  kacapp;
    p.kicapp  =  kicapp;

