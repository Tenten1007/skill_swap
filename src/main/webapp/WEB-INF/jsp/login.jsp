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

    <style>
        :root {
            /* === Glass Effects === */
            --glass-bg: rgba(255, 255, 255, 0.08);
            --glass-border: rgba(255, 255, 255, 0.2);
            --glass-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            --glass-hover: rgba(255, 255, 255, 0.12);
            --blur-strength: blur(20px);

            /* === Aurora Color Palette === */
            --primary: #6366F1;
            --primary-hover: #4F46E5;
            --secondary: #8B5CF6;
            --accent: #06B6D4;
            --success: #10B981;
            --warning: #F59E0B;
            --error: #EF4444;

            --button-gradient: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);

            /* === Text System - WHITE ON DARK === */
            --text-primary: #FFFFFF;
            --text-secondary: rgba(255, 255, 255, 0.8);
            --text-muted: rgba(255, 255, 255, 0.6);
            --text-white: #FFFFFF;
            --text-glass: rgba(255, 255, 255, 0.95);

            /* === Interactive States === */
            --hover-lift: translateY(-2px);
            --spring-easing: cubic-bezier(0.175, 0.885, 0.32, 1.275);
            --smooth-easing: cubic-bezier(0.4, 0, 0.2, 1);
            --duration-normal: 0.3s;

            /* === Spacing System === */
            --space-xs: 4px;
            --space-sm: 8px;
            --space-md: 16px;
            --space-lg: 24px;
            --space-xl: 32px;
            --space-2xl: 48px;

            /* === Border Radius === */
            --radius-sm: 8px;
            --radius-md: 12px;
            --radius-lg: 16px;
            --radius-xl: 20px;

            /* === Font Sizes === */
            --font-xs: 0.75rem;
            --font-sm: 0.875rem;
            --font-base: 1rem;
            --font-lg: 1.125rem;
            --font-xl: 1.25rem;
            --font-2xl: 1.5rem;
            --font-3xl: 1.875rem;
            --font-4xl: 2.25rem;
        }

        /* Dark Theme Body */
        body {
            margin: 0;
            font-family: 'Inter', 'SF Pro Display', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(-45deg,
                #0f0f23 0%,
                #1a1a2e 25%,
                #16213e 50%,
                #0f3460 75%,
                #533483 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            min-height: 100vh;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: var(--space-lg);
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Login Container */
        .form-container {
            background: linear-gradient(135deg,
                rgba(255, 255, 255, 0.15) 0%,
                rgba(255, 255, 255, 0.05) 100%);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-xl);
            backdrop-filter: blur(40px);
            padding: var(--space-2xl);
            box-shadow:
                0 25px 80px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            width: 100%;
            max-width: 400px;
            animation: slideInFromBottom 0.8s ease-out;
        }

        @keyframes slideInFromBottom {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Login-specific overrides for Aurora theme */
        .login-header {
            text-align: center;
            margin-bottom: var(--space-2xl);
        }

        .app-logo {
            width: 80px;
            height: 80px;
            margin: 0 auto var(--space-lg);
            background: var(--button-gradient);
            border-radius: var(--radius-xl);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 15px 35px rgba(99, 102, 241, 0.4);
            animation: logoFloat 3s ease-in-out infinite;
        }

        @keyframes logoFloat {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-6px); }
        }

        .app-logo i {
            font-size: 36px;
            color: var(--text-white);
        }

        .app-title {
            font-size: var(--font-3xl);
            font-weight: 700;
            background: linear-gradient(135deg,
                var(--primary) 0%,
                var(--secondary) 30%,
                var(--accent) 60%,
                var(--success) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            background-size: 200% 200%;
            margin-bottom: var(--space-sm);
            animation: gradientShift 4s ease-in-out infinite;
            letter-spacing: -0.02em;
        }

        .app-subtitle {
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.8);
            font-weight: 500;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: var(--space-lg);
        }

        .form-group {
            position: relative;
        }

        .form-label {
            font-size: var(--font-sm);
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: var(--space-sm);
            font-weight: 600;
            display: block;
        }

        .form-input {
            width: 100%;
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-lg);
            padding: var(--space-md) var(--space-2xl) var(--space-md) var(--space-md);
            font-size: var(--font-base);
            color: #ffffff;
            font-family: inherit;
            transition: all var(--duration-normal) var(--spring-easing);
            backdrop-filter: blur(20px);
            box-sizing: border-box;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--primary);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
            transform: translateY(-1px);
        }

        .form-input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .form-icon {
            position: absolute;
            right: var(--space-md);
            top: 38px;
            color: var(--text-muted);
            font-size: 18px;
            pointer-events: none;
            transition: color var(--duration-normal) var(--smooth-easing);
        }

        .form-group:focus-within .form-icon {
            color: var(--primary);
        }

        .btn {
            padding: var(--space-md) var(--space-xl);
            border-radius: var(--radius-lg);
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            transition: all var(--duration-normal) var(--spring-easing);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: var(--space-sm);
            border: none;
            cursor: pointer;
            font-size: var(--font-base);
            font-family: inherit;
        }

        .btn-primary {
            background: var(--button-gradient);
            color: var(--text-white);
            box-shadow: 0 10px 30px rgba(99, 102, 241, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 15px 40px rgba(99, 102, 241, 0.4);
        }

        .register-section {
            text-align: center;
            margin-top: var(--space-lg);
            padding-top: var(--space-lg);
            border-top: 1px solid var(--glass-border);
        }

        .register-link {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            color: var(--text-glass);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 500;
            padding: var(--space-md) var(--space-lg);
            background: var(--glass-bg);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-md);
            backdrop-filter: var(--blur-strength);
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .register-link:hover {
            color: var(--primary);
            background: var(--glass-hover);
            border-color: rgba(99, 102, 241, 0.3);
            transform: var(--hover-lift);
            text-decoration: none;
        }

        /* Alert Messages */
        .alert {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-lg);
            border-radius: var(--radius-md);
            margin-bottom: var(--space-lg);
            font-weight: 500;
            backdrop-filter: blur(20px);
            border: 1px solid;
            animation: slideInFromTop 0.5s ease-out;
        }

        .alert-error {
            background: rgba(239, 68, 68, 0.1);
            color: #ef4444;
            border-color: rgba(239, 68, 68, 0.3);
        }

        .alert-info {
            background: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
            border-color: rgba(59, 130, 246, 0.3);
        }

        .alert i {
            font-size: 18px;
        }

        @keyframes slideInFromTop {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
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

    <script>
        // Enhanced form interactions
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('.login-form');
            const button = form.querySelector('button[type="submit"]');

            // Prevent double submission
            form.addEventListener('submit', function(e) {
                if (button.hasAttribute('data-submitting')) {
                    e.preventDefault();
                    return false;
                }

                button.setAttribute('data-submitting', 'true');
                button.style.opacity = '0.7';
                button.style.pointerEvents = 'none';
            });

            // Console branding
            console.log('%c🚀 Skill Swap', 'color: #6366F1; font-size: 16px; font-weight: bold;');
            console.log('%cAurora Glass Theme System', 'color: #8B5CF6; font-size: 12px;');
        });
    </script>
</body>
</html>