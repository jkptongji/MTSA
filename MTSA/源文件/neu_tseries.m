function [ A ] = neu_tseries( input_dz,output_dz )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
fid=fopen(input_dz,'r');
tline=fgetl(fid);
k=0;
fid_w=fopen(output_dz,'w');
header=['# time_unit: years',10,'# unit: mm',10,'# scale: 1',...
    10,'# column_names: east north up east_sigma north_sigma up_sigma year month day hour',...
    10,'# columns_index: 1 2 3 4 5 6 11 12 13 14',10,'# index_cols: year month day hour',...
    10,'# index_formats: %Y %m %d %H',10,'# unit: mm',10,'# time_unit: years',...
    10,'# scale: 1000',10,'# column_names: east north up east_sigma north_sigma up_sigma year month day hour',...
    10,'# columns_index: 1 2 3 4 5 6 11 12 13 14',10,'# index_cols: 11 12 13 14',...
    10,'# index_formats: %Y %m %d %H'];
fprintf(fid_w,'%s\n',header);
while feof(fid)==0
    tline=fgetl(fid);
    year=str2num((tline(11:14)));
    day=str2num((tline(16:18)));
    B(1)=year+day/365;
    B(2)=str2num((tline(21:28)));
    B(3)=str2num((tline(31:38)));
    B(4)=str2num((tline(41:48)));
    B(5)=str2num((tline(51:58)));
    B(6)=str2num((tline(61:68)));
    B(7)=str2num((tline(71:78)));
    B(8)=(B(2)+B(4))/2;
    B(9)=(B(3)+B(5))/2;
    B(10)=(B(6)+B(7))/2;
    B(11)=31622400.00+k*86400;
    B(12)=year;
    [B(13),B(14)]=find_m_d(day);
    B(15)=12;
    B(16)=0;
    B(17)=0;
    fprintf(fid_w,'%.8f        %.6f        %.6f        %.6f        %.6f        %.6f        %.6f        %.6f        %.6f        %.6f      %.2f  %d  %d %d %d  %d  %d\n',B);
    k=k+1;
end
A=0;
fclose(fid_w);
