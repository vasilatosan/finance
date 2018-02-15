M = randn(1000,2);
R = [1 0.1; 0.1 1];
D = chol(R); 
M=M*D; 
x = M(:,1);
y = M(:,2); 
corr(x,y) 
STATS=regstats(x,y,'linear',{'tstat'}) 
save