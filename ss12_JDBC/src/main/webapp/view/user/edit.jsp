<%--
  Created by IntelliJ IDEA.
  User: a12345
  Date: 24/03/2023
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit User </h1>


<p>
    <a href="/user">Back to user  list</a>
</p>

<p>
    <c:if test="${messageUpdate != null}">
        <span class="messageUpdate">${messageUpdate}</span>
    </c:if>
</p>

<form method="post">
    <fieldset>
        <legend>User  information</legend>
        <table>
            <tr>
                <td>name:</td>
                <td><input type="text" name="name" id="name" value="${user.getName()}"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" id="email" value="${user.getEmail()}"></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><input type="text" name="country" id="country" value="${user.getCountry()}">
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update User "></td>
                <td><a href="/user">Back to user list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
