package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import controller.dao.MemberDAO;

public class idCheckAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email");
		
		MemberDAO mDao = MemberDAO.getInstance();
		int idCheck = mDao.idCheck(email);
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("idCheck" ,idCheck);
		
//		JSONArray jsonArray = new JSONArray();
//		
//		jsonArray.add(jsonObject);
//		
//		JSONObject mainObject = new JSONObject();
//		
//		mainObject.put("idCheckList" ,jsonArray);
		
		out.print(jsonObject);
	}

}
