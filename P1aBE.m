%This is for the backward Euler methhod applying Newton method with a
%strating guess obtained by Euler method(tol = 10^(-3)).

%% Plot the exact solution
x = linspace(0,1,200);
y = 1./(1+x.^2);
plot(x,y,'k')
hold on

%% Give the I.V.P. and step size
df = @(t,y) -2*t*y^2;
y_0 = 1;
h = 0.1;

%% Calculate from t = 0 to t = 1
t = 0;
y_be = y_0;
P1y_be = [];
P1y_fe = [];
for i = 1: 1/h
    y_fe = Euler_forward(df, t, y_be, h);
    P1y_fe = [P1y_fe, y_fe];
    y_be = Euler_backward_Newton(y_fe, df, t+h, y_be, h);
    P1y_be = [P1y_be, y_be];
    plot(t+h,y_fe,'b.',t+h,y_be,'r*')
    t = t + 0.1;
end