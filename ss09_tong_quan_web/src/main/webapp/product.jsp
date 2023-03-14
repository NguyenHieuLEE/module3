<%--
  Created by IntelliJ IDEA.
  User: a12345
  Date: 13/03/2023
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
</head>
<body>
<h1>Tính giá sản phẩm</h1>
<form action="/tinh">
    <table>
        <tr>
            <td>Product Description: </td>
            <td><input type="text"name="a"></td>
        </tr>
        <tr>
            <td>List Price:</td>
            <td><input type="text"name="b"></td>
        </tr>
        <tr>
            <td>Discount Percent:</td>
            <td><input type="text"name="c"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Discount Amount">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <input type="submit" value="Discount Price">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
