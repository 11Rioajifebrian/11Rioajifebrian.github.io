<%-- 
    Document   : processUpdateStudent
    Created on : Jul 5, 2023, 3:29:15 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>

<% 
   String id = request.getParameter("id");
   String namaPesanan = request.getParameter("nama_pesanan");
   String nama = request.getParameter("name");
   
   if (id != null) {
       Connection connection = null;
       PreparedStatement statement = null;
       try {
           String url = "jdbc:mysql://localhost/warkopgws";
           String username = "root";
           String password = "";
           Class.forName("com.mysql.jdbc.Driver");
           connection = DriverManager.getConnection(url, username, password);
           String query = "UPDATE pesanan SET nama_pesanan=?, name=? WHERE id=?";
           statement = connection.prepareStatement(query);
           statement.setString(1, namaPesanan);
           statement.setString(2, nama);
           statement.setString(3, id);
           int i = statement.executeUpdate();
           if (i != 0) {
               response.sendRedirect("lihatPesanan.jsp");
           }
       } catch (Exception e) {
           out.println("Error: " + e.getMessage());
       } finally {
           if (statement != null) {
               statement.close();
           }
           if (connection != null) {
               connection.close();
           }
       }
   }
%>
