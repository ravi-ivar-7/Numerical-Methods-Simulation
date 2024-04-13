clc;
clear;
delX = 0.02;
delT = (0.9*delX^2)/2;

nX = (1-0)/delX;
nT = 500;

xi = 0 : delX : 1 ;

for i = 1 : nX +1
    u(i,1) = sin(pi*(xi(i)));
    
end

for t = 2 : nT
    for i = 1 : nX +1
        if(i ==1 || i == nX +1)
            u(i, t) = 0;
        else
            u(i, t) = u(i, t-1) + (delT/delX^2) * (u(i + 1, t-1) -2*u(i, t-1) + u(i-1, t-1)) ;
        end
    end
end
hold on;
plot(xi, u(:,300))
plot(xi, u(:, 400))
plot(xi, u(:, nT))
