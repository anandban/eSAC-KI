%% Fig 3E

clear all

time_in_mitosis(1,1,0.1,1);
hold all
time_in_mitosis(0,1,0.1,1);
time_in_mitosis(1,0,0.1,1);
time_in_mitosis(0,0,0.1,1)
set(gca,'FontSize',18,'LineWidth',1,'Position',[0.1708    0.1849    0.7988    0.7952]);
xticks([0 50 100 150 200])
xticklabels({'0','5','10','15','20'})
xlabel('eSAC dosage');
ylabel('Time in mitosis (min)');
set(gca,'Box','off','TickDir','out');