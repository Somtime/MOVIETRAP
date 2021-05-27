package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.dao.MemberDAO;
import controller.dto.MemberVO;

public class EditPayAction implements Action {
    
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "edit_payment.jsp";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		MemberDAO mDao = MemberDAO.getInstance();
		
		if(loginUser == null) {
			url = "MOVIETRAPServlet?command=index";
		} else {
			MemberVO memberInfo = mDao.memberInfo(loginUser.getEmail());
			request.setAttribute("memberInfo", memberInfo);
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
