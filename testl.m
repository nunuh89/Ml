%# load data
fid = fopen('car.data');
A = textscan(fid,'%s%s%s%s%s%s%s','delimiter',',');
fclose(fid);
%%
%# construct predicting attributes and target class
x1=A{1,1};
x2=A{1,2};
x3=A{1,3};
x4=A{1,4};
x5=A{1,5};
x = [x1 x2 x3 x4 x5];  %# mixed continous/discrete data
y = A{1,6};                        %# class labels

%# train classification decision tree
t = classregtree(x, y, 'method','classification', 'minparent',2,'prune','on','splitcriterion','gdi');
view(t)
%%
%# test
yPredicted = eval(t, x);
cm = confusionmat(y,yPredicted);           %# confusion matrix
N = sum(cm(:));
err = ( N-sum(diag(cm)) ) / N;             %# testing error

%# prune tree to avoid overfitting
tt = prune(t, 'level',3);
view(tt)

%# predict a new unseen instance
inst = [low med 4 more];
prediction = eval(tt, inst)    %# pred = 'Japan'