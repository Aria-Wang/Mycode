% ��˹��ͨ�˲���
% �ο�����D0 = 100
function p=GaussianH_PFilter(Img_in,D0)
[M,N]=size(Img_in);    M=2*M;N=2*N;
u = -M/2:(M/2-1);   v = -N/2:(N/2-1);
[u,v] = meshgrid(u,v);
D = sqrt(u.^2+v.^2);
%����˲�����
H = 1-exp(-D.^2/(2.*(D0.^2))); 
Img_fft= fft2(Img_in,size(H,1),size(H,2));
Img_fft_shift = fftshift(Img_fft);
Img_Gaussian = Img_fft_shift.*H;
Img_out = ifft2(ifftshift(Img_Gaussian));
Img_out = Img_out(1:size(Img_in,1),1:size(Img_in,2));
%���ͼ��
figure;
subplot(2,2,1);imshow(Img_in);title('ԭʼͼ��');
subplot(2,2,2);imshow(log(1+abs(Img_fft_shift)),[]);title('Ƶ��ͼ��');
subplot(2,2,3);plot3(u,v,H);title('��˹�˲���');
subplot(2,2,4);imshow(Img_out);title(['�˲����ͼ��,D0=',num2str(D0)]);
%���㹦���ױȣ�
S = 0;S1 = 0;
[P,Q] = size(Img_fft_shift);
for a = 1:P
    for b=1:Q
        S1 = S1+(abs(Img_Gaussian(a,b)))^2;
        Img_out = (abs(Img_fft_shift(a,b)))^2;
        S=S+Img_out;
    end
end
p = S1/S
end