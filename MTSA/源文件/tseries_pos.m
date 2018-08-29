function [ A ] = tseries_pos( input_dz,output_dz,name )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
fid=fopen(input_dz,'r');
for i=1:14
    tline=fgetl(fid);    
end
k=1;
a=-2800000;
b=-2500000;
c=-4800000;
d=-4500000;
e=3500000;
f=3800000;
X=(a+(b-a)*rand(1));
Y=(c+(d-c)*rand(1));
Z=(e+(f-e)*rand(1));
N=(30+10*rand(1));
E=(200+100*rand(1));
U=(500+100*rand(1));
fid_w=fopen(output_dz,'w');
 dX=0.00001+0.0056*rand(1);
    dY=0.00001+0.0056*rand(1);
    dZ=0.00001+0.0056*rand(1);
    dN=0.0000000001+4.5000e-09*rand(1);
    dE=0.0000000001+4.5000e-09*rand(1);
    dU=0.0000000001+4.5000e-09*rand(1);
    tline=fgetl(fid);
    year=(tline(186:189));%时间
    month=str2num(tline(191:192));
    month=num2str(month,'%02d');
    day=str2num(tline(194:195));
    day=num2str(day,'%02d');
    time=[year,month,day];
    %B(1)=[year,month,day];
    B(1)=str2num(time);
    B(2)=120000;
    B(3)=51411.5000;
    B(4)=X+dX;
    B(5)=Y+dY;
    B(6)=Z+dZ;
    B(7)=str2num(tline(22:30));
    B(8)=str2num(tline(39:47));
    B(9)=str2num(tline(56:64));
    B(10)=0;
    B(11)=0;
    B(12)=0;
    B(13)=N+dN;
    B(14)=E+dE;
    B(15)=U+dU;
    B(16)=str2num(tline(73:81));
    B(17)=str2num(tline(90:98));
    B(18)=str2num(tline(107:115));
    B(19)=str2num(tline(124:132));
    B(20)=str2num(tline(141:149));
    B(21)=str2num(tline(158:166));
    B(22)=0;
    B(23)=0;
    B(24)=0;
    
header=['PBO Station Position Time Series. Reference Frame : ITRF2005',...
    10,'Format Version: 1.0.2',10,'4-character ID: ',name,...
    10,'Station name  : ',[name,'_sio.noamf'],10,'First Epoch   : ',[time,' 120000'],...
    10,'Last Epoch    : ','20090110 120000',10,'Release Data  : 20090127 142905',...
    10,'XYZ Reference position :  ',[num2str(X),' ',num2str(Y),' ',num2str(Z)],...
    10,'NEU Reference position :  ',[num2str(N),' ',num2str(E),' ',num2str(U),'(ITRF2005/WGS84)']];
fprintf(fid_w,'%s\n',header);
fprintf(fid_w,' %d %d %.4f %.5f %.5f %.5f %.5f %.5f %.5f %.3f %.3f %.3f %.10ff %.10f %.5f %.5f %.5f %.5f %.5f %.5f %.5f %.3f %.3f %.3f %s\n',B,'noamf');
while feof(fid)==0
    dX=0.00001+0.0056*rand(1);
    dY=0.00001+0.0056*rand(1);
    dZ=0.00001+0.0056*rand(1);
    dN=0.0000000001+4.5000e-09*rand(1);
    dE=0.0000000001+4.5000e-09*rand(1);
    dU=0.0000000001+4.5000e-09*rand(1);
    tline=fgetl(fid);
    year=(tline(186:189));%时间
    month=str2num(tline(191:192));
    month=num2str(month,'%02d');
    day=str2num(tline(194:195));
    day=num2str(day,'%02d');
    time=[year,month,day];
    %B(1)=[year,month,day];
    B(1)=str2num(time);
    B(2)=120000;
    B(3)=51411.5000+k;
    B(4)=X+dX;
    B(5)=Y+dY;
    B(6)=Z+dZ;
    B(7)=str2num(tline(22:30));
    B(8)=str2num(tline(39:47));
    B(9)=str2num(tline(56:64));
    B(10)=0;
    B(11)=0;
    B(12)=0;
    B(13)=N+dN;
    B(14)=E+dE;
    B(15)=U+dU;
    B(16)=str2num(tline(73:81));
    B(17)=str2num(tline(90:98));
    B(18)=str2num(tline(107:115));
    B(19)=str2num(tline(124:132));
    B(20)=str2num(tline(141:149));
    B(21)=str2num(tline(158:166));
    B(22)=0;
    B(23)=0;
    B(24)=0;
    fprintf(fid_w,' %d %d %.4f %.5f %.5f %.5f %.5f %.5f %.5f %.3f %.3f %.3f %.10ff %.10f %.5f %.5f %.5f %.5f %.5f %.5f %.5f %.3f %.3f %.3f %s\n',B,'noamf');
    k=k+1;
end
A=0;
fclose(fid_w);
