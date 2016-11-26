function [y_est] = mybdt(x,y,xt)
%MYBDT Summary of this function goes here
%   Detailed explanation goes here
RegTreeEns = fitensemble(x,y,'LSBoost',100,'tree');
y_est = round(predict(RegTreeEns,xt));

end

