clc;
xi=1:0.1:2;
l=length(xi);
syms x y z lambda;
h=0.1;

f(x,y,z) = z ;
g(x,y,z) = 3*z/x - 3*y/x^2 + 2*x^2*exp(x);

threshold = 0.0001;
guess1 = 0 ;
guess2 = 1 ;

pn_u = zeros(1, l);
qn_u = zeros(1, l);

pn_v = zeros(1, l);
qn_v = zeros(1, l);

y_n = 2 ;

while abs(pn_v(l) - y_n) > threshold
    qn_u(1) = guess1 ;
    for i = 1:l-1
        k1 = f(xi(i), pn_u(i), qn_u(i) );
        l1 = g(xi(i), pn_u(i), qn_u(i) );
    
        k2 = f(xi(i) + h/2 , pn_u(i) + h*k1/2 , qn_u(i) + h*l1/2 );
        l2 = g(xi(i) + h/2 , pn_u(i) + h*k1/2 , qn_u(i) + h*l1/2 );
    
        k3 = f(xi(i) + h/2 , pn_u(i) + h*k2/2 , qn_u(i) + h*l2/2 );
        l3 = g(xi(i) + h/2 , pn_u(i) + h*k2/2 , qn_u(i) + h*l2/2 );
    
        k4 = f(xi(i) + h   , pn_u(i) + h*k3   , qn_u(i) + h*l3 );
        l4 = g(xi(i) + h   , pn_u(i) + h*k3   , qn_u(i) + h*l3 );
        
        pn_u(i+1) = pn_u(i) + (k1 + 2*k2 + 2*k3 + k4)*h/6 ;
    
        qn_u(i+1) = qn_u(i) + (l1 + 2*l2 + 2*l3 + l4)*h/6 ;
        
    end
    
    qn_v(1) = guess2;
    
    for i = 1:l-1
        k1 = f(xi(i), pn_v(i), qn_v(i) );
        l1 = g(xi(i), pn_v(i), qn_v(i) );
    
        k2 = f(xi(i) + h/2 , pn_v(i) + h*k1/2 , qn_v(i) + h*l1/2 );
        l2 = g(xi(i) + h/2 , pn_v(i) + h*k1/2 , qn_v(i) + h*l1/2 );
    
        k3 = f(xi(i) + h/2 , pn_v(i) + h*k2/2 , qn_v(i) + h*l2/2 );
        l3 = g(xi(i) + h/2 , pn_v(i) + h*k2/2 , qn_v(i) + h*l2/2 );
    
        k4 = f(xi(i) + h   , pn_v(i) + h*k3   , qn_v(i) + h*l3 );
        l4 = g(xi(i) + h   , pn_v(i) + h*k3   , qn_v(i) + h*l3 );
        
        pn_v(i+1) = pn_v(i) + (k1 + 2*k2 + 2*k3 + k4)*h/6 ;
    
        qn_v(i+1) = qn_v(i) + (l1 + 2*l2 + 2*l3 + l4)*h/6 ;
        
    end

    gs1 = pn_u(l) - y_n ;
    gs2 = pn_v(l) - y_n ;

    guess3 = guess2 - (guess2 - guess1) * gs2/(gs2 - gs1);
    guess1 = guess2 ;
    guess2 = guess3 ;
    disp(pn_v(l) - y_n)

end

plot(xi, pn_u);
