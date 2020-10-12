class Test 
{
	public static void main(String[] args) 
	{
		int arr1[] = new int[4];

		int arr2[][] = new int[2][2];

		arr2[0][0] = 50;arr2[0][1] = 30;
		arr2[1][0] = 30;arr2[1][1] = 40;

//0 20 1 50
			int k =0;
		for(int i=0; i<2; i++){

			for(int j=0; j<2; j++){
				
				arr1[k] = arr2[i][j];
				k++;
			}
		}
		
//		arr1[1] = arr2[0][0];
		for(int i=0; i<4; i++){
		System.out.println(arr1[i]);
		}

/*
				for(int i=0; i<stu; i++){ //Çà

			for(int j=0; j<stu+1; j++){  //¿­
				if(arr2[j][5] < arr2[j+1][5]){
					temp[j] += arr2[i][j];
					arr2[i][j] = 0;
					arr2[i][j] += arr2[i+1][j];
					arr2[i+1][j] = temp[j];

*/

	}
}
