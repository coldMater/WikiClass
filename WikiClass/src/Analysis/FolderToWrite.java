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
		//파일 하나하나 읽는 객체
		Read read = new Read(); 
		
		
		//txt파일들이 있는 폴더 경로
		
		/*String readFolderPath = "C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/3";*/
		File dir = new File(readFolderPath);
		
		
		//txtFiles를 담을 ArrayList선언
		ArrayList<String> javaFiles = new ArrayList<String>();
		ArrayList<String> txtFiles = new ArrayList<String>();

		
		//읽는메소드(경로 ,빈 txt ArrayList) 실행
		listRecursive(dir, txtFiles); 
		
		
		//갯수출력
		//System.out.println(txtCount + "개의 txt파일이 있음"); 
		
		
		//txt파일들이 담긴 배열 출력
		//System.out.println("파일리스트: "+txtFiles); 

		//table 태그로 나올 결과 값 return 할 변수 선언
		String result = "";

		//지정한 폴더(readFolderPath)안 파일 읽기
		for (int i = 0; i < txtFiles.size(); i++) {
			String note = read.fileRead(
					readFolderPath+"/"+ txtFiles.get(i).toString()); // 각각 파일
			result += note;
		}

		//System.out.println("out.txt에 써질 내용 : "+result);

		//txt 쓰는파일 파일경로
		/*String writePath = "C:/Users/pc-11/Desktop/WikiClass6/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WikiClass/noteText/out.txt";*/

		// 파일쓰기(한번만)
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(writePath), "UTF-8"));

		

		bw.write(result);

		bw.close();
		
		//System.out.println("폴더에서 읽어온 내용:" + result);

	}

	public static void listRecursive(File dir, ArrayList<String> txtFiles) {
		// 경로가 존재하면
		if (dir.isDirectory()) { 
			// 모든 File을 담는 배열
			File[] items = dir.listFiles(); 

			for (File item : items) {
				// System.out.println(item.getAbsoluteFile()); // 절대 경로 출력
				if (item.isDirectory()) // 디렉토리(폴더)일 경우
					listRecursive(item, txtFiles); // Recursive call 그 폴더 또 읽어
				else { // 파일일 경우
					if (item.getName().endsWith(".txt")) { //텍스트로 끝나면
						txtFiles.add(item.getName());
						++txtCount;
					}
				}

			}

		}
	}
}
