package chap01;

import java.util.Scanner;

public class Max3 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("세 정수의 최대값을 구합니다");
		System.out.println("a값은? : ");
		int a = scanner.nextInt();
		System.out.println("b값은? : ");
		int b = scanner.nextInt();
		System.out.println("c값은? : ");
		int c = scanner.nextInt();
		
		int max = 0;
		if(max <= a ) {
			max = a;
		}
		if(max <= b) {
			max = b;
		}
		if(max <= c) {
			max = c;
		}
		System.out.println(max);
	
	}
	

}
