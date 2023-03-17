<%--
  Created by IntelliJ IDEA.
  User: a12345
  Date: 15/03/2023
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        .message {
            background-color: black;
            color: aqua;
        }
        body {
            background-color: aquamarine;
        }
    </style>
</head>
<body>
<h1>CREATE PRODUCT</h1>

<p>
    <a href="/Product"> Back List Product</a>
</p>
<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>ID :</td>
                <td><input type="text" name="id" id="id"></td>
            </tr>
            <tr>
                <td>Name Product:</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Price :</td>
                <td><input type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Description Product :</td>
                <td><input type="text" name="description" id="description"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Add Product"></td>
                <td><p>
                    <a href="/Product"> Back List Product</a>
                </p></td>
            </tr>
        </table>
    </fieldset>

</form>
</body>
</html>