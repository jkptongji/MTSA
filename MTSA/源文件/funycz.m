function [n_data,tt1,xx1,d1,d2]= funycz( idata )
%������Ϊ�쳣ֵ�޳���������idataΪ���������ݾ���n_dataΪ�����������ݾ���
t=idata(:,1);
x=idata(:,2);
N=length(t);
index=0;
n_data=sortrows(idata,2);%��idata���յڶ�������ķ�ʽ���о���
k1=n_data(:,2);%����¾���ĵڶ���
Q1=quantile(k1,0.25);
Q2=quantile(k1,0.75);
Q3=quantile(k1,0.0035);
Q4=quantile(k1,0.9965);
IQR=Q2-Q1;%����IQRֵ
d1=Q3;
d2=Q4;
for i=1:N
    if k1(i)>d2|k1(i)<d1
        index=index+1;%�쳣ֵ����
        error(index)=i;%���n_data���쳣ֵ������
    end
end
for i=1:index
    L1=n_data(error(i),:);
    k=L1(1);
    k2(i)=find(t==k);%����쳣ֵ��idata�е�����
end
global ck2;
for i=1:index
    tt1(i)=t(k2(i));
    xx1(i)=x(k2(i));
end  %Ϊ�˻����쳣��
aa=[];
for i=1:index   
    bb=idata(k2(i),:);
    aa=[aa;bb];
end   %aaΪ�쳣ֵ����
aa=sortrows(aa,1);
idata(k2,:)=[]; %ɾ��ָ����
n_data=idata;
end

