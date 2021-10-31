% ����ÿ����������ͼ���ϵ������ۼƺͣ�
% �õ�������Ҷ�����
function re = grayline(img)

[m,n]=size(img);

cy=m/2;
cx=n/2;

%�����ĵ㵽ͼ���ĸ��ǵľ���
up_l=sqrt((cy-0)^2+(cx-0)^2);
up_r=sqrt((cy-0)^2+(cx-n)^2);
down_l=sqrt((cy-m)^2+(cx-0)^2);
down_r=sqrt((cy-m)^2+(cx-n)^2);

num=3600;
%�����ĵ�����ĽǾ�������ֵ����Ϊ�任��ͼ��ĸߡ�
%������ֵҲ�Ǽ�����任�ļ���
r=round(max([up_l up_r down_l down_r]));
re = zeros(num,1);

for i=0:1:r          %���������������ͬ�����һ��
    for j=1:num       %����������ǣ�Ϊ3600
        %cy,cx��Ϊ������任�������꣬��Ҫ��Ϊƫ�������
        ind = j/10;
        h=round(cy+i*sin(ind*pi/180));
        w=round(cx+i*cos(ind*pi/180));
        
        if h>0 && w> 0&& h<=m && w<=n       %����ԭͼ������غ���
            re(j)= re(j) +double(img(h,w));
        end
    end
end
re = re/sum(re);
end