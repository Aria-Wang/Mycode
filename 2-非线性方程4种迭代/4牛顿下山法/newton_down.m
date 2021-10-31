function [x,k]=newton_down(x_0,fun,dfun,eps) 
%fun��ԭ������fun�ǵ�������error��������x0�ǵ�����ʼ��
x=x_0;
y=f(fun,x);
k=1;	        %��ǵ����˶��ٴ�
while abs(y)>eps
    d=1;
    x2=x-d*y/f(dfun,x);
    while abs(f(fun,x2))>abs(f(fun,x))
        d=d/2;
        x2=x-d*y/f(dfun,x);
    end
    x=x2;
    y=f(fun,x);
    k=k+1;
end
