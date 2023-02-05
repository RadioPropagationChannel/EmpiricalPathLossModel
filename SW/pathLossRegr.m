% pathLossRegr

% ---------------------------------------------------------------
clear, clc, close all

load pathloss

%%

[distkm,I] = sort(distkm);
Pr = Pr(I);
figure, plot(distkm, Pr, '+r')

dlog = 10*log10(distkm);

%%
figure, hold on; 
plot(dlog, Pr, '+g')
N = 1;
P = polyfit(dlog,Pr,N);

disp(['Stright line coefficients: a_1 : ',num2str(P(1)),' and a_0 : ',num2str(P(2))])
disp(' ')

Prfitted = polyval(P,dlog);
plot(dlog, Prfitted, 'r', 'LineWidth', 3)
xlabel('10 log_1_0 (d_k_m)')
ylabel('Received mean local power, dBm') 


%%

X = Pr - Prfitted;
figure, plot(dlog, X, 'v')
xlabel('Distance in km')
ylabel('Residuals, dB')
figure, plot(distkm, X, 'v') 
xlabel('10 log_1_0 (d_k_m)')
ylabel('Residuals, dB')
meanX = mean(X);
sigmaL = std(X);
disp(['Mean and stadard deviation of random variable X :', num2str(meanX),'  ', num2str(sigmaL)])
disp(' ')
%%  analisys of the goodness of fit

St = sum(Pr.^2 - mean(Pr)^2);
Sr = sum(Pr.^2 - Prfitted.^2);
n = length(Pr);

sy = sqrt(St/(n-1));
syx = sqrt(Sr/(n-2));

r2 = (St - Sr)/St;

disp(['Model''s coefficient of determination : ',num2str(r2)])











