package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GenreMovieGoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int genre = Integer.parseInt(request.getParameter("genre"));
		String selected_genre = request.getParameter("genre_name");
		System.out.println("genremoviegoaction");
		System.out.println(genre);
		String url = "genre_movie.jsp";
	
		request.setAttribute(url, url);
		request.setAttribute("genre_num", genre);
		request.setAttribute("selected_genre", selected_genre);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
