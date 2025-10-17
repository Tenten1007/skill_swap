<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - Skill Swap</title>

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
            --radius-full: 9999px;

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

        /* Edit Profile Page Styles */
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
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .edit-profile-container {
            min-height: 100vh;
            padding: var(--space-lg);
            position: relative;
            z-index: 2;
        }

        /* Enhanced Floating Background Elements */
        .floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
            overflow: hidden;
        }

        .shape {
            position: absolute;
            opacity: 0.06;
            animation: floatShape 25s infinite ease-in-out;
            filter: blur(1px);
        }

        .shape:nth-child(1) {
            top: 15%;
            left: 8%;
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border-radius: 50%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            top: 70%;
            right: 12%;
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, var(--secondary), var(--accent));
            transform: rotate(45deg);
            animation-delay: -10s;
        }

        @keyframes floatShape {
            0%, 100% {
                transform: translateY(0px) translateX(0px) rotate(0deg) scale(1);
                opacity: 0.06;
            }
            25% {
                transform: translateY(-30px) translateX(15px) rotate(90deg) scale(1.1);
                opacity: 0.1;
            }
            50% {
                transform: translateY(-15px) translateX(-20px) rotate(180deg) scale(0.9);
                opacity: 0.04;
            }
            75% {
                transform: translateY(-40px) translateX(10px) rotate(270deg) scale(1.05);
                opacity: 0.08;
            }
        }

        /* Header Section */
        .header-section {
            max-width: 800px;
            margin: 0 auto var(--space-2xl);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: var(--space-lg);
            background: rgba(255, 255, 255, 0.08);
            border-radius: var(--radius-xl);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(20px);
            animation: slideInFromTop 0.8s ease-out;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        @keyframes slideInFromTop {
            0% {
                opacity: 0;
                transform: translateY(-30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .header-title h1 {
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
            margin-bottom: var(--space-xs);
            animation: gradientShift 4s ease-in-out infinite;
        }

        .header-title p {
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.8);
            font-weight: 500;
        }

        .header-actions {
            display: flex;
            gap: var(--space-sm);
        }

        .action-button {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-sm) var(--space-md);
            border-radius: var(--radius-lg);
            font-weight: 600;
            text-decoration: none;
            transition: all var(--duration-normal) var(--spring-easing);
            font-size: var(--font-sm);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.9);
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(20px);
        }

        .action-button:hover {
            transform: translateY(-2px);
            border-color: rgba(99, 102, 241, 0.4);
            color: var(--primary);
        }

        /* Main Content */
        .content-container {
            max-width: 800px;
            margin: 0 auto;
            animation: slideInFromBottom 0.8s ease-out 0.2s both;
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

        /* Form Container */
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
        }

        .form-section {
            margin-bottom: var(--space-2xl);
        }

        .form-section:last-child {
            margin-bottom: 0;
        }

        .section-title {
            font-size: var(--font-xl);
            font-weight: 700;
            color: #ffffff;
            margin-bottom: var(--space-lg);
            display: flex;
            align-items: center;
            gap: var(--space-sm);
        }

        .section-icon {
            width: 32px;
            height: 32px;
            background: var(--button-gradient);
            border-radius: var(--radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: var(--text-white);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: var(--space-lg);
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-label {
            font-size: var(--font-sm);
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: var(--space-sm);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-input,
        .form-textarea {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-lg);
            padding: var(--space-md);
            font-size: var(--font-base);
            color: #ffffff;
            font-family: inherit;
            transition: all var(--duration-normal) var(--spring-easing);
            backdrop-filter: blur(20px);
        }

        .form-input:focus,
        .form-textarea:focus {
            outline: none;
            border-color: var(--primary);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
            transform: translateY(-1px);
        }

        .form-input::placeholder,
        .form-textarea::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .form-textarea {
            min-height: 120px;
            resize: vertical;
        }

        .form-hint {
            font-size: var(--font-xs);
            color: rgba(255, 255, 255, 0.6);
            margin-top: var(--space-xs);
            font-style: italic;
        }

        /* Form Actions */
        .form-actions {
            display: flex;
            gap: var(--space-md);
            justify-content: center;
            padding-top: var(--space-xl);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            margin-top: var(--space-xl);
        }

        .form-btn {
            padding: var(--space-md) var(--space-2xl);
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
            min-width: 140px;
        }

        .form-btn-primary {
            background: var(--button-gradient);
            color: var(--text-white);
            box-shadow: 0 10px 30px rgba(99, 102, 241, 0.3);
        }

        .form-btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.9);
            border: 2px solid rgba(255, 255, 255, 0.3);
        }

        .form-btn:hover {
            transform: translateY(-3px) scale(1.02);
        }

        .form-btn-primary:hover {
            box-shadow: 0 15px 40px rgba(99, 102, 241, 0.4);
        }

        .form-btn-secondary:hover {
            border-color: rgba(255, 255, 255, 0.5);
            background: rgba(255, 255, 255, 0.15);
        }

        /* Alert Messages */
        .alert {
            padding: var(--space-lg);
            border-radius: var(--radius-md);
            margin-bottom: var(--space-lg);
            font-weight: 500;
            backdrop-filter: blur(20px);
            border: 1px solid;
            animation: slideInFromTop 0.5s ease-out;
            display: flex;
            align-items: center;
            gap: var(--space-sm);
        }

        .alert-error {
            background: rgba(239, 68, 68, 0.1);
            color: var(--error);
            border-color: rgba(239, 68, 68, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .edit-profile-container {
                padding: var(--space-md);
            }

            .header-section {
                flex-direction: column;
                gap: var(--space-md);
                text-align: center;
            }

            .form-container {
                padding: var(--space-lg);
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .form-btn {
                min-width: auto;
            }
        }
    </style>
</head>

<body>
    <!-- Enhanced Background Effects -->
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <!-- Main Container -->
    <div class="edit-profile-container">
        <!-- Header Section -->
        <div class="header-section">
            <div class="header-title">
                <h1><i class="fas fa-user-edit"></i> แก้ไขโปรไฟล์</h1>
                <p>อัปเดตข้อมูลส่วนตัวของคุณ</p>
            </div>
            <div class="header-actions">
                <a href="profile" class="action-button btn-secondary">
                    <i class="fas fa-arrow-left"></i>
                    กลับไปโปรไฟล์
                </a>
            </div>
        </div>

        <!-- Content Container -->
        <div class="content-container">
            <!-- Error Messages -->
            <c:if test="${param.error == 'update-failed'}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>ไม่สามารถอัปเดตข้อมูลได้ กรุณาลองใหม่อีกครั้ง</span>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <!-- Form Container -->
            <form action="update-profile" method="post" class="form-container">
                <!-- Personal Information -->
                <div class="form-section">
                    <h3 class="section-title">
                        <div class="section-icon">
                            <i class="fas fa-user"></i>
                        </div>
                        ข้อมูลส่วนตัว
                    </h3>

                    <div class="form-grid">
                        <div class="form-group">
                            <label for="firstName" class="form-label">ชื่อ</label>
                            <input
                                type="text"
                                id="firstName"
                                name="firstName"
                                class="form-input"
                                value="${user.firstName}"
                                placeholder="กรุณาใส่ชื่อของคุณ"
                                required
                            >
                        </div>

                        <div class="form-group">
                            <label for="lastName" class="form-label">นามสกุล</label>
                            <input
                                type="text"
                                id="lastName"
                                name="lastName"
                                class="form-input"
                                value="${user.lastName}"
                                placeholder="กรุณาใส่นามสกุลของคุณ"
                                required
                            >
                        </div>

                        <div class="form-group">
                            <label for="email" class="form-label">อีเมล</label>
                            <input
                                type="email"
                                id="email"
                                name="email"
                                class="form-input"
                                value="${user.email}"
                                placeholder="example@email.com"
                                required
                            >
                        </div>

                        <div class="form-group">
                            <label for="phone" class="form-label">เบอร์โทร</label>
                            <input
                                type="tel"
                                id="phone"
                                name="phone"
                                class="form-input"
                                value="${user.phone}"
                                placeholder="081-234-5678"
                            >
                            <div class="form-hint">ไม่บังคับ - ใส่เบอร์โทรเพื่อให้ผู้อื่นติดต่อได้</div>
                        </div>

                        <div class="form-group">
                            <label for="location" class="form-label">ที่อยู่</label>
                            <input
                                type="text"
                                id="location"
                                name="location"
                                class="form-input"
                                value="${user.location}"
                                placeholder="กรุงเทพฯ, ประเทศไทย"
                            >
                            <div class="form-hint">เช่น เชียงใหม่, กรุงเทพฯ, ต่างประเทศ</div>
                        </div>
                    </div>
                </div>

                <!-- About Me -->
                <div class="form-section">
                    <h3 class="section-title">
                        <div class="section-icon">
                            <i class="fas fa-quote-left"></i>
                        </div>
                        เกี่ยวกับฉัน
                    </h3>

                    <div class="form-group full-width">
                        <label for="bio" class="form-label">แนะนำตัวเอง</label>
                        <textarea
                            id="bio"
                            name="bio"
                            class="form-textarea"
                            placeholder="เล่าให้ฟังหน่อยเกี่ยวกับตัวคุณ สิ่งที่ชอบ ความถนัด หรือสิ่งที่อยากเรียนรู้..."
                        >${user.bio}</textarea>
                        <div class="form-hint">แนะนำตัวเองให้คนอื่นรู้จักคุณมากขึ้น</div>
                    </div>
                </div>

                <!-- Social Links -->
                <div class="form-section">
                    <h3 class="section-title">
                        <div class="section-icon">
                            <i class="fas fa-link"></i>
                        </div>
                        ลิงก์โซเชียล
                    </h3>

                    <div class="form-grid">
                        <div class="form-group">
                            <label for="linkedin" class="form-label">LinkedIn</label>
                            <input
                                type="url"
                                id="linkedin"
                                name="linkedin"
                                class="form-input"
                                value="${user.linkedin}"
                                placeholder="https://linkedin.com/in/username"
                            >
                            <div class="form-hint">ลิงก์โปรไฟล์ LinkedIn ของคุณ</div>
                        </div>

                        <div class="form-group">
                            <label for="github" class="form-label">GitHub</label>
                            <input
                                type="url"
                                id="github"
                                name="github"
                                class="form-input"
                                value="${user.github}"
                                placeholder="https://github.com/username"
                            >
                            <div class="form-hint">ลิงก์ GitHub profile ของคุณ</div>
                        </div>
                    </div>
                </div>

                <!-- Form Actions -->
                <div class="form-actions">
                    <button type="submit" class="form-btn form-btn-primary">
                        <i class="fas fa-save"></i>
                        บันทึกการเปลี่ยนแปลง
                    </button>
                    <a href="profile" class="form-btn form-btn-secondary">
                        <i class="fas fa-times"></i>
                        ยกเลิก
                    </a>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Enhanced form animations
            const formElements = document.querySelectorAll('.form-section');

            formElements.forEach((element, index) => {
                element.style.animationDelay = `${index * 0.1}s`;
                element.classList.add('animate-in');
            });

            // Add ripple effect to buttons
            const buttons = document.querySelectorAll('.form-btn, .action-button');
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;

                    ripple.style.cssText = `
                        position: absolute;
                        border-radius: 50%;
                        background: rgba(255, 255, 255, 0.3);
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                        animation: ripple 0.6s linear;
                        pointer-events: none;
                    `;

                    this.appendChild(ripple);
                    setTimeout(() => ripple.remove(), 600);
                });
            });

            // Form validation
            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                const requiredFields = form.querySelectorAll('input[required]');
                let hasError = false;

                requiredFields.forEach(field => {
                    if (!field.value.trim()) {
                        field.style.borderColor = 'var(--error)';
                        hasError = true;
                    } else {
                        field.style.borderColor = 'var(--primary)';
                    }
                });

                if (hasError) {
                    e.preventDefault();
                    // Show error message or scroll to first error
                    const firstError = form.querySelector('input[style*="--error"]');
                    if (firstError) {
                        firstError.focus();
                    }
                }
            });

            // Real-time validation
            const inputs = document.querySelectorAll('.form-input, .form-textarea');
            inputs.forEach(input => {
                input.addEventListener('blur', function() {
                    if (this.hasAttribute('required') && !this.value.trim()) {
                        this.style.borderColor = 'var(--error)';
                    } else if (this.value.trim()) {
                        this.style.borderColor = 'var(--primary)';
                    }
                });

                input.addEventListener('input', function() {
                    if (this.style.borderColor === 'var(--error)' && this.value.trim()) {
                        this.style.borderColor = 'var(--primary)';
                    }
                });
            });
        });

        // Add animation styles
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(2);
                    opacity: 0;
                }
            }

            @keyframes animate-in {
                0% {
                    opacity: 0;
                    transform: translateY(30px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-in {
                animation: animate-in 0.6s ease-out forwards;
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>