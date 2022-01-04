/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.56
 * Generated at: 2022-01-04 08:00:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Ex0104_005f3_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<form action=\"./Ex0104_4.jsp\" method=\"post\">\r\n");
      out.write("	 	성명 : <input type =\"text\" name =\"sname\" required><br>\r\n");
      out.write("	 	나이 : <input type =\"text\" name =\"sage\"><br>\r\n");
      out.write("	 	지역 : <select name = \"sarea\">\r\n");
      out.write("	 		<option value = \"충북\">충북</option>\r\n");
      out.write("	 		<option value = \"경기\">경기</option>\r\n");
      out.write("	 		<option value = \"서울\">서울</option>\r\n");
      out.write("	 	</select> <br>\r\n");
      out.write("	 	<!-- 2000년 부터 2030년까지 syear변수로 전송할수 있는 select 태그 구현 -->\r\n");
      out.write("	 	\r\n");
      out.write("	 	년도 : <select name = \"syear\">\r\n");
      out.write("	 	<!-- java문법을 적용하기위해서 jsp 스크립트/태그를 사용 -->\r\n");
      out.write("	 		");
 for(int i = 2000; i < 2031; i++) { 
      out.write("\r\n");
      out.write("				 <option value =\"");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i);
      out.write("</option> \r\n");
      out.write("				 <!-- value 값을 넣어야 넘어갈수 있다 -->\r\n");
      out.write("				 <!-- option을 바깥에 두면 하나하나로 보이는것이 아니라 뭉터기 하나로 --> \r\n");
      out.write("	 		");
 } 
      out.write("\r\n");
      out.write("	 	</select><br>\r\n");
      out.write("	 	\r\n");
      out.write("	 	취미 : <input type=\"radio\" name =\"shobby\" value =\"등산\" >등산&nbsp;&nbsp;&nbsp;\r\n");
      out.write("	 	<input type=\"radio\" name =\"shobby\" value =\"낚시\" checked>낚시&nbsp;&nbsp;&nbsp;\r\n");
      out.write("	 	<input type=\"radio\" name =\"shobby\" value =\"축구\" >축구&nbsp;&nbsp;&nbsp;\r\n");
      out.write("	 	<!-- 배타적특성 최초의 아무것도 없는 상태로 넘어갈수 있어서 checked 표시-->\r\n");
      out.write("	 	<br>\r\n");
      out.write("	 	\r\n");
      out.write("	 	비빌번호 : <input type=\"password\" name=\"spwd\" ><br>\r\n");
      out.write("	 	<input type=\"submit\" value=\"전송하기\" >\r\n");
      out.write("	</form>\r\n");
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
