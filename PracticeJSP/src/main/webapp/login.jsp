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
<title>Login Result</title>
</head>
<body style="font-family: Arial; text-align: center; margin-top: 100px;">

<%
String un = request.getParameter("un");
String pwd = request.getParameter("pwd");
int same = 0;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "shubham");
    Statement statement = connection.createStatement();
    ResultSet set = statement.executeQuery("SELECT * FROM infor");
    
    while(set.next()) {
        if(un.equals(set.getString(2)) && pwd.equals(set.getString(3))) {
            same = 1;
            break;
        }
    }
    
    set.close();
    statement.close();
    connection.close();
    
} catch(Exception e) {
    e.printStackTrace(out);
}

if(same == 1) {
    response.sendRedirect("welcome.jsp");
} else {
%>
    <h3 style="color:red;">Wrong username or password!</h3>
    <a href="login.html">Try Again</a>
<%
}
%>

</body>
</html>
