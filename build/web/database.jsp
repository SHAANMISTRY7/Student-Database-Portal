<%-- 
    Document   : database
    Created on : 3 Oct, 2020, 4:21:08 PM
    Author     : SHAAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                font-family: Helvetica;
                text-align: center;
                margin-top: 150px;
            }
            .success {
                background-color: green;
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
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
        %>
        <%
            PreparedStatement ps = con.prepareStatement("insert into student values(?, ?, ?)");
            ps.setInt(1, Integer.parseInt(request.getParameter("id")));
            ps.setString(2, request.getParameter("name"));
            ps.setString(3, request.getParameter("country"));
            
            ps.execute();
        %>
        <div class="success">
            Successfully inserted the data...
        </div>
        <jsp:include page="view.jsp"/>
        <script>
            const success = document.querySelector('.success');
            setTimeout(() => success.remove(), 3000);
        </script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
