x=randn(1000,1); 
z=randn(1000,1); 
correlation=0.1 ;
y=correlation*x + sqrt(1-correlation^2)*z ; 
clear z 
corrcoef(x,y)
stats=regstats(y,x,'linear',{'tstat'}) 
save