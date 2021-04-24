<%-- 
    Document   : validate
    Created on : 5 Oct, 2020, 12:36:24 PM
    Author     : SHAAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validate Admin Page</title>
        <style>
            .error {
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
        %>
        <% 
            if(username.equals(config.getInitParameter("username")) && password.equals(config.getInitParameter("password"))) {
                session.setAttribute("uname", username);
                response.sendRedirect("homepage.jsp");
            } else {
                out.println("<div class='error'>Invalid username or password. Try again...</div>");
                request.getRequestDispatcher("index.html").include(request, response);
            }
        %>
        <script>
            const error = document.querySelector('.error');
            setTimeout(() => error.remove(), 3000);
        </script>
    </body>
</html>
