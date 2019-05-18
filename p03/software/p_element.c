#include <stdio.h>
#define N 5

typedef unsigned char uint8_t;

void matrix_op(uint8_t a, uint8_t b);

FILE *fid_A, *fid_B, *fid_R;

int main()
{
	uint8_t a = 0, b = 0;
	fid_A = fopen("InputsA.txt", "w");
	fid_B = fopen("InputsB.txt", "w");
	fid_R = fopen("ExpectedOutputs.txt", "w");
	if (fid_A == NULL)
	{
	    printf("Error opening file!\n");
	    exit(1);
	}
	if (fid_B == NULL)
	{
	    printf("Error opening file!\n");
	    exit(1);
	}
	if (fid_R == NULL)
	{
	    printf("Error opening file!\n");
	    exit(1);
	}
	for(a=0;a<0xFF;a++)
	{
		for(b=0;b<0xFF;b++)
			matrix_op(a,b);
	}
	
	fclose(fid_A);
	fclose(fid_B);
	fclose(fid_R);
	return 0;
}

void matrix_op(uint8_t a, uint8_t b)
{
	uint8_t i, j, out;
	
	for(i=0;i<N;i++)
	{
		fprintf(fid_A, "%d,", a);
		fprintf(fid_B, "%d,", b);
		for(j=0;j<N;j++)
		{	
			out = (a*b) + out;
		}
		fprintf(fid_R,"%d,",out);
		out = 0;
	}
}

