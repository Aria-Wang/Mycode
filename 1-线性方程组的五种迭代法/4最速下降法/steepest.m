function [x,i] = steepest(A,B,x_0,rol,n)
% n�����Է������ά��
max1 = 1000;
r = B-A*x_0;
% ���ڻ�
c = dot(r,r)/dot(A*r,r);
x = x_0+c*r;
i = 1;
D = {};

while norm(x-x_0)>=rol
    x_0 = x;
    
    r = B-A*x_0;
    c = dot(r,r)/dot(A*r,r);
    x = x_0+c*r;
    fprintf('������%d��\n',i);
    D{i} = x;
    xlswrite('x.xlsx',cell2mat(D),1); % ��ŵ�x.xlsx�ĵ�һ��sheet
    i = i+1;
    if(i>=max1)
        disp('������������',max1,'�Σ���������ܲ�����');
        return;
    end
end