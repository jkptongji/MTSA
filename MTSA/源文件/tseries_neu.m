function [ A ] = tseries_neu( input_dz,output_dz )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
fid=fopen(input_dz,'r');
for i=1:14
    tline=fgetl(fid);    
end
k=0;
fid_w=fopen(output_dz,'w');
fprintf(fid_w,'%s\n','# YYYY.DECM YYYY DOY     N(m)      E(m)      U(m)     nn(m)     ee(m)     uu(m)');
while feof(fid)==0
    tline=fgetl(fid);
    B(1)=str2num((tline(1:13)));
    B(2)=str2num((tline(1:4)));
    B(3)=floor((B(1)-B(2))*365)+k;
    B(4)=str2num((tline(22:30)));
    B(5)=str2num((tline(39:47)));
    B(6)=str2num((tline(55:64)));
    B(7)=str2num((tline(72:81)));
    B(8)=str2num((tline(90:98)));
    B(9)=str2num((tline(107:115)));
    fprintf(fid_w,'%.4f %d %d  %.5f  %.5f  %.5f %.5f  %.5f  %.5f\n',B);
    k=k+1;
end
A=0;
fclose(fid_w);
