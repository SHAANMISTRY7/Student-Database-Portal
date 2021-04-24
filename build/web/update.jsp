<%-- 
    Document   : update
    Created on : 3 Oct, 2020, 6:01:17 PM
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
            int id_old = Integer.parseInt(request.getParameter("old_id"));
            
            PreparedStatement ps = con.prepareStatement("update student set id = ?, name = ?, country = ? where id = ?");
    
            ps.setInt(1, Integer.parseInt(request.getParameter("id")));
            ps.setString(2, request.getParameter("name"));
            ps.setString(3, request.getParameter("country"));
            ps.setInt(4, id_old);
            
            ps.execute();
        %>
        <div class="success">
            Successfully updated the record...
        </div>
        <jsp:include page="view.jsp"/>
        <script>
           const success = document.querySelector('.success');
           setTimeout(() => success.remove(), 3000);
        </script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
