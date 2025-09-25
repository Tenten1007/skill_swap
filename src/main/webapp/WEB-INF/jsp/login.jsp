<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Swap - เข้าสู่ระบบ</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        /* CSS Variables - iOS 16 Inspired Liquid Glass */
        :root {
            /* Glass System */
            --glass-bg: rgba(255, 255, 255, 0.1);
            --glass-bg-strong: rgba(255, 255, 255, 0.15);
            --glass-border: rgba(255, 255, 255, 0.2);
            --glass-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            --glass-shadow-strong: 0 16px 40px rgba(31, 38, 135, 0.5);

            /* Colors */
            --primary-color: #007AFF;
            --primary-hover: #0056CC;
            --secondary-color: #5856D6;
            --accent-color: #32D74B;
            --warning-color: #FF9500;
            --error-color: #FF3B30;

            /* Text Colors */
            --text-primary: rgba(0, 0, 0, 0.9);
            --text-secondary: rgba(0, 0, 0, 0.6);
            --text-tertiary: rgba(0, 0, 0, 0.4);
            --text-on-glass: rgba(255, 255, 255, 0.9);
            --text-on-glass-secondary: rgba(255, 255, 255, 0.7);

            /* Background */
            --bg-gradient: linear-gradient(135deg,
                #667eea 0%,
                #764ba2 25%,
                #667eea 50%,
                #f093fb 75%,
                #f5576c 100%
            );

            /* iOS-style blur and materials */
            --blur-strength: blur(20px);
            --blur-strong: blur(40px);
            --material-thickness: 1px;

            /* Animation easing */
            --spring-easing: cubic-bezier(0.175, 0.885, 0.32, 1.275);
            --smooth-easing: cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Inter', 'Segoe UI', Roboto, sans-serif;
            background: var(--bg-gradient);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        /* Dynamic Background Elements */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image:
                radial-gradient(circle at 20% 20%, rgba(255, 255, 255, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(255, 255, 255, 0.08) 0%, transparent 50%),
                radial-gradient(circle at 40% 60%, rgba(255, 255, 255, 0.05) 0%, transparent 50%);
            animation: backgroundFlow 15s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes backgroundFlow {
            0%, 100% {
                transform: translateX(0) translateY(0) rotate(0deg) scale(1);
                opacity: 1;
            }
            25% {
                transform: translateX(10px) translateY(-10px) rotate(1deg) scale(1.02);
                opacity: 0.8;
            }
            50% {
                transform: translateX(-5px) translateY(10px) rotate(-0.5deg) scale(0.98);
                opacity: 0.9;
            }
            75% {
                transform: translateX(-10px) translateY(-5px) rotate(0.5deg) scale(1.01);
                opacity: 0.7;
            }
        }

        /* Floating Particles */
        .particle {
            position: fixed;
            width: 4px;
            height: 4px;
            background: rgba(255, 255, 255, 0.6);
            border-radius: 50%;
            pointer-events: none;
            animation: float 8s linear infinite;
        }

        .particle:nth-child(1) { left: 10%; animation-delay: 0s; }
        .particle:nth-child(2) { left: 20%; animation-delay: 2s; }
        .particle:nth-child(3) { left: 30%; animation-delay: 4s; }
        .particle:nth-child(4) { left: 70%; animation-delay: 1s; }
        .particle:nth-child(5) { left: 80%; animation-delay: 3s; }

        @keyframes float {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10%, 90% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }

        /* Main Container */
        .login-container {
            width: 100%;
            max-width: 400px;
            z-index: 10;
        }

        /* Glass Login Card */
        .login-card {
            background: var(--glass-bg);
            backdrop-filter: var(--blur-strength);
            -webkit-backdrop-filter: var(--blur-strength);
            border: var(--material-thickness) solid var(--glass-border);
            border-radius: 24px;
            box-shadow: var(--glass-shadow);
            padding: 40px 32px;
            position: relative;
            overflow: hidden;
            transition: all 0.4s var(--smooth-easing);
            animation: cardAppear 0.8s var(--spring-easing) forwards;
            transform: translateY(20px);
            opacity: 0;
        }

        @keyframes cardAppear {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .login-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                90deg,
                transparent,
                rgba(255, 255, 255, 0.1),
                transparent
            );
            transition: left 0.8s ease;
        }

        .login-card:hover::before {
            left: 100%;
        }

        .login-card:hover {
            transform: translateY(-2px);
            box-shadow: var(--glass-shadow-strong);
            border-color: rgba(255, 255, 255, 0.3);
        }

        /* Logo and Header */
        .login-header {
            text-align: center;
            margin-bottom: 32px;
        }

        .app-logo {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow:
                0 4px 20px rgba(0, 122, 255, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            animation: logoFloat 3s ease-in-out infinite;
        }

        @keyframes logoFloat {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-6px) rotate(2deg); }
        }

        .app-logo i {
            font-size: 36px;
            color: white;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .app-title {
            font-size: 28px;
            font-weight: 700;
            color: var(--text-on-glass);
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .app-subtitle {
            font-size: 16px;
            color: var(--text-on-glass-secondary);
            font-weight: 400;
        }

        /* Form Styling */
        .login-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-group {
            position: relative;
        }

        .form-label {
            display: block;
            color: var(--text-on-glass);
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 8px;
            transition: color 0.3s ease;
        }

        .form-input {
            width: 100%;
            height: 52px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 16px;
            padding: 0 48px 0 20px;
            font-size: 16px;
            color: var(--text-on-glass);
            transition: all 0.3s var(--smooth-easing);
            font-family: inherit;
        }

        .form-input::placeholder {
            color: var(--text-on-glass-secondary);
        }

        .form-input:focus {
            outline: none;
            background: rgba(255, 255, 255, 0.2);
            border-color: var(--primary-color);
            box-shadow:
                0 0 0 3px rgba(0, 122, 255, 0.1),
                0 4px 20px rgba(0, 0, 0, 0.1);
            transform: translateY(-1px);
        }

        .form-icon {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-on-glass-secondary);
            font-size: 18px;
            pointer-events: none;
            transition: color 0.3s ease;
        }

        .form-group:focus-within .form-icon {
            color: var(--primary-color);
        }

        /* Error Message */
        .error-message {
            background: rgba(255, 59, 48, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 59, 48, 0.3);
            border-radius: 12px;
            padding: 12px 16px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            color: #ffffff;
            font-size: 14px;
            font-weight: 500;
            animation: errorShake 0.5s ease-in-out;
        }

        @keyframes errorShake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        /* Login Button */
        .login-button {
            width: 100%;
            height: 52px;
            background: var(--primary-color);
            border: none;
            border-radius: 16px;
            color: white;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: all 0.3s var(--smooth-easing);
            box-shadow:
                0 4px 20px rgba(0, 122, 255, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            font-family: inherit;
        }

        .login-button:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow:
                0 8px 30px rgba(0, 122, 255, 0.4),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
        }

        .login-button:active {
            transform: translateY(0);
            transition: transform 0.1s ease;
        }

        .login-button::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: all 0.4s ease;
        }

        .login-button:active::before {
            width: 200px;
            height: 200px;
        }

        /* Loading State */
        .login-button.loading {
            pointer-events: none;
            background: var(--text-tertiary);
        }

        .login-button.loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            transform: translate(-50%, -50%);
            animation: spin 0.8s linear infinite;
        }

        @keyframes spin {
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }

        .login-button.loading .button-text {
            opacity: 0;
        }

        /* Register Link */
        .register-section {
            text-align: center;
            margin-top: 24px;
            padding-top: 24px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .register-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: var(--text-on-glass);
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            padding: 12px 20px;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            transition: all 0.3s var(--smooth-easing);
            backdrop-filter: blur(10px);
        }

        .register-link:hover {
            color: var(--primary-color);
            background: rgba(255, 255, 255, 0.15);
            border-color: rgba(0, 122, 255, 0.3);
            transform: translateY(-1px);
            text-decoration: none;
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            body {
                padding: 16px;
            }

            .login-card {
                padding: 32px 24px;
                border-radius: 20px;
            }

            .app-logo {
                width: 70px;
                height: 70px;
                border-radius: 18px;
            }

            .app-logo i {
                font-size: 32px;
            }

            .app-title {
                font-size: 24px;
            }

            .form-input {
                height: 48px;
                font-size: 16px; /* Prevent zoom on iOS */
            }

            .login-button {
                height: 48px;
                font-size: 16px;
            }
        }

        /* Dark mode support */
        @media (prefers-color-scheme: dark) {
            :root {
                --text-primary: rgba(255, 255, 255, 0.9);
                --text-secondary: rgba(255, 255, 255, 0.6);
                --text-tertiary: rgba(255, 255, 255, 0.4);
            }
        }

        /* High contrast mode */
        @media (prefers-contrast: high) {
            .form-input, .login-button {
                border-width: 2px;
            }
        }

        /* Reduced motion */
        @media (prefers-reduced-motion: reduce) {
            *, *::before, *::after {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.01ms !important;
            }
        }
    </style>
</head>

<body>
    <!-- Floating Particles -->
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>

    <div class="login-container">
        <div class="login-card">
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
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <!-- Login Form -->
            <form name="frm" action="doLogin" method="post" class="login-form" onsubmit="showLoading(event)">
                <div class="form-group">
                    <label class="form-label" for="username">
                        <i class="fas fa-user"></i> ชื่อผู้ใช้
                    </label>
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
                    <label class="form-label" for="password">
                        <i class="fas fa-lock"></i> รหัสผ่าน
                    </label>
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

                <button type="submit" class="login-button" id="loginBtn">
                    <span class="button-text">
                        <i class="fas fa-sign-in-alt"></i> เข้าสู่ระบบ
                    </span>
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
        // Form submission with loading state
        function showLoading(event) {
            const button = document.getElementById('loginBtn');
            const form = event.target;

            // Add loading state
            button.classList.add('loading');

            // Prevent double submission
            if (button.hasAttribute('data-submitting')) {
                event.preventDefault();
                return false;
            }

            button.setAttribute('data-submitting', 'true');

            // Simulate network delay for UX (remove in production)
            setTimeout(() => {
                form.submit();
            }, 300);

            return false;
        }

        // Enhanced form interactions
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('.form-input');

            inputs.forEach(input => {
                // Focus/blur effects
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-2px)';
                });

                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'translateY(0)';
                });

                // Real-time validation feedback
                input.addEventListener('input', function() {
                    if (this.value.length > 0) {
                        this.style.borderColor = 'var(--accent-color)';
                    } else {
                        this.style.borderColor = 'rgba(255, 255, 255, 0.2)';
                    }
                });
            });

            // Keyboard shortcuts
            document.addEventListener('keydown', function(e) {
                // Enter key on any input submits form
                if (e.key === 'Enter' && e.target.classList.contains('form-input')) {
                    document.querySelector('.login-form').dispatchEvent(new Event('submit'));
                }
            });
        });

        // Add smooth page transitions
        window.addEventListener('beforeunload', function() {
            document.body.style.opacity = '0';
            document.body.style.transform = 'scale(0.95)';
        });

        // Console welcome message
        console.log('%c🚀 Skill Swap Login', 'color: #007AFF; font-size: 16px; font-weight: bold;');
        console.log('%cLiquid Glass Design System v1.0', 'color: #666; font-size: 12px;');
    </script>
</body>
</html>