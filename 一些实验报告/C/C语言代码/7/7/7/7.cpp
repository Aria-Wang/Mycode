/*1
#include <stdio.h>
int main()
{
	int num[5]={1,2,3,4,5};
	int i;
	for(i=0;i<=5;i++)
		printf("%d",num[i]);
	return 0;
}*/


/*1��
#include <stdio.h>
int main()
{
	int num[5]={1,2,3,4,5};
	int i;
	for(i=0;i<5;i++)
		printf("%d",num[i]);
	return 0;
}*/

/*ð������(��С����)*/
#include <stdio.h>
int main()
{
	printf("������7����������\n");
	int a[7],i,t,k=6;
	for(i=0;i<7;i++)
		scanf("%d",&a[i]);
	printf("\n");
	for(i=0;i<k;i++)
	{
		if(a[i]>a[i+1])
		{
			t=a[i];
			a[i]=a[i+1];
			a[i+1]=t;
			k--;
		}
	}
	for(i=0;i<7;i++)
		printf("%d",a[i]);
	return 0;
}

/*����һ��3*5����ĸ�Ԫ�ص�ַ
#include<stdio.h>
int main ()
{
	int;
	int a[3][5]={{1,2,3,4,5},{6,7,8,9,10},{11,12,13,14,15}};

}*/