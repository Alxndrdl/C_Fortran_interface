#include <stdio.h>
#include <complex.h>

/* Example 1 : Call a Fortran function that returns an int */

int functionThatReturnsAnInt();

/* Example 2 : Call a Fortran subroutine that takes an array as parameter */

void subroutineThatTakesAnArray(double* array);

/* Example 3 : Call a Fortran subroutine that takes a complex as parameter */

void subroutineThatTakesAComplex(double complex* ioComplex);

/* Example 4 : Call a C function with its name from Fortran code */

int callMyCfunction();
void mycfunction_(int* res) /*  ends by _ */
{
	*res = 42;
}

/* Example 5 : Call a C function with its pointer from Fortran code */

void callMyfunctionPtr(void (**)(int*)); /* Pointer to a function pointer */
void printInt(int* myInt) /* The parameter passed by Fortran is a pointer */
{
	printf("In printInt : %i\n", *myInt); /* 35 */
}

int main()
{
	int result;
	int i,j;
	double array[2][3];
	double complex ioComplex;
	void (*fnPtr)(int*);
	
	/* Example 1 : Call a Fortran function that returns an int */
	
	result = functionThatReturnsAnInt();
	printf("functionThatReturnsAnInt : %i\n", result); /* print 123*/
	
	/* Example 2 : Call a Fortran subroutine that takes an array as parameter */

	subroutineThatTakesAnArray((double*)array);
	printf("subroutineThatTakesAnArray : \n");
	for (j = 0 ; j < 2 ; j++)
	{
		for (i = 0 ; i < 3 ; i++)
			printf("%lf,",array[j][i]); /* print 1 2 3 4 5 6 */
		printf("\n");
	}

	/* Example 3 : Call a Fortran subroutine that takes a complex as parameter */
	
	subroutineThatTakesAComplex(&ioComplex); /* take a pointer */
	printf("subroutineThatTakesAComplex : %lf, %lf\n", creal(ioComplex), cimag(ioComplex)); /* print 7-5i */
	
	/* Example 4 : Call a C function with its name from Fortran code */
	
	result = callMyCfunction(); /* print 42 */
	printf("callMyCfunction : %i\n", result);
	
	/* Example 5 : Call a C function with its pointer from Fortran code */
	
	fnPtr = printInt;
	callMyfunctionPtr(&fnPtr); /* take a pointer */ /* print 35 */
	
	getchar();
	return 0;
}
