%�Ӹ�˹������
%% ��һ
% g=imnoise( f , 'gaussian' , m , var )
% ����ֵΪm������Ϊvar�ĸ�˹�����ӵ�ͼ��f�ϡ�
% Ĭ��ֵΪ��ֵ��0��������0.01��������
%% ����
% !!!!!!!!!��Ҫ�ҶȻ�ͼ�����ʹ��!!!!!!!!!!!!

% ��˹������Ч�����ֵ��������������������أ�
% ����Խ��ʱԽģ���������и��󡢸��أ�
% ��׼��Խ��ʱ��ͼ��Խ����Խƫ�ס�
% ��ֵav������std
function Img_out=GaussianNoise(Img,av,std)
[M,N]=size(Img);
u1=rand(M,N);   u2=rand(M,N);
x=std*sqrt(-2*log(u1)).*cos(2*pi*u2)+av;
Img_out=uint8(255*(double(Img)/255+x));
end