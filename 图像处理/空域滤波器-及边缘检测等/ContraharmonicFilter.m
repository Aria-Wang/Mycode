%��г����ֵ�˲���
% QΪ����ʱ���Ժ��������нϺõĻָ�Ч����
% ���԰���������ָ�Ч���ܲ����������ͼ����ɰ�ɫ��
% ��QΪ����ʱ���԰��������кܺõĻָ�Ч����
% ���Ժ��������Ļָ�Ч���ܲ����������ͼ����ɺ�ɫ��
function Img_out=ContraharmonicFilter(Img,Q)
[M,N]=size(Img);
ImgSize=3;   ImgSize=(ImgSize-1)/2;
Img_out=Img;
for x=1+ImgSize:1:M-ImgSize
    for y=1+ImgSize:1:M-ImgSize
        is=Img(x-ImgSize:1:x+ImgSize,y-ImgSize:1:y+ImgSize);
        Img_out(x,y)=sum(double(is(:)).^(Q+1))/sum(double(is(:)).^(Q));
    end
end
end