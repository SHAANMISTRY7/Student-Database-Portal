<%-- 
    Document   : add
    Created on : 3 Oct, 2020, 4:18:10 PM
    Author     : SHAAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                padding-left: 90px;
                padding-right: 130px;
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
                margin-top: 100px;
                font-size: 25px;
            }
            input {
                min-height: 25px;
                min-width: 200px;
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
            <div class="homepage"><a href="homepage.jsp"><i class="fa fa-home"></i>  Homepage</a></div>
            <div class="title"><h1>Add Student</h1></div>
            <div class="logout"><a href="logout.jsp">Log Out</a></div>
        </div>
        <hr>
        <div class="form">
            <form action="database.jsp" method="POST" name="add_student">
                Enrollment No. 
                <br>
                <input type="text" name="id" required>
                <br>
                <br>
                Name 
                <br>
                <input type="text" name="name" required>
                <br>
                <br>
                Country 
                <br>
                <input type="text" name="country" required>
                <br>
                <br>
                <input type="submit" value="ADD" class="button">
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
