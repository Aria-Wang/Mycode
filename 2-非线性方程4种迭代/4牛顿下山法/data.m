clc
clear
fun='x^3-3*x-1';    %ԭ����
dfun='3*x^2-3';    %ԭ���̵�΢��
[x,y]=newton_down(-3,fun,dfun,1e-5)     %�������