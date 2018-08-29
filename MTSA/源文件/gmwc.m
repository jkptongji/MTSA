function [ X,XXX,X1,X2,X3 ] = gmwc( data,n )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
%X为协方差矩阵，XXX为去除共模误差后的矩阵（PCA），X1为PCA，X2为KLE，X3为stacking
%data=load(dz{option});
x=data(:,1);
y=cell(2*n,1);
for i=2:2*n+1
    y{i-1}=data(:,i);
end
for i=1:length(x)
    for j=1:n
        X(i,j)=y{j}(i);
    end
end
for i=1:length(x)
    for j=1:n
        XX(i,j)=y{j+n}(i);
    end
end
B=cov(X);
[V,D]=eig(B);
D1=wrev(diag(D));
V=fliplr(V);
A=X*V;
A1=A(:,1:1);
V1=V(:,1:1);
X1=A1*V1';
%set(handles.edit1,'string',num2str(X1));
%figure('NumberTitle', 'off', 'Name', '三种滤波方法的比较');
%{
subplot(2,2,1);
plot(x,mean(X1,2),'r');
zoom on;
title('PCA');
%}
for i=1:length(B)
    for j=1:length(B)
        C(i,j)=B(i,j)/sqrt(B(i,i)*B(j,j));
    end
end
[V2,D2]=eig(C);
V2=fliplr(V2);
A2=X*V2;
A3=A2(:,1:1);
V3=V2(:,1:1);
X2=A3*V3';
%set(handles.edit2,'string',num2str(X2));
%{
subplot(2,2,2);
plot(x,mean(X2,2),'b');
zoom on;
title('KLE');
%}
for i=1:length(x)
    for j=1:length(B)
        a(i,j)=X(i,j)/(XX(i,j)*XX(i,j));
        b(i,j)=1/(XX(i,j)*XX(i,j));
    end
end
a1=sum(a,2);
b1=sum(b,2);
for i=1:length(x)
    X3(i)=a1(i)/b1(i);
end
%set(handles.edit3,'string',num2str(X3));
%{
K=X-X1;
subplot(2,2,3);
plot(x,X3,'k');
zoom on;
title('Stacking');
subplot(2,2,4);
plot(x,mean(X1,2),'r.');
zoom on;
hold on;
plot(x,mean(X2,2),'b.');
plot(x,X3,'k-');
legend({'PCA','KLE','Stacking'},'Location','Best');
legend('boxoff');
title('混合');
for i=1:length(x)
    XXX(i,1)=x(i);
end
for i=1:length(x)
    for j=2:n_s+1
        XXX(i,j)=K(i,j-1);
    end
end
%}
K=X-X1;
for i=1:length(x)
    XXX(i,1)=x(i);
end
for i=1:length(x)
    for j=2:n+1
        XXX(i,j)=K(i,j-1);
    end
end
end

