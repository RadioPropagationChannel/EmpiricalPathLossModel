% fascicleFigures

clear, clc, close all

rng('default')     % we get always the same outcome
% rng('shuffle')   % we get different results with each draw

N = 30;     % number of data points
dataStd = 0.25;
maxX = 10;

a0 = 3;
a1 = 0.25;

% create data set

x = rand(1,N)*maxX;

x = sort(x);

y = a0 + a1*x + randn(1,N)*dataStd;

xAxis = (0:maxX);

A = polyfit(x,y,1);
new_a1 = A(1)
new_a0 = A(2)

yModel = polyval(A, xAxis);

yRegr = polyval(A,x);

residuals = y - yRegr;
mean(residuals)
std(residuals)

figure, hold on, grid on
plot(x,y,'or', 'LineWidth',2)
plot(xAxis, yModel,'b', 'LineWidth',2)
for ii = 1:N
    plot([x(ii) x(ii)], [y(ii) yRegr(ii)])
end
xlim([0 maxX])
ylim([yModel(1)-1 yModel(end)+1])
xlabel('x')
ylabel('y')

dataMean = mean(y)
dataStd = std(y)

yToMean = y - dataMean;
mean(yToMean)
std(yToMean)

figure, hold on, grid on
plot(x,y,'or', 'LineWidth',2)
plot([0 maxX], [dataMean dataMean],'b', 'LineWidth',2)
for ii = 1:N
    plot([x(ii) x(ii)], [y(ii) dataMean])
end
xlim([0 maxX])
ylim([yModel(1)-1 yModel(end)+1])
xlabel('x')
ylabel('y')


