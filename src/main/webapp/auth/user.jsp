<%@ page import="org.example.datasource.DatabaseManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
 <form action="/auth/user" method="get">
     <table>
         <thead>
         <tr>Id</tr>
         <tr>Name</tr>
         <tr>Email</tr>
         </thead>
         <tbody>
         <%
             try (Connection connection = DatabaseManager.connect()) {
                 PreparedStatement statement = connection.prepareStatement("SELECT * FROM users");
                 ResultSet resultSet = statement.executeQuery();

                 while (resultSet.next()) {
                     String bookName = resultSet.getString("id");
                     String author = resultSet.getString("username");
                     String publishedYear = resultSet.getString("email");
         %>

         <tr>
             <td><%= bookName %>
             </td>
             <td><%= author %>
             </td>
             <td><%= publishedYear %>
             </td>
         </tr>
         <% } %>

         <% } catch (SQLException e) {
             throw new RuntimeException(e);
         }
         %>
         </tbody>
     </table>
 </form>


</body>
</html>
