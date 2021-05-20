package controller.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class MoviePageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("movieid");
		String url =  "moviepage.jsp";
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		HashMap<String, String> URL =  new HashMap();
		
		String videoURL = "https://api.themoviedb.org/3/movie/"+id+"/videos?api_key=e520d648beeee23f00a8b3386b9dec08";
		String movieDetailURL ="https://api.themoviedb.org/3/movie/"+id+"?api_key=e520d648beeee23f00a8b3386b9dec08&language=en-US";
		URL.put("videoData", videoURL);	// results : key
		URL.put("movieDetailData", movieDetailURL); // : genre , overview, vote_average
		
		JSONObject videoData = new JSONObject();
		JSONObject movieDetailData = new JSONObject();
		JSONArray video = new JSONArray();
		//JSONObject result = new JSONObject();
		for (String key : URL.keySet()) {
			if (key.toString().equals("videoData")) {
				 videoData = (JSONObject) getData(URL.get(key)).get("movieDetail");
				 video = (JSONArray) videoData.get("results");			 
			}
			if (key.toString().equals("movieDetailData")) {
				 movieDetailData = getData(URL.get(key));
			}
			
		} 
		/*
		 * System.out.println(id); System.out.println("video :" +video);
		 * System.out.println("videoData : " + videoData);
		 * System.out.println("movieDetailData : " + movieDetailData);
		 */
		System.out.println("video: " +video);
		JSONObject v = (JSONObject) video.get(0);
//		System.out.println("v : " + v);
		String key = v.get("key").toString();
		
		System.out.println("movieDetailData: " +movieDetailData);
		System.out.println("key : " + key);
		
		JSONObject movieDetail=(JSONObject) movieDetailData.get("movieDetail");
		System.out.println("movieDetail : " + movieDetail);
		String title = movieDetail.get("title").toString();
		String overview = movieDetail.get("overview").toString();
		String release_date = movieDetail.get("release_date").toString();
		String vote_average = movieDetail.get("vote_average").toString();	
		//creating array of genres
		JSONArray genres = (JSONArray) movieDetail.get("genres");
		String[] genres_array = new String[genres.size()];
		for(int i=0; i<genres.size(); i++) {
		JSONObject g = (JSONObject) genres.get(i);
		genres_array[i] = g.get("name").toString();
		}
		//sysout test
		System.out.println("title: "+title);
		System.out.println("overview: " + overview);
		System.out.println("release date: "+release_date);
		System.out.println("vote_average: "+vote_average);
		System.out.println("genres: "+ Arrays.toString(genres_array));
		//set attribute for moviepage.jsp
		request.setAttribute("detail", movieDetailData);	
		request.setAttribute("key", key);
		request.setAttribute("title", title);
		request.setAttribute("overview", overview);
		request.setAttribute("release_date", release_date);
		request.setAttribute("vote_average", vote_average);
		request.setAttribute("genres_array", genres_array);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

	private static JSONObject getData(String apiUrl) {
		
		String responseBody = get(apiUrl);
		// System.out.println("responseBody : " + responseBody); UTF-8 이상 없음
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject = (JSONObject) jsonParser.parse(responseBody);
		} catch (ParseException e) {
			e.printStackTrace();
			}
		
		JSONObject data = new JSONObject();
		
		JSONArray jsonArray = new JSONArray();
		if (jsonObject.get("result") != null) {
			jsonArray = (JSONArray)jsonObject.get("results");
			
			data.put("video", jsonArray.get(0));
			
		} else {
			data.put("movieDetail", jsonObject);
		}
		
		return data;			
		
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
