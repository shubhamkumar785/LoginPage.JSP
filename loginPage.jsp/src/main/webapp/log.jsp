<%@page import="java.sql.ResultSet"%>
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


try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "shubham");
	Statement statement = connection.createStatement();
	ResultSet set = statement.executeQuery("SELECT * FROM user;");
	int flag = 0;
	while(set.next()){
		if(un.equals(set.getString(2)) && pwd.equals(set.getString(3))){
			flag = 1;
		}
	}
	if(flag == 1){
		response.sendRedirect("welcome.jsp");
	}
	else{
		response.sendRedirect("login.html");
	}
	
	
	out.println("Fine");
}
catch(Exception e){
	System.out.println(e);
}



%>
</body>
</html>