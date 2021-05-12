package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.MemberDAO;

public class idCheckAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
		
		String userid = request.getParameter("email");
		
		MemberDAO mDao = MemberDAO.getInstance();
		int idCheck = mDao.idCheck(userid);
		
		request.getRequestDispatcher("join.jsp").forward(request, response);;
	}

}
