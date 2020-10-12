import java.util.Scanner;
import java.util.Calendar;
class Test2 
{
	public static void main(String[] args) 
	{
		Scanner scan = new Scanner(System.in);
		System.out.print("년도 = ");
		int year = scan.nextInt();
		System.out.print("월 = ");
		int month = scan.nextInt();

		Calendar dal = Calendar.getInstance();
		dal.set(year, month-1, 1);
		
		System.out.println("일\t월\t화\t수\t목\t금\t토");
	    int week = dal.get(Calendar.DAY_OF_WEEK);
		
		int max = 31;
		int s=0;
		int a=0;
		int j=1;
	
		if(month!=2){
				max=31;
			}else if(year%4==0 && year%100!=0 || year==400){
				max=29;
			}else{
				max=28;
			}
		if(month%2==0){
			max=30;
		}


			for(int i=1; i<week; i++){
				System.out.print("\t");
						
			}
			for(int k=1; k<=max; k++ ){
				System.out.print(j+"\t");
				j++;
				if((k+(week-1))%7==0){

					System.out.println();
				}

			}

			






	}
}
