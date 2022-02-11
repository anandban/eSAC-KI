%% Figure 1E

clear all

x = 1:1:200;
yt = 100; kd = 1;
y = ((kd+yt+x)-sqrt((kd+yt+x).^2 - 4*x*yt))/2;

% dose-reponse curve for full Bub1 domain
for i = 1:length(y)
s = He_new(x(i),y(i));
et(i) = s.xe;
end
plot(x,et,'LineWidth',2,'Color','r');
xlabel('[eSAC activator complex]');
ylabel('Mitosis duration (min)')
set(gca,'FontSize',18,'Linewidth',1,'Position',[0.1517    0.1706    0.8055    0.7992]);

hold all

%%
% dose-reponse curve for truncated Bub1 domain
% set the parameter kaes2 = 0 in He_par_v6.m file


for i = 1:length(y)
s = He_new(x(i),y(i));
et(i) = s.xe;
end
plot(x,et,'-','LineWidth',2,'Color','b');

%%
% dose-reponse curve for full Bub1 domain but BubR1 does not contribute to
% MCC formation
% set the parameter p = 0 in He_par_v6.m file

for i = 1:length(y)
s = He_new(x(i),y(i));
et(i) = s.xe;
end
plot(x,et,'--','LineWidth',2,'Color','r');