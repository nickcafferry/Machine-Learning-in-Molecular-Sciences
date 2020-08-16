#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
   double s1,s2,fe_nn,fe,cost,sum,L2_error;
   int npts,i;
   FILE *infile;

   printf("Input the number of points in the validation set\n");
   scanf("%d",&npts);
   infile = fopen("output.txt","r");

   sum = 0.0;
   for(i = 1; i <= npts; i++){
      fscanf(infile,"%lf %lf %lf %lf %lf",&s1,&s2,&fe_nn,&fe,&cost);
      sum += (fe_nn - fe)*(fe_nn - fe);
   }
   L2_error = sqrt(sum/((double) npts));
   printf("L2_error = %.12g\n",L2_error);
   return 0;
   
}
