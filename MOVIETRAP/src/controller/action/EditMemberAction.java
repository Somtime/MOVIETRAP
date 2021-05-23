package controller.action;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.dao.MemberDAO;
import controller.dto.MemberVO;

public class EditMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "edit_memberInfo.jsp";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			 url = "MOVIETRAPServlet?command=index";
		} else {
			MemberDAO mDao = MemberDAO.getInstance();
			MemberVO memInfo = mDao.memberInfo(loginUser.getEmail());
			request.setAttribute("memberInfo", memInfo);

			
		}
		request.getRequestDispatcher(url).forward(request, response);

	}

}
