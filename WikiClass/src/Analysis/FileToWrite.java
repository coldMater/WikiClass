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

		// note���� �����
		String result = "";

		// ���� �б�
		String note = read.fileRead(
				"C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/31.txt");

		result = note;

		//System.out.println(result);

		//txt���� ���ϰ��
		String path = "C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/out.txt";

		
		//��ο� ����
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path), "UTF-8"));

		// �������

		bw.write(result);

		bw.close();

	}

}
