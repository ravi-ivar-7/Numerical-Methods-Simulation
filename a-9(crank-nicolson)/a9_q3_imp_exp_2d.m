dx = 0.2;
dt = 0.01;
p = pi;
p = p*p;
n = (1/dx) + 1;
n = floor(n);
x = zeros(n,0);
u = zeros(n,1);
for i = 1:n
    x(i) = 0 + (i-1)*dx;
    u(i) = sin(x(i)*pi) + sin(2*x(i)*pi);
end
l = (dt)/(dx*dx);
t = 0;
left = zeros(n,n);
left(1,1) = 1;
left(n,n) = 1;
for i = 2 : n-1
    left(i,i-1) = -l;
    left(i,i) = 2*(1+l);
    left(i,i+1) = -l;
end
right = zeros(n,n);
right(1,1) = 1;
right(n,n) = 1;
for i = 2 : n-1
    right(i,i-1) = l;
    right(i,i) = 2*(1-l);
    right(i,i+1) = l;
end
right = inv(left)*right;
while t<0.05
    t = t + dt;
    
    u = right * u;
end
plot(x,u);
hold on;
dx = 1/50;
n = (1/dx) + 1;
n = floor(n);
x = zeros(n,0);
u = zeros(n,1);
for i = 1:n
    x(i) = 0 + (i-1)*dx;
    u(i) = sin(x(i));
end
l = 0.49;
dt = (l*dx*dx);
t = 0;
while t<0.05
    t = t + dt;
    
    temp = zeros(n,1);
    for i = 2:n-1
        temp(i) = u(i) + l*(u(i+1)-2*u(i)+u(i-1));
    end
    u = temp;
end
plot(x,u);
disp(dt);
hold off;