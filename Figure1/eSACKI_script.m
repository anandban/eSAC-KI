%
% This function uses the SAC model described in Excel file to generate a .m
% file containing stochiometric matrix and propensity vector. The file is used 
% to create SACKT_yeast_ssa.m which contains the complete code for Gillespie 
% stochastic simulation of the model

function[] = eSACKI_script()

% Read different sheets of the Excel files

[ic,list1] = xlsread('He_Model_new.xlsx',1);
[~,list2] = xlsread('He_Model_new.xlsx',2);
[~,list3] = xlsread('He_Model_new.xlsx',3);
%[~,list4] = xlsread('He_Model_new.xlsx',4);


% Get rid of the headers by removing the top row
list1(1,:) = [];
list2(1,:) = [];
list3(1,:) = [];
%list4(1,:) = [];

% Define species, reactions and reaction rates
spc = list1(:,1);
rxn = list2(:,1);
%rxn_rate = list2(:,2);
rxn_rate = rx_rates();
%parm = list3;
constr = list3;


fp1 = fopen('He_model_odes.m','w');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Print constraints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i = 1:length(spc)
    
    constr = strrep(constr,spc(length(spc)-i+1),sprintf('z(%d)',length(spc)-i+1));
    
end



for i = 1:length(constr)
    
    fprintf(fp1,'%s;\n',constr{i});
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Print ode rates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(fp1,'\n\n');

fprintf(fp1,'zp = [');

for i = 1:length(spc)   
    
    for j = 1:length(rxn)
        
        [re,pr] = reac_prod(rxn{j});
        
        v1 = -sum(strcmp(spc(i),re));
        v2 = sum(strcmp(spc(i),pr));      
        
        if(v1+v2==1)
            
            fprintf(fp1,'+%s',rxn_rate{j});
            
        end
        
        if(v1+v2==-1)
            
            fprintf(fp1,'-%s',rxn_rate{j});
            
        end
    
    end
    
    fprintf(fp1,';\n');
    
end

fprintf(fp1,']');

fclose(fp1);


end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[r,p] = reac_prod(s)

    reaction = strsplit(s,'_');
    k = 1;
    while(strcmp(reaction(k),'Arrow')~=1)
        
        k = k+1;
        
    end
    
    r = reaction(1:k-1);
    p = reaction(k+1:end);

end

