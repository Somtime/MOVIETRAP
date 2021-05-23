package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import controller.dao.QnaDAO;
import controller.dto.MemberVO;
import controller.dto.QnaVO;

public class QnaSendAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String qna_content = request.getParameter("chat_content");
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		QnaDAO qDao = QnaDAO.getInstance();
		QnaVO qna = new QnaVO();
		
		// Qna Insert
		if(qna_content != null) {			
			qna.setSend_id(loginUser.getEmail());
			qna.setRcvd_id("admin");
			qna.setChat_content(request.getParameter("chat_content"));		
			
			qDao.qnaWrite(qna);	
		}
		//
		
		//response.getWriter().print();
	}

}

//PrintWriter out = response.getWriter();
//out.print();