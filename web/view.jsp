<%-- 
    Document   : view
    Created on : 3 Oct, 2020, 4:35:19 PM
    Author     : SHAAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
        <style>
            * {
                font-family: Helvetica;
                text-align: center;
                margin: auto;
            }
            .header {
                background-color: black;
                color: white;
            }
            .homepage {
                float: left;
                margin-top: 25px;
                box-sizing: border-box;
                padding-left: 20px;
                width: auto;
            }
            .title {
                display: inline-block;
                box-sizing: border-box;
                padding-top: 20px;
                padding-bottom: 20px;
                padding-left: 70px;
                padding-right: 100px;
            }
            .logout {
                float: right;
                margin-top: 25px;
                box-sizing: border-box;
                padding-right: 20px;
                width: auto;
            }
            .logout a, .homepage a {
                text-decoration: none;
                color: white;
                font-size: 20px;
            }
            .logout a:hover, .homepage a:hover {
                color: greenyellow;
            }
            table {
                margin-top: 30px;
                font-size: 25px;
            }
            td {
                min-width: 250px;
            }
            tr {
                height: 50px;
            }
            .header_row {
                background-color: black;
                color: white;
                height: 75px;
            }
            .add {
                margin-top: 25px;
                margin-bottom: 60px;
            }
            .add input{
                height: 50px;
                font-size: 25px;
                background-color: white;
                color: black;
                border: 2px solid black;
            }
            .add input:hover {
                background-color: black;
                color: white;
                box-shadow: 5px 10px #c0c0c0;
            }
            .hover a {
                text-decoration: none;
            }
            .hover:hover{
                background-color: #c0c0c0;
            }
            .hover a:visited {
                color: blue;
            }
            .empty {
                margin-top: 18px;
                margin-bottom: 15px;
                font-size: 20px;
                color: red;
            }
        </style>
    </head>
    <body>
        <%
            String temp = (String)session.getAttribute("uname");
            if(temp == null) {
                request.getRequestDispatcher("index.html").forward(request, response);
            }
        %>
        <div class="header">
            <div class="homepage"><a href="homepage.jsp"><i class="fa fa-home"></i>  Homepage</a></div>
            <div class="title"><h1>MU Student DataBase</h1></div>
            <div class="logout"><a href="logout.jsp">Log Out</a></div>
        </div>
        <hr>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
            
            Statement stat = con.createStatement();
            ResultSet rs = stat.executeQuery("select * from student");
            
            if(!rs.isBeforeFirst()) {
                out.println("<div class='empty'>Database is empty.</div>");
            }
        %>
        <table border="1">
            <tr class="header_row">
                <td>Enrollment No.</td>
                <td>Name</td>
                <td>Country</td>
                <td>Edit Record</td>
                <td>Delete Record</td>
            </tr>
            <%
                while(rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt(1) + "</td>");
                    out.println("<td>" + rs.getString(2) + "</td>");
                    out.println("<td>" + rs.getString(3) + "</td>");
                    out.println("<td class='hover'> <a href='edit.jsp?id=" + rs.getInt(1) + "&name=" + rs.getString(2) + "&country=" + rs.getString(3) + "'><div>Edit </div></a> </td>");
                    out.println("<td class='hover'> <a href='delete.jsp?id=" + rs.getInt(1) + "'><div>Delete </div></a> </td>");
                    out.println("</tr>");
                }
            %>
        </table>
        <div class="add">
            <form action="add.jsp">
                <input type="submit" value="Add Student">
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
