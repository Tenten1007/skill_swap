<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Swap - เข้าสู่ระบบ</title>

    <!-- Aurora Glass Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aurora-theme.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>

<body>
    <!-- Main Login Container -->
    <div class="form-container">
            <!-- Header -->
            <div class="login-header">
                <div class="app-logo">
                    <i class="fas fa-exchange-alt"></i>
                </div>
                <h1 class="app-title">Skill Swap</h1>
                <p class="app-subtitle">แลกเปลี่ยนทักษะ สร้างโอกาส</p>
            </div>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <!-- Login Required Message -->
            <c:if test="${param.message == 'login-required'}">
                <div class="alert alert-info">
                    <i class="fas fa-info-circle"></i>
                    <span>กรุณาเข้าสู่ระบบก่อนเพื่อสร้าง Skill Offer</span>
                </div>
            </c:if>

            <!-- Login Form -->
            <form name="frm" action="doLogin" method="post" class="login-form">
                <div class="form-group">
                    <label class="form-label" for="username">ชื่อผู้ใช้</label>
                    <input
                        type="text"
                        id="username"
                        name="username"
                        class="form-input"
                        placeholder="กรอกชื่อผู้ใช้"
                        required
                        autocomplete="username"
                        autofocus
                    >
                    <i class="fas fa-user form-icon"></i>
                </div>

                <div class="form-group">
                    <label class="form-label" for="password">รหัสผ่าน</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-input"
                        placeholder="กรอกรหัสผ่าน"
                        required
                        autocomplete="current-password"
                    >
                    <i class="fas fa-lock form-icon"></i>
                </div>

                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-sign-in-alt"></i>
                    เข้าสู่ระบบ
                </button>
            </form>

            <!-- Register Link -->
            <div class="register-section">
                <a href="register" class="register-link">
                    <i class="fas fa-user-plus"></i>
                    สมัครสมาชิกใหม่
                </a>
            </div>
        </div>
    </div>
    <!-- Custom Scripts -->
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>