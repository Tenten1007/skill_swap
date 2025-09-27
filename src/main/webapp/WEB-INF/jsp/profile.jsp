<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Skill Swap</title>

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

        /* Profile Page Styles */
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

        .profile-container {
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

        .shape:nth-child(3) {
            bottom: 20%;
            left: 25%;
            width: 60px;
            height: 60px;
            background: var(--success);
            clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
            animation-delay: -20s;
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
            max-width: 1200px;
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
            font-size: var(--font-4xl);
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
            font-size: var(--font-lg);
            color: rgba(255, 255, 255, 0.9);
            font-weight: 500;
        }

        .header-actions {
            display: flex;
            gap: var(--space-md);
        }

        .action-button {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-lg);
            border-radius: var(--radius-lg);
            font-weight: 600;
            text-decoration: none;
            transition: all var(--duration-normal) var(--spring-easing);
            position: relative;
            overflow: hidden;
        }

        .btn-primary {
            background: var(--button-gradient);
            color: var(--text-white);
            border: 2px solid transparent;
            box-shadow: 0 10px 30px rgba(99, 102, 241, 0.3);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.9);
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(20px);
        }

        .action-button:hover {
            transform: translateY(-3px) scale(1.02);
        }

        .btn-primary:hover {
            box-shadow: 0 15px 40px rgba(99, 102, 241, 0.4);
        }

        .btn-secondary:hover {
            border-color: rgba(99, 102, 241, 0.4);
            color: var(--primary);
        }

        /* Main Content */
        .content-container {
            max-width: 1200px;
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

        /* Profile Layout */
        .profile-layout {
            display: grid;
            grid-template-columns: 350px 1fr;
            gap: var(--space-2xl);
        }

        /* Profile Card */
        .profile-card {
            background: linear-gradient(135deg,
                rgba(255, 255, 255, 0.25) 0%,
                rgba(255, 255, 255, 0.10) 50%,
                rgba(255, 255, 255, 0.05) 100%);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: var(--radius-xl);
            padding: var(--space-2xl);
            backdrop-filter: blur(25px);
            box-shadow:
                0 15px 35px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            transition: all var(--duration-normal) var(--spring-easing);
            position: sticky;
            top: var(--space-lg);
        }

        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow:
                0 25px 50px rgba(0, 0, 0, 0.15),
                0 0 0 1px rgba(99, 102, 241, 0.3);
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            background: var(--button-gradient);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            font-weight: 700;
            color: var(--text-white);
            margin: 0 auto var(--space-lg);
            box-shadow: 0 15px 35px rgba(99, 102, 241, 0.4);
        }

        .profile-name {
            font-size: var(--font-2xl);
            font-weight: 700;
            color: #ffffff;
            text-align: center;
            margin-bottom: var(--space-sm);
        }

        .profile-username {
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.7);
            text-align: center;
            margin-bottom: var(--space-lg);
        }

        .profile-stats {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: var(--space-md);
            margin-bottom: var(--space-xl);
        }

        .stat-item {
            text-align: center;
            padding: var(--space-md);
            background: rgba(255, 255, 255, 0.05);
            border-radius: var(--radius-md);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .stat-number {
            font-size: var(--font-xl);
            font-weight: 700;
            color: var(--primary);
            margin-bottom: var(--space-xs);
        }

        .stat-label {
            font-size: var(--font-sm);
            color: rgba(255, 255, 255, 0.7);
        }

        /* Rating Stars Styling */
        .rating-stat {
            grid-column: 1 / -1;
        }

        .rating-value {
            font-size: var(--font-lg);
            font-weight: 700;
            color: var(--warning);
            margin-right: var(--space-sm);
        }

        .rating-stars {
            display: inline-flex;
            gap: 2px;
        }

        .star {
            font-size: 16px;
            color: rgba(255, 255, 255, 0.3);
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .star.filled {
            color: var(--warning);
            text-shadow: 0 0 8px rgba(245, 158, 11, 0.4);
        }

        .rating-stat .stat-number {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
            gap: var(--space-xs);
        }

        .profile-actions {
            display: flex;
            flex-direction: column;
            gap: var(--space-sm);
        }

        .profile-btn {
            padding: var(--space-md);
            border-radius: var(--radius-lg);
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            transition: all var(--duration-normal) var(--spring-easing);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: var(--space-sm);
        }

        .profile-btn-primary {
            background: var(--button-gradient);
            color: var(--text-white);
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.3);
        }

        .profile-btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .profile-btn:hover {
            transform: translateY(-2px);
        }

        /* Profile Details */
        .profile-details {
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

        .details-section {
            margin-bottom: var(--space-2xl);
        }

        .details-section:last-child {
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

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: var(--space-lg);
        }

        .info-item {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-lg);
            padding: var(--space-lg);
            transition: all var(--duration-normal) var(--spring-easing);
        }

        .info-item:hover {
            background: rgba(255, 255, 255, 0.08);
            transform: translateY(-2px);
        }

        .info-label {
            font-size: var(--font-sm);
            color: rgba(255, 255, 255, 0.6);
            margin-bottom: var(--space-xs);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .info-value {
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.9);
            font-weight: 500;
        }

        .info-value.empty {
            color: rgba(255, 255, 255, 0.4);
            font-style: italic;
        }

        .bio-text {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-lg);
            padding: var(--space-lg);
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
        }

        .bio-text.empty {
            color: rgba(255, 255, 255, 0.4);
            font-style: italic;
        }

        .social-links {
            display: flex;
            gap: var(--space-md);
            flex-wrap: wrap;
        }

        .social-link {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-sm) var(--space-md);
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-lg);
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            transition: all var(--duration-normal) var(--spring-easing);
        }

        .social-link:hover {
            background: rgba(99, 102, 241, 0.2);
            border-color: rgba(99, 102, 241, 0.4);
            transform: translateY(-2px);
        }

        /* Success/Error Messages */
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

        .alert-success {
            background: rgba(16, 185, 129, 0.1);
            color: var(--success);
            border-color: rgba(16, 185, 129, 0.3);
        }

        .alert-error {
            background: rgba(239, 68, 68, 0.1);
            color: var(--error);
            border-color: rgba(239, 68, 68, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .profile-container {
                padding: var(--space-md);
            }

            .header-section {
                flex-direction: column;
                gap: var(--space-md);
                text-align: center;
            }

            .profile-layout {
                grid-template-columns: 1fr;
                gap: var(--space-xl);
            }

            .profile-card {
                position: static;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .social-links {
                justify-content: center;
            }
        }
    </style>
</head>

<body>
    <!-- Enhanced Background Effects -->
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <!-- Main Container -->
    <div class="profile-container">
        <!-- Header Section -->
        <div class="header-section">
            <div class="header-title">
                <h1><i class="fas fa-user"></i> My Profile</h1>
                <p>จัดการข้อมูลส่วนตัวและดูสถิติการใช้งาน</p>
            </div>
            <div class="header-actions">
                <a href="home" class="action-button btn-secondary">
                    <i class="fas fa-home"></i>
                    หน้าหลัก
                </a>
                <a href="matches" class="action-button btn-secondary">
                    <i class="fas fa-handshake"></i>
                    Matches
                </a>
                <a href="doLogout" class="action-button btn-secondary" style="background: rgba(239, 68, 68, 0.1); border-color: rgba(239, 68, 68, 0.3); color: var(--error);">
                    <i class="fas fa-sign-out-alt"></i>
                    ออกจากระบบ
                </a>
            </div>
        </div>

        <!-- Content Container -->
        <div class="content-container">
            <!-- Success/Error Messages -->
            <c:if test="${param.success == 'updated'}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    <span>อัปเดตข้อมูลโปรไฟล์เรียบร้อยแล้ว!</span>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <!-- Profile Layout -->
            <div class="profile-layout">
                <!-- Profile Card -->
                <div class="profile-card">
                    <div class="profile-avatar">
                        ${user.initials}
                    </div>

                    <h2 class="profile-name">${user.fullName}</h2>
                    <p class="profile-username">@${user.username}</p>

                    <div class="profile-stats">
                        <div class="stat-item">
                            <div class="stat-number">${totalOffers}</div>
                            <div class="stat-label">Skills</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">${sentRequests}</div>
                            <div class="stat-label">Sent</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">${receivedRequests}</div>
                            <div class="stat-label">Received</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">
                                <c:choose>
                                    <c:when test="${user.createdAt != null}">
                                        ${user.createdAt.monthValue}/${user.createdAt.year}
                                    </c:when>
                                    <c:otherwise>--</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="stat-label">Joined</div>
                        </div>
                        <div class="stat-item rating-stat">
                            <div class="stat-number">
                                <span class="rating-value">
                                    <c:choose>
                                        <c:when test="${averageRating > 0}">
                                            <fmt:formatNumber value="${averageRating}" type="number" maxFractionDigits="1"/>
                                        </c:when>
                                        <c:otherwise>--</c:otherwise>
                                    </c:choose>
                                </span>
                                <span class="rating-stars">
                                    <c:forEach begin="1" end="5" var="star">
                                        <span class="star <c:if test="${star <= averageRating}">filled</c:if>">★</span>
                                    </c:forEach>
                                </span>
                            </div>
                            <div class="stat-label">Rating (${totalRatings} reviews)</div>
                        </div>
                    </div>

                    <div class="profile-actions">
                        <a href="edit-profile" class="profile-btn profile-btn-primary">
                            <i class="fas fa-edit"></i>
                            แก้ไขโปรไฟล์
                        </a>
                        <a href="my-offers" class="profile-btn profile-btn-secondary">
                            <i class="fas fa-briefcase"></i>
                            My Skills
                        </a>
                    </div>
                </div>

                <!-- Profile Details -->
                <div class="profile-details">
                    <!-- Personal Information -->
                    <div class="details-section">
                        <h3 class="section-title">
                            <div class="section-icon">
                                <i class="fas fa-user"></i>
                            </div>
                            ข้อมูลส่วนตัว
                        </h3>

                        <div class="info-grid">
                            <div class="info-item">
                                <div class="info-label">ชื่อ</div>
                                <div class="info-value">${user.firstName}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">นามสกุล</div>
                                <div class="info-value">${user.lastName}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">อีเมล</div>
                                <div class="info-value">${user.email}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">เบอร์โทร</div>
                                <div class="info-value ${empty user.phone ? 'empty' : ''}">
                                    <c:choose>
                                        <c:when test="${not empty user.phone}">${user.phone}</c:when>
                                        <c:otherwise>ไม่ได้ระบุ</c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">ที่อยู่</div>
                                <div class="info-value ${empty user.location ? 'empty' : ''}">
                                    <c:choose>
                                        <c:when test="${not empty user.location}">${user.location}</c:when>
                                        <c:otherwise>ไม่ได้ระบุ</c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bio Section -->
                    <div class="details-section">
                        <h3 class="section-title">
                            <div class="section-icon">
                                <i class="fas fa-quote-left"></i>
                            </div>
                            เกี่ยวกับฉัน
                        </h3>

                        <div class="bio-text ${empty user.bio ? 'empty' : ''}">
                            <c:choose>
                                <c:when test="${not empty user.bio}">${user.bio}</c:when>
                                <c:otherwise>ยังไม่ได้เขียนข้อมูลเกี่ยวกับตัวเอง คลิกแก้ไขโปรไฟล์เพื่อเพิ่มข้อมูล</c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <!-- Social Links -->
                    <div class="details-section">
                        <h3 class="section-title">
                            <div class="section-icon">
                                <i class="fas fa-link"></i>
                            </div>
                            ลิงก์โซเชียล
                        </h3>

                        <div class="social-links">
                            <c:if test="${not empty user.linkedin}">
                                <a href="${user.linkedin}" target="_blank" class="social-link">
                                    <i class="fab fa-linkedin"></i>
                                    LinkedIn
                                </a>
                            </c:if>
                            <c:if test="${not empty user.github}">
                                <a href="${user.github}" target="_blank" class="social-link">
                                    <i class="fab fa-github"></i>
                                    GitHub
                                </a>
                            </c:if>
                            <c:if test="${empty user.linkedin and empty user.github}">
                                <p class="info-value empty">ไม่ได้เพิ่มลิงก์โซเชียล คลิกแก้ไขโปรไฟล์เพื่อเพิ่ม</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Enhanced animations
            const elements = document.querySelectorAll('.profile-card, .profile-details');

            elements.forEach((element, index) => {
                element.style.animationDelay = `${index * 0.2}s`;
                element.classList.add('animate-in');
            });

            // Add ripple effect to buttons
            const buttons = document.querySelectorAll('.profile-btn, .action-button');
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