#define _CRT_SECURE_NO_WARNINGS 
#include <stdio.h>
#include <time.h>
#include<math.h>
#include <stdlib.h>

int divisionBySubtraction(int a, int b) {
	int result = 0;
 	
	int num = a;
	int num1 = b;


	while (b >= a) {
		printf("result :%d\n",result);	

		a = a - b;
		result ++;
	}
	return result;
}

int main() {
	int num1 = 0;
	int num2 = 0;
	printf("Please enter a number that you wish to divide\n");
	scanf("%d", &num1);
	printf("Please enter your second number into the terminal\n");
	scanf("%d", &num2);
	if(num2 < num1) {
	
		printf("please enter number 2 larger than number 1\n");
		return 0;

	}
	
	printf("%d" ,divisionBySubtraction(num1,num2));

	return 0;
}
