function y_rk = RK(df, t, y_rk, h)
k1 = df(t, y_rk);
k2 = df(t+h/2, y_rk+(h/2)*k1);
k3 = df(t+h/2, y_rk+(h/2)*k2);
k4 = df(t+h, y_rk+h*k3);

y_rk = y_rk + (h/6)*(k1+2*k2+2*k3+k4);
end