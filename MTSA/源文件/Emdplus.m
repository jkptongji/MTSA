%本文件仅对信号进行emd分解并显示,附加程序见hht.m
%具体分解过程见emd.m
clear;clc;clf;
N=2048;
%构造函数x，默认计算的信号是从0开始的
t=linspace(1,2,N);deta=t(2)-t(1);fs=1/deta;
x=5*sin(2*pi*10*t)+5*sin(2*pi*35*t);
z=x;

[c,a,b]=emd(z);
A=a
B=b
%计算每个IMF分量及最后一个剩余分量residual与原始信号的相关性
[m,n]=size(c)%m=5分解为5个信号（包括残余分量）,n=2048
for i=1:m;
a=corrcoef(c(i,:),z);
xg(i)=a(1,2);
end
xg;

for i=1:m-1
%--------------------------------------------------------------------
%计算各IMF的方差贡献率
%定义：方差为平方的均值减去均值的平方
%均值的平方
%imfp2=mean(c(i,:),2).^2
%平方的均值
%imf2p=mean(c(i,:).^2,2)
%各个IMF的方差
mse(i)=mean(c(i,:).^2,2)-mean(c(i,:),2).^2;
end;
mmse=sum(mse);
for i=1:m-1
mse(i)=mean(c(i,:).^2,2)-mean(c(i,:),2).^2; 
%方差百分比，也就是方差贡献率
mseb(i)=mse(i)/mmse*100;
%显示各个IMF的方差和贡献率
end;


%输出imf[i]的方差与贡献率
for i=1:m-1
disp(['imf',int2str(i)]) ;disp([mse(i) mseb(i)]);
end;
%% 画出分解图
%画出每个IMF分量及最后一个剩余分量residual的图形
figure(1)
subplot(m+1,1,1)
plot(t,z)
%set(gca,'fontname','times New Roman')%表明字体等，可不用
%set(gca,'fontsize',14.0)
ylabel(['原始信号'])
%画出imf[i]的图形
for i=1:m-1
subplot(m+1,1,i+1);
set(gcf,'color','w')
plot(t,c(i,:),'k')
set(gca,'fontname','times New Roman')
%set(gca,'fontsize',14.0)
ylabel(['imf',int2str(i)])
end
%画残余分量
subplot(m+1,1,m+1);
set(gcf,'color','w')
plot(t,c(m,:),'k')
set(gca,'fontname','times New Roman')
%set(gca,'fontsize',14.0)
ylabel(['r',int2str(m-1)])
%% 计算样本熵
%可以使用自己编写的samp，也可以使用SampEn函数，得到样本熵不同，但是类似
for i=1:m
   Samp(i)= samp(c(i,:),2,0.1)
end