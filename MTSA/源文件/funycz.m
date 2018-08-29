function [n_data,tt1,xx1,d1,d2]= funycz( idata )
%本函数为异常值剔除程序，其中idata为待分析数据矩阵，n_data为处理过后的数据矩阵
t=idata(:,1);
x=idata(:,2);
N=length(t);
index=0;
n_data=sortrows(idata,2);%将idata按照第二列升序的方式排列矩阵
k1=n_data(:,2);%获得新矩阵的第二列
Q1=quantile(k1,0.25);
Q2=quantile(k1,0.75);
Q3=quantile(k1,0.0035);
Q4=quantile(k1,0.9965);
IQR=Q2-Q1;%计算IQR值
d1=Q3;
d2=Q4;
for i=1:N
    if k1(i)>d2|k1(i)<d1
        index=index+1;%异常值个数
        error(index)=i;%获得n_data中异常值的行数
    end
end
for i=1:index
    L1=n_data(error(i),:);
    k=L1(1);
    k2(i)=find(t==k);%获得异常值在idata中的行数
end
global ck2;
for i=1:index
    tt1(i)=t(k2(i));
    xx1(i)=x(k2(i));
end  %为了绘制异常点
aa=[];
for i=1:index   
    bb=idata(k2(i),:);
    aa=[aa;bb];
end   %aa为异常值序列
aa=sortrows(aa,1);
idata(k2,:)=[]; %删除指定行
n_data=idata;
end

