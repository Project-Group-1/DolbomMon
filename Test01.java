import java.util.Scanner;
class Test01 
{
	public static void main(String[] args) 
	{
		Scanner scan = new Scanner(System.in);
		System.out.print("입력=");
		int data = scan.nextInt();

		if(data>=50){
			System.out.print("50 이상 수입니다.");
		}else{
			System.out.print("50 이하 수입니다.");
		}


	}
}
