package 
com.Service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ClassDAO;
import com.DAO.NoteDAO;
import com.DAO.NoteHistoryDAO;
import com.DAO.TextReadWriteDAO;
import com.VO.NodeVO;

@WebServlet("/NoteUpdatingService")
public class NoteUpdatingService extends HttpServlet {
	ArrayList<NodeVO> nodeList;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		System.out.println("Start @@ com.Service/NoteUpdatingService.java");
		
		String classID = request.getParameter("classNum");
		String noteName = request.getParameter("noteName");
		String nickname = request.getParameter("nickname");
		String editor1 = request.getParameter("editor1");
		String noteNum = request.getParameter("noteNum");
		String userNum = (String)request.getSession().getAttribute("userNum");
		ServletContext context =  request.getSession().getServletContext();
		ClassDAO classDAO = new ClassDAO();
		String groupNum = classDAO.getGroupNum(classID);
		String saveDir = context.getRealPath("NoteText")+"\\"+groupNum+"\\"+classID;
		NoteDAO noteDao = new NoteDAO();
		
		//File ���� ���� : ��Ʈ ����
		TextReadWriteDAO trwDAO = new TextReadWriteDAO();
		trwDAO.writeNote(saveDir, noteNum, editor1);
		
		//History �߰� ���� : ������
		NoteHistoryDAO hisDAO = new NoteHistoryDAO();
		int hisdbresult = hisDAO.insertHistory(userNum, noteNum, classID, "2", noteDao.getNote(noteNum).getTitle(), noteDao.getNote(noteNum).getTitle()); //�з�(���:0, ��ȸ : 1, ����:2,����:3)
		System.out.println(hisdbresult);
		
		//DB ���� ���� : ��Ʈ ����
		int dbResult = noteDao.updateNote(noteNum, noteName);
		
		request.setAttribute("classIDnow", classID);
		request.setAttribute("noteID", noteNum);

		RequestDispatcher dis = request.getRequestDispatcher("NoteLoadingService");
		dis.forward(request, response);

	}

}
