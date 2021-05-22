package controller.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class mainAction implements Action { 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String url = "main.jsp";
		 
		HashMap<String, String> URL = new HashMap();				
				
		String trendURL = "https://api.themoviedb.org/3/trending/movie/week?api_key=e520d648beeee23f00a8b3386b9dec08";
		String popURL = "https://api.themoviedb.org/3/discover/movie?api_key=e520d648beeee23f00a8b3386b9dec08&sort_by=popularity.desc";
		
		URL.put("trendURL", trendURL);
		URL.put("popURL", popURL);
		
		String t = "title";
		String i = "id";
		
		JSONObject result = new JSONObject();
		for(String key : URL.keySet()) {
			if (key.toString()=="trendURL") {
				JSONObject trendData = new JSONObject();
				trendData = getData(URL.get("trendURL"), t);
				result.put("trendData", trendData);
				//System.out.println("trendData : " + trendData); // UTF-8 안됨 // [Window - Preferences - General - Workspace] Text file encoding : Other : UTF-8 설정으로 해결
			}
			if(key.toString()=="popURL") {
				JSONObject popData = new JSONObject();
				popData = getData(URL.get("popURL"), t);
				result.put("popData", popData);						
			}
		}
		
		
//		String responsebody = get(popURL);
//		JSONParser parser = new JSONParser(); 
//		JSONObject jsonObject = new JSONObject();
//		try {
//			 jsonObject = (JSONObject) parser.parse(responsebody);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		JSONArray jsonArray =  (JSONArray) jsonObject.get("result");
		
		// popData에서 인기 영화의 movieid 값 뽑아오기
		JSONObject tobj = (JSONObject) getData(popURL, t);
		ArrayList<String> objectKeys = new ArrayList<String>(tobj.keySet());
		JSONObject obj = (JSONObject) tobj.get(objectKeys.get(0));
		String movieid = obj.get("id").toString();
		//	trailer_id put into result
		result.put("trailer_id", movieid);
		System.out.println(obj);
		// 끝 : movieid
		
		
		String videoURL = "https://api.themoviedb.org/3/movie/" + movieid + "/videos?api_key=e520d648beeee23f00a8b3386b9dec08";
		
		// movieid 를 url에 넣어서 JSON 정보를 얻어와서 트레일러 key 얻음
		JSONObject videoData = new JSONObject();
		videoData = getData(videoURL);
		JSONObject video = (JSONObject) videoData.get(0);
		String trailerkey = video.get("key").toString();
		System.out.println(video);

		// 끝 : trailerkey
		
		//	get trailer genres
//		String movieDetailURL ="https://api.themoviedb.org/3/movie/"+ movieid +"?api_key=e520d648beeee23f00a8b3386b9dec08&language=en-US";
//		JSONObject movieDetailData = getData(movieDetailURL);
//		System.out.println(movieDetailData);
//		JSONArray genres = (JSONArray) movieDetailData.get("genres");
//		JSONObject trailer_genres = new JSONObject();
//		for(int p=0; p<genres.size(); p++) {
//		 trailer_genres = (JSONObject) genres.get(p);
//		}
		
		//	push to result
//		result.put("genres", trailer_genres);
		
		
		// popmoviekey를 key로 result에 넣음
		result.put("popmoviekey", trailerkey);
		System.out.println(result);
	
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

	
	private static JSONObject getData(String apiUrl, String objkey) {
		
		String responseBody = get(apiUrl);
		// System.out.println("responseBody : " + responseBody); UTF-8 이상 없음
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject = (JSONObject) jsonParser.parse(responseBody);
		} catch (ParseException e) {
			e.printStackTrace();
			}
		JSONArray jsonArray = (JSONArray)jsonObject.get("results");
		JSONObject data = new JSONObject();
		for (int i = 0; i < jsonArray.size(); i ++) {
			JSONObject m = (JSONObject) jsonArray.get(i);
			data.put(m.get(objkey), jsonArray.get(i));
		}
		return data;			
		
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
		JSONArray jsonArray = (JSONArray)jsonObject.get("results");
		JSONObject data = new JSONObject();
		for (int i = 0; i < jsonArray.size(); i ++) {
			data.put(i, jsonArray.get(i));
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
