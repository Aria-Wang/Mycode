% ��˹�˲�
% masksize = [N N]
% ��ʾ����N*N������ֵ�˲���
% sigmaֵԽ���˲�Ч��Խ�ã�ͼ��Խģ��
% ����ȡ��Խ���˲�Ч��Խ�ã�ͬ��ͼ��Ҳ����Խģ��
function Img_out = GaussianFilter( Img, masksize, sigma)
w = fspecial( 'gaussian', masksize, sigma);
%replicate:ͼ���Сͨ����ֵ��߽��ֵ����չ
%symmetric ͼ���Сͨ��������ı߽���о���ӳ����չ
Img_out = imfilter( Img, w, 'replicate');