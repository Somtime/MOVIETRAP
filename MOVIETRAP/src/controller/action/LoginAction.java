package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.dao.MemberDAO;
import controller.dto.MemberVO;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "MOVIETRAPServlet?command=login";
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String message = "";
		
		MemberDAO mDao = MemberDAO.getInstance();
		int loginCheck = mDao.loginCheck(email, pwd);
		// loginCheck => 1: 일치 0: 불일치 -1:계정정보 없음
		
		if (loginCheck == 1) {
			MemberVO loginUser = mDao.memberInfo(email);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			url = "main.jsp";
		} else if (loginCheck == 0) {
			message = "비밀번호를 확인해주세요.";
			request.setAttribute("message", message);
		} else {
			message = "이메일을 확인해주세요.";
			request.setAttribute("message", message);
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}	
}
