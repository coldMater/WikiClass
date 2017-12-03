package Analysis;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import javax.swing.plaf.synth.SynthScrollBarUI;

public class FileToWrite {

	public static void main(String[] args) throws IOException {

		Read read = new Read();

		// note읽은 결과값
		String result = "";

		// 파일 읽기
		String note = read.fileRead(
				"C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/31.txt");

		result = note;

		//System.out.println(result);

		//txt파일 파일경로
		String path = "C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/out.txt";

		
		//경로에 쓰기
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path), "UTF-8"));

		// 경로지정

		bw.write(result);

		bw.close();

	}

}
