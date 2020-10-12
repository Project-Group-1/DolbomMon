import java.util.Scanner;

public class TestArray1 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String title[] = {"이름","국어","영어","수학","총점","평균","석차"};
		
		System.out.print("학생 수 = ");
		
		int cnt = scan.nextInt(); //학생 수 입력
		
		String name[] = new String[cnt];
		double jumsu[][] = new double[cnt+2][6];
				
		
		for(int i=0; i<cnt; i++) {//학생 수 만큼 회전한다.
			System.out.print(title[0] + "=");
			scan.nextLine();
			name[i] = scan.nextLine();
			// 이름을 입력받아 name배열에 집어넣는다.
			for(int j=0; j<3; j++) {
				System.out.print(title[j+1]+"=");
				jumsu[i][j] = scan.nextDouble();
			}
		}

		/*
		 Scanner scan = new Scanner(System.in);
	        String title[] = {"이름","국어","영어","수학","총점","평균","석차"};
	 
	        //학생수를 입력받아 이름 저장할 배열, 성적 저장할 배열 생성
	        System.out.print("학생수 = ");
	        int cnt = scan.nextInt();
	 
	        String name[] = new String[cnt];//이름 저장할 배열
	        double jumsu[][] = new double[cnt+2][6]; //점수를 저장할 배열
	 
	        //데이터 입력
	        for(int i=0; i<cnt; i++){// i=0,1,2,3,4 -> 학생수만큼 회전
	            System.out.print(title[0]+"=");//이름
	            scan.nextLine();  // nextLine 에러나서 초기화 한번 해줌
	            name[i] = scan.nextLine();  // nextLine 확인
	            //세과목의 점수
	            for(int j=0; j<3; j++){ //j= 0,1,2
	                System.out.print(title[j+1]+"=");
	                jumsu[i][j] = scan.nextInt();
	                
	            }
	        }		*/
		//개인별 총점, 평균, 과목별 총점
       for(int r=0; r<cnt; r++){//0,1,2,3,4
            for(int c=0; c<3; c++){//0,1,2		
		//for(int r=0; r<cnt; r++) {
		//	for(int c=0;c<3;c++) {
                jumsu[r][3] = jumsu[r][3] + jumsu[r][c]; //개인별 총점            	
			//jumsu[r][3]= jumsu[r][3] + jumsu[r][c];
                jumsu[cnt][c] = jumsu[cnt][c] + jumsu[r][c]; //과목별 총점
				
//				jumsu[cnt][c]= jumsu[cnt][c] + jumsu[r][c];
				
			}
			jumsu[r][4] = jumsu[r][3] / 3;
		}
		for(int c=0; c<=2; c++) {
			jumsu[cnt+1][c] = jumsu[cnt][c] /cnt;
		}
		
		//석차 구하기
		for(int i=0; i<cnt; i++) {
			jumsu[i][5]++; //기본숫자는 0이니까 무조건 +1을 해줘야 순위가 나온다.			
			for(int j=0; j<cnt; j++) {
				if(jumsu[i][3] < jumsu[j][3]) {
					jumsu[i][5]++;
				}
			}

		}
		
		
		
		//출력
		for(String t : title) { //확장된 for문
			System.out.print(t+"\t");
		}
		System.out.println();
		for(int i=0;i<jumsu.length;i++) { //cnt+2라서 5명이면 0~6까지 7개(아래로 출력되는것) 
			if(i==cnt) {
				System.out.print("총점\t");
			}else if(i==cnt+1){
				System.out.print("평균\t");
			}else {
				System.out.print(name[i]+"\t");
			}
			for(int j=0; j<jumsu[i].length ; j++) { //jumsu.length는 jumsu의 행의 갯수 jumsu[i].length는 jumsu의 i행의 길이
				System.out.printf("%.1f\t", jumsu[i][j]);
			}
			System.out.println();
		}
		
		
		
	}

}
