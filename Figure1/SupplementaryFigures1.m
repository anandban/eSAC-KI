
%% Figure S1A for plotting [eSAC activator complex] vs. [eSAC dosage] 

clear all

x = 1:1:200;
yt = 100; kd = 1;
y = ((kd+yt+x)-sqrt((kd+yt+x).^2 - 4*x*yt))/2;

plot(x,y,'LineWidth',2);
xlim([0,200]);
set(gca,'FontSize',18,'LineWidth',1,'position',[0.1517    0.1762    0.8090    0.7889]);
xlabel('[Mps1] (nM)');
ylabel('[eSAC activator complex] (nM)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Figure S1C for plotting MCC formation rates

clear all

% MCC formation rate for full Bub1 domain

x = 1:1:200;
yt = 100; kd = 1;
y = ((kd+yt+x)-sqrt((kd+yt+x).^2 - 4*x*yt))/2;

[t,z] = He_new_check(x(200),y(200));

kasmcc1 = 0.15/80;
kasmcc2 = 0.5;
BubR1T = 80;
Mad2T = 50;
p = 1;

BubR1 = BubR1T - (z(:,10) + z(:,12) + z(:,14)) - (z(:,7) + z(:,5) + z(:,8) + z(:,6));
Mad2I = Mad2T - (z(:,9) + z(:,10));
fslow = kasmcc1*BubR1.*z(:,9);
ffast = p*kasmcc2*Mad2I.*z(:,8);

plot(t,fslow+ffast,'LineWidth',2);
hold all
xlim([0,200]);
set(gca,'FontSize',18,'LineWidth',1,'Position',[0.1517    0.1706    0.8055    0.7992]);
xlabel('Time (min)');
ylabel('MCC formation rate (nM/min)');

%%
% MCC formation rate truncated Bub1 domain
% set the parameter kaes2 = 0 in He_par.m file

[t,z] = He_new_check(x(200),y(200));

kasmcc1 = 0.15/80;
kasmcc2 = 0.5;
BubR1T = 80;
Mad2T = 50;
p = 1;

BubR1 = BubR1T - (z(:,10) + z(:,12) + z(:,14)) - (z(:,7) + z(:,5) + z(:,8) + z(:,6));
Mad2I = Mad2T - (z(:,9) + z(:,10));
fslow = kasmcc1*BubR1.*z(:,9);
ffast = p*kasmcc2*Mad2I.*z(:,8);

plot(t,fslow+ffast,'LineWidth',2);

legend('full Bub1','truncated Bub1');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Figure S1D for plotting the relation between MCC formation rate and 
% concentration of catalyzing phosphodomain 

% truncated phosphodomain - set the parameter kaes2 = 0 in He_par_v6.m file

clear all

x = 1:1:200;
yt = 100; kd = 1;
y = ((kd+yt+x)-sqrt((kd+yt+x).^2 - 4*x*yt))/2;

[t,z] = He_new_check(x(200),y(200));

kasmcc1 = 0.15/80;
kasmcc2 = 0.5;
BubR1T = 80;
Mad2T = 50;
p = 1;

BubR1 = BubR1T - (z(:,10) + z(:,12) + z(:,14)) - (z(:,7) + z(:,5) + z(:,8) + z(:,6));
Mad2I = Mad2T - (z(:,9) + z(:,10));

rslow = kasmcc1*BubR1.*z(:,9);

figure(1)
plot(t,rslow,'LineWidth',2); 
hold all
plot(t,1.5*z(:,4),'LineWidth',2);
xlim([0,200]);
set(gca,'FontSize',18,'Linewidth',1,'Position',[0.1517    0.1706    0.8055    0.7992]);
xlabel('Time (min)');
ylabel('Concentration (nM/min)');
legend('MCC formation rate (cyt)','1.5\times[Bub1-Cdc20]')

%% 

% Full phosphodomain

figure

[t,z] = He_new_check(x(200),y(200));

BubR1 = BubR1T - (z(:,10) + z(:,12) + z(:,14)) - (z(:,7) + z(:,5) + z(:,8) + z(:,6));
Mad2I = Mad2T - (z(:,9) + z(:,10));

rfast = kasmcc2*Mad2I.*z(:,8);

plot(t,rfast,'LineWidth',2); 
hold all
plot(t,14*z(:,8),'LineWidth',2);
xlim([0,200]);
set(gca,'FontSize',18,'Linewidth',1,'Position',[0.1517    0.1706    0.8055    0.7992]);
xlabel('Time (min)');
ylabel('Concentration (nM)');
legend('MCC formation rate (phos)','14\times[Bub1-BubR1-Cdc20]')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Figure S1E for plotting Cyclin B degradation

% Cyclin B degradation for full Bub1 domain

clear all

x = 1:1:200;
yt = 100; kd = 1;
y = ((kd+yt+x)-sqrt((kd+yt+x).^2 - 4*x*yt))/2;

[t,z] = He_new_check(x(200),y(200));

plot(t,z(:,1),'LineWidth',2);
hold all
set(gca,'FontSize',18,'LineWidth',1);
set(gca,'position',[0.1389    0.1706    0.8158    0.7929])
xlim([0,200])
xlabel('Time (min)');
ylabel('[Cyclin B] (nM)');

%%

% Cyclin B degradation for truncated Bub1 domain
% set the parameter kaes2 = 0 in He_par_v6.m file

[t,z] = He_new_check(x(200),y(200));

plot(t,z(:,1),'LineWidth',2);
set(gca,'FontSize',18,'LineWidth',1);

legend('full Bub1','truncated Bub1');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
