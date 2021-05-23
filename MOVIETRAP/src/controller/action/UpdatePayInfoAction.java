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
		// copied from AdminProductWriteAction.java
		int sizeLimit = 5 * 1024 * 1024; // 5MB
		String savePath = "product_images"; // product images saving folder location
		// find actual storage path
		HttpSession session = request.getSession();
		ServletContext context = session.getServletContext();
		String uploadPath = context.getRealPath(savePath);

		MultipartRequest multi = new MultipartRequest(request, // request object
				uploadPath, // upload file storage path
				sizeLimit, // max file size
				"UTF-8", // encoding type
				new DefaultFileRenamePolicy() // same file name rename policy
		);
		MemberVO member = new MemberVO();
		member.setName(multi.getParameter("name"));
		member.setImage(multi.getParameter("image"));
		member.setPhone(multi.getParameter("phone"));
		member.setPwd(multi.getParameter("pwd"));
		member.setPay_num(Integer.parseInt(multi.getParameter("pay_num")));
		member.setPay_num_lstfour(Integer.parseInt(multi.getParameter("pay_num_lstfour")));
		member.setPay_cvc(Integer.parseInt(multi.getParameter("pay_cvc")));

		MemberDAO mDao = MemberDAO.getInstance();
		mDao.updateInfo(member);

		request.getRequestDispatcher(url).forward(request, response);
	}

}