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
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		QnaVO qna = new QnaVO();
		qna.setSend_id(request.getParameter(loginUser.getEmail()));
		qna.setRcvd_id("admin");
		qna.setChat_content(request.getParameter("chat_content"));
		
		// Qna Insert
		QnaDAO qDao = QnaDAO.getInstance();
		qDao.qnaWrite(qna);
		//
		
		// Qna List
		ArrayList qnaList = qDao.qnaList(loginUser.getEmail());
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < qnaList.size(); i++) {
			qna = (QnaVO) qnaList.get(i);
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("cseq", qna.getCseq());
			jsonObject.put("send_id", qna.getSend_id());
			jsonObject.put("rcvd_id", qna.getRcvd_id());
			jsonObject.put("chat_content", qna.getChat_content());
			
			jsonArray.add(jsonObject);
		}
		//
		
		response.getWriter().print(jsonArray);
	}

}

//PrintWriter out = response.getWriter();
//out.print();