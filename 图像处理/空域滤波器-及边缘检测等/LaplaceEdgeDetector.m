% Laplacian��Ե����㷨
function Img_out=LaplaceEdgeDetector(Img)
laplace=[1,1,1;1,-8,1;1,1,1];   %����������˹����
Img_out=uint8(conv2(Img,laplace,'same'));
end
% �ڵ�ͼ��Ƚ�"�ɾ�"ʱ�нϺõı�Ե������ã��Ҿ�����������Sobel�㷨
% ����Laplacian�������������У��������ܵ��������ţ�