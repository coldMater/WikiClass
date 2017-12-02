package com.DAO;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class TextReadWriteDAO {
	public void writeNote(String path, String noteID, String content) {
		
		File outDir = new File(path);
		outDir.mkdirs();
		File outFile = new File(path+"\\"+noteID+".txt");
		System.out.println(path+"\\"+noteID+".txt");
		
		// ==========================//
		// 텍스트 파일 쓰기
		// ==========================//
		BufferedWriter bw = null;
		try {
			bw = new BufferedWriter(new FileWriter(outFile));
			bw.write(content);
			bw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (bw != null)
				try {
					bw.close();
				} catch (IOException e) {
				}
			System.out.println("파일 저장 완료");
		}
	}

	public String readNote(String path, String noteID) {
		String content = "";
		File inFile = new File(path+"\\"+noteID+".txt");
		System.out.println(path+noteID+".txt");
		// ==========================//
		// 텍스트 파일 읽기
		// ==========================//
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(inFile));
			String line;
			while ((line = br.readLine()) != null) {
				content+=line;
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}
			System.out.println("파일 읽기 완료");
		}
		return content;
	}
}
