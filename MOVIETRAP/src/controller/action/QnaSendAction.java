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
		int chat_cseq = Integer.parseInt(request.getParameter("chat_cseq"));
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		QnaDAO qDao = QnaDAO.getInstance();
		QnaVO qna = new QnaVO();
		int cseq = 0;
		
		// Admin으로 로그인 했을 때
		if(loginUser.getEmail().equals("admin")) {
			 cseq = chat_cseq;
			 
			qna.setCseq(cseq);
			qna.setSend_id(loginUser.getEmail());
			qna.setRcvd_id(qDao.getChat(cseq).getId());
		}
		
		// User로 로그인 했을 때
		else {
			 cseq = qDao.checkChat(loginUser.getEmail());
			 qna.setCseq(cseq);
			if (cseq == 0) {
				qDao.insertChat(loginUser.getEmail());
				cseq = qDao.checkChat(loginUser.getEmail());
				qna.setCseq(cseq);
			}
			
			qna.setSend_id(loginUser.getEmail());
			qna.setRcvd_id("admin");
			
		}
		
		qna.setChat_content(request.getParameter("chat_content"));
		qDao.qnaWrite(qna);
		
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

		System.out.println(jsonArray);
		response.getWriter().print(jsonArray);
	}

}

//PrintWriter out = response.getWriter();
//out.print();