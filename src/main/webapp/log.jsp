<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/webdev",
        "root",
        "shubham"
    );

    String sql = "SELECT * FROM data WHERE name=? AND password=?";
    PreparedStatement ps = con.prepareStatement(sql);

    ps.setString(1, uname);
    ps.setString(2, pwd);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        // Login success
        response.sendRedirect("home.jsp");
    } else {
        // Login failed
        out.println("<h3 style='color:red;text-align:center'>Invalid Username or Password</h3>");
        out.println("<a href='login.html'>Try Again</a>");
    }

    rs.close();
    ps.close();
    con.close();

} catch (Exception e) {
    out.println("Error: " + e);
}
%>
