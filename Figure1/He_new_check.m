% 06/15/2020 - this file was created to calculate the exit time when
% [BubR1] changes over time due to MCC dissociation

%---------------------------------Authors----------------------------------
% Anand Banerjee
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%------------------------------Description---------------------------------
% This function file contains all the parameters and right hand side of the
% deterministic ODEs for the model for bistable anaphase switch given in
% He et. al (see equations S1-S5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[t,sol] = He_new_check(mp,es)

global par eSACT Mps1

eSACT = es;
Mps1  = mp;

%**************************************************************************
% Time for integration
% ts=start time; tf=final time
%**************************************************************************
ts = 0;
tf = 6000; 

%**************************************************************************
% Initial conditions for the variables
%**************************************************************************

[par,~] = He_par();

z0 = He_new_ic(mp,es);

%**************************************************************************
% Integration step
%**************************************************************************


        [t,sol] = ode15s(@esac_odes,[ts tf],z0);                      


end


function zp = esac_odes(t,z)

global par eSACT Mps1


%**************************************************************************
% Parameters 
%**************************************************************************

Cdc20T  = par.Cdc20T;
Mad2T   = par.Mad2T;
CAPPT   = par.CAPPT;
PhosT   = par.PhosT;
kscyc   = par.kscyc;
kdcyc   = par.kdcyc;
kdcyc20 = par.kdcyc20;
kancyc  = par.kancyc; 
kincapp = par.kincapp;
kimad20 = par.kimad20;
kasmcc1 = par.kasmcc1;
kdimcc  = par.kdimcc;
kacapp  = par.kacapp;
kicapp  = par.kicapp;
BubR1T  = par.BubR1T;
kases2  = par.kases2;
kdies2  = par.kdies2;
kdic1   = par.kdic1;
kfcdc   = par.kfcdc ;
krcdc   = par.krcdc; 
kasmcc2 = par.kasmcc2;
kasc1p  = par.kasc1p;
kasc1 =   par.kasc1;


Cdc20 = Cdc20T - z(10) - z(9) - z(8) - z(6) - z(4) - z(2) - z(13) - z(14);
Mad2I = Mad2T - (z(9) + z(10));
BubR1 = BubR1T - (z(10) + z(12) + z(14)) - (z(7) + z(5) + z(8) + z(6));
Bub1X = PhosT - eSACT - z(12) - z(13)  - z(14);
eSAC1I = eSACT -  (z(2) + z(3) + z(4) + z(5) + z(6) + z(7) + z(8));
CAPX = CAPPT - z(11);


zp = [+kscyc-kdcyc*z(1)-kdcyc20*z(1)*Cdc20;
+kfcdc*eSAC1I*Cdc20-krcdc*z(2)+kdies2*z(6)+kdies2*z(8);
+kancyc*eSAC1I*z(1)-kincapp*z(3)*z(11)-kases2*z(3)*BubR1+kdies2*z(7)-kfcdc*z(3)*Cdc20+krcdc*z(4)+kasmcc2*z(8)*Mad2I+kasc1*z(4)*Mad2I;
+kfcdc*z(3)*Cdc20-krcdc*z(4)-kasc1*z(4)*Mad2I;
-kancyc*z(5)*z(1)+kincapp*z(7)*z(11)-kfcdc*z(5)*Cdc20+krcdc*z(6);
-kdies2*z(6)+kfcdc*z(5)*Cdc20-krcdc*z(6);
+kases2*z(3)*BubR1-kdies2*z(7)+kancyc*z(5)*z(1)-kincapp*z(7)*z(11)-kfcdc*z(7)*Cdc20+krcdc*z(8)+kasc1p*z(8)*Mad2I;
-kdies2*z(8)+kfcdc*z(7)*Cdc20-krcdc*z(8)-kasmcc2*z(8)*Mad2I-kasc1p*z(8)*Mad2I;
-kdic1*z(9)-kasmcc1*BubR1*z(9)+kasc1p*z(8)*Mad2I+kasc1*z(4)*Mad2I;
+kasmcc1*BubR1*z(9)-kdimcc*z(10)-kimad20*z(10)*Cdc20+kasmcc2*z(8)*Mad2I;
+kacapp*CAPX-kicapp*z(11)*z(1);
+kases2*BubR1*Bub1X-kdies2*z(12)-kfcdc*Cdc20*z(12)+krcdc*z(14);
+kfcdc*Cdc20*Bub1X-krcdc*z(13)-kases2*BubR1*z(13)+kdies2*z(14);
+kfcdc*Cdc20*z(12)+kases2*BubR1*z(13)-kdies2*z(14)-krcdc*z(14);
];

end
 


