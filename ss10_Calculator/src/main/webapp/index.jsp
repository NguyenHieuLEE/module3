<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/ServletCalculator" method="post">
    <h4>First Operand: </h4>
    <input type="text" name="FirstOperand">
    <h4></h4>
    <select name="operator">
        <option value="cong">Cong</option>
        <option value="tru">Tru</option>
        <option value="nhan">Nhan</option>
        <option value="chia">Chia</option>
    </select>
    <h4> Operand : </h4>
    <input type="text" name="Operand">
    <h4> Result : </h4>
    <button type="submit">  Send</button>
</form>
</body>
</html>