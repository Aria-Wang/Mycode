%Gray-level Co-occurrence Matrix���Ҷȹ�������
clc
clear
I=[1,1,5,6,8; 2,3,5,7,1; 4,5,7,1,2; 8,5,1,2,5];%���ؾ���

row=size(I,1);%��ȡ��������
column=size(I,2);%��ȡ��������
GV_MIN=min(min(I));%��ȡ��С�Ҷ�ֵ
GV_MAX=max(max(I));%��ȡ���Ҷ�ֵ
d=1;%���þ���
COUNT_FLTR=zeros(GV_MAX,GV_MAX);%�������󣨴����ң�
COUNT_FTTL=zeros(GV_MAX,GV_MAX);%�������󣨴��ϵ��£�
COUNT_LD=zeros(GV_MAX,GV_MAX);%����������Խ��ߣ�
COUNT_RD=zeros(GV_MAX,GV_MAX);%���������ҶԽ��ߣ�

%������
for  m=GV_MIN:GV_MAX
    for n=GV_MIN:GV_MAX
        for i=1:row
            for j=1:d:column-d
                 if(I(i,j)==m&&I(i,j+d)==n)%�ж����ض�
                     COUNT_FLTR(m,n)=COUNT_FLTR(m,n)+1;
                 end
            end
        end
    end
end

%���ϵ���
for  m=GV_MIN:GV_MAX
    for n=GV_MIN:GV_MAX
        for i=1:d:row-d
            for j=1:column
                 if(I(i,j)==m&&I(i+d,j)==n)%�ж����ض�
                     COUNT_FTTL(m,n)=COUNT_FTTL(m,n)+1;
                 end
            end
        end
    end
end

%��Խ���
for  m=GV_MIN:GV_MAX
    for n=GV_MIN:GV_MAX
        for k=-1:1
            diag_M=diag(I,k);%��Խ�������
            for i=1:d:length(diag_M)-d
                 if(diag_M(i)==m&&diag_M(i+d)==n)%�ж����ض�
                     COUNT_LD(m,n)=COUNT_LD(m,n)+1;
                 end
            end
        end
    end
end

%�ҶԽ���
I1=rot90(I);%����ԭ���ؾ���
for  m=GV_MIN:GV_MAX
    for n=GV_MIN:GV_MAX
        for k=-1:1
            arcdiag_M=diag(I1,k);%�ҶԽ�������
            for i=1:d:length(arcdiag_M)-d
                 if(arcdiag_M(i)==m&&arcdiag_M(i+d)==n)%�ж����ض�
                     COUNT_RD(m,n)=COUNT_RD(m,n)+1;
                 end
            end
        end
    end
end

%��һ���õ��Ҷȹ�������
disp('�����ҵõ��ĻҶȹ�������')
GRAY_FLTR=COUNT_FLTR./sum(sum(COUNT_FLTR))
disp('���ϵ��µõ��ĻҶȹ�������')
GRAY_FTTL=COUNT_FTTL./sum(sum(COUNT_FTTL))
disp('����Խ��ߵõ��ĻҶȹ�������')
GRAY_LD=COUNT_LD./sum(sum(COUNT_LD))
disp('���ҶԽ��ߵõ��ĻҶȹ�������')
GRAY_RD=COUNT_FLTR./sum(sum(COUNT_RD))
