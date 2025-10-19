<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Swap - สมัครสมาชิก</title>

    <!-- Aurora Glass Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aurora-theme.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>

<body>
    <!-- Main Register Container -->
    <div class="form-container">
            <!-- Header -->
            <div class="register-header">
                <div class="app-logo">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h1 class="app-title">Skill Swap</h1>
                <p class="app-subtitle">สร้างบัญชีใหม่</p>
            </div>

            <!-- Error Message -->
            <% if(request.getAttribute("error") != null) { %>
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            <% } %>

            <!-- Register Form -->
            <form name="frm1" action="doRegister" method="post" class="register-form">
                <div class="form-group">
                    <label class="form-label" for="username">ชื่อผู้ใช้</label>
                    <input
                        type="text"
                        id="username"
                        name="username"
                        class="form-input"
                        placeholder="กรุณากรอกชื่อผู้ใช้"
                        required
                        autocomplete="username"
                        autofocus
                    >
                </div>

                <div class="form-group">
                    <label class="form-label" for="password">รหัสผ่าน</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-input"
                        placeholder="กรุณากรอกรหัสผ่าน"
                        required
                        autocomplete="new-password"
                    >
                </div>

                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-user-plus"></i>
                    สมัครสมาชิก
                </button>
            </form>

            <!-- Login Link -->
            <div class="login-link">
                <a href="/">
                    <i class="fas fa-sign-in-alt"></i>
                    มีบัญชีแล้ว? เข้าสู่ระบบ
                </a>
            </div>
        </div>
    <!-- Custom Scripts -->
    <script src="${pageContext.request.contextPath}/js/register.js"></script>
</body>
</html>