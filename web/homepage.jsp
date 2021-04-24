<%-- 
    Document   : homepage
    Created on : 5 Oct, 2020, 12:37:01 PM
    Author     : SHAAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                padding-left: 110px;
                padding-right: 30px;
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
            input {
                margin-top: 30px;
                min-height: 50px;
                margin-right: 20px;
                min-width: 300px;
                font-size: 25px;
                background-color: white;
                border: 2px solid black;
            }
            input:hover {
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
            <div class="title"><h1>MU Student DataBase</h1></div>
            <div class="logout"><a href="logout.jsp">Log Out</a></div>
        </div>
        <hr>
        <form>
            <input type="submit" value="Add Student" formaction="add.jsp">
            <br>
            <input type="submit" value="View By ID" formaction="view_by_id.jsp">
            <br>
            <input type="submit" value="View Database" formaction="view.jsp">
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
