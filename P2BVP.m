df = @(t,u) [u(2); sin(t*u(2))+1];
h = 1/16;
tspan = 0 : h : 1;
hold on

r1 = 1;
y_0 = [0; r1];
[t,y] = ode45(df,tspan,y_0);
g1 = y(17,1)-1;
plot(t, y(:,1))

r2 = -1;
y_0 = [0; r2];
[t,y] = ode45(df,tspan,y_0);
g2 = y(17,1)-1;
plot(t, y(:,1))

g = g2;
while abs(g) >= 10^(-3)
    r3 = r2 - ((r2-r1)/(g2-g1))*g2;
    y_0 = [0;r3];
    [t,y] = ode45(df,tspan,y_0);
    g = y(17,1)-1;
    plot(t,y(:,1))

    r1 = r2;
    r2 = r3;
    g1 = g2;
    g2 = g;
    i = i+1;
end