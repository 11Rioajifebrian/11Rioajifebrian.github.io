<%--
    Document   : tambah
    Created on : Jul 5, 2023, 2:56:19 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ganti Pesanan</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <a href="lihatPesanan.jsp" class="btn btn-outline-primary" style="margin-top: 20px; margin-left: 20px">Back</a>
        <div class="mb-3">
        <h1 style="text-align: center; padding-bottom: 30px; padding-top: 30px">Ganti Pesanan</h1>
            <%@page import="java.sql.*" %>
            <%
                String id = request.getParameter("id");
                Connection connection = null;
                Statement statement = null;

                try {
                    String url = "jdbc:mysql://localhost/warkopgws";
                    String username = "root";
                    String password = "";
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(url, username, password);
                    statement = connection.createStatement();
                    String query = "SELECT * FROM pesanan WHERE id=" + id;
                    ResultSet result = statement.executeQuery(query);

                    while (result.next()) {
            %>
            <form style="text-align: center;" action="proses.jsp" method="post">
                <input type="hidden" name="id" value="<%out.println(result.getString("id")); %>">
                <label for="nama_pesanan">Pesanan
                    <input type="text" class="form-control" id="studentNumber" name="nama_pesanan" value="<%out.println(result.getString("nama_pesanan")); %>">
                    </label>

                    <label for="name">Nama
                    <input type="text" class="form-control" id="name" name="name" value="<%out.println(result.getString("name")); %>">
                    </label>
                <div class="d-grid gap-2 col-6 mx-auto" style="padding-top: 30px">
                <button type="submit" class="btn btn-primary" name="updateStudent">Simpan</button>
                </div>
            </form>
            <%}
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
            %>
        </div>
    </body>
</html>


