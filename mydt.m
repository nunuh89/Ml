function [y_est] = mydt(x,y,xt)
%MYDT Summary of this function goes here
%   Detailed explanation goes here
t = classregtree(x,y, 'method', 'classification');
%view(t);
[y_est, ~, ~] = eval(t, xt);
y_est=str2num(cell2mat(y_est));
end

