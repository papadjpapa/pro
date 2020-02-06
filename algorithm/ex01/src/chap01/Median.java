package chap01;

public class Median {

	public static void main(String[] args) {
		System.out.println(med3(17,20,15));

	}
	static int med3(int a, int b , int c) {
		if(a>=b) {
			if(b>=c) {
				return  b;
				
			}else if(c>=a) {
				return a;
			}else {
				return c;
			}
		}else if(a >= c) {
			return a;
		}else if(c>=b) {
			return b;
		}else {
			return c;
		}
		
		
	}
}
