package chap01;

import java.util.Scanner;

public class Max3 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("�� ������ �ִ밪�� ���մϴ�");
		System.out.println("a����? : ");
		int a = scanner.nextInt();
		System.out.println("b����? : ");
		int b = scanner.nextInt();
		System.out.println("c����? : ");
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
