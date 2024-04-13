clc;
clear all;
xi=[1:0.1:2];
l=length(xi);
syms x y z t;
h=0.1;
g(x,y,z)=(3*z/x-3*y/(x^2)+2*x*x*exp(x));

f(x,y,z)=z;
exact_ans=matlabFunction(2*x*(x-1)*exp(x));
soln=exact_ans(xi);
guess1=0;
guess2=1;
thresh=1e-4;
final_ans=0;
y1=zeros(1,l);
y1(1)=0;
z1=zeros(1,l);
z1(1)=guess1;
for i=1:l-1
    k1=h*f(xi(i),y1(i),z1(i));
    l1=vpa(h*g(xi(i),y1(i),z1(i)));
    k2=h*f(xi(i)+h/2,y1(i)+k1/2,z1(i)+l1/2);
    l2=h*g(xi(i)+h/2,y1(i)+k1/2,z1(i)+l1/2);
    k3=h*f(xi(i)+h/2,y1(i)+k2/2,z1(i)+l2/2);
    l3=h*g(xi(i)+h/2,y1(i)+k2/2,z1(i)+l2/2);
    k4=h*f(xi(i)+h,y1(i)+k3,z1(i)+l3);
    l4=h*g(xi(i)+h,y1(i)+k3,z1(i)+l3);
    y1(i+1)=y1(i)+(k1+2*k2+2*k3+k4)/6;
    z1(i+1)=z1(i)+(l1+2*l2+2*l3+l4)/6;
end
y1;
z1;
y2=zeros(1,l);
y2(1)=0;
z2=zeros(1,l);
z2(1)=guess2;
for i=1:l-1
    k1=h*f(xi(i),y2(i),z2(i));
    l1=vpa(h*g(xi(i),y2(i),z2(i)));
    k2=h*f(xi(i)+h/2,y2(i)+k1/2,z2(i)+l1/2);
    l2=vpa(h*g(xi(i)+h/2,y2(i)+k1/2,z2(i)+l1/2));
    k3=h*f(xi(i)+h/2,y2(i)+k2/2,z2(i)+l2/2);
    l3=vpa(h*g(xi(i)+h/2,y2(i)+k2/2,z2(i)+l2/2));
    k4=h*f(xi(i)+h/2,y2(i)+k3,z2(i)+l3);
    l4=vpa(h*g(xi(i)+h,y2(i)+k3,z2(i)+l3));
    y2(i+1)=y2(i)+(k1+2*k2+2*k3+k4)/6;
    z2(i+1)=z2(i)+(l1+2*l2+2*l3+l4)/6;
end
y2;
eqn=t*y1(l)+(1-t)*y2(l)-soln(l);
sol=vpa(solve(eqn,t));
an=sol*y1+(1-sol)*y2;
soln;
disp("an");
disp(an)
disp("soln");
disp(soln);
plot(xi, soln);