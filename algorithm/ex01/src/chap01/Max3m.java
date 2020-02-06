package chap01;

public class Max3m {

	public static void main(String[] args) {
		System.out.println("[3,2,1] : " + max3m(3,2,1));
		System.out.println("[3,2,7] : " + max3m(3,2,7));
		
		}
	static int max3m(int a , int b , int c) {
		int max = a;
		if(max <= b) {
			max = b;
		}
		if(max <= c) {
			max = c;
		}
		return max;

	}

}
