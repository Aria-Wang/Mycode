%A��ϵ������
%B�Ƿ�������Ҷ�����
clc
clear
s = 13;
x1 = [];
for i=1:s
    fprintf('��ֱ����ε�λ����%dλѧ��:\n',s);
    x = input('�����룺');
    x1(end+1) = x;
end
x1  %����ѧ��
m = 10;  %ѧ���ظ�����(m>=10)
n = s*m;
A1 = ones(n,n);
A2 = ones(n-1,n-1);
A = diag(diag(4*A1))+ diag(diag(-1*A2),1)...
    + diag(diag(-1*A2),-1);  %ϵ������
x0 = repmat(x1,1,m);  %ѧ���ظ�m�εõ���x0(x*)
B = A*x0.';  %����b=Ax0���ɵ�B
x = run(A,B,n);