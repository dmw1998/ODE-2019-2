%This is an algrithm of PECE of Euler and backward Euler 

%% Plot the exact solution
xx = linspace(0,1,200);
yy = 1./(1+xx.^2);
plot(xx,yy,'k')
hold on

%% Give the I.V.P. and step size
df = @(t,y) -2*t*y^2;
y_0 = 1;
h = 0.1;

%% PECE
t = 0;
y = y_0;
ypdata = [];
ycdata = [];
for i = 1: 1/h
    % Prediction
    yp = Euler_forward(df, t, y, h);
    plot(t+h,yp,'b.')
    ypdata = [ypdata yp];
    % Correction
    yc = Euler_backward_Corr(yp, df, t, y, h);
    plot(t+h,yc,'r*')
    ycdata = [ycdata yc];
    % Update 
    t = t + h;
    y = yc;
end