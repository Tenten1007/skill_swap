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
        /* Login-specific overrides for Aurora theme */
        .login-header {
            text-align: center;
            margin-bottom: var(--space-xl);
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
            box-shadow: 0 4px 20px rgba(99, 102, 241, 0.3);
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
            color: var(--text-glass);
            margin-bottom: var(--space-sm);
            text-shadow: 0 2px 4px rgba(255, 255, 255, 0.8);
            letter-spacing: -0.02em;
        }

        .app-subtitle {
            font-size: var(--font-base);
            color: var(--text-glass-secondary);
            font-weight: 500;
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: var(--space-lg);
        }

        .form-icon {
            position: absolute;
            right: var(--space-md);
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            font-size: 18px;
            pointer-events: none;
            transition: color var(--duration-normal) var(--smooth-easing);
        }

        .form-group:focus-within .form-icon {
            color: var(--primary);
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
    <!-- Floating Particles Background -->
    <div class="floating-particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <!-- Main Login Container -->
    <div class="flex min-h-screen items-center justify-center p-lg">
        <div class="glass-card form-container">
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
                        class="glass-input form-input"
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
                        class="glass-input form-input"
                        placeholder="กรอกรหัสผ่าน"
                        required
                        autocomplete="current-password"
                    >
                    <i class="fas fa-lock form-icon"></i>
                </div>

                <button type="submit" class="btn btn-primary w-full">
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