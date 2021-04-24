<%-- 
    Document   : logout
    Created on : 7 Oct, 2020, 10:25:59 AM
    Author     : SHAAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .success {
                font-size: 20px;
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
          session.invalidate();
        %>
        <jsp:include page="index.html"/>
        <%
            out.println("<div class='success'>Successfully logged out!!!</div>");
        %>
        <script>
            const success = document.querySelector('.success');
            setTimeout(() => success.remove(), 3000);
        </script>
    </body>
</html>
