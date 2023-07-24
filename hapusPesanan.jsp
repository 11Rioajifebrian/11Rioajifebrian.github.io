<%-- 
    Document   : hapusPesanan
    Created on : Jul 11, 2023, 5:24:59 PM
    Author     : User
--%>
<%@page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    try {
        String url = "jdbc:mysql://localhost/warkopgws";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, "root", "");
        Statement statement = conn.createStatement();
        String query = " DELETE FROM pesanan WHERE id=" + id + "";
        int i = statement.executeUpdate(query);
        response.sendRedirect("lihatPesanan.jsp");
    } catch (Exception e) {
        response.sendRedirect("lihatPesanan.jsp");
    }
%>