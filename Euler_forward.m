%We need to give the diifferential equation, a strat point (t,y) and a
%step size h. Then we can get the function value y at t+h.

function y_fe = Euler_forward(df, t, y, h)
y_fe = y + h*df(t,y);
end