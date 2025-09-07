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
String pwd = request.getParameter("pwd");
String add = request.getParameter("add");
String zip = request.getParameter("zip");
// int zipInt = Integer.parseInt(zip);

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "shubham");
	Statement statement = connection.createStatement();
	//String query = "INSERT INTO `user` (name, password, address, zip) VALUES ('" + un + "', '" + pwd + "', '" + add + "', '" + zip + "')";
	String query = "INSERT INTO `user` (`name`, `password`, `address`, `zip`) VALUES ('" + un +"','" + pwd +"','" + add +"','" + zip  +"')";
	statement.executeUpdate(query);
	response.sendRedirect("index.html");
	out.println("Fine");
}
catch(Exception e){
	System.out.println(e);
}



%>
</body>
</html>