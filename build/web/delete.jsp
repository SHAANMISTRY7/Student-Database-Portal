<%-- 
    Document   : delete
    Created on : 3 Oct, 2020, 5:24:39 PM
    Author     : SHAAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .success {
                background-color: green;
                color: white;
                padding: 10px;
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
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
        %>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            PreparedStatement ps = con.prepareStatement("delete from student where id=?");
            ps.setInt(1, id);
            
            ps.execute();
        %>
        <div class='success'>
            Successfully deleted the record...
        </div>
        <jsp:include page="view.jsp"/>
        <script>
            const success = document.querySelector('.success');
            setTimeout(() => success.remove(), 3000);
        </script>
    </body>
</html>
