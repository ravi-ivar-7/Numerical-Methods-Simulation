clc;
clear;
h=1/10;
x=0:h:1;
k=1/100;
T=0.1/k+1;
t1=0:k:0.1;
m=(1/pi^2);
U=zeros(1/h+1,1/h+1);
for i=1:1/h+1
    U(1,i)=sin(pi*x(i));
end
U1_1=zeros(1/h-1,1/h-1);
disp(U);
U1_1(1,:)=U(1,2:end-1);
disp(U1_1);
A=zeros((1/h)-1,(1/h)-1);
for i=2:(1/h-2)
    A(i,i-1)=-m;
    A(i,i)=2*(1+m);
    A(i,i+1)=-m;
end
A(1,1)=2*(1+m);
A(1,2)=-m;
A(end,end-1)=-m;
A(end,end)=2*(1+m);
disp(A);
for k=2:T
    B=zeros(1,(1/h)-1);
    for j=1:(1/h-1)
        B(1,j)=m*U(k-1,j)+2*(1-m)*U(k-1,j+1)+m*U(k-1,j+2);
    end
    S=A\transpose(B);
    U1_1(k,:)=S;
    U(k,2:1/h)=U1_1(k,:);
end
disp(U1_1);
disp(U);
%plot(x, U(T,:));
tiledlayout(2,1);
nexttile;
surf(x,t1,U);
title("implicit")
h=1/50;
x=0:h:1;
ep=0.8;
k=((pi^2)*ep*(h)^2)/2;
U11=zeros(1,(1/h) +1);
T=62.5*k;
rowcount=1;
sumT=0;
for i=1:1/h+1
    U11(1,i)=sin(pi*x(i));
end
while (sumT<T)
    sumT=sumT+k;
    disp(k);
    for i=2:(1/h)-1
        U11(rowcount+1,i)=(1-ep)*U11(rowcount,i)+ (ep/2)*(U11(rowcount,i+1)+U11(rowcount,i-1));
    end
    rowcount=rowcount+1;
    U11(rowcount,end)=0;
    U11(rowcount,1)=0;
end
disp(rowcount);
%hold on;
%plot(x,U11(rowcount,:));
t=0:k:0.1;
nexttile;
surf(x,t,U11);
title("explicit");