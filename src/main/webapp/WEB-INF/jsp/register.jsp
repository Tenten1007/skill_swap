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

    <style>
        /* Register-specific overrides for Aurora theme */
        .register-header {
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

        .register-form {
            display: flex;
            flex-direction: column;
            gap: var(--space-lg);
        }

        .login-link {
            text-align: center;
            margin-top: var(--space-lg);
            padding-top: var(--space-lg);
            border-top: 1px solid var(--glass-border);
        }

        .login-link a {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            color: var(--text-glass);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 600;
            padding: var(--space-md) var(--space-lg);
            background: var(--glass-bg-strong);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-md);
            backdrop-filter: var(--blur-strength);
            transition: all var(--duration-normal) var(--smooth-easing);
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
        }

        .login-link a:hover {
            color: var(--primary);
            background: var(--glass-hover);
            border-color: rgba(99, 102, 241, 0.3);
            transform: var(--hover-lift);
            text-decoration: none;
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

    <!-- Main Register Container -->
    <div class="flex min-h-screen items-center justify-center p-lg">
        <div class="glass-card form-container">
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
                        class="glass-input form-input"
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
                        class="glass-input form-input"
                        placeholder="กรุณากรอกรหัสผ่าน"
                        required
                        autocomplete="new-password"
                    >
                </div>

                <button type="submit" class="btn btn-primary w-full">
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
    </div>

    <script>
        // Enhanced form interactions
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('.register-form');
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
            console.log('%c🚀 Skill Swap Register', 'color: #6366F1; font-size: 16px; font-weight: bold;');
            console.log('%cAurora Glass Theme System', 'color: #8B5CF6; font-size: 12px;');
        });
    </script>
</body>
</html>