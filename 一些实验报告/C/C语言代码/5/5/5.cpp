/*��λ��
# include<stdio.h>
int main()
{
	printf("������һ��������:\n");
	int temp,sum=0;
	scanf("%d",&temp);
	while(temp!=0)
	{
		sum=sum*10+temp%10;
		temp/=10;
	}
	printf("���������ķ�λ��Ϊ��%d\n",sum);
	return 0;
}*/

/*ȡ��ĳ�������е�ż��λ
# include<stdio.h>
int main()
{
	printf("������һ��������:\n");
	int m,temp,sum=0;
	scanf("%d",&temp);
	while(temp!=0)
	{
		m=temp%10;
		if(m%2==0)
			sum=sum*10+m;
		temp/=10;
	}
	int u=0;
	while(sum!=0)
	{
		u=u*10+sum%10;
		sum/=10;
	}
	printf("����������ż��λΪ��%d\n",u);
	return 0;
}*/

/*�ж�101-200֮���ж��ٸ�����
# include<stdio.h>
# include<math.h>
int main()
{
	int t,sum=0,i;
	for(t=101;t<=200;t++)
	{
		int k=0;
		double u=sqrt(t*1.0);
		for(i=2;i<=u;i++)
		{
			if(t%i==0)
				k++;
		}
		if(k==0)
			sum++;
	}
	printf("101-200֮�乲��%d������\n",sum);
	return 0;
}*/

/*��������� */
# include<stdio.h>
int main()
{
	int a[20][20]={0},n,i,j;
	printf("��������������εĲ���(0<n<=20)��\n");
	scanf("%d",&n);
	printf("%d�����������Ϊ��\n",n);
	for(i=0;i<n;i++)
		for(j=0;j<=i;j++)
		{
			a[i][0]=1;
			a[i][j]=a[i-1][j-1]+a[i-1][j];
			a[i][i]=1;
		}
	for(i=0;i<n;i++)
	{
		int t;
		for(t=i;t<n;t++)
			printf("   ");
		for(j=0;j<n;j++)
			if(a[i][j]!=0)
				printf("%3d   ",a[i][j]);
		printf("\n");
	}
	return 0;
} 