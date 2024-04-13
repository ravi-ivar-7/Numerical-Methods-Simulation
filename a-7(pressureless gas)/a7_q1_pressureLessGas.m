clc;
clear;
syms rho u u1 u2 lambda x1 x2;
I = eye(2 ,2);

f1 = u2;
f2 = u2*u2/u1;

J = [ diff(f1,u1) diff(f1, u2);
      diff(f2,u1) diff(f2, u2)];

E = det(J - lambda*I);
E = solve(E, lambda);

E = subs(E, u1, rho);
E = subs(E, u2, rho*u);

disp(E);  %Eigen values

% Eigne Values : u, u
% geometric multiplicity : 1 // no. of Linerly Independent eigen values
% algebraic multiplicity : 2 // no. of repetative eigen values

X = [x1 ;
    x2];
EVec = solve((J - E(1)*I)*X == 0, X);
disp(EVec);

