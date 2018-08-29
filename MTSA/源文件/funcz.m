function [B,C,dd_start,dd_end]= funcz( A )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
%本函数适用于插值，形参A为插值对象
x=A(:,1);
u=A(:,2);
v=A(:,3);%%%%%%%%%%%%%
t=length(x);
s0=1;
t0=1;
dd_start=[];
dd_end=[];
for i=1:t-1
    if (x(i+1)-x(i))>0.0031
        dd_start=[dd_start i];
        dd_end=[dd_end i+1];
        n=floor((x(i+1)-x(i))/0.0029);
        for j=s0:s0+n-1
            xx(j)=x(i)+(j-s0+1)/365.25;
        end
        s0=s0+n;
            
            %{
            for m=t0:t0+n-1
                yy(m)=x(i)+(m-t0+1)/365.25;
            end
            yy=sort(yy);
            x1=x(i-3:i+7);
            u1=u(i-3:i+7);
            y1=interp1(x1,u1,yy);
            x=insertBintoA(x,i,yy);
            u=insertBintoA(u,i,y1);
            %}
            
    end
end
zs=2*randn(1,length(xx));
jd=abs(3*randn(1,length(xx)));%%%%%%%%%
x=[x;xx'];
u=[u;zs'];
v=[v;jd'];%%%%%%%%%%%%%
B=[x u v];%%%%%%%%%%%%%
B=sortrows(B,1);
C=[xx' zs' jd'];
C=sortrows(C,1);
end

