package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dao.MemberDAO;
import controller.dto.MemberVO;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "main.jsp";
		
		MemberVO member = new MemberVO();
		
		member.setEmail(request.getParameter("email"));
		member.setnewsletter(request.getParameter("newsletter_yn"));
		member.setName(request.getParameter("name"));
		member.setPhone(request.getParameter("phone"));
		member.setPwd(request.getParameter("pwd"));
		member.setPay_name(request.getParameter("pay_name"));
		member.setPay_num(request.getParameter("pay_num"));
		member.setPay_num_lstfour(request.getParameter("pay_num_lstfour"));
		member.setPay_exp_date(request.getParameter("pay_exp_date"));
		member.setPay_exp_yr(Integer.parseInt(request.getParameter("pay_exp_yr")));
		member.setPay_cvc(Integer.parseInt(request.getParameter("pay_cvc")));
		
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.insertMember(member);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
