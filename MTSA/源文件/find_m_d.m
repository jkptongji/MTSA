function [ m,d ] = find_m_d( n )
%UNTITLED6 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%���ڲ���һ����ָ��������Ӧ���·ݺ�������nΪ��������mΪ�·�,dΪ��
month=[31 28 31 30 31 30 31 31 30 31 30 31];
for i=1:12
    day(i)=sum(month(1:i));
end
fm=find(day<n);
if length(fm)>0
    m=fm(length(fm))+1;
    d=n-day(fm(end));
else
    m=1;
    d=n;
end


end

