
clc;
clear;
for t=0:0.1:4
    grid = 200;

    x = zeros(grid+1,0);
    val = zeros(grid+1,0);

    h = 2/grid;
    for i = 1:(grid+1)
        x(i) = -1+(h)*(i-1);
        if abs(x(i))<1/3
            val(i)=1;
        else
            val(i)=0;
        end
    end
    time = t;
    dt = h*0.8;
    times = time/dt;

    for i = 1:times
        temp = zeros(grid+1,0);
        for j = 2:grid
            temp(j)=0.5*(val(j+1)+(val(j-1))-0.4*(val(j+1)-val(j-1)));
        end
        temp(1) = 0.5*(val(grid)+val(2))-0.4*(val(2)-val(grid));
        temp(grid+1) = 0.5*(val(grid-1)+val(1))-0.4*(val(1)-val(grid-1));
        val = temp;
    end
    plot(x,val);
    n=0.1;
    pause(n);
end

lsdfcsd grid = 5000;

x = zeros(grid+1,0);
val = zeros(grid+1,0);

h = 2/grid;
for i = 1:(grid+1)
    x(i) = -1+(h)*(i-1);
    if abs(x(i))<1/3
        val(i)=1;
    else
        val(i)=-1;
    end
end

times = 3/(8*h);

for i = 1:times
    temp = zeros(grid+1,0);
    for j = 2:grid
        temp(j)=0.5*(val(j+1)+(val(j-1))-0.4*(val(j+1)-val(j-1)));
    end
    temp(1) = 0.5*(val(grid)+val(2))-0.4*(val(2)-val(grid));
    temp(grid+1) = 0.5*(val(grid-1)+val(1))-0.4*(val(1)-val(grid-1));
    val = temp;
end

plot(x,val)
hold on
grid = 200;

x = zeros(grid+1,0);
val = zeros(grid+1,0);

h = 2/grid;
for i = 1:(grid+1)
    x(i) = -1+(h)*(i-1);
    if abs(x(i))<1/3
        val(i)=1;
    else
        val(i)=-1;
    end
end

times = 3/(8*h);

for i = 1:times
    temp = zeros(grid+1,0);
    for j = 2:grid
        temp(j)=0.5*(val(j+1)+(val(j-1))-0.4*(val(j+1)-val(j-1)));
    end
    temp(1) = 0.5*(val(grid)+val(2))-0.4*(val(2)-val(grid));
    temp(grid+1) = 0.5*(val(grid-1)+val(1))-0.4*(val(1)-val(grid-1));
    val = temp;
end
plot(x,val);
hold off



