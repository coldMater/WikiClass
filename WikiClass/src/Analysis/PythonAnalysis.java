package Analysis;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.swing.plaf.synth.SynthSpinnerUI;

public class PythonAnalysis {

/*	public static void main(String[] args) {

		String result = sortByWordsNum("C:/Users/pc-11/Desktop/notes/words3.py");
		System.out.println(result);

		System.out.println("�̰� result:" + result);

	}*/

	/* C:/Users/pc-11/Downloads/words1.py */
	public static String sortByWordsNum(String pyPath) {

		Process ps = null;
		
	/*	 = "C:/Users/pc-11/Desktop/notes/words3.py";*/
		
		String[] cmd = new String[] {"py", pyPath , "print"};
		
		
		
		
		String str = null;
		ArrayList<String> result_list = new ArrayList<String>();

		
		String result = "";

		try {
                                                  //ProcessBuilder �������� �Ű����� (����Ÿ��,���ϰ��,??)
		
			System.out.println("Start");
			ps = new ProcessBuilder(cmd).start();	 // ��ȯ���� process  

	
			BufferedReader stdOut = new BufferedReader(new InputStreamReader(ps.getInputStream()));

		
			
		
		
	
			while ((str = stdOut.readLine()) != null) {
				
				result_list.add(str);
				
			}
			

			System.out.println("END");
			
			for (int i = 0; i < result_list.size(); i++) {
				System.out.println(result_list.get(i));
				
			}
				result += "<tr><td>�� ��</td><td>�� ��</td><td>���� Ƚ��</td></tr>";
			
			for (int i = 0; i < result_list.size(); i++) {
				result += "<tr>";
				result += "<td>";
				result += (i)+1;
				result +="</td>";
				result += "<td>";
				result += result_list.get(i).split(" ")[0];
				result +="</td>";
				result += "<td>";
				
				result += result_list.get(i).split(" ")[1];
				result +="</td>";
				
				result += "</tr>";
			}
			
			
			System.out.println(result);
			
			
		
		

		} catch (IOException e) {
			e.printStackTrace();

		}
		
		return "<table class=table4_3>"+result+"</table>";

	}
}
