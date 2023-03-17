<%--
  Created by IntelliJ IDEA.
  User: a12345
  Date: 16/03/2023
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Title</title>
  <style>
    body{
      background-color: aquamarine;
    }
  </style>
</head>
<body>
<p>
  <a href="/Product"> Back List Product </a>
</p>
<fieldset>
  <legend>Product information</legend>
  <table>
    <tr>
      <td>ID : ${product.getId()}</td>
    </tr>
    <tr>
      <td> Name Product : ${product.getName()}</td>
    </tr>
    <tr>
      <td>Price: ${product.getPrice()}</td>
    </tr>
    <tr>
      <td>Description: ${product.getDescription()}</td>
    </tr>
  </table>
  <td><a href="/Product">Back to product list</a></td>
  <br>
  <td><a href="/Product?action=view&id=${productNext.getId()}"> ${productNext.getName()} </a></td>
</fieldset>
</body>
</html>
