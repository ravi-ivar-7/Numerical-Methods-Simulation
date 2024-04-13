clc;
clear all;
xi=[0:0.4:2];
l=length(xi);
syms x y z t;
h=0.4;
g(x,y,z)=(1/y-z^2/y);
%vpa(g(1,0,1))
f(x,y,z)=z;
guess1=0;
yb=2;
guess2=1;
thresh=0.0001;
y1=zeros(1,l);
y2=zeros(1,l);
while abs(y2(l)-2)>thresh
y1(1)=1;
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
y2(1)=1;
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
gs2=y2(l)-yb;
gs1=y1(l)-yb;
guess3=guess2-gs2*(guess2-guess1)/(gs2-gs1)
guess1=guess2;
guess2=guess3;
end
y2
plot(xi,y2)