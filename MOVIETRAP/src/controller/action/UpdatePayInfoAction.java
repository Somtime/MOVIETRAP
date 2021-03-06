package controller.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.dao.MemberDAO;
import controller.dto.MemberVO;

public class UpdatePayInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "MOVIETRAPServlet?command=membership";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		request.setCharacterEncoding("UTF-8");
		MemberVO member = new MemberVO();
		member.setPay_name(request.getParameter("pay_name"));
		member.setPay_num(request.getParameter("pay_num"));
		member.setPay_num_lstfour(request.getParameter("pay_num_lstfour"));
		member.setPay_cvc(Integer.parseInt(request.getParameter("pay_cvc")));
		member.setPay_exp_yr(Integer.parseInt(request.getParameter("pay_exp_yr")));
		member.setPay_exp_date(request.getParameter("pay_exp_date"));
		member.setEmail(loginUser.getEmail());

		MemberDAO mDao = MemberDAO.getInstance();
		mDao.updatePayInfo(member);

		request.getRequestDispatcher(url).forward(request, response);
	}

}