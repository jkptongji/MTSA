function [ hz,cezhanm ] = get_hz_cezhanm( FileName )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
fm=FileName(end:-1:1);%倒序
    i=strfind(fm,'.');
    hz=fm(1:i-1);%获取后缀名
    hz=hz(end:-1:1);
    j=strfind(FileName,'.');
    cezhanm=FileName(1:j-1); 

end

