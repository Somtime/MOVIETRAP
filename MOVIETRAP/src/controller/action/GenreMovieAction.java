package controller.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class GenreMovieAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String url = "genre_movie.jsp";
		
		int genre = Integer.parseInt(request.getParameter("genre"));
		
		String genreURL = "https://api.themoviedb.org/3/discover/movie?api_key=e520d648beeee23f00a8b3386b9dec08&language=en-US&sort_by=popularity.desc&include_adult=false"
							+ "&include_video=false&page=1&with_genres=" + genre + "&with_watch_monetization_types=flatrate";
		
		// 장르url 에서 id를 뽑아보자
		String responseBody = get(genreURL);
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject = (JSONObject) parser.parse(responseBody);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		JSONArray jsonArray = (JSONArray) jsonObject.get("results");
		
		JSONArray data = new JSONArray();
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject j = (JSONObject) jsonArray.get(i);
			
			
			// 영화의 id값을 얻어서 api에서 video key를 따옴
			String videoURL = "https://api.themoviedb.org/3/movie/" + j.get("id") + "/videos?api_key=e520d648beeee23f00a8b3386b9dec08";
			String resBody = get(videoURL);
			
			
			JSONObject jObject = new JSONObject();
			try {
				jObject = (JSONObject) parser.parse(resBody);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			JSONArray jArray = (JSONArray) jObject.get("results");
			JSONObject jobj = (JSONObject) jArray.get(0);
			j.put("key", jobj.get("key"));
			// j에 각 키값을 넣음
			
			// JSONArray 타입의 data 변수에 각 반복문 마다 j값을 add해줌
			data.add(j);
		}
		System.out.println("GenreMovieAction data : " + data);
		
		PrintWriter out = response.getWriter();
		out.print(data);
		
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request,response);
	}
	

	
	private static String get(String apiUrl){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패 : ", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다. : " , e);
        }
    }
}
