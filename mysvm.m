function [y_est] = mysvm(x,ysvm,xt)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

svmStruct = svmtrain(x,ysvm,'Kernel_Function','rbf');
y_est = svmclassify(svmStruct,xt);

end

