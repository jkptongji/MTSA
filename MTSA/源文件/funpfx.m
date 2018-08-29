function [ f1,mag,T,Q,t1,t2,xx] = funpfx( data )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
x=data(:,1);
%y=data(:,4);
%z=data(:,5);
a=data(:,2);
fs=1/0.0027;
Nd=1024;%1024
N=1024;%1024
n=0:Nd-1;t=n/fs;
Y=fft(a,N);
mag=abs(Y);
f=(0:N-1)*fs/N;
for i=1:N
    f1(i)=1/f(i);
end
mag=mag(1:N);

for i=2:N
    B(i-1,1)=1;
    B(i-1,2)=-log(f(i));
end
for i=2:N
    l(i-1)=log(mag(i));
end
xx=inv(B'*B)*(B'*l');
for i=2:N
    T(i-1)=log(f(i));
    Q(i-1)=log(mag(i));
end
t1=linspace(T(1),T(N-1));
t2=-xx(2)*t1+xx(1);

end

