clc
clear
fun=inline('x^3-3*x-1');    %ԭ����
dfun=inline('3*x^2-3');    %ԭ���̵�΢��
x=newton(fun,dfun,1.5)     %��ֵ1.5