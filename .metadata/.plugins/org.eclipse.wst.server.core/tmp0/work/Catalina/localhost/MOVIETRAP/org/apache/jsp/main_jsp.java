/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.44
 * Generated at: 2021-05-21 10:01:09 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("jar:file:/D:/Project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MOVIETRAP/WEB-INF/lib/standard.jar!/META-INF/c.tld", Long.valueOf(1098678690000L));
    _jspx_dependants.put("jar:file:/D:/Project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MOVIETRAP/WEB-INF/lib/standard.jar!/META-INF/fmt.tld", Long.valueOf(1098678690000L));
    _jspx_dependants.put("/WEB-INF/lib/standard.jar", Long.valueOf(1620715428411L));
    _jspx_dependants.put("/header.jsp", Long.valueOf(1621588564264L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"EUC-KR\">\r\n");
      out.write("<link href=\"assets/css/header.css\" type=\"text/css\" rel=\"stylesheet\" >  \r\n");
      out.write("<title>Header</title>\r\n");
      out.write("<style>\r\n");
      out.write("body {\r\n");
      out.write("\tz-index: 9;\r\n");
      out.write("\t}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<header>\r\n");
      out.write("\t\t<div id=\"logo\" onclick=\"location='main.jsp'\">\r\n");
      out.write("\t\t\t\t<img src=\"assets/images/logo.png\" /> \r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"search\">\r\n");
      out.write("\t\t\t<input type=\"search\" placeholder=\"search\">\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"genre\">\r\n");
      out.write("\t\t\t<select name=\"genre\">\r\n");
      out.write("\t\t\t\t<option value=\"28\">Action</option>\r\n");
      out.write("\t\t\t\t<option value=\"12\">Adventure</option>\r\n");
      out.write("\t\t\t\t<option value=\"16\">Animation</option>\r\n");
      out.write("\t\t\t\t<option value=\"35\">Comedy</option>\r\n");
      out.write("\t\t\t\t<option value=\"80\">Crime</option>\r\n");
      out.write("\t\t\t\t<option value=\"99\">Documentary</option>\r\n");
      out.write("\t\t\t\t<option value=\"18\">Drama</option>\r\n");
      out.write("\t\t\t\t<option value=\"10751\">Family</option>\r\n");
      out.write("\t\t\t\t<option value=\"14\">Fantasy</option>\r\n");
      out.write("\t\t\t\t<option value=\"36\">History</option>\r\n");
      out.write("\t\t\t\t<option value=\"27\">Horror</option>\r\n");
      out.write("\t\t\t\t<option value=\"10402\">Music</option>\r\n");
      out.write("\t\t\t\t<option value=\"9648\">Mystery</option>\r\n");
      out.write("\t\t\t\t<option value=\"10749\">Romance</option>\r\n");
      out.write("\t\t\t\t<option value=\"878\">Science Fiction</option>\r\n");
      out.write("\t\t\t\t<option value=\"10770\">Movie</option>\r\n");
      out.write("\t\t\t\t<option value=\"53\">Thriller</option>\r\n");
      out.write("\t\t\t\t<option value=\"10752\">War</option>\r\n");
      out.write("\t\t\t\t<option value=\"37\">Western</option>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t</select>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"user_icon\" onclick=\"location='MOVIETRAPServlet?command=membership'\">\r\n");
      out.write("\t\t\t<img src=\"assets/images/user.png\" />\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"watch_later\">\r\n");
      out.write("\t\t\t<a href=\"\">\r\n");
      out.write("\t\t\t\t<img src=\"assets/images/heart.png\" />\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"set\">\r\n");
      out.write("\t\t\t<a href=\"\">\r\n");
      out.write("\t\t\t\t<img src=\"assets/images/set.png\" />\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</header>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"EUC-KR\">\r\n");
      out.write("<link href=\"assets/css/main.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("<script\r\n");
      out.write("\tsrc=\"https://ajax.googleapis.com/ajax/li\r\n");
      out.write("bs/jquery/3.5.1/jquery.min.js\"></script>\r\n");
      out.write("<title>MOVIETRAP</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body style=\"background-color: black;\">\r\n");
      out.write("\t<div class=\"main_movie_container\">\r\n");
      out.write("\t\t<div id=\"main_movie\" > <!-- style=\"overflow-y: hidden; overflow-x: hidden;\" -->\r\n");
      out.write("\t\t\t<div id=\"main_movie_trailer\">\r\n");
      out.write("\t\t\t\t<iframe id=\"main_movie_frame\" src=\"\"> </iframe> <!-- class=\"vid\" -->\r\n");
      out.write("<!-- <iframe id=\"main_movie_frame\" class=\"vid\" width=\"100%\" height=\"100%\" style=\"overflow-y: hidden; overflow-x: hidden;\" src=\"\"> </iframe> -->\r\n");
      out.write("\t\t\t\t<div class=\"main_movie_info_hover\">\r\n");
      out.write("\t\t\t\t\t<div class=\"main_movie_info\">\r\n");
      out.write("\t\t\t\t\t\t<div id=\"main_movie_title\">\r\n");
      out.write("\t\t\t\t\t\t\t<h1>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${title}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h1>\r\n");
      out.write("\t\t\t\t\t\t\t<h3>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${release_date}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h3>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<div id=\"main_movie_genre\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${genres_array}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h2>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<div id=\"main_movie_description\">\r\n");
      out.write("\t\t\t\t\t\t\t<h2>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${overview}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h2>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<div id=\"main_movie_rationgscore\">\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"assets/images/star.png\" width=\"50px\" height=\"50px\" />\r\n");
      out.write("\t\t\t\t\t\t\t");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${vote_average}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<div id=\"main_button\">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"MOVIETRAPServlet?command=moviepage&movieid=\"+id>\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"assets/images/main-play.png\" />\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("<!-- \t\t\t\t\t\t</div> -->\r\n");
      out.write("\r\n");
      out.write("<!-- \t\t\t\t\t\t<div id=\"main_watch_later\"> -->\r\n");
      out.write("\t\t\t\t\t\t\t<img src=\"assets/images/main-heart.png\" />\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"thumbnail_slideshow_wrapper\">\r\n");
      out.write("\t\t<div class=\"thumbnail_slideshow_row\">\r\n");
      out.write("\t\t\t<div id=\"thumbnail_wrapper\">\r\n");
      out.write("\t\t\t\t<img id=\"slideLeft\" class=\"arrow\" src=\"assets/images/left_arrow.png\">\r\n");
      out.write("\t\t\t\t<div id=\"trend_movie\"></div>\r\n");
      out.write("\t\t\t\t<img id=\"slideRight\" class=\"arrow\" src=\"assets/images/arrow.png\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<!-- QNA / Chat pop up -->\r\n");
      out.write("\t<form name=\"frm\" method=\"post\" onclick=\"MOVIETRAPServlet?command=qna_send\">\r\n");
      out.write("\t\t<div class=\"chat-box\">\r\n");
      out.write("\t\t\t<div class=\"chat-closed\">Chat Now</div>\r\n");
      out.write("\t\t\t<div class=\"chat-header hide\">\r\n");
      out.write("\t\t\t\t<div class=\"box\"></div>\r\n");
      out.write("\t\t\t\tOnline Support\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"chat-content-container hide\">\r\n");
      out.write("\t\t\t\t<div id=\"chat_section\" class=\"chat-content\">\r\n");
      out.write("\t\t\t\t\t<!-- 채팅 내용 위치 -->\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div id=\"chat_footer\">\r\n");
      out.write("\t\t\t\t\t<textarea id=\"chat_content\" name=\"chat_content\" cols=\"25\" rows=\"5\"></textarea>\r\n");
      out.write("\t\t\t\t\t<input id=\"chat-submit\" class=\"btn\" type=\"submit\" name=\"qna_send\" value=\"send\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("//send data for each movie(thumbnail);\r\n");
      out.write(" function moviepage(img){\r\n");
      out.write("var id = img.getAttribute('alt'); \t\t\r\n");
      out.write("\tvar url = \"MOVIETRAPServlet?command=moviepage&movieid=\"+id;\r\n");
      out.write("\tconsole.log(id)\r\n");
      out.write("\tlocation.href = url;\t  \r\n");
      out.write(" \r\n");
      out.write("}\r\n");
      out.write("//qna send msg\r\n");
      out.write("function qna_send() {\r\n");
      out.write("var theForm = document.frm;\r\n");
      out.write("theForm.action =  \"MOVIETRAPServlet?command=qna_send\"; \r\n");
      out.write("theForm.submit();\r\n");
      out.write("}\r\n");
      out.write("//pic slide \r\n");
      out.write("let buttonRight = document.getElementById('slideRight');\r\n");
      out.write("let buttonLeft = document.getElementById('slideLeft');\r\n");
      out.write("\r\n");
      out.write("buttonLeft.addEventListener('click', function(){\r\n");
      out.write("\tdocument.getElementById('trend_movie').scrollLeft -= 500\r\n");
      out.write("})\r\n");
      out.write("\r\n");
      out.write("buttonRight.addEventListener('click', function(){\r\n");
      out.write("\tdocument.getElementById('trend_movie').scrollLeft += 500\r\n");
      out.write("})\r\n");
      out.write("\r\n");
      out.write("//qna\r\n");
      out.write(" $(document).ready(function(){\r\n");
      out.write("    $(\".chat-closed\").on(\"click\",function(e){\r\n");
      out.write("        $(\".chat-header,.chat-content-container\").removeClass(\"hide\");\r\n");
      out.write("        $(this).addClass(\"hide\");\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("    $(\".chat-header\").on(\"click\",function(e){\r\n");
      out.write("        $(\".chat-header,.chat-content-container\").addClass(\"hide\");\r\n");
      out.write("        $(\".chat-closed\").removeClass(\"hide\");\r\n");
      out.write("    });\r\n");
      out.write("});\r\n");
      out.write("\t \r\n");
      out.write("\t\r\n");
      out.write("//movie info AJAX\t\r\n");
      out.write("window.onload = function() {\r\n");
      out.write("\t\t$.ajax ({\r\n");
      out.write("\t\t\turl : 'MOVIETRAPServlet?command=main',\r\n");
      out.write("\t\t\tasync : false,\r\n");
      out.write("\t\t\ttype : 'get',\r\n");
      out.write("\t\t\tdatatype : 'json',\r\n");
      out.write("\t\t\tsuccess : function(result) {\r\n");
      out.write("\t\t\t\tconst json =  JSON.parse(result)\r\n");
      out.write("\t\t\t\tvar trend = json[\"trendData\"]\r\n");
      out.write("\t\t\t\tvar pop = json[\"popData\"]\r\n");
      out.write("\t\t\t\tvar trailerkey = json[\"popmoviekey\"]\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t// 메인 동영상 src 인기 영상 트레일러로 변경\r\n");
      out.write("\t\t\t\tif (trailerkey != null) {\r\n");
      out.write("\t\t\t\t\tconsole.log(trailerkey);\r\n");
      out.write("\t\t\t\t\tdocument.getElementById('main_movie_frame').src = \"https://youtube.com/embed/\" + trailerkey + \"?autoplay=1&mute=1\";\r\n");
      out.write("\t\t\t\t}\t\r\n");
      out.write("\t\t\t\t// 메인 동영상 src 인기 영상 트레일러로 변경 끝 \r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t// trend_movie div 생성 및 포스터 이미지 삽입\r\n");
      out.write("\t\t\t\tfor (var i = 0; i <= Object.keys(trend).length; i++) {\r\n");
      out.write("\t\t\t\t\tdocument.querySelector('#trend_movie').innerHTML += '<div class=\"container\"><img src='+'http://www.themoviedb.org/t/p/w200' + trend[Object.keys(trend)[i]][\"poster_path\"] +\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t' alt=' + trend[Object.keys(trend)[i]][\"id\"] +\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t' onclick=\"moviepage(this)\" /></div>';\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t// trend_movie div 생성 및 포스터 이미지 삽입 끝\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t//main_trailer_detail 삽입\r\n");
      out.write("\t\t\t\t\tdocument.querySelector('#movie_title').h1.innerHTML =  pop[Object.keys(pop)[0]][\"title\"];\r\n");
      out.write("\t\t\t\t\tdocument.querySelector('#movie_title').h3.innerHTML =  pop[Object.keys(pop)[0]][\"release_date\"];\r\n");
      out.write("\t\t\t\t\tdocument.querySelector('#movie_genre').h2.innerHTML =  pop[Object.keys(pop)[0]][\"genre\"];\r\n");
      out.write("\t\t\t\t\tdocument.querySelector('#movie_description').h2.innerHTML =  pop[Object.keys(pop)[0]][\"overview\"];\r\n");
      out.write("\t\t\t\t\tdocument.querySelector('#movie_rationgscore').innerHTML =  pop[Object.keys(pop)[0]][\"vote_average\"];\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror : function() {\r\n");
      out.write("\t\t\t\tconsole.log(\"ajax : fail\")\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("}\r\n");
      out.write("\t\r\n");
      out.write("$.ajax ({\r\n");
      out.write("\turl : 'MOVIETRAPServlet?command=qna_send',\r\n");
      out.write("\tasync : false,\r\n");
      out.write("\ttype : 'get',\r\n");
      out.write("\tdatatype : 'json',\r\n");
      out.write("\tsuccess : function(result) {\r\n");
      out.write("\t\tconst json = JSON.parse(result);\r\n");
      out.write("\t\tvar user_id = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.loginUser.email}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tconsole.log(json[0][\"chat_content\"]);\r\n");
      out.write("\t\tfor (var i = 0; i < json.length; i++) {\r\n");
      out.write("\t\t\tif (user_id == json[i][\"send_id\"]) {\r\n");
      out.write("\t\t\t\tdocument.querySelector('#chat_section').innerHTML += '<div ' + 'float:right' + '>' + json[i][\"chat_content\"] + '</div><br>';\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\tdocument.querySelector('#chat_section').innerHTML += '<div ' + 'float:left' + '>' + json[i][\"chat_content\"] + '</div><br>';\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t},\r\n");
      out.write("\terror : function() {\r\n");
      out.write("\t\tconsole.log(\"ajax : fail\")\r\n");
      out.write("\t}\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
