<%-- 
    Document   : view_by_id
    Created on : 5 Oct, 2020, 3:33:13 PM
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
                padding-left: 105px;
                padding-right: 120px;
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
                font-size: 25px;
            }
            input {
                width: 20%;
                height: 25px;
                font-size: 20px;
                margin-top: 10px;
            }
            .button {
                margin-top: 30px;
                height: 30px;
                width: auto;
                font-size: 20px;
            }
            .button:hover {
                opacity: 0.9;
                background-color: black;
                color: white;
                box-shadow: 5px 10px #c0c0c0;
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
            <div class="homepage"><a href="homepage.jsp"><i class="fa fa-home"></i> Homepage</a></div>
            <div class="title"><h1>View Student Detail By Enrollment No.</h1></div>
            <div class="logout"><a href="logout.jsp">Log Out</a></div>
        </div>
        <hr>
        <div class="form">
            <form action="view_by_id_2.jsp" method="POST">
                <p>Enrollment No</p>
                <input type="text" name="id" required>
                <br>
                <input type="submit" value="View" class="button">
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
