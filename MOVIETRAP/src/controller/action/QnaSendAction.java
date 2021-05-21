package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import controller.dao.QnaDAO;
import controller.dto.QnaVO;

public class QnaSendAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String chat_content = request.getAttribute("");
		QnaVO qna = new QnaVO();
		qna.setRcvd_id(request.getParameter("rcvd_id"));
		qna.setSend_id(request.getParameter("send_id"));
		qna.setChat_content(request.getParameter("chat_content"));
		
		QnaDAO qDao = QnaDAO.getInstance();
		JSONObject result2 = new JSONObject(); 
		result2.put("qna", qDao.qnaWrite(qna));
		
		System.out.println("result2: "+result2);
		
		PrintWriter out = response.getWriter();
		out.print(result2);
		
	}

}

//PrintWriter out = response.getWriter();
//out.print();