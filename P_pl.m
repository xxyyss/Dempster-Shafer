%Function for deteming  the bayesian probabilities with the plausibility
%   transformation method
%
%   [P(A)=Pl(A)/summ(Pl(x)) for all x]
%   

function [ P ] = P_pl( pl )

Keys = keys(pl);
single_keys = cell([1 log2(length(Keys))]);
single_pls = zeros([1 log2(length(Keys))]);

index = 1;
for i=2:length(Keys)
    if(length(Keys{i}) == 1)
        single_keys{index} = Keys{i};
        single_pls(index) = pl(single_keys{index});
        index = index + 1;   
    end;
end;

P = containers.Map(single_keys,single_pls/sum(single_pls));

end