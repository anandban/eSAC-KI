
% This script is used to calculate the time at which the cell exits mitosis.
% We assume that the cell exits mitosis when [CycB] < 1 nM. 
% The script simulates the ODE model given in Eq. 16(a) - 16(c) in the manuscript
% and outputs the time at which the [CycB] fall below 1 nM.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[sol] = exit_time(es,km)

global par eSAC_conc kasmcc

eSAC_conc = es;
kasmcc = km;
%**************************************************************************
% Time for integration
% ts=start time; tf=final time
%**************************************************************************
ts = 0;
tf = 60000; 

%**************************************************************************
% Initial conditions for the variables
%**************************************************************************

[par,z0] = esac2_par();
z0(2) = eSAC_conc;


%**************************************************************************
% Integration step
%**************************************************************************
options = odeset('Events',@my_exit);

        sol = ode15s(@esac_odes,[ts tf],z0,options);                      


end


function zp = esac_odes(t,z)

global par eSAC_conc kasmcc

CycB   = z(1);
eSACA  = z(2);
MCC    = z(3);
CAPP   = z(4);

%**************************************************************************
% Parameters 
%**************************************************************************

Cdc20T  = par.Cdc20T;
CAPPT   = par.CAPPT;
kscyc   = par.kscyc;
kdcyc   = par.kdcyc;
kdcyc20 = par.kdcyc20;
kancyc  = par.kancyc; 
kincapp = par.kincapp;
kimad20 = par.kimad20;
kdimcc  = par.kdimcc;
kacapp  = par.kacapp;
kicapp  = par.kicapp;


Cdc20 = Cdc20T-MCC;

zp = [kscyc - (kdcyc + kdcyc20*Cdc20)*CycB;
      kancyc*CycB*(eSAC_conc-eSACA) - kincapp*CAPP*eSACA;
      kasmcc*eSACA*Cdc20 - (kdimcc + kimad20*Cdc20)*MCC;
      kacapp*(CAPPT-CAPP) - kicapp*CycB*CAPP];
  
end
 

function [value,isterminal,direction] = my_exit(t,y)
% Locate the time when height passes through zero in a decreasing direction
% and stop integration.  Also locate both decreasing and increasing
% zero-crossings of velocity, and don't stop integration.
value = y(1)-1;      
isterminal = 1;
direction = 0;

end


