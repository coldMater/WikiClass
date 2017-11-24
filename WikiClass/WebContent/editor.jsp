<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    	<style type="text/css">
    	#cke_1_contents{
			height: 500px !important;
		}
    	</style>
        <meta charset="utf-8">
        <title>A Simple Page with CKEditor</title>
        <!-- Make sure the path to CKEditor is correct. -->
        <script src="./ckeditor/ckeditor.js"></script>
		<link rel="stylesheet" href="./ckeditor/contents.css" />
    </head>
    <body>
        <form action="class_generic.jsp" method = "get">
            <textarea name="editor1" id="editor1" rows="10" cols="80">
                This is my textarea to be replaced with CKEditor.
                <h1>This is my textarea to be replaced with CKEditor.</h1>    
            </textarea>
            <input type="submit" value="텍스트 전송"/>
            
            
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // <textarea id = "editor1">를 CKEditor로 대체합니다.
                CKEDITOR.replace( 'editor1' );
            </script>
        </form>
    </body>
</html>