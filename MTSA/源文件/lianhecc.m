function [ e ] = lianhecc( GB,n_s )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
 for j=1:n_s
        Length(j)=length(GB{j});
    end
    N=min(Length);
    A=GB{1};
    p=A(:,1);
    q=A(:,2);
    p=p(1:N);
    q=q(1:N);
    a=[p q];
    b=A(:,3);
    b=b(1:N);
    for k=2:length(GB)
        A=GB{k};
        c=A(:,2);
        c=c(1:N);
        d=A(:,3);
        d=d(1:N);
        a=[a c];
        b=[b d];
    end
    e=[a b];

end

