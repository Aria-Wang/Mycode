/*�����������ж�
# include<stdio.h>
# include<math.h>
int main()
{
	float a,b,c;
	printf("�����������ε����ߣ��ö��Ÿ�����:\n");
	scanf("%f,%f,%f",&a,&b,&c);
	switch(a>0&&b>0&&c>0)
	{
		case 1:
			switch(a+b<c||a+c<b||b+c<a)
			{
				case 0:
					switch(fabs(a-b)<1e-19||fabs(b-c)<1e-19||fabs(c-a)<1e-19)
					{
						case 1:
							switch(a==b==c)
								{
									case 1:printf("���������ǵȱ�������\n");break;
									case 0:printf("���������ǵ���������\n");break;
								};break;
						case 0:printf("�������β��ǵ���������\n");break;
					}
					switch(fabs(a*a+b*b-c*c)<1e-19||(b*b+c*c-a*a)<1e-19||(c*c+a*a-b*b)<1e-19)
					{
						case 1:printf("����������ֱ��������\n");break;
						case 0:printf("�������β���ֱ��������\n");break;
					};break;
				case 1:printf("������������\n");break;
			};break;
		case 0:printf("���ݴ����߶γ���ӦΪ�Ǹ�����\n");break;
	}
	return 0;
}*/


/*�ɼ��ȼ�
# include<stdio.h>
int main()
{
	printf("������ٷ��Ƴɼ�\n");
	int score;
	scanf("%d",&score);
	if(score>100||score<0)
		printf("Data errors!\n"
				"�ٷ��Ƴɼ�Ӧ����0��100֮�������\n");
	else if(90<=score&&score<=100)
		printf("score=%d,'A'\n",score);
	else if(80<=score&&score<90)
		printf("score=%d,'B'\n",score);
	else if(70<=score&&score<80)
		printf("score=%d,'C'\n",score);
	else if(60<=score&&score<70)
		printf("score=%d,'D'\n",score);
	else if(score<60)
		printf("score=%d,'E'\n",score);
	
	return 0;
}*/

/*Ѱ�����������С��*/
# include<stdio.h>
int main()
{
	int a,max,min,k=1;
	printf("������5����(�ÿո����):\n");
	scanf("%d",&a);
	max=a;min=a;
	while(k<5)
	{
		scanf("%d",&a);
		if(a<min)
			min=a;
		if(a>max)
			max=a;
		k++;
	}
	printf("�����=%d,��С��=%d\n",max,min);
	return 0;
}
