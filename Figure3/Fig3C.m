%% Figure 3C left

clear all

coop = 1;

km2 = km_par(0,1,coop); % BubR1


xt = 200;

BubR1_tot = (0.25:0.25:4)*100;

for i = 1:length(BubR1_tot)

        y1 = esac2_conc(xt,0,1,BubR1_tot(i));
        y2 = esac2_conc(xt,1,0,BubR1_tot(i));
        
        bubr1_01(i) = sum(y1.*km2');  % KI1*-KI2
        bubr1_10(i) = sum(y2.*km2');  % KI1-KI2*
    
end


figure
plot(BubR1_tot/100,bubr1_01,'.-','MarkerSize',20,'LineWidth',2,'color','b');
hold all
plot(BubR1_tot/100,bubr1_10,'.-','MarkerSize',20,'LineWidth',2,'color','g');
legend('KI1*-KI2','KI1-KI2*','Position',[0.6292    0.2496    0.2351    0.1409]);

set(gca,'FontSize',18,'LineWidth',1,'Position',[0.1637    0.1881    0.8077    0.7817]);
set(gca,'Box','off','TickDir','out');
xlabel('BubR1:Bub1 stochiometry')
ylabel({'[MELpT-Bub1-BubR1]'});
ylim([0,100])

%% Figure 3C right

clear all

coop = 2;

km2 = km_par(0,1,coop); % BubR1

xt = 200;

BubR1_tot = (0.25:0.25:4)*100;

for i = 1:length(BubR1_tot)

    % KI1*-KI2
    [n,k] = kamad(xt,0,1,0.1,1,BubR1_tot(i));    
    s = exit_time(n,80*k/1000);
    tm_01(i) = s.xe;
        
    % KI1-KI2*
    [n,k] = kamad(xt,1,0,0.1,1,BubR1_tot(i));    
    s = exit_time(n,80*k/1000);
    tm_10(i) = s.xe;
    
end


figure
plot(BubR1_tot/100,tm_10./tm_01,'.-','MarkerSize',20,'LineWidth',2,'color','b');

set(gca,'FontSize',18,'LineWidth',1,'Position',[0.1398    0.1706    0.8329    0.7976]);
set(gca,'Box','off','TickDir','out');
grid('on');
xlabel('BubR1:Bub1 stochiometry')
ylabel('Ratio');
ylim([0.8,2])
