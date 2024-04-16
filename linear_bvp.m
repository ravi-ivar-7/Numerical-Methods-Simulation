clc;
xi=1:0.1:2;
l=length(xi);
syms x y z lambda;
h=0.1;

f(x,y,z) = z ;
g(x,y,z) = 3*z/x - 3*y/x^2 + 2*x^2*exp(x);

pn_u = zeros(1, l);
qn_u = zeros(1, l);

pn_v = zeros(1, l);
qn_v = zeros(1, l);

qn_u(1) = 0 ;
for i = 1:l-1
    k1 = h*f(xi(i), pn_u(i), qn_u(i) );
    l1 = h*g(xi(i), pn_u(i), qn_u(i) );

    k2 = h*f(xi(i) + h/2 , pn_u(i) + k1/2 , qn_u(i) + l1/2 );
    l2 = h*g(xi(i) + h/2 , pn_u(i) + k1/2 , qn_u(i) + l1/2 );

    k3 = h*f(xi(i) + h/2 , pn_u(i) + k2/2 , qn_u(i) + l2/2 );
    l3 = h*g(xi(i) + h/2 , pn_u(i) + k2/2 , qn_u(i) + l2/2 );

    k4 = h*f(xi(i) + h   , pn_u(i) + k3   , qn_u(i) + l3 );
    l4 = h*g(xi(i) + h   , pn_u(i) + k3   , qn_u(i) + l3 );
    
    pn_u(i+1) = pn_u(i) + (k1 + 2*k2 + 2*k3 + k4)/6 ;

    qn_u(i+1) = qn_u(i) + (l1 + 2*l2 + 2*l3 + l4)/6 ;
    
end
u = pn_u(l);


qn_v(1) = 1 ;
for i = 1:l-1
    k1 = h*f(xi(i), pn_v(i), qn_v(i) );
    l1 = h*g(xi(i), pn_v(i), qn_v(i) );

    k2 = h*f(xi(i) + h/2 , pn_v(i) + k1/2 , qn_v(i) + l1/2 );
    l2 = h*g(xi(i) + h/2 , pn_v(i) + k1/2 , qn_v(i) + l1/2 );

    k3 = h*f(xi(i) + h/2 , pn_v(i) + k2/2 , qn_v(i) + l2/2 );
    l3 = h*g(xi(i) + h/2 , pn_v(i) + k2/2 , qn_v(i) + l2/2 );

    k4 = h*f(xi(i) + h   , pn_v(i) + k3   , qn_v(i) + l3 );
    l4 = h*g(xi(i) + h   , pn_v(i) + k3   , qn_v(i) + l3 );
    
    pn_v(i+1) = pn_v(i) + (k1 + 2*k2 + 2*k3 + k4)/6 ;

    qn_v(i+1) = qn_v(i) + (l1 + 2*l2 + 2*l3 + l4)/6 ;
    
end
v = pn_v(l);

Y = lambda*u + (1 - lambda)*v;
lambda_value = vpa(solve(Y, lambda));

descrete_values = lambda_value*pn_u + (1 - lambda_value)*pn_v;

exact_eqn = matlabFunction(2*x*(x-1)*exp(x)) ;
exact_values = exact_eqn(xi);

% Tiled layout with 3 rows and 1 column
tiledlayout(3, 1)

% Plot discrete values in the first subplot
nexttile
plot(xi, descrete_values)
title('Discrete Numerical Solution')

% Plot exact values in the second subplot
nexttile
plot(xi, exact_values)
title('Exact Solution')

% Plot both numerical and exact solutions on the same graph in the third subplot
nexttile
plot(xi, descrete_values, 'b-', xi, exact_values, 'r-')
title('Numerical vs Exact Solution')
xlabel('x')
ylabel('y')
legend('Numerical', 'Exact')
grid on
