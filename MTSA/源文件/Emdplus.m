%���ļ������źŽ���emd�ֽⲢ��ʾ,���ӳ����hht.m
%����ֽ���̼�emd.m
clear;clc;clf;
N=2048;
%���캯��x��Ĭ�ϼ�����ź��Ǵ�0��ʼ��
t=linspace(1,2,N);deta=t(2)-t(1);fs=1/deta;
x=5*sin(2*pi*10*t)+5*sin(2*pi*35*t);
z=x;

[c,a,b]=emd(z);
A=a
B=b
%����ÿ��IMF���������һ��ʣ�����residual��ԭʼ�źŵ������
[m,n]=size(c)%m=5�ֽ�Ϊ5���źţ��������������,n=2048
for i=1:m;
a=corrcoef(c(i,:),z);
xg(i)=a(1,2);
end
xg;

for i=1:m-1
%--------------------------------------------------------------------
%�����IMF�ķ������
%���壺����Ϊƽ���ľ�ֵ��ȥ��ֵ��ƽ��
%��ֵ��ƽ��
%imfp2=mean(c(i,:),2).^2
%ƽ���ľ�ֵ
%imf2p=mean(c(i,:).^2,2)
%����IMF�ķ���
mse(i)=mean(c(i,:).^2,2)-mean(c(i,:),2).^2;
end;
mmse=sum(mse);
for i=1:m-1
mse(i)=mean(c(i,:).^2,2)-mean(c(i,:),2).^2; 
%����ٷֱȣ�Ҳ���Ƿ������
mseb(i)=mse(i)/mmse*100;
%��ʾ����IMF�ķ���͹�����
end;


%���imf[i]�ķ����빱����
for i=1:m-1
disp(['imf',int2str(i)]) ;disp([mse(i) mseb(i)]);
end;
%% �����ֽ�ͼ
%����ÿ��IMF���������һ��ʣ�����residual��ͼ��
figure(1)
subplot(m+1,1,1)
plot(t,z)
%set(gca,'fontname','times New Roman')%��������ȣ��ɲ���
%set(gca,'fontsize',14.0)
ylabel(['ԭʼ�ź�'])
%����imf[i]��ͼ��
for i=1:m-1
subplot(m+1,1,i+1);
set(gcf,'color','w')
plot(t,c(i,:),'k')
set(gca,'fontname','times New Roman')
%set(gca,'fontsize',14.0)
ylabel(['imf',int2str(i)])
end
%���������
subplot(m+1,1,m+1);
set(gcf,'color','w')
plot(t,c(m,:),'k')
set(gca,'fontname','times New Roman')
%set(gca,'fontsize',14.0)
ylabel(['r',int2str(m-1)])
%% ����������
%����ʹ���Լ���д��samp��Ҳ����ʹ��SampEn�������õ������ز�ͬ����������
for i=1:m
   Samp(i)= samp(c(i,:),2,0.1)
end