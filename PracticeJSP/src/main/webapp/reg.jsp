<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String un = request.getParameter("un");
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");

try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "shubham");
	Statement statement = connection.createStatement();
	String query = "INSERT INTO infor(name, password,  email) VALUES('" + un + "', '" + pwd + "', '" + email + "')";
	statement.executeUpdate(query);
	response.sendRedirect("reg.html");
	
}
catch(Exception e){
	e.printStackTrace();
}
%>

</body>
</html>