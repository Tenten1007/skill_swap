<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Skill Swap - Register</title>
</head>
<body>
<h2>Skill Swap Register</h2>
    <form name="frm1" action="doRegister" method="post">
        username: <input type="text" name="username"> <br>
        password: <input type="password" name="password"> <br>
        <input type="submit" value="บันทึก">
    </form>

    <p><a href="/">กลับไปหน้า Login</a></p>

    <font color="red">${error}</font>
</body>
</html>