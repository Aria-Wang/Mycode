function Conjugate(A,B,x_0,rol)
max_i=1000; %������������
fprintf('\n');
[y,i]= f1(A,B,x_0,max_i,rol);
fprintf('\n');
fprintf('��������:\n   %d \n',i);
fprintf('���̵Ľ�: \n');
fprintf('%10.6f',y);
xlswrite('data.xlsx',y,3); % ��ŵ�data.xlsx�ĵ�3��sheet
end