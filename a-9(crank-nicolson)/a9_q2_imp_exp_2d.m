dx = 0.52;
dt = 0.01;
p = pi;
p = p*p;
n = (pi/dx) + 1;
n = floor(n);
x = zeros(n,0);
u = zeros(n,1);
for i = 1:n
    x(i) = 0 + (i-1)*dx;
    u(i) = sin(x(i));
end
l = (3*dt)/(dx*dx);
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
disp(right);
while t<0.1
    t = t + dt;
    
    u = right * u;
end
plot(x,u);
hold on;
dx = pi/50;
n = (pi/dx) + 1;
n = floor(n);
x = zeros(n,0);
u = zeros(n,1);
for i = 1:n
    x(i) = 0 + (i-1)*dx;
    u(i) = sin(x(i));
end
l = 0.49;
dt = (l*dx*dx)/3;
t = 0;
while t<0.1
    t = t + dt;
    
    temp = zeros(n,1);
    for i = 2:n-1
        temp(i) = u(i) + l*(u(i+1)-2*u(i)+u(i-1));
    end
    u = temp;
end
plot(x,u);
hold off;