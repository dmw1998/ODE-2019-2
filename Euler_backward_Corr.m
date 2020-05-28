%We need to give  the diifferential equation, a strat point (t,y_fe) and a
%step size h. Then we can get the function value y at t+h.
%Instead of solving the nonliear equation, we use the value of y_fe to
%repleace the y_be on the right side and evalue it.

function y_be = Euler_backward_Corr(y_fe, df, t, y_be, h)
y_be = y_be + h*df(t+h, y_fe);
end