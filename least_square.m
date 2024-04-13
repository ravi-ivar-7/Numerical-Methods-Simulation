x = [1 1.5 2 2.5 3 3.5 4];
y = [25 31 27 28 36 35 32];

n = length(x);
sum_x = 0;
sum_y = 0;
sum_xx = 0;
sum_xy = 0;

syms  a b;

for i = 1:n
    sum_x = sum_x +x(i);
    sum_y =sum_y + y(i);
    sum_xx = sum_xx +x(i)*x(i);
    sum_xy = sum_xy + x(i)*y(i);
end

eq1 = n*a +sum_x *b == sum_y;
eq2 = sum_x*a + b*sum_xx == sum_xy;
sol = solve([eq1, eq2], [a, b]);
a_sol = sol.a;
b_sol = sol.b;
eq = poly2sym([a_sol, b_sol]);
disp(a_sol);
disp(b_sol);
fplot(eq, [1 5]);