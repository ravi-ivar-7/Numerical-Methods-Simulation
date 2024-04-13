X = [0  0.5  1     1.5  2     2.5 ];
Y = [0  0.2  0.27  0.3  0.32  0.33];

n = length(X);

A = [n               sum(X, "all")    sum(X.^2, "all")  sum(X.^3,"all");
    sum(X, "all")    sum(X.^2, "all") sum(X.^3,"all")   sum(X.^4,"all"); 
    sum(X.^2, "all") sum(X.^3, "all") sum(X.^4, "all")  sum(X.^5,"all");
    sum(X.^3, "all") sum(X.^4, "all") sum(X.^5 , "all") sum(X.^6,"all")];

B = [sum(Y, "all"); 
     dot(X,Y);
     dot(X.^2 , Y);
     dot( X.^3, Y)];

X = linsolve(A, B);
X = flip(X);
disp(X);
  
eq = vpa(poly2sym(X));
disp(eq);

fplot(eq);