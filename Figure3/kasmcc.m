%
% This function returns the values of eSAC concentration (Nesac) and the
% effective kasmcc value (kmad). The input are:
% x = [eSAC activator complex] = [Mps1] (can be a vector)
% k1 = 0 if KI1 is closed or 1 if open.
% k2 = 0 if KI2 is closed or 1 if open.
% km1 = MCC formation rate of Bub1, relative to Bub1:BubR1
% km2 = MCC formation rate of Bub1:BubR1, set to 1.
% BubR1T = Total BubR1 concentration

function[Nesac,kmcc] = kasmcc(x,k1,k2,km1,km2,BubR1T)

xt = x;
coop = 2; % cooperativity among MELT repeats (when highly occupied by Bub1:BubR1)

K = km_par(km1,km2,coop); % read parameter values from km_par file.
    
y = zeros(81,length(xt));

parfor i = 1:length(xt)
        
    y(:,i) = esac2_conc(xt(i),k1,k2,BubR1T); 
        
end
       
S = 0;

for i = 1:length(K) 
    
    S = S + K(i)*y(i,:);
    
end
    
Nesac = sum(y(2:81,:));

kmcc = S./sum(y(2:81,:));
