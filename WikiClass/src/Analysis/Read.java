package Analysis;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class Read {

	public static void main(String[] args) throws IOException {

	
		
		Read read = new Read();
		
		
		String result = "";
		String note2 = read.fileRead("C:/Users/pc-11/Desktop/notes/2장/02.txt");
		String note2_1 = read.fileRead("C:/Users/pc-11/Desktop/notes/2장/02-1.txt");
		String note2_2 = read.fileRead("C:/Users/pc-11/Desktop/notes/2장/02-2.txt");
		String note2_3 = read.fileRead("C:/Users/pc-11/Desktop/notes/2장/02-3.txt");
		String note2_4 = read.fileRead("C:/Users/pc-11/Desktop/notes/2장/02-4.txt");
		String note2_5 = read.fileRead("C:/Users/pc-11/Desktop/notes/2장/02-5.txt");
		String note2_6 = read.fileRead("C:/Users/pc-11/Desktop/notes/2장/02-6.txt");
		String note2_7 = read.fileRead("C:/Users/pc-11/Desktop/notes/2장/02-7.txt");
		String note2_8 = read.fileRead("C:/Users/pc-11/Desktop/notes/2장/02-8.txt");
		
		
		result = note2 + note2_1 + note2_2 + note2_3+ note2_4+ note2_5+ note2_6+ note2_7+ note2_8;
		System.out.println(result);
	
		
		
	}
	
	public String fileRead(String input) throws IOException {
		
		
        BufferedReader br = new BufferedReader(new FileReader(input));
        String result = "";
        while(true) {
            
        	String line = br.readLine();
            if (line==null) break;
            result+=line;
            
            
        }
   
        br.close();
        
		return result;
		
		   /*byte[] b = new byte[1024];
	        FileInputStream input = new FileInputStream("C:/Users/pc-11/Desktop/konlpy2.py");
	        input.read(b);
	        System.out.println(new String(b));
	        input.close();*/
		

	}

}
