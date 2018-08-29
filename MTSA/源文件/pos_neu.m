function [A] = pos_neu( input_dz,output_dz )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
day_month=[31 28 31 30 31 30 31 31 30 31 30 31];
fid=fopen(input_dz,'r');
for i=1:9
    tline=fgetl(fid);    
end
k=1;
fid_w=fopen(output_dz,'w');
B=zeros(9,1);
fprintf(fid_w,'%s\n','# YYYY.DECM YYYY DOY     N(m)      E(m)      U(m)     nn(m)     ee(m)     uu(m)');
while feof(fid)==0
    tline=fgetl(fid);
    B(1)=str2num(tline(1:9));%时间
    num_month=str2num(tline(6:7));
    num_day=sum(day_month(1:num_month-1))+str2num(tline(8:9));%一年中占的天数
    B(1)=str2num(tline(1:5))+num_day/365;
    B(2)=str2num(tline(1:5));
    B(3)=num_day;
    B(4)=str2num(tline(171:178));
    B(5)=str2num(tline(181:188));
    B(6)=str2num(tline(191:198));
    B(7)=str2num(tline(202:209));
    B(8)=str2num(tline(211:218));
    B(9)=str2num(tline(220:227));
    fprintf(fid_w,'%.4f   %d  %d  %.5f  %.5f  %.5f  %.5f  %.5f  %.5f\n',B);
end
A=0;
fclose(fid_w);
%B(1),B(2),B(3),B(4),B(5),B(6),B(7),B(8),B(9)
%}