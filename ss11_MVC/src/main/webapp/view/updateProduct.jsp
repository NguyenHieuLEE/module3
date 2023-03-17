<%--
  Created by IntelliJ IDEA.
  User: a12345
  Date: 15/03/2023
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        .messageUpdate {
            background-color: black;
            color: aqua;
        }
        body{
            background-color: aquamarine;
        }
    </style>
</head>
<body>
<h1>Edit Product</h1>


<p>
    <a href="/Product">Back to product list</a>
</p>

<p>
    <c:if test="${messageUpdate != null}">
        <span class="messageUpdate">${messageUpdate}</span>
    </c:if>
</p>

<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>name:</td>
                <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" name="price" id="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><input type="text" name="description" id="description" value="${product.getDescription()}">
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update Product"></td>
                <td><a href="/Product">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
