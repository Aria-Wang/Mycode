% Canny��Ե����㷨
% ������Matlab����ʵ��
% ����ȻҲ���Ե���edge����������ѧϰ�Ļ�
% ����Լ��ӵײ�ʵ��һ�����ǰɣ�
I=imread('cameraman.tif');
%I=rgb2gray(I);
figure(1);subplot(121);imshow(I);xlabel('ԭͼ��');
[m n]=size(I);
a=double(I);
sigma=1;               %��˹��׼��
%highThresh=0.0625;     %����ֵ
%lowThresh=0.0250 ;    %����ֵ
  
  
%=======================��˹�˲�&�ݶȼ���=======================

%%%%%%%%%%%%%%%%%%%%%%%%%Old%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pw = 1:30; 
%ssq = sigma^2;
%width = find(exp(-(pw.*pw)/(2*ssq))>0.0001,1,'last');
%if isempty(width)
%    width = 1;  
%end
    
%t = (-width:width);
%gauss = exp(-(t.*t)/(2*ssq))/(2*pi*ssq);     % һά��˹�˲���
    

%[x,y]=meshgrid(-width:width,-width:width);
%gauss2=-x.*exp(-(x.*x+y.*y)/(2*ssq))/(pi*ssq);   %��ά��˹�˲���
    
%��ͼ����и�˹�˲�ƽ��
%aSmooth=imfilter(a,gauss,'conv','replicate');   % ����X����
%aSmooth=imfilter(aSmooth,gauss','conv','replicate'); % ����Y����
    
%ʹ�ö�ά��˹��ͼ����о��
%dx = imfilter(aSmooth, gauss2, 'conv','replicate');
%dy = imfilter(aSmooth, gauss2', 'conv','replicate');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ���ݸ�˹��׼������˲�������
filterExtent = ceil(4*sigma);
x = -filterExtent:filterExtent;

% ����һά��˹��
c = 1/(sqrt(2*pi)*sigma);
gaussKernel = c * exp(-(x.^2)/(2*sigma^2));

% ��׼��
gaussKernel = gaussKernel/sum(gaussKernel);

% ��ֵ�ݶȺ���(Gaussian�˵�����1-D����)
derivGaussKernel = gradient(gaussKernel);

% ��׼��
negVals = derivGaussKernel < 0;
posVals = derivGaussKernel > 0;
derivGaussKernel(posVals) = derivGaussKernel(posVals)/sum(derivGaussKernel(posVals));
derivGaussKernel(negVals) = derivGaussKernel(negVals)/abs(sum(derivGaussKernel(negVals)));

    
% ��ͼ����и�˹�˲�ƽ��
aSmooth=imfilter(a,gaussKernel,'conv','replicate');   % ����X����
aSmooth=imfilter(aSmooth,gaussKernel','conv','replicate');  % ����Y����
%hv=fspecial('sobel');

% �����ݶ�
dx = imfilter(aSmooth, derivGaussKernel, 'conv','replicate');
dy = imfilter(aSmooth, derivGaussKernel', 'conv','replicate');


mag = hypot(dx,dy); 
magmax = max(mag(:));
if magmax>0
    magGrad = mag / magmax;   % �ݶȱ�׼��
end

% ��ֵѡ��
%PercentOfPixelsNotEdges = 0.7; 
counts=imhist(magGrad, 64);
highThresh = find(cumsum(counts) > 0.7*m*n, 1 ,'first' ) / 64;
lowThresh = 0.4*highThresh;

%figure(8);imshow(magGrad);
%%========================��˹�˲�========================================
%w=fspecial('gaussian',[5 5]);
%img=imfilter(img,w,'replicate');
%figure;
%imshow(uint8(img))

%%===================sobel��Ե���=======================================
%hv=fspecial('sobel');
%dx=imfilter(img,hv,'replicate');      %����Ե
%hh=hv';
%dy=imfilter(img,hh,'replicate');      %������Ե
%img=sqrt(dx.^2+dy.^2); 


%    magmax = max(img(:));%      ����ֵѡ���һ����
%    if magmax > 0
%        magGrad = img / magmax;
%    end
%figure;
%imshow(uint8(img));

I = thinAndThreshold(dx, dy, magGrad, lowThresh, highThresh);


%disp(lowThresh);
subplot(122);imshow(I);xlabel('canny��Ե���');
disp('����ֵTL: '+highThresh);
disp('����ֵTH: '+lowThresh);


%========================�Ǽ���ֵ���ƺͱ�Ե����=======================================
function H = thinAndThreshold(dx, dy, magGrad, lowThresh, highThresh)

E = cannyFindLocalMaxima(dx,dy,magGrad,lowThresh);  %�Ǽ���ֵ����

if ~isempty(E)
    [rstrong,cstrong] = find(magGrad>highThresh & E);

    if ~isempty(rstrong) 
        H = bwselect(E, cstrong, rstrong, 8);   % ѡ��ǿ��Ե8��ͨĿ��
       % figure(2);imshow(H);
        
       % set(0,'RecursionLimit',1000);      %����Ե��ͨ����̫�����ã�������ʱ�������
       % [xstrong ystrong]=find(magGrad>highThresh & E);
       % for i=1:numel(xstrong);
       %     H = connect1(H,xstrong(i),ystrong(i),lowThresh,highThresh,magGrad);
       % end
       %  figure(3);imshow(H);
        
        H = bwmorph(H, 'thin', 1);      % ��Եϸ��
    else
        H = false(size(E));
    end
else
    H = false(size(E));
end
end

%========================����Ե����=======================================

function nedge=connect1(nedge,y,x,low,high,magGrad)       %���Ӷ�λ�����ͨ����
    neighbour=[-1 -1;-1 0;-1 1;0 -1;0 1;1 -1;1 0;1 1];  %����ͨ��Ѱ
    [m n]=size(nedge);

    for k=1:8
        yy=fix(y+neighbour(k,1));
        xx=fix(x+neighbour(k,2));


        if yy>=1 &&yy<=m &&xx>=1 && xx<=n  
            if magGrad(yy,xx)>=low & nedge(yy,xx)~=255 & magGrad(yy,xx)<high  
                nedge(yy,xx)=255;
                %disp('check check');
                %nedge=connect1(nedge,yy,xx,low,high,magGrad);
            end
        end
    end
end