function [ hz,cezhanm ] = get_hz_cezhanm( FileName )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
fm=FileName(end:-1:1);%����
    i=strfind(fm,'.');
    hz=fm(1:i-1);%��ȡ��׺��
    hz=hz(end:-1:1);
    j=strfind(FileName,'.');
    cezhanm=FileName(1:j-1); 

end

