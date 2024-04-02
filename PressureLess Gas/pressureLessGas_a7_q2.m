clc ; clear;
delX = 1/100;
T = 0.5;
X = [-1 1];
N = (X(2) -X(1))/delX;

xi = linspace(X(1) , X(2) , N);

for i = 1 :N
    u1(i,1) =1;
    if(xi(i) > 0)
        u2(i, 1) = -2;
        disp("xi is positive")
    else
        disp("xi is less")
        u2(i, 1) = 2;
    end
end


