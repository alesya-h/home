#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include "globals.h"

void Search1(int i);
void Search2(int i);
void Search3(int i);
void Search4(int i);
void Search5(int i);
void Search6(int i);
int Check(int i,int j);
void Eq(int mas[13],int mas1[13]);
void show(int mas[13]);
void Initialize(void);

void main()
{
int p,v,q=0,i;
do
{


fflush(stdin);
system("cls");
Initialize();
puts("Viberite tochku neispravnosti (1-6)");
scanf("%d",&p);
puts("Viberite znachenie neispravnosti (0-1)");
scanf("%d",&v);
puts("Testovaja posledovatelnost':");
puts("----------------------------------------------");
puts("1  2  3  4  5  6  7  8  9 10 11 12 13");
puts("----------------------------------------------");
switch(p)
 {
  case 1:
	  Search1(v);
	  break;
  case 2:
	  Search2(v);
	  break;
  case 3:
	  Search3(v);
	  break;
  case 4:
	  Search4(v);
	  break;
  case 5:
	  Search5(v);
	  break;
  case 6:
	  Search6(v);
	  break;
 }

fflush(stdin);
puts("\n\nPovtor?");
scanf("%d",&q);
}while(q);
}

void Initialize(void)
{
  for(int i=0;i<13;i++)
  {
	 f1s1[i]=f1s2[i]=f2s1[i]=f2s2[i]=f2s3[i]=2;
	 f3s1[i]=f3s2[i]=f3s3[i]=2;
	 f4s1[i]=f4s2[i]=f4s3[i]=f4s4[i]=2;
	 f5s1[i]=f5s2[i]=f5s3[i]=2;
	 f6s1[i]=f6s2[i]=f6s3[i]=2;
  }

	 f1s1[2]=0; f1s1[7]=1; 
	 f1s2[2]=1; f1s2[7]=0;

	 f2s1[4]=f2s1[5]=f2s1[8]=1;
	 f2s2[4]=f2s2[8]=0; f2s2[5]=2;
	 f2s3[5]=f2s3[8]=0; f2s3[4]=2;

	 f3s1[0]=f3s1[1]=f3s1[9]=1;
	 f3s2[0]=f3s2[9]=0; f3s2[1]=2;
	 f3s3[1]=f3s3[9]=0; f3s3[0]=2;

	 f4s1[3]=f4s1[8]=f4s1[6]=f4s1[10]=1;
	 f4s2[3]=f4s2[10]=0; f4s2[6]=f4s2[8]=2;
	 f4s3[8]=f4s3[10]=0; f4s3[3]=f4s3[6]=2;
	 f4s4[6]=f4s4[10]=0; f4s4[3]=f4s4[8]=2;

	 f5s1[7]=f5s1[10]=f5s1[11]=1;
	 f5s2[7]=f5s2[11]=0; f5s2[10]=2;
	 f5s3[10]=f5s3[11]=0; f5s3[7]=2;

	 f6s1[9]=f6s1[11]=f6s1[12]=1;
	 f6s2[9]=f6s2[12]=0; f6s2[11]=2;
	 f6s3[11]=f6s3[12]=0; f6s3[9]=2;

	 //////////////////////////////////////////////////////////////////////////

	 for(int i=0;i<13;i++)
  {
	 f1dp1[i]=f1dp2[i]=f2dp1[i]=f2dp2[i]=f2dp3[i]=2;
	 f3dp1[i]=f3dp2[i]=f3dp3[i]=2;
	 f4dp1[i]=f4dp2[i]=f4dp3[i]=f4dp4[i]=2;
	 f5dp1[i]=f5dp2[i]=f5dp3[i]=2;
	 f6dp1[i]=f6dp2[i]=f6dp3[i]=2;
  }

	 f1dp1[2]=0; f1dp1[7]=4; 
	 f1dp2[2]=1; f1dp2[7]=3;

	 f2dp1[4]=f2dp1[5]=1; f2dp1[8]=4;
	 f2dp2[4]=0; f2dp2[8]=3; f2dp2[5]=2;
	 f2dp3[5]=0; f2dp3[8]=3; f2dp3[4]=2;

	 f3dp1[0]=f3dp1[1]=1; f3dp1[9]=4;
	 f3dp2[0]=0; f3dp2[9]=3; f3dp2[1]=2;
	 f3dp3[1]=0; f3dp3[9]=3; f3dp3[0]=2;

	 f4dp1[3]=f4dp1[8]=f4dp1[6]=1; f4dp1[10]=4;
	 f4dp2[3]=0; f4dp2[10]=3; f4dp2[6]=f4dp2[8]=2;
	 f4dp3[8]=0; f4dp3[10]=3; f4dp3[3]=f4dp3[6]=2;
	 f4dp4[6]=0; f4dp4[10]=3; f4dp4[3]=f4dp4[8]=2;

	 f5dp1[7]=f5dp1[10]=1; f5dp1[11]=4;
	 f5dp2[7]=0; f5dp2[11]=3; f5dp2[10]=2;
	 f5dp3[10]=0; f5dp3[11]=3; f5dp3[7]=2;

	 f6dp1[9]=f6dp1[11]=1; f6dp1[12]=4;
	 f6dp2[9]=0; f6dp2[12]=3; f6dp2[11]=2;
	 f6dp3[11]=0; f6dp3[12]=3; f6dp3[9]=2;

	  //////////////////////////////////////////////////////////////////////////

	  for(int i=0;i<13;i++)
  {
	 f4d12[i]=f4d13[i]=f4d14[i]=f4d21[i]=f4d31[i]=f4d41[i]=2;
  }

	 f4d12[3]=3;f4d12[8]=1;f4d12[6]=1;f4d12[10]=3;
	 f4d13[3]=1;f4d13[8]=3;f4d13[6]=1;f4d13[10]=3;
	 f4d14[3]=1;f4d14[8]=1;f4d14[6]=3;f4d14[10]=3;
	 f4d21[3]=4;f4d21[8]=1;f4d21[6]=1;f4d21[10]=4;
	 f4d31[3]=1;f4d31[8]=4;f4d31[6]=1;f4d31[10]=4;
	 f4d41[3]=1;f4d41[8]=1;f4d41[6]=4;f4d41[10]=4;

	 for(int i=0;i<13;i++)
  {
	 f5d12[i]=f5d13[i]=f5d21[i]=f5d31[i]=2;
  }

	 f5d12[7]=3;f5d12[10]=1;f5d12[11]=3;
	 f5d13[7]=1;f5d13[10]=3;f5d13[11]=3;
	 f5d21[7]=4;f5d21[10]=1;f5d21[11]=4;
	 f5d31[7]=1;f5d31[10]=4;f5d31[11]=4;

	 for(int i=0;i<13;i++)
  {
	 f6d12[i]=f6d13[i]=f6d21[i]=f6d31[i]=2;
  }

	 f6d12[9]=3;f6d12[11]=1;f6d12[12]=3;
	 f6d13[9]=1;f6d13[11]=3;f6d13[12]=3;
	 f6d21[9]=4;f6d21[11]=1;f6d21[12]=4;
	 f6d31[9]=1;f6d31[11]=4;f6d31[12]=4;
}
int Check(int i,int j)
{
 if(i==j) return i;
 if(i==2) return j;
 if(j==2) return i;
 return 5;
}
void show(int mas[13])
{
 for(int i=0;i<13;i++)
 {
  if(mas[i]==0) printf("0  ");
  if(mas[i]==1) printf("1  ");
  if(mas[i]==2) printf("x  ");
  if(mas[i]==3) printf("d  ");
  if(mas[i]==4) printf("b  ");
 }
 puts("");
}
void Eq(int mas[13],int mas1[13])
{
 for(int i=0;i<13;i++)
 mas[i]=mas1[i];
}

void Search1(int i)
{
 int var,j;
 if(i==0) 
 { 
	 show(f1dp1); 
	 Eq(result1,result);
	 var=0;
	 for(j=0;j<13;j++)
    {
     result1[j]=Check(f1dp1[j],f5d21[j]);
     if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f5d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f6d31[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f6d13[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }

	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f2s1[j]);
	 if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f2s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f3s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f3s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f4s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f4s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

    Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");
 }
 else 
 {
	 show(f1dp2);
	 Eq(result1,result);
	 var=0;

	  for(j=0;j<13;j++)
    {
     result1[j]=Check(f1dp2[j],f5d12[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f5d21[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }

	}

     Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f6d13[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f6d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }

	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f2s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f2s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f3s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f3s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f4s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f4s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

    Eq(result,result1);
	show(result);
    printf("\n-------------------");
    puts("TEST");
 }
}

void Search2(int i)
{
 int var,j;
 if(i==0) 
 {
	 show(f2dp1);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(f2dp1[j],f4d31[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f4d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f5d31[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f5d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f6d31[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f6d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f1s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f1s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f3s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f3s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

    Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");

 }
 else 
 {
	 show(f2dp2);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(f2dp2[j],f4d13[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f4d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f5d13[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f5d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f6d13[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f6d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f1s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f1s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f3s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f3s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");
 }
}

void Search3(int i)
{
 int var,j;
 if(i==0) 
 {
	 show(f3dp1);
	 Eq(result1,result);
	 var=0;

	  for(j=0;j<13;j++)
    {
     result1[j]=Check(f3dp1[j],f6d21[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f6d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

     Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f1s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f1s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f2s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f2s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f4s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f4s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f5s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f5s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

    Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");
 }
 else 
 {
	 show(f3dp2);
	 Eq(result1,result);
	 var=0;

	  for(j=0;j<13;j++)
    {
     result1[j]=Check(f3dp2[j],f6d12[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f6d13[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f1s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f1s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f2s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f2s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f4s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f4s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f5s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f5s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");
 }
}

void Search4(int i)
{
 int var,j;
 if(i==0) 
 {
	 show(f4dp1);
	 Eq(result1,result);
	 var=0;

	  for(j=0;j<13;j++)
    {
     result1[j]=Check(f4dp1[j],f5d31[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f5d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f6d31[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f6d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f1s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f1s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f2s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f2s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f3s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f3s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");
 }
 else
 {
	 show(f4dp2);
	 Eq(result1,result);
	 var=0;

	  for(j=0;j<13;j++)
    {
     result1[j]=Check(f4dp2[j],f5d13[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f5d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f6d13[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f6d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f1s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f1s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f2s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f2s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f3s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f3s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

    Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");
 }
}

void Search5(int i)
{
 int var,j;
 if(i==0)
 {
	 show(f5dp1);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(f5dp1[j],f6d31[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f6d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f1s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f1s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f3s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f3s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f2s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f2s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f4s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f4s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

    Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");
 }
 else
 {
	 show(f5dp2);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(f5dp2[j],f6d13[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f6d12[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f1s2[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f1s1[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f3s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f3s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f2s2[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f2s1[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f4s3[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f4s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

    Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");
 }
}

void Search6(int i)
{
 int var,j;
 if(i==0) 
 {
	 show(f6dp1);
	 Eq(result1,result);
	 var=0;

	  for(j=0;j<13;j++)
    {
     result1[j]=Check(f6dp1[j],f1s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f1s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f2s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f2s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f3s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f3s1[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f4s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f4s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f5s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f5s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

    Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");
 }
 else
 {
	 show(f6dp2);
	 Eq(result1,result);
	 var=0;

	  for(j=0;j<13;j++)
    {
     result1[j]=Check(f6dp2[j],f1s2[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f1s1[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f2s1[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f2s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f3s3[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f3s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f4s4[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f4s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	 Eq(result,result1);
	 show(result);
	 Eq(result1,result);
	 var=0;

	 for(j=0;j<13;j++)
    {
     result1[j]=Check(result[j],f5s3[j]);
	  if(result1[j]==5) var=5;
    }
    if(var==5)
    {
     var=0;
     Eq(result1,result);
     for(j=0;j<13;j++)
     {
      result1[j]=Check(result1[j],f5s2[j]);
      if(result1[j]==5) var=5;
     }
     if(var==5)
     {
	printf("\nTest ne sostavlen");
	return;
     }
	}

	Eq(result,result1);
	show(result);
	printf("\n-------------------");
    puts("TEST");
 }
}