% report
close all
%% ���
clc
clear
%% ����ͼ��
Img = imread( 'newspaper.jpg');
% ���ԭͼ��
figure, imshow(Img);
title( 'origin');
%% Ϊͼ�����Ӹ�˹����
% ���þ�ֵav������std
av = 0; std = 0.5;
% ����ֵΪavg������Ϊstd�ĸ�˹�����ӵ�ͼ��Img�ϡ�
% Ĭ��ֵΪ��ֵ��0��������0.01������
I1 = imnoise( Img, 'gaussian' , av , std );
% �����˹����ͼ��
figure, imshow(I1);
title( 'GaussianNoise');
%% Ϊͼ�����ӽ�������
% ���������ܶ�d
d = 0.5;
% �ý���������Ⱦͼ��Img������d�������ܶȣ�����������ֵ��ͼ������İٷֱȣ���
% ��ˣ���Լ��d*numel��Img���������ܵ�Ӱ�졣Ĭ�ϵ������ܶ�Ϊ0.05��
I2 = imnoise( Img, 'salt & pepper', d);
%  �����������ͼ��
figure, imshow(I2);
title( 'Salt & PepperNoise');
%% ʹ����ֵ�˲��͸�˹�˲����лָ�
% %% ��ֵ�˲���
% %% ����3*3������ֵ�˲���
% masksize = [3 3];
% % �����˹����ͼ��
% I1_M3=MedianFilter(I1,masksize);
% % ����������ͼ��
% I2_M3=MedianFilter(I2,masksize);
% % �����˹�����ָ���ͼ��
% figure, imshow(I1_M3);
% title( 'GaussianNoise-M3');
% %  ������������ָ���ͼ��
% figure, imshow(I2_M3);
% title( 'Salt & PepperNoise-M3');
% %% ����7*7������ֵ�˲���
% masksize = [7 7];
% % �����˹����ͼ��
% I1_M7=MedianFilter(I1,masksize);
% % ����������ͼ��
% I2_M7=MedianFilter(I2,masksize);
% % �����˹�����ָ���ͼ��
% figure, imshow(I1_M7);
% title( 'GaussianNoise-M7');
% %  ������������ָ���ͼ��
% figure, imshow(I2_M7);
% title( 'Salt & PepperNoise-M7');
% %% ��˹�˲���
%% ͼ��ڰ׻�(��ֵ��)(��ɫ������)(�·��ֲʵ�Ҳ�ܴ���)
I1_G=rgb2gray(I1);
I2_G=rgb2gray(I2);
% �������ͼ�ĻҶ�ͼ
figure, imshow(I1_G);
title( 'GaussianNoise-Gray');
figure, imshow(I2_G);
title( 'Salt & PepperNoise-Gray');
% %% ����3*3���ĸ�˹�˲���
% masksize = [3 3];
% % masksize = [5 5];
% % sigma (�ο�ֵ0.8)
% sigma = 1;
% % �����˹����ͼ��
% I1_G3 = GaussianFilter( I1, masksize, 'replicate');
% % ����������ͼ��
% I2_G3 = GaussianFilter( I2, masksize, 'replicate');
% % �����˹�����ָ���ͼ��
% figure, imshow(I1_G3);
% title( 'GaussianNoise-G3');
% %  ������������ָ���ͼ��
% figure, imshow(I2_G3);
% title( 'Salt & PepperNoise-G3');
% %% ����7*7���ĸ�˹�˲���
% masksize = [7 7];
% % sigma (�ο�ֵ0.8)
% sigma = 1;
% % �����˹����ͼ��
% I1_G7 = GaussianFilter( I1, masksize, 'replicate');
% % ����������ͼ��
% I2_G7 = GaussianFilter( I2, masksize, 'replicate')
% % �����˹�����ָ���ͼ��
% figure, imshow(I1_G7);
% title( 'GaussianNoise-G7');
% %  ������������ָ���ͼ��
% figure, imshow(I2_G7);
% title( 'Salt & PepperNoise-G7');
%% ʹ��Ƶ���˲���
%% ������˹��ͨ�˲�
% �ο�����D0 = 200, n = 5
D0 = 700; n = 20;
% �����˹����ͼ��
I1_BwLP = ButterworthL_PFilter(I1_G, D0, n);
% ����������ͼ��
I2_BwLP = ButterworthL_PFilter(I2_G, D0, n);
% �����˹�����ָ���ͼ��
figure, imshow(I1_BwLP);
title( 'GaussianNoise-BwLP');
%  ������������ָ���ͼ��
figure, imshow(I2_BwLP);
title( 'Salt & PepperNoise-BwLP');
%% ��˹��ͨ�˲���
% �ο�����D0 = 100
D0 = 100;
% �����˹����ͼ��
I1_GHP = GaussianH_PFilter(I1_G, D0);
% ����������ͼ��
I2_GHP = GaussianH_PFilter(I2_G, D0);
% �����˹�����ָ���ͼ��
figure, imshow(I1_GHP);
title( 'GaussianNoise-GHP');
%  ������������ָ���ͼ��
figure, imshow(I2_GHP);
title( 'Salt & PepperNoise-GHP');







