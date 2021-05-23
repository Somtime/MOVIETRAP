package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.MemberDAO;

public class EditMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "edit_memberInfo.jsp";
		
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.updateInfo(null);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);		
	}

}
