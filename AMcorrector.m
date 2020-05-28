function yc = AMcorrector(df, yp, t, y_k, h)
yc = y_k(4) + h/24 * (9*df(t+h, yp) + 19*df(t, y_k(4)) - 5*df(t-h, y_k(3)) + df(t-2*h, y_k(2)));
end