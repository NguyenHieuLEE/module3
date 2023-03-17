<%--
  Created by IntelliJ IDEA.
  User: a12345
  Date: 16/03/2023
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<h1> PRODUCR NAME IS : ${name}</h1>
<c:forEach items="${products}" var="product">
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
  </fieldset>
</c:forEach>

<tr>
  <td><a href="/Product">Back to product list</a></td>
</tr>

</body>
</html>
