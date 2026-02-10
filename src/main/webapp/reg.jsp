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
String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");
String address = request.getParameter("add");
String zip = request.getParameter("zip");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection connection = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/webdev",
        "root",
        "shubham"
    );

    Statement statement = connection.createStatement();

    String sql =
    	    "INSERT INTO data (name, password, address, zip) VALUES ('"
    	    + uname + "', '"
    	    + pwd + "', '"
    	    + address + "', '"
    	    + zip + "')";


    statement.executeUpdate(sql);
    response.sendRedirect("log.html");

} catch (Exception e) {
    e.printStackTrace();
}


%>
</body>
</html>