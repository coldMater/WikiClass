package Analysis;
import java.io.IOException;

public class main {

	public static void main(String[] args) throws IOException {
		
		
		String folderPath = "C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/4";
		String writeTxtPath = "C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/out.txt";
		FolderToWrite ftw = new FolderToWrite();
		ftw.readFolderAndWrite(folderPath, writeTxtPath);
		
		
		PythonAnalysis pa = new PythonAnalysis();
		
		//�м��ϴ� txt������ ��δ� ���̽� �ڵ忡 �ִ�
		
		
		
		String result = pa.sortByWordsNum("C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/py/words3.py");
		
		System.out.println("result : "+ result);

	}

}

