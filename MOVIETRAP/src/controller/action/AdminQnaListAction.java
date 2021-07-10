package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import controller.dao.QnaDAO;
import controller.dto.QnaVO;
public class AdminQnaListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		
		QnaDAO qDao = QnaDAO.getInstance();
		ArrayList<QnaVO> qnaList = qDao.qnaGet(cseq);
		
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < qnaList.size(); i++) {
			JSONObject jsonObject = new JSONObject();
			
			QnaVO qna = new QnaVO();
			jsonObject.put("qseq", qnaList.get(i).getQseq());
			jsonObject.put("cseq", qnaList.get(i).getCseq());
			jsonObject.put("send_id", qnaList.get(i).getSend_id());
			jsonObject.put("rcvd_id", qnaList.get(i).getRcvd_id());
			jsonObject.put("chat_content", qnaList.get(i).getChat_content());
			jsonObject.put("regdate", qnaList.get(i).getRegdate());
			System.out.println(jsonObject);
			
			jsonArray.add(jsonObject);
		}
		
		response.getWriter().print(jsonArray);
	}

}
