clc
clear
A=imread('newspaper.jpg');
figure,imshow(A);
title('origin'); %���ԭͼ��
I1=imrotate(A,1,'bicubic','crop'); %˫���β�ֵ����ת1�㣬������ͼ��ʹ�õ���ͼ���ԭͼ���Сһ��
I2=imrotate(A,50,'bicubic','crop'); %˫���β�ֵ����ת50�㣬������ͼ��ʹ�õ���ͼ���ԭͼ���Сһ��
I3=imrotate(A,30,'bicubic','crop'); %˫���β�ֵ����ת30�㣬������ͼ��ʹ�õ���ͼ���ԭͼ���Сһ��
I4=imrotate(A,60,'bicubic','crop'); %˫���β�ֵ����ת60�㣬������ͼ��ʹ�õ���ͼ���ԭͼ���Сһ��
figure,imshow(I1);
title('image-1��');
figure,imshow(I2);
title('image-50��');
figure,imshow(I3);
title('image-30��');
figure,imshow(I4);
title('image-60��');