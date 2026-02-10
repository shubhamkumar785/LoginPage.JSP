<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>

<%
String uname = request.getParameter("uname");
String newpwd = request.getParameter("newpwd");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/webdev",
        "root",
        "shubham"
    );

    String sql = "UPDATE data SET password=? WHERE name=?";
    PreparedStatement ps = con.prepareStatement(sql);

    ps.setString(1, newpwd);
    ps.setString(2, uname);

    int rows = ps.executeUpdate();

    if (rows > 0) {
%>
        <h3 style="color:green;text-align:center">
            Password updated successfully
        </h3>
        <div style="text-align:center">
            <a href="log.html">Login Now</a>
        </div>
<%
    } else {
%>
        <h3 style="color:red;text-align:center">
            Username not found
        </h3>
        <div style="text-align:center">
            <a href="forget.html">Try Again</a>
        </div>
<%
    }

    ps.close();
    con.close();

} catch (Exception e) {
    out.println("Error: " + e);
}
%>

</body>
</html>
