%% Figure 3B left panel (figure 1) & right panel (figure 2) 

clear all

coop = 1;
km1 = km_par(1,0,coop); % Bub1
km2 = km_par(0,1,coop); % BubR1


xt = [0:1:50,52:4:100,110:10:200];

 y1 = zeros(81,74);
 y2 = zeros(81,74);
 z1 = zeros(81,74);
 z2 = zeros(81,74);

BubR1_tot = 100;

for i = 1:length(xt)
   
     y1(:,i) = esac2_conc(xt(i),0,1,BubR1_tot);
     y2(:,i) = esac2_conc(xt(i),1,0,BubR1_tot);
    
end

BubR1_tot = 400;

for i = 1:length(xt)
   
     z1(:,i) = esac2_conc(xt(i),0,1,BubR1_tot);
     z2(:,i) = esac2_conc(xt(i),1,0,BubR1_tot);
    
end

bub1_01_11 = sum(y1.*km1');  % KI1*-KI2, Bub1:BubR1 = 1:1
bub1_01_14 = sum(z1.*km1');  % KI1*-KI2, Bub1:BubR1 = 1:4
bub1_10_11 = sum(y2.*km1');  % KI1-KI2*, Bub1:BubR1 = 1:1
bub1_10_14 = sum(z2.*km1');  % KI1-KI2*, Bub1:BubR1 = 1:4


bubr1_01_11 = sum(y1.*km2');  % KI1*-KI2, Bub1:BubR1 = 1:1
bubr1_01_14 = sum(z1.*km2');  % KI1*-KI2, Bub1:BubR1 = 1:4
bubr1_10_11 = sum(y2.*km2');  % KI1-KI2*, Bub1:BubR1 = 1:1
bubr1_10_14 = sum(z2.*km2');  % KI1-KI2*, Bub1:BubR1 = 1:4

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
plot(xt,bub1_01_11,'LineWidth',2,'color','b');
hold all
plot(xt,bub1_10_11,'LineWidth',2,'color','g');
plot(xt,bub1_01_14,'--','LineWidth',2,'color','b');
plot(xt,bub1_10_14,'--','LineWidth',2,'color','g');
legend('KI1*-KI2, Bub1:BubR1 = 1:1','KI1-KI2*, Bub1:BubR1 = 1:1','KI1*-KI2, Bub1:BubR1 = 1:4','KI1-KI2*, Bub1:BubR1 = 1:4');

set(gca,'FontSize',18,'LineWidth',1,'Box','off','TickDir','out');
xlabel('eSAC dosage (a.u.)')
ylabel('[MELpT-Bub1]');
xticklabels({'0','5','10','15','20'})
ylim([0,100]) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
plot(xt,bubr1_01_11,'LineWidth',2,'color','b');
hold all
plot(xt,bubr1_10_11,'LineWidth',2,'color','g');
plot(xt,bubr1_01_14,'--','LineWidth',2,'color','b');
plot(xt,bubr1_10_14,'--','LineWidth',2,'color','g');


set(gca,'FontSize',18,'LineWidth',1,'Box','off','TickDir','out');
xlabel('eSAC dosage (a.u.)')
ylabel('[MELpT-Bub1-BubR1]');
xticklabels({'0','5','10','15','20'})
