clc;
clear;

alpha = 1/pi^2;
delX = .1;
delT = .01;
T = .1;
x = 0:delX:1;
lambda = alpha*delT/delX^2;



A = zeros(1/delX-1, 1/delX-1);

for i=1:1/delX-1
    for j=i-1:i+1
        if(j~=0 && j==i-1)
            A(i, j) = -1*lambda;
        end
        if(j==i)
            A(i, j) = 2*(1+lambda);
        end
        if(j~=1/delX && j==i+1)
            A(i, j) = -1*lambda;
        end
    end
end

B = zeros(1/delX-1, 1/delX-1);

for i=1:1/delX-1
    for j=i-1:i+1
        if(j~=0 && j==i-1)
            B(i, j) = lambda;
        end
        if(j==i)
            B(i, j) = 2*(1-lambda);
        end
        if(j~=1/delX && j==i+1)
            B(i, j) = lambda;
        end
    end
end

for i=1:1/delX+1
    u(i, 1) = sin(pi*x(i));
end

for i=1:T/delT+1
    u(1, i)=0;
    u(1/delX+1, i)=0;
end

for i=1:T/delT
    u(2:1/delX, i+1) = (A\B)*u(2:1/delX, i);
end


for i=1:T/delT+1
    plot(x, u(:, i));
    ylim([0 1])
    pause(.1);
end