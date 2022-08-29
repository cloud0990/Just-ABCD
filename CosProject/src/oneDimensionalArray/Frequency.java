package oneDimensionalArray;

/* int[]를 입력받고, 각 숫자의 빈도수를 출력한다. */
public class Frequency {

	public static void main(String[] args) throws Exception {
		
		int[] target = {1, 3, 3, 2, 0, 0, 1, 2, 3, 0, 1};
		int[] result = new int[4]; //0~3
		
		for(int i=0; i<target.length; i++) {
			if(target[i]==0) {
				result[0]+=1;
			}else if(target[i]==1) {
				result[1]+=1;
			}else if(target[i]==2) {
				result[2]+=1;
			}else {
				result[3]+=1;
			}
		}
		for(int i : result) {
			System.out.print(i + " ");
		}
	}
}