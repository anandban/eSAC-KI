%%
function[rxr] = rx_rates()


[~,list1] = xlsread('He_Model_new.xlsx',1);
[~,list2] = xlsread('He_Model_new.xlsx',2);


% Get rid of the headers by removing the top row
list1(1,:) = [];
list2(1,:) = [];

% Define species, reactions and reaction rates
spc = list1(:,1);
rxn_rate = list2(:,2);

pfind = 1:length(spc);
pfind = pfind';

for i = 1:length(rxn_rate)
    
   rxn = strsplit(rxn_rate{i},'*');
   nv = [rxn{1}];
   
   for j = 2:length(rxn)
      
       pos = sum(pfind.*strcmp(rxn{j},spc));
       
       if(pos==0)
           
          nv = [nv,'*',rxn{j}];
          
       else
           
           
           nv = [nv,'*','z(',num2str(pos),')'];
           
       end
       
       
   end
    
   rxr{i} = nv;
   
end

