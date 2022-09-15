package java;

import java.util.Calendar;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateTest {

	public static void main(String[] args) throws ParseException {
		
		String date = "2022-09-13";
		
		String dateTypeOne = "yyyyMMdd";
		String dateTypeTwo = "yyyy-MM-dd";
		
		SimpleDateFormat dfOne = new SimpleDateFormat(dateTypeOne);   //yyyyMMdd
		SimpleDateFormat dfTwo = new SimpleDateFormat(dateTypeTwo); //yyyy-MM-dd
		
		Date oneDate = dfOne.parse(date);
		Date twoDate = dfTwo.parse(date);
		
		System.out.println(oneDate); //Thu Dec 09 00:00:00 KST 2021
		System.out.println(twoDate); //Sat Sep 17 00:00:00 KST 2022
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(twoDate); //Sat Sep 17 00:00:00 KST 2022 
		
		String day = "";	

		/* Calendar.DAY_OF_WEEK : �� ���� �ش��ϴ� �� ���� return int */
		int dayNum = cal.get(Calendar.DAY_OF_WEEK); //dayNum : 0 > �Ͽ���, 1 > ������ etc
		
		//switch�����ε� ����
		if(dayNum==1) {
			day = "��";
		}else if(dayNum==2) {
			day = "��";
		}else if(dayNum==3) {
			day = "ȭ";
		}else if(dayNum==4) {
			day = "��";
		}else if(dayNum==5) {
			day = "��";
		}else if(dayNum==6) {
			day = "��";
		}else if(dayNum==7){
			day = "��";
		}
		System.out.println(dayNum); //��ȯ�� ���� Ȯ��
		System.out.println(day);
	}
}