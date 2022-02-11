% This file contains the scripts used to create the supplementary figures
% for Figure 3

%% Figure S3A

clear all

xt = [0:1:50,52:4:100,110:10:200];
y = zeros(81,length(xt));

parfor i = 1:length(xt)
        
    y(:,i) = esac2_conc(xt(i),0,0,100); 
        
end


plot(xt,y(20,:),'LineWidth',2)
hold all
plot(xt,y(54,:),'LineWidth',2)
plot(xt,y(75,:),'LineWidth',2)
plot(xt,y(81,:),'LineWidth',2)
set(gca,'FontSize',18,'Box','off','TickDir','out');
xticks([0 50 100 150 200])
xticklabels({'0','50','100','150','200'})
xlabel('[eSAC]');
ylabel('Concentration (nM)');
legend('2000','2200','2202','2222','position',[0.7536    0.4329    0.1780    0.2734]);
set(gca,'position',[0.1300    0.1825    0.8333    0.7879],'LineWidth',1);

%% Figure S3B - Cyclin B degredation

clear all

xt = 100;

[n,k] = kamad(xt,1,1,0,1,100);
[t,y] = esac_model(n,k*80/1000);
plot(t,y(:,1),'LineWidth',2,'Color',[0.9294    0.6941    0.1255]);
hold all

[n,k] = kamad(xt,0,1,0,1,100);
[t,y] = esac_model(n,k*80/1000);
plot(t,y(:,1),'LineWidth',2,'Color',[0,0,1]);

[n,k] = kamad(xt,1,0,0,1,100);
[t,y] = esac_model(n,k*80/1000);
plot(t,y(:,1),'LineWidth',2,'Color',[0.4667    0.6745    0.1882]);

[n,k] = kamad(xt,0,0,0,1,100);
[t,y] = esac_model(n,k*80/1000);
plot(t,y(:,1),'LineWidth',2,'Color',[1,0,1]);


plot([60,200],[1,1],'--','LineWidth',2,'Color',[0,0,0]);

xlim([0,200]);
set(gca,'FontSize',18,'LineWidth',1,'Position',[0.1300    0.1825    0.8265    0.7833]);
xlabel('Time elapsed (min)');
ylabel('[Cyclin B]');
legend('KI1-KI2','KI1*-KI2','KI1-KI2*','KI1*-KI2*');
set(gca,'Box','off','TickDir','out');

 
%% Fig S3D 

% To make the curves with cooeprativity - run the code.

% To make the curves without cooperativity - set coop = 1 in kamad.m and
% then run the code.

clear all

time_in_mitosis(1,1,0.1,1);
hold all
time_in_mitosis(0,1,0.1,1);
time_in_mitosis(1,0,0.1,1);
time_in_mitosis(0,0,0.1,1)
set(gca,'FontSize',18,'LineWidth',1,'Position',[0.1517    0.1881    0.8126    0.7849]);
set(gca,'Box','off','TickDir','out');
xticks([0 50 100 150 200])
xticklabels({'0','5','10','15','20'})
xlabel('[eSAC]');
ylabel('Time in mitosis (min)');
ylim([0,200]);


