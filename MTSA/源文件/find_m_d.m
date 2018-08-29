function [ m,d ] = find_m_d( n )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
%用于查找一年中指定天数对应的月份和天数，n为总天数，m为月份,d为日
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

