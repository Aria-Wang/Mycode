function simu2
M(1)=0;T(1)=0;
for i=1:500 %����
    [M(i),T(i)]=aaa;
end
mean_M=mean(M);
mean_T=mean(T);
fprintf('�����ÿ��ƽ������˿�����%fλ \n',  mean_M);
fprintf('�����ÿλ�˿�ƽ���ȴ�ʱ�䣺%f���� \n', mean_T);