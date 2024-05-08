<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.List" %>
<%@page import="rentalcarServer.user.model.UserResponseDto"%>
<%@page import="rentalcarServer.user.model.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<jsp:include page="/header"></jsp:include>
<body>
	<section id="root">
	<%
	// JSP 내강 객체의 유효기간 (Scope)
	pageContext.setAttribute("test", "page data");
	request.setAttribute("test", "request data");
	session.setAttribute("test", "session data");
	application.setAttribute("test", "page data");
	
	// 페이지 이동처리 1)
	// ㄴ 단순 페이지 이동 처리 (url의 변화 O)
	//response.sendRedirect("test1.jsp");
	
	// 페이지 이동처리 2)
	// ㄴ request & response 객체를 전달하면서 이동 처리 (url의 변화 X)
	//request.getRequestDispatcher("test1.jsp").forward(request, response);
	%>
	
	<%
	String pageData = (String) pageContext.getAttribute("test");
	String requestData = (String) request.getAttribute("test");
	String sessionData = (String) session.getAttribute("test");
	String applicationData = (String) application.getAttribute("test");

	out.print(String.format("<p>pageData : <b>%s</b></p>", pageData));
	out.print(String.format("<p>requestData : <b>%s</b></p>", requestData));
	out.print(String.format("<p>sessionData : <b>%s</b></p>", sessionData));
	out.print(String.format("<p>applicationData : <b>%s</b></p>", applicationData));
	%>

	<!-- JSP EL(Expression language) Tag -->
	<p>${pageScope.test}</p>
	<p>${requestScope.test}</p>
	<p>${sessionScope.test}</p>
	<p>${applicationScope.test}</p><br>

	<!--  Default 참조 영역 확인용 : request > session > application -->
	<p>${pageScope.test}</p>
	<!--  
	<script>
	const val = '1234';
	const str = `${val}`;
	</script>
	-->
	
	<%
	// 간단한 DB 연동 확인 작업
	//Connection conn = null;
	
	//String url="jdbc:mysql://localhost:3306/board_server_db";
	//String user="root";
	//String password="root";
	
	// 드라이버 로드
	// Class.forName("com.mysql.cj.jdbc.Driver");
	
	// conn = DriverManager.getConnection(url, user, password);
	
	//if(conn != null)
	//	out.print("Database 연동 성공");
	//else
	//	out.print("Database 연동 실패");
	
	
	List<UserResponseDto> result = UserDao.getInstance().findUserAll();
	System.out.println("result.size() : " + result.size());
	%>
	</section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>