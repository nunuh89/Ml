% decision trees
y=Fisher(1:70,1);
x=Fisher(1:70,2:5);
t = classregtree(x,y, 'method', 'classification');
%view(t);
xt=Fisher(71:150,2:5);
[y_est, node, labels] = eval(t, xt);
y_est=str2num(cell2mat(y_est));
yt=Fisher(71:150,1);
%Remp = sum(abs(yt-y_est)) / length(yt);%abs mean err
%%
%boosted decision tree
RegTreeEns = fitensemble(x,y,'LSBoost',100,'tree');
y_est1 = round(predict(RegTreeEns,xt));
%%
ysvm=y;
for i=1:length(y)
    if y(i)==1
        ysvm(i)=0;%med is not safe
    end
end
%%
svmStruct = svmtrain(x,ysvm,'Kernel_Function','rbf');
y_est2 = svmclassify(svmStruct,xt);
%%
svmStruct1 = svmtrain(x,ysvm,'Kernel_Function','quadratic');
y_est21 = svmclassify(svmStruct1,xt);
%%
mdl = ClassificationKNN.fit(x,y,'NumNeighbors',5);
y_est3 = predict(mdl,xt);
%%
mdl1 = ClassificationKNN.fit(x,y,'NumNeighbors',2);
y_est31 = predict(mdl1,xt);
%%
net = newgrnn(x',y');
y_est4 = round(sim(net,xt'))';









