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
import controller.dto.ChatVO;
import controller.dto.MemberVO;

public class AdminChatListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		
		QnaDAO qDao = QnaDAO.getInstance();
		ArrayList<ChatVO> chat = qDao.listChat();
		
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < chat.size(); i++) {
			JSONObject jsonObject = new JSONObject();
			
			jsonObject.put("cseq", chat.get(i).getCseq());
			jsonObject.put("id", chat.get(i).getId());
			jsonObject.put("regdate", chat.get(i).getRegdate());
			
			jsonArray.add(jsonObject);
		}
		
		response.getWriter().print(jsonArray);
			
		/*
		 * if (request.getParameter("cseq") != null) { QnaVO qna =
		 * qDao.qnaGet(Integer.parseInt(request.getParameter("cseq")));
		 * 
		 * response.getWriter().print(qna); }
		 */
			
		//}
		
		

	}

}
