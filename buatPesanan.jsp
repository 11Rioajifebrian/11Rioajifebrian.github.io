<%-- 
    Document   : lihatMenu
    Created on : Jul 11, 2023, 3:16:17 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Buat Pesanan</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css"/>
    <style>
    </style>
</head>
<body>
    <a href="index.html" class="btn btn-outline-primary" style="margin-top: 20px; margin-left: 20px">Back</a>
        <h1 style="text-align: center; padding-top: 30px; padding-bottom: 30px">Buat Pesanan</h1>
        <div style="text-align: center">
        <form action="" method="post">
                <label for="nama">Pesanan
                <input type="text" class="form-control" name="nama_pesanan" id="nama">
            </label>
            
                <label for="name">Nama
                <input type="text" class="form-control" name="name" id="id">
                </label>
            <div class="d-grid gap-2 col-6 mx-auto" style= "padding-top:30px">
            <button type="submit" class="btn btn-primary" name="Create">Konfirmasi</button>
            </div>
        </form>
        </div>
</body>
 
<%@page import="java.sql.*" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.*" %>
<% 
    String namaPesanan = request.getParameter("nama_pesanan");
    String nama = request.getParameter("name");
    Connection conn = null;
    PreparedStatement statement = null;
    
    if (namaPesanan != null && !namaPesanan.isEmpty()) {
        try {
            String url = "jdbc:mysql://localhost/warkopgws";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, "root", "");

            String query = "INSERT INTO pesanan (id, nama_pesanan, name) VALUES (?,?,?)";

            statement = conn.prepareStatement(query);
            int min = 9;
            int max = 98;
            int randomNumber = (int) (Math.random() * (max - min) + min);
            statement.setInt(1, randomNumber);
            statement.setString(2, namaPesanan);
            statement.setString(3, nama);
            int updatedQuery = statement.executeUpdate();
            
            if (updatedQuery != 0) {
                response.sendRedirect("lihatPesanan.jsp");
            }
        } catch (Exception e) {
            out.println(e.getMessage());
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        }
    }
%>

</html>
