function [ A ] = pos_tseries( input_dz,output_dz )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
day_month=[31 28 31 30 31 30 31 31 30 31 30 31];
fid=fopen(input_dz,'r');
for i=1:9
    tline=fgetl(fid);    
end
k=1;
header=['# time_unit: years',10,'# unit: mm',10,'# scale: 1',...
    10,'# column_names: east north up east_sigma north_sigma up_sigma year month day hour',...
    10,'# columns_index: 1 2 3 4 5 6 11 12 13 14',10,'# index_cols: year month day hour',...
    10,'# index_formats: %Y %m %d %H',10,'# unit: mm',10,'# time_unit: years',...
    10,'# scale: 1000',10,'# column_names: east north up east_sigma north_sigma up_sigma year month day hour',...
    10,'# columns_index: 1 2 3 4 5 6 11 12 13 14',10,'# index_cols: 11 12 13 14',...
    10,'# index_formats: %Y %m %d %H'];
fid_w=fopen(output_dz,'w');
fprintf(fid_w,'%s\n',header);
while feof(fid)==0
    tline=fgetl(fid);
    B(1)=str2num(tline(1:9));%时间
    num_month=str2num(tline(6:7));
    num_day=sum(day_month(1:num_month-1))+str2num(tline(8:9));%一年中占的天数
    B(1)=str2num(tline(1:5))+num_day/365;
    B(2)=(str2num(tline(74:81)));
    B(3)=(str2num(tline(83:90)));
    B(4)=(str2num(tline(92:99)));
    B(5)=(str2num(tline(171:178)));
    B(6)=(str2num(tline(181:188)));
    B(7)=(str2num(tline(191:198)));
    B(8)=(str2num(tline(202:209)));
    B(9)=(str2num(tline(211:218)));
    B(10)=(str2num(tline(220:227)));
    B(11)=str2num(tline(58:72));
    B(12)=str2num(tline(2:5));
    B(13)=str2num(tline(6:7));
    B(14)=str2num(tline(8:9));
    B(15)=12;
    B(16)=0;
    B(17)=0;
    fprintf(fid_w,'%.8f        %.6f        %.6f       %.6f        %.6f       %.6f       %.6f        %.6f        %.6f        %.6f      %.2f  %d %d %d %d  %d  %d\n',B);
end
A=0;
fclose(fid_w);
end

