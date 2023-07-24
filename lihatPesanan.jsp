<%-- 
    Document   : lihatPesanan
    Created on : Jul 11, 2023, 5:21:05 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lihat Pesanan</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css" />
        
    </head>
    <body>
        <a href="index.html" class="btn btn-outline-primary" style="margin-top: 20px; margin-left: 20px">Back</a>
       <h2 style="text-align: center; padding-top: 20px; padding-bottom: 20px">Daftar Pesanan</h2>
        <%@page import="java.sql.*" %>
       <%
            Connection conn = null;
            Statement statement = null;
            ResultSet result = null;

            try {
                String url = "jdbc:mysql://localhost/warkopgws";
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, "root", "");
                statement = conn.createStatement();

                String query = "SELECT * FROM pesanan";
                result = statement.executeQuery(query);

        %>

        <div class="mb-3">
        <table border="1" class="table table-bordered" style="color: white">
                <thead color="white" class="table-dark">
                <tr>
                    <td>No. Pesanan</td>
                    <td>Nama Pesanan</td>
                    <td>Nama Pemesan</td>
                    <td>Edit</td>
                    <td>Hapus</td>
                </tr>
                </thead>
                
                <tbody>
                <%         
                int i = 1;
                while (result.next()) {
                %>

                
                <tr>
                    <td><% out.print(i++); %></td>
                    <td> <% out.print(result.getString("nama_pesanan"));%> </td>
                    <td> <% out.println(result.getString("name"));%> </td>
                    
                    <td><a class="btn btn-success" href="tambahPesanan.jsp?id=<% out.println(result.getString("id"));%>">Edit Data</a> </td>
                     <td><a class="btn btn-danger" href="hapusPesanan.jsp?id=<% out.println(result.getString("id"));%>">Hapus Data</a> </td>
                </tr>

                <%
                        }
                    } catch (Exception e) {
                    }

                %>
                </tbody>
        </table>
        </div>
                
          <div class="d-grid gap-2 col-6 mx-auto" style= "padding-top:30px">
<button class="btn btn-primary" onclick="location.href='buatPesanan.jsp' ">Tambah pesanan Baru</button>
</div>
    </body>
</html>

