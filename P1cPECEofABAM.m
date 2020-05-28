% This is an algorithm for PECE of A-B and A-M of order 4.

%% Plot the exact solution
x = linspace(0,1,200);
y = 1./(1+x.^2);
plot(x,y,'k')
hold on

%% Give the I.V.P. and step size
df = @(t,y) -2*t*y^2;
y_0 = 1;
h = 0.1;

%% PECE
t = 0;

% 4th R-K
y_k = [y_0];
y_rk = y_0;
for k = 1:3
    y_rk = RK(df, t, y_rk, h);
    y_k = [y_k y_rk];
    t = t+h;
    plot(t, y_rk, 'r+')
end

ypdata = [];
ycdata = [];
for i = 1:7
    % A-B prediction
    yp = ABpredictor(df, t, y_k, h);
    plot(t+h, yp,'bs');
    ypdata = [ypdata, yp];
    %A-M correction
    yc = AMcorrector(df, yp, t, y_k, h);
    plot(t+h, yc, 'r*');
    ycdata = [ycdata, yc];
    y_k(1) = [];
    y_k(4) = yc;
    t = t+h;
end