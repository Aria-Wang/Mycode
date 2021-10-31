% ��ֵ�˲�
% masksize = [N N]
% ��ʾ����N*N������ֵ�˲���
% ����ȡ��Խ���˲�Ч��Խ�ã�ͬ��ͼ��Ҳ����Խģ��
function Img_out=MedianFilter(Img,masksize)
exsize=floor(masksize/2);   %��������չ��С
Imgex=padarray(Img,[exsize,exsize],'replicate','both'); %��չͼƬ
[m,n]=size(Img);
Img_out=Img;    %��Img_out׼��Ϊ��Img��ͬ��size
for i=1:m
    for j=1:n
        neighbor=Imgex(i:i+masksize-1,j:j+masksize-1);  %��ȡ����
        Img_out(i,j)=median(neighbor(:));   %��ֵ�˲�
    end
end
end