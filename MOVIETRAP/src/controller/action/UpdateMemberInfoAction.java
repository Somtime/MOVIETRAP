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

public class UpdateMemberInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "MOVIETRAPServlet?command=membership";
		
		int sizeLimit = 5 * 1024 * 1024; // 5MB
		String savePath = "assets/images"; // 
		
		// find actual storage path
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		ServletContext context = session.getServletContext();
		String uploadPath = context.getRealPath(savePath);

		MultipartRequest multi = new MultipartRequest(
				request, // request object
				uploadPath, // upload file storage path
				sizeLimit, // max file size
				"UTF-8", // encoding type
				new DefaultFileRenamePolicy() // same file name rename policy
		);
		
		MemberVO member = new MemberVO();
		member.setEmail(loginUser.getEmail());
		member.setName(multi.getParameter("name"));
		member.setPhone(multi.getParameter("phone"));
		member.setPwd(multi.getParameter("pwd"));
		member.setNewsletter(multi.getParameter("newsletter"));
		if(multi.getFilesystemName("image")==null) {
			member.setImage(multi.getParameter("og_img"));
		} else {
			member.setImage(multi.getFilesystemName("image"));
		}

		MemberDAO mDao = MemberDAO.getInstance();
		mDao.updateInfo(member);

		//request.getRequestDispatcher(url).forward(request, response);
	}

}
	
