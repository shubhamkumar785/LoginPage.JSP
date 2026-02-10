<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Record Status</title>
</head>
<body>

<%
String sname   = request.getParameter("sname");
String rollno  = request.getParameter("rollno");
String course  = request.getParameter("course");
String branch  = request.getParameter("branch");
String year    = request.getParameter("year");
String contact = request.getParameter("contact");
String email   = request.getParameter("email");
String address = request.getParameter("address");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/webdev",
        "root",
        "shubham"
    );

    String sql = "INSERT INTO student "
               + "(sname, rollno, course, branch, year, contact, email, address) "
               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    PreparedStatement ps = con.prepareStatement(sql);

    ps.setString(1, sname);
    ps.setString(2, rollno);
    ps.setString(3, course);
    ps.setString(4, branch);
    ps.setString(5, year);
    ps.setString(6, contact);
    ps.setString(7, email);
    ps.setString(8, address);

    int rows = ps.executeUpdate();

    if (rows > 0) {
%>
        <h2 style="color:green; text-align:center;">
            Student Record Saved Successfully
        </h2>
        <div style="text-align:center;">
            <a href="home.html">Add Another Student</a>
        </div>
<%
    } else {
%>
        <h2 style="color:red; text-align:center;">
            Failed to Save Record
        </h2>
<%
    }

    ps.close();
    con.close();

} catch (Exception e) {
    out.println("<h3 style='color:red;'>Error: " + e + "</h3>");
}
%>

</body>
</html>
