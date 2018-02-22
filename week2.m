clear all
load('exercise2.mat')
expectedreturn=nanmean(AverageValueWeightedReturnsMonthly);
risk=cov(AverageValueWeightedReturnsMonthly,'partialrows'); 
p=Portfolio('AssetMean',expectedreturn,'AssetCovar',risk, 'LowerBound',0,'UpperBound',1,'Budget',1); 
%estimate frontier
frontier=estimateFrontier(p,1000); 

%plotting process
figure(1);
plotFrontier(p,1000);
%estimate maxsharpe
maxsharpeportfolio=estimateMaxSharpeRatio(p);
%estimate expected return and risk of the max sharpe portfolio
[risk,expectedret]=estimatePortMoments(p,maxsharpeportfolio);
hold on
%plot efficient frontier with max sharpe portfolio
plot(risk,expectedret,'rs')
%end process

%create table of weights and names 
load('IndustriesNames.mat'); 
MaxSharpeWithNames= [ reshape(IndustriesNames, 49,1  ), round(maxsharpeportfolio ,2)]; 
