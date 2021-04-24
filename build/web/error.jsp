<%-- 
    Document   : error
    Created on : 25 Nov, 2020, 2:22:20 PM
    Author     : SHAAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                font-family: Helvetica;
                text-align: center;
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
        <div class="error">
            <%
                String id = request.getParameter("id");
            %>
                Enrollment No. <%= id %> already exist.
        </div>
            <jsp:include page="add.jsp"></jsp:include>
        <script>
            const error = document.querySelector('.error');
            setTimeout(() => error.remove(), 3000);
        </script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
