<%--
  Created by IntelliJ IDEA.
  User: a12345
  Date: 24/03/2023
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<fieldset>
    <legend>User information</legend>
    <table>
        <tr>
            <td>ID : ${user.getId()}</td>
        </tr>
        <tr>
            <td> Name User : ${user.getName()}</td>
        </tr>
        <tr>
            <td>Email: ${user.getEmail()}</td>
        </tr>
        <tr>
            <td>Country: ${user.getCountry()}</td>
        </tr>
    </table>
    <td><a href="/user">Back to user list</a></td>
    <br>
</fieldset>
</body>
</html>
