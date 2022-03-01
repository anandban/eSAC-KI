%
% This function generates the time in mitosis curves. The inputs are
% k1 = 0 if KI1 is closed or 1 if open.
% k2 = 0 if KI2 is closed or 1 if open.
% km1 = Mad2 activation rate of Bub1, relative to Bub1:BubR1
% km2 = Mad2 activation rate of Bub1:BubR1, set to 1.

function[] = time_in_mitosis(k1,k2,km1,km2)

% Set [eSAC activator] at which time in mitosis will be calculated 

xt = [0:1:50,52:4:100,110:10:200];


% Calculate the n = average [eSAC] and k = average kasmcc.
[n,k] = kasmcc(xt,k1,k2,km1,km2,100);
k(1) = 0;

parfor i = 1:length(xt)
    
    s = exit_time(n(i),80*k(i)/1000); 
    tm(i) = s.xe;

end

plot(xt,tm,'LineWidth',2);




