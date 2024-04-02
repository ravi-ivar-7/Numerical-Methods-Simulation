% assign 6
clear; clc;
L=5;
Nx=501;
delx=L/(Nx-1);
x=linspace(0,5,Nx);
%x
g=9.81;
lambda=0.8;
T=0;
delt=(lambda*delx)/(sqrt(g*2));
%T=T+delt;
u1=2;
u2=0;
%Nt=round(T/delt);
%t=linspace(0,T,Nt+1);
U1=zeros(1, Nx);
U2=zeros(1, Nx);
for i=1:Nx
U1(1,i)=exp(-10*(x(i)-2.5).^2);
U2(1, i)=0;
end
i=0;
sr=0;
T=T+delt;
while T<=0.2 %1
i=i+1;
for j=2:Nx-1
U1(i+1,j)=0.5*(U1(i,j+1)+U1(i,j-1))-0.5*delt*(U2(i,j+1)-U2(i,j-1))/delx;
U2(i+1,j)=0.5*(U2(i,j+1)+U2(i,j-1))-0.5*delt*((U2(i,j+1)*U2(i,j+1)/U1(i,j+1))+0.5*g*U1(i,j+1)*U1(i,j+1)-((U2(i,j-1)*U2(i,j-1)/U1(i,j-1))+0.5*g*U1(i,j-1)*U1(i,j-1)))/delx;
end
U1(i+1,1)=exp(-10*(9));
U1(i+1,end)=exp(-10*(4));
U2(i+1,1)=0;
U2(i+1,end)=0;
for j=1:Nx
sr_temp=abs(U2(i+1,j)/U1(i+1,j)) + sqrt(g*U1(i+1,j));
sr=max(sr_temp,sr);
end
delt= lambda*delx/sr;
T=T+delt;
end
h=U1(i,:);
%u=U2(i,:)/U1(i,:);
% U2(i,:)

for j = 1:i
    plot(x, U1(j, :));
    xlim([0 5]);
    ylim([-0.5 3]);
    pause(0.005);
end