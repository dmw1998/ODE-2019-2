y(1) = 0;
y(3)= 1;
h = 1/2;
t = linspace(0,1,3);
y(2) = -(1/2)*(h^2 - (1+(1/2)*t(2)*h) * y(1)- (1-(1/2)*t(2)*h) * y(3));
plot(t,y)