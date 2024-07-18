·p3() 에서 평균, 편차를 구하는 다음 두 함수를 호출하고 결과 값을 반환받아 출력
	·calc_Avg(…), calc_Dev(…)  

·p5() 에서 행 합, 열 합을 구하는 다음 두 함수를 호출하고 결과 값을 반환받아 출력
	·sum_Row(…), sum_Col(…)  

·p9() 에서 copy(…) 를 호출하면 copy 함수에서 복사하고 출력

·p11() 에서 get_stat(…) 호출하고 3개 값을 반환받아 출력

#include<iostream>
#include<cmath>
#define SIZE 4
using namespace std;

double calc_Avg(double c[], int num); // 평균값을 구하는 함수
double calc_Dev(double c[], int num); // 표준편차를 구하는 함수
int* sum_Row(int s[][5]); // 각 행의 합계를 구하는 함수
int* sum_Col(int s[][5]); // 각 열의 합계를 구하는 함수
void copy(int* A, int* B, int n); // 배열을 복사하여 출력하는 함수
void get_stat(double A[], double* p_avg, double* p_max, double* p_sum); // 평균값, 최댓값, 전체의 합을 구하는 함수

// 3번
void p3() {
	int n;
	double* grade;
	
	cout << "몇 개의 실수 자료를 입력 하시겠습니까?: ";
	cin >> n;
	grade = new double[n];

	cout << n << "개의 실수 자료를 입력하십시오: ";
	for (int i = 0; i < n; i++) {
		cin >> grade[i];
	}
	cout << "\n";
	cout << "실수 자료들의 평균값은 " << calc_Avg(grade, n) << "입니다.\n";
	cout << "실수 자료들의 표준편차는 " << calc_Dev(grade, n) << "입니다.\n\n";
}
double calc_Avg(double c[], int num) {

	double sum = 0;

	for (int i = 0; i < num; i++) {
		sum = sum + c[i];
	}

	return sum / (double)num;
}
double calc_Dev(double c[], int num) {

	double result = 0;
	double sum = 0;
	double variance; // 분산
	double average; // 평균

	average = calc_Avg(c, num);

	for (int i = 0; i < num; i++) {
		sum = sum + pow(c[i] - average, 2.0);
	}
	variance = sum / (double)num;

	return sqrt(variance);
}

// 5번
void p5() {
	int s[3][5] = {
		{12, 56, 32, 16, 98}, {99, 56, 34, 41, 3}, {65, 3, 87, 78, 21}
	};
	int* result_Row = sum_Row(s);
	int* result_Col = sum_Col(s);

	cout << "| 12 | 56 | 32 | 16 | 98 |\n" << "| 99 | 56 | 34 | 41 |  3 | \n" << "| 65 |  3 | 87 | 78 | 21 | \n\n";

	for (int i = 0; i < 3; i++) {
		cout << i + 1 << "번째 행 값들의 합계: " << result_Row[i] << "\n";
	}
	cout << "\n";
	for (int i = 0; i < 5; i++) {
		cout << i + 1 << "번째 열 값들의 합계: " << result_Col[i] << "\n";
	}
	cout << "\n";
}
int *sum_Row(int s[][5]){
	int* sum_Row = new int[3];

	for (int i = 0; i < 3; i++) {
		sum_Row[i] = 0;
	}

	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 5; j++) {
			sum_Row[i] = sum_Row[i] + s[i][j];
		}
	}
	return sum_Row;
}
int* sum_Col(int s[][5]) {

	int* sum_Col = new int[5];

	for (int i = 0; i < 5; i++) {
		sum_Col[i] = 0;
	}

	for (int j = 0; j < 5; j++) {
		for (int i = 0; i < 3; i++) {
			sum_Col[j] = sum_Col[j] + s[i][j];
		}
	}
	return sum_Col;
}

// 9번
void p9() {
	int A[4] = { 0, 3, 1, 9 };
	int B[4];

	copy(A, B, 4);
}
void copy(int* A, int* B, int n) {
	for (int i = 0; i < n; i++) {
		B[i] = A[i];
		cout << B[i] << " ";
	}
	cout << "\n";
	cout << "\n";
}

// 11번
void p11() {
	double A[SIZE] = { 1.9, 2.1, 2.3, 11.2 };
	double p_avg, p_max, p_sum; // 평균값, 최댓값, 전체의 합
	
	get_stat(A, &p_avg, &p_max, &p_sum);

	cout << "4개의 실수 값 : 1.9 / 2.1 / 2.3 / 11.2\n" << "평균값 : " << p_avg << "\n" << "최댓값 : " << p_max << "\n" << "전체의 합: " << p_sum << "\n";
}
void get_stat(double A[], double* p_avg, double* p_max, double* p_sum) {

	double sum = 0;
	double max = 0;

	for (int i = 0; i < SIZE; i++) {
		sum = sum + A[i];

		if (A[i] > max)max = A[i];
	}

	*p_avg = sum / SIZE;
	*p_max = max;
	*p_sum = sum;
}
int main() {
	p3();
	p5();
	p9();
	p11();

	return 0;
}
