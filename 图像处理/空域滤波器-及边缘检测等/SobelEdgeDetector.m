% Sobel��Ե���
% ����x��y�����Sobel����Sx��Sy
% �ֱ���ԭͼ��Sx��Sy���ж�ά������õ�����������ݶȾ���
% �����������ݶȷֱ������ֵ����ӵõ�ͼ����ݶȾ���
% ���ݶȾ���ת��uint8��ʽ����Ϊ�����ͼ��
function [Img_out,gx,gy]=SobelEdgeDetector(Img)
sobely=[1,2,1;0,0,0;-1,-2,-1];  %����y����Sobel����
sobelx=[1,0,-1;2,0,-2;1,0,-1];  %����x����Sobel����
gx=conv2(Img,sobelx,'same');
gy=conv2(Img,sobely,'same');
Img_out=uint8(abs(gx)+abs(gy));
end
% ����Sobel�㷨��ȡ���ı�Ե��Χ�ϴ�������ʾ�ı�Ե��Ϊ�ִ�
% �����������������ˣ��Ҷ������в��������Ч�������Ǿ�ȷ�Ȳ��ߡ�