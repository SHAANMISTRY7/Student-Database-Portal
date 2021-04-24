<%-- 
    Document   : edit
    Created on : 3 Oct, 2020, 5:22:01 PM
    Author     : SHAAN
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            .title {
                display: inline-block;
                box-sizing: border-box;
                padding-top: 20px;
                padding-bottom: 20px;
                padding-left: 90px;
            }
            .logout {
                float: right;
                margin-top: 25px;
                box-sizing: border-box;
                padding-right: 20px;
                width: auto;
            }
            a {
                text-decoration: none;
                color: white;
                font-size: 20px;
            }
            a:hover {
                color: greenyellow;
            }
            .form {
                margin-top: 20px;
                font-size: 30px;
            }
            input {
                min-height: 25px;
                width: 20%;
                font-size: 20px;
            }
            .button {
                min-height: 30px;
                width: 20.5%;
                font-size: 20px;
            }
            .button:hover {
                background-color: black;
                color: white;
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
            <div class="title"><h1>Edit Student Details for Enrollment No. <%= request.getParameter("id") %> </h1></div>
            <div class="logout"><a href="logout.jsp">Log Out</a></div>
        </div>
        <hr>
        <div class="form">
            <form action="update.jsp" method="POST">
                <%=
                    "<input type='hidden' name='old_id' value='"+request.getParameter("id")+"'>"
                %>
                    Enrollment No. 
                    <br>
                    <input type="text" name="id" value="<%=request.getParameter("id")%>" required>
                    <br>
                    <br>
                    Name 
                    <br>
                    <input type="text" name="name" value="<%=request.getParameter("name")%>" required>
                    <br>
                    <br>
                    Country 
                    <br>
                    <input type="text" name="country" value="<%=request.getParameter("country")%>" required>
                    <br>
                    <br>
                    <input type="submit" value="Update" class="button">
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
