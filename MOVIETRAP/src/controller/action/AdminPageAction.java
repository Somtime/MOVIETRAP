package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import controller.dao.MemberDAO;
import controller.dao.QnaDAO;
import controller.dto.MemberVO;
import controller.dto.QnaVO;

public class AdminPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		JSONArray json = new JSONArray();
		/*
		 * if (loginUser.getEmail().equals("admin")) { MemberDAO mDao =
		 * MemberDAO.getInstance(); ArrayList emailList = mDao.listMemberEmail();
		 * 
		 * 
		 * JSONArray jsonArray = new JSONArray(); for (int i = 0; i < emailList.size();
		 * i++) { String email = (String) emailList.get(i);
		 * 
		 * QnaDAO qDao = QnaDAO.getInstance(); ArrayList<QnaVO> qnaList =
		 * qDao.qnaList(email);
		 * 
		 * for (int j = 0; j < qnaList.size(); j++) { JSONObject jsonObject = new
		 * JSONObject(); QnaVO qna = qnaList.get(i);
		 * 
		 * jsonObject.put("cseq", qna.getCseq()); jsonObject.put("send_id",
		 * qna.getSend_id()); jsonObject.put("rcvd_id", qna.getRcvd_id());
		 * jsonObject.put("chat_content", qna.getChat_content());
		 * 
		 * jsonArray.add(jsonObject); }
		 * 
		 * json.add(jsonArray); }
		 * 
		 * response.getWriter().print(json); } else { // NaGa!!! }
		 */
		
		//
		MemberDAO mDao = MemberDAO.getInstance();
		ArrayList emailList = mDao.listMemberEmail();
		
		
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < emailList.size(); i++) {
			String email = (String) emailList.get(i);
			
			QnaDAO qDao = QnaDAO.getInstance();
			ArrayList<QnaVO> qnaList = qDao.qnaList(email);
			
			for (int j = 0; j < qnaList.size(); j++) {
				JSONObject jsonObject = new JSONObject();
				QnaVO qna = qnaList.get(i);

				jsonObject.put("cseq", qna.getCseq());
				jsonObject.put("send_id", qna.getSend_id());
				jsonObject.put("rcvd_id", qna.getRcvd_id());
				jsonObject.put("chat_content", qna.getChat_content());
				
				jsonArray.add(jsonObject);
			}
			
			json.add(jsonArray);
		}
		
		response.getWriter().print(json);
		//
		
		
		
		
		
		

	}

}
