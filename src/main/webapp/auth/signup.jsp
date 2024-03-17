<%--
  Created by IntelliJ IDEA.
  User: New
  Date: 16.03.2024
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <form action="/auth/signup" method="post">
        Username : <input type="text" name="username">
        <br>
        <br>
        Email : <input type="email" name="email">
        <br>
        <br>
        Password : <input type="password" name="password">

        <button type="submit">Sign Up</button>
    </form>

    <p>${sessionScope.sessionAttribute}</p>
    <p>${requestAttribute}</p>
</body>
</html>
