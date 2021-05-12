package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;

@WebServlet("/MOVIETRAPServlet")
public class MOVIETRAPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MOVIETRAPServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// command를 입력받을 변수
			String command = request.getParameter("command");
			
			// console창에 커맨드 표시
			System.out.println("MOVIETRAPServlet : " + command);
			
			// ActionFactory에 command 변수 입력
			ActionFactory af = ActionFactory.getInstance();
			Action action = af.getAction(command);
			
			// Action 실행
			if (action != null) {
				action.execute(request, response);
			}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
