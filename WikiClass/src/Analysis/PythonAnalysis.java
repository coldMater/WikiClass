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

		System.out.println("이게 result:" + result);

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
                                                  //ProcessBuilder 생성자의 매개변수 (파일타입,파일경로,??)
		
			System.out.println("Start");
			ps = new ProcessBuilder(cmd).start();	 // 반환형이 process  

	
			BufferedReader stdOut = new BufferedReader(new InputStreamReader(ps.getInputStream()));

		
			
		
		
	
			while ((str = stdOut.readLine()) != null) {
				
				result_list.add(str);
				
			}
			

			System.out.println("END");
			
			for (int i = 0; i < result_list.size(); i++) {
				System.out.println(result_list.get(i));
				
			}
				result += "<th>순 위</th><th>단 어</th><th>횟 수</th><th>비 율</th>";
				
				
				
			int sum = 0;
			
			
			for (int i = 0; i < result_list.size(); i++) {
				
				sum+= Integer.parseInt(result_list.get(i).split(" ")[1]);
				
			}
				
				
				
				
				
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
				
				result +="<td>";
				result += (int)((float)Integer.parseInt(result_list.get(i).split(" ")[1])/sum*100)+"%";
				
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
