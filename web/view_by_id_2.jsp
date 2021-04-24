<%-- 
    Document   : view_by_id_2
    Created on : 5 Oct, 2020, 3:47:57 PM
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
                padding-left: 80px;
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
                margin-top: 15px;
                font-size: 25px;
            } 
            .add a {
                text-decoration: none;
            }
            .add a:visited {
                color: blue;
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
            .error {
                background-color: red;
                color: white;
                font-size: 20px;
                padding: 10px;
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
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
            
            PreparedStatement ps = con.prepareStatement("select * from student where id=?");
            ps.setInt(1, Integer.parseInt(request.getParameter("id")));  
            ResultSet rs = ps.executeQuery();
            
            if(!rs.isBeforeFirst()) {
                out.println("<div class='error'>No record in the database for this enrollment number.</div>");
            }
        %>
        <div class="header">
            <div class="homepage"><a href="homepage.jsp"><i class="fa fa-home"></i>  Homepage</a></div>
            <div class="title"><h1>Student Detail Of Enrollment No. <%= request.getParameter("id")%></h1></div>
            <div class="logout"><a href="logout.jsp">Log Out</a></div>
        </div>
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
                    out.println("<td class='hover'> <a href='edit.jsp?id=" + rs.getInt(1) + "&name=" + rs.getString(2) + "&country=" + rs.getString(3) + "'>Edit </a> </td>");
                    out.println("<td class='hover'> <a href='delete.jsp?id=" + rs.getInt(1) + "'>Delete </a> </td>");
                    out.println("</tr>");
                }
            %>
        </table>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
