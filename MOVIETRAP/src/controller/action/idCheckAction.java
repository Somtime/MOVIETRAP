package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import controller.dao.MemberDAO;

public class idCheckAction implements Action {

	@SuppressWarnings("unchecked")
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
	
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email");
		
		MemberDAO mDao = MemberDAO.getInstance();
		int idCheck = mDao.idCheck(email);
		
		JSONObject idCheckResult = new JSONObject();
		
		idCheckResult.put("idcheck", idCheck);
		
		String jsonIdCheck = idCheckResult.toJSONString();
		
		out.print(jsonIdCheck);
	}

}
