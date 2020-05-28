n = 7;
h = 1/(n+1);
y(1) = 0;
y(n+2) = 1;

A(1,1) = -2;
A(n,n) = -2;
A(1,2) = 1; % t = 0
A(n,n-1) = 1+h/2; % t = 1
b(1) = h^2 - y(1);
b(n) = h^2 - (1-h/2)*y(n+2);

t = 0;
for i = 2: n-1
    t = t+h;
    A(i, i-1) = 1+t*h/2;
    A(i, i) = -2;
    A(i, i+1) = 1-t*h/2;
    b(i) = h^2;
end

y(2: n+1)= A\b.';
t = linspace(0,1,n+2);
plot(t,y)