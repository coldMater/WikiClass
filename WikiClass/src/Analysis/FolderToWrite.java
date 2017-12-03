package Analysis;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;

public class FolderToWrite {

	public static int javaCount = 0;
	public static int txtCount = 0;

	public static void readFolderAndWrite(String readFolderPath,String writePath) throws IOException {
		//���� �ϳ��ϳ� �д� ��ü
		Read read = new Read(); 
		
		
		//txt���ϵ��� �ִ� ���� ���
		
		/*String readFolderPath = "C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/3";*/
		File dir = new File(readFolderPath);
		
		
		//txtFiles�� ���� ArrayList����
		ArrayList<String> javaFiles = new ArrayList<String>();
		ArrayList<String> txtFiles = new ArrayList<String>();

		
		//�д¸޼ҵ�(��� ,�� txt ArrayList) ����
		listRecursive(dir, txtFiles); 
		
		
		//�������
		//System.out.println(txtCount + "���� txt������ ����"); 
		
		
		//txt���ϵ��� ��� �迭 ���
		//System.out.println("���ϸ���Ʈ: "+txtFiles); 

		//table �±׷� ���� ��� �� return �� ���� ����
		String result = "";

		//������ ����(readFolderPath)�� ���� �б�
		for (int i = 0; i < txtFiles.size(); i++) {
			String note = read.fileRead(
					readFolderPath+"/"+ txtFiles.get(i).toString()); // ���� ����
			result += note;
		}

		//System.out.println("out.txt�� ���� ���� : "+result);

		//txt �������� ���ϰ��
		/*String writePath = "C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/out.txt";*/

		// ���Ͼ���(�ѹ���)
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(writePath), "UTF-8"));

		

		bw.write(result);

		bw.close();
		
		//System.out.println("�������� �о�� ����:" + result);

	}

	public static void listRecursive(File dir, ArrayList<String> txtFiles) {
		// ��ΰ� �����ϸ�
		if (dir.isDirectory()) { 
			// ��� File�� ��� �迭
			File[] items = dir.listFiles(); 

			for (File item : items) {
				// System.out.println(item.getAbsoluteFile()); // ���� ��� ���
				if (item.isDirectory()) // ���丮(����)�� ���
					listRecursive(item, txtFiles); // Recursive call �� ���� �� �о�
				else { // ������ ���
					if (item.getName().endsWith(".txt")) { //�ؽ�Ʈ�� ������
						txtFiles.add(item.getName());
						++txtCount;
					}
				}

			}

		}
	}
}
