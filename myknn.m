function [y_est] = myknn(x,y,xt,n)
%MYKNN Summary of this function goes here
%   Detailed explanation goes here
mdl = ClassificationKNN.fit(x,y,'NumNeighbors',n);
y_est = predict(mdl,xt);

end

