%We need to give  the diifferential equation, a strat point (t,y_fe) and a
%step size h. Then we can get the function value y at t+h.
%Since backward Euler method is implicit, we need to solve the nonlinear
%equation every step. In this function, we use Newton's method with
%tolerance 10^(-3).

function y_be = Euler_backward_Newton(y_fe, df, t, y_be, h)
% Newton's method
f = @(y) h*df(t,y)-y+y_be; % This is the func. from backward Euler method
df_dy = @(y) -0.4*t*y - 1; % This is the derivative of the func. above I calculated 

% Starting point is y_fe
y_be = y_fe;
while abs(f(y_be)) >= 10^(-3)
    h = f(y_be)/df_dy(y_be);
    y_be = y_be - h;
end
end