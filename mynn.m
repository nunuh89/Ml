function [y_est] = mynn(x,y,xt)
net = newgrnn(x',y');
y_est = round(sim(net,xt'))';
end

