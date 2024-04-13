syms x ;
X = 0 : 0.1 : 1;
a_x = (100 - 5*exp(x));
b_x = (-100 - x);
c_x = (100 + 5*exp(x)) ;
d_x = 2 - x + exp(-x)*(-x*x + 2*x -3);

A = zeros(11,11);
B = zeros(11,1);
A(1,1) = 1;
A(11,11) = 1;
B(1,1) =-1;
B(11,11) = 0;
for i = 1 : 9
    A(i+1,i + 1) = subs(b_x, x, X(i+1));
    A(i+1, i) = subs(a_x, x,X(i+1));
    A(i+1, i+2) = subs(c_x, x, X(i+1));
end
for j = 2:10
    B(j, 1) = subs(d_x, x, X(j));
end
result = A\B;
result = result(:, 11)';
for i = 1: 11
    exact(i,1) = subs(x^4 +4*x,x,X(i));
end

disp(result);
disp("exact values are : ");
disp(exact');

plot( X,result')
hold on ;
scatter(X, exact)


