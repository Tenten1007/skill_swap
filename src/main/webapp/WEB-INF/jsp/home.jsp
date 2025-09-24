<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Skill Swap - Home</title>
</head>
<body>
<h2>Welcome to Skill Swap!</h2>
    <p>เข้าสู่ระบบสำเร็จ</p>
    <p>Username: ${sessionScope.user.username}</p>

    <a href="doLogout">ออกจากระบบ</a>
</body>
</html>