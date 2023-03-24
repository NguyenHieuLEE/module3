<%--
  Created by IntelliJ IDEA.
  User: a12345
  Date: 24/03/2023
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Add User</h1>

<p>
    <a href="/user"> Back List User</a>
</p>
<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<form method="post">
    <fieldset>
        <legend>User information</legend>
        <table>
            <tr>
                <td>Name user:</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>email :</td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Country :</td>
                <td><input type="text" name="country" id="country"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Add User"></td>
                <td><p>
                    <a href="/user"> Back List User</a>
                </p></td>
            </tr>
        </table>
    </fieldset>

</form>
</body>
</html>

