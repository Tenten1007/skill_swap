<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications | Skill Swap</title>

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

            /* === Navbar Height === */
            --navbar-height: 80px;

            /* === Aurora Color Palette === */
            --primary: #6366F1;
            --primary-hover: #4F46E5;
            --secondary: #8B5CF6;
            --accent: #06B6D4;
            --success: #10B981;
            --warning: #F59E0B;
            --error: #EF4444;

            --button-gradient: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);

            /* === Text System === */
            --text-primary: #FFFFFF;
            --text-secondary: rgba(255, 255, 255, 0.8);
            --text-muted: rgba(255, 255, 255, 0.6);

            /* === Spacing === */
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
        }

        body {
            margin: 0;
            font-family: 'Inter', 'SF Pro Display', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(-45deg, #0f0f23 0%, #1a1a2e 25%, #16213e 50%, #0f3460 75%, #533483 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            min-height: 100vh;
            color: var(--text-primary);
            padding-top: var(--navbar-height);
        }

        @keyframes gradientShift {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        /* === NAVBAR STYLES === */
        .modern-navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            padding: var(--space-md) var(--space-lg);
            background: linear-gradient(135deg,
                    rgba(255, 255, 255, 0.15) 0%,
                    rgba(255, 255, 255, 0.08) 100%);
            backdrop-filter: blur(40px) saturate(180%);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            animation: slideDownNavbar 0.6s ease-out;
        }

        @keyframes slideDownNavbar {
            0% {
                opacity: 0;
                transform: translateY(-100%);
            }

            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .navbar-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: var(--space-lg);
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            font-size: var(--font-xl);
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary), var(--secondary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-decoration: none;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .navbar-brand:hover {
            transform: scale(1.05);
            filter: brightness(1.2);
        }

        .navbar-menu {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
            flex-wrap: wrap;
        }

        .navbar-link {
            display: inline-flex;
            align-items: center;
            gap: var(--space-xs);
            padding: var(--space-sm) var(--space-md);
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-md);
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 600;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        .navbar-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        .navbar-link:hover::before {
            left: 100%;
        }

        .navbar-link:hover {
            background: rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
            color: var(--text-white);
            text-decoration: none;
        }

        .navbar-link.active {
            background: var(--button-gradient);
            border-color: transparent;
            color: var(--text-white);
        }

        .navbar-link.active:hover {
            box-shadow: 0 4px 16px rgba(99, 102, 241, 0.5);
        }

        /* Navbar Icons Colors */
        .navbar-link.nav-home {
            border-color: rgba(99, 102, 241, 0.3);
        }

        .navbar-link.nav-home:hover {
            background: rgba(99, 102, 241, 0.15);
            border-color: rgba(99, 102, 241, 0.5);
        }

        .navbar-link.nav-board {
            border-color: rgba(245, 158, 11, 0.3);
        }

        .navbar-link.nav-board:hover {
            background: rgba(245, 158, 11, 0.15);
            border-color: rgba(245, 158, 11, 0.5);
        }

        .navbar-link.nav-add {
            border-color: rgba(16, 185, 129, 0.3);
        }

        .navbar-link.nav-add:hover {
            background: rgba(16, 185, 129, 0.15);
            border-color: rgba(16, 185, 129, 0.5);
        }

        .navbar-link.nav-offers {
            border-color: rgba(139, 92, 246, 0.3);
        }

        .navbar-link.nav-offers:hover {
            background: rgba(139, 92, 246, 0.15);
            border-color: rgba(139, 92, 246, 0.5);
        }

        .navbar-link.nav-matches {
            border-color: rgba(6, 182, 212, 0.3);
        }

        .navbar-link.nav-matches:hover {
            background: rgba(6, 182, 212, 0.15);
            border-color: rgba(6, 182, 212, 0.5);
        }

        .navbar-link.nav-notifications {
            border-color: rgba(245, 158, 11, 0.3);
        }

        .navbar-link.nav-notifications:hover {
            background: rgba(245, 158, 11, 0.15);
            border-color: rgba(245, 158, 11, 0.5);
        }

        .navbar-link.nav-profile {
            border-color: rgba(16, 185, 129, 0.3);
        }

        .navbar-link.nav-profile:hover {
            background: rgba(16, 185, 129, 0.15);
            border-color: rgba(16, 185, 129, 0.5);
        }

        /* Mobile Menu Toggle */
        .mobile-menu-toggle {
            display: none;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-md);
            padding: var(--space-sm);
            color: var(--text-white);
            font-size: var(--font-xl);
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .mobile-menu-toggle:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: scale(1.1);
        }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .mobile-menu-toggle {
                display: block;
            }

            .navbar-menu {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background: linear-gradient(135deg,
                        rgba(255, 255, 255, 0.15) 0%,
                        rgba(255, 255, 255, 0.08) 100%);
                backdrop-filter: blur(40px);
                border-top: 1px solid rgba(255, 255, 255, 0.2);
                padding: var(--space-md);
                flex-direction: column;
                gap: var(--space-xs);
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            }

            .navbar-menu.active {
                display: flex;
                animation: slideDownMenu 0.3s ease-out;
            }

            @keyframes slideDownMenu {
                0% {
                    opacity: 0;
                    transform: translateY(-20px);
                }

                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .navbar-link {
                width: 100%;
                justify-content: center;
                padding: var(--space-md);
            }

            .navbar-brand {
                font-size: var(--font-lg);
            }
        }

        /* Container */
        .notifications-container {
            max-width: 900px;
            margin: var(--space-2xl) auto;
            padding: 0 var(--space-lg);
        }

        /* Header */
        .header-section {
            margin-bottom: var(--space-2xl);
        }

        .header-title h1 {
            font-size: var(--font-3xl);
            font-weight: 800;
            margin: 0 0 var(--space-sm) 0;
            background: var(--button-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .header-title p {
            color: var(--text-muted);
            margin: 0;
        }

        /* Actions Bar */
        .actions-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--glass-bg);
            backdrop-filter: var(--blur-strength);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-lg);
            padding: var(--space-md) var(--space-lg);
            margin-bottom: var(--space-xl);
        }

        .unread-count {
            color: var(--text-secondary);
            font-size: var(--font-sm);
        }

        .unread-count strong {
            color: var(--primary);
            font-size: var(--font-lg);
            margin-right: var(--space-xs);
        }

        .mark-all-btn {
            background: var(--button-gradient);
            color: white;
            border: none;
            padding: var(--space-sm) var(--space-lg);
            border-radius: var(--radius-md);
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: var(--font-sm);
        }

        .mark-all-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(99, 102, 241, 0.3);
        }

        /* Notifications List */
        .notifications-list {
            display: flex;
            flex-direction: column;
            gap: var(--space-md);
        }

        .notification-card {
            background: var(--glass-bg);
            backdrop-filter: var(--blur-strength);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-lg);
            padding: var(--space-lg);
            transition: all 0.3s ease;
            position: relative;
        }

        .notification-card.unread {
            background: rgba(99, 102, 241, 0.1);
            border-left: 4px solid var(--primary);
        }

        .notification-card:hover {
            background: var(--glass-hover);
            transform: translateY(-2px);
            box-shadow: var(--glass-shadow);
        }

        .notification-header {
            display: flex;
            align-items: start;
            gap: var(--space-md);
        }

        .notification-icon {
            width: 48px;
            height: 48px;
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: var(--font-lg);
            flex-shrink: 0;
        }

        .notification-icon.swap-request {
            background: linear-gradient(135deg, #6366F1, #8B5CF6);
        }

        .notification-icon.swap-accepted {
            background: linear-gradient(135deg, #10B981, #059669);
        }

        .notification-icon.swap-rejected {
            background: linear-gradient(135deg, #EF4444, #DC2626);
        }

        .notification-icon.match-created {
            background: linear-gradient(135deg, #06B6D4, #0891B2);
        }

        .notification-icon.rating-received {
            background: linear-gradient(135deg, #F59E0B, #D97706);
        }

        .notification-icon.match-completed {
            background: linear-gradient(135deg, #8B5CF6, #7C3AED);
        }

        .notification-content {
            flex: 1;
        }

        .notification-message {
            color: var(--text-primary);
            font-size: var(--font-base);
            margin: 0 0 var(--space-sm) 0;
            line-height: 1.5;
        }

        .notification-time {
            color: var(--text-muted);
            font-size: var(--font-xs);
        }

        .notification-actions {
            display: flex;
            gap: var(--space-sm);
            margin-top: var(--space-md);
        }

        .notification-link {
            background: var(--button-gradient);
            color: white;
            text-decoration: none;
            padding: var(--space-sm) var(--space-md);
            border-radius: var(--radius-sm);
            font-size: var(--font-sm);
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: var(--space-xs);
        }

        .notification-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
        }

        .delete-btn {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: var(--error);
            padding: var(--space-sm) var(--space-md);
            border-radius: var(--radius-sm);
            font-size: var(--font-sm);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            background: rgba(239, 68, 68, 0.2);
            border-color: var(--error);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: var(--space-2xl);
            background: var(--glass-bg);
            backdrop-filter: var(--blur-strength);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-lg);
        }

        .empty-state i {
            font-size: 64px;
            color: var(--text-muted);
            margin-bottom: var(--space-lg);
        }

        .empty-state h3 {
            color: var(--text-secondary);
            margin: 0 0 var(--space-sm) 0;
        }

        .empty-state p {
            color: var(--text-muted);
            margin: 0;
        }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .notifications-container {
                padding: 0 var(--space-md);
            }

            .actions-bar {
                flex-direction: column;
                gap: var(--space-md);
                align-items: stretch;
            }

            .mark-all-btn {
                width: 100%;
            }

            .notification-header {
                flex-direction: row;
            }

            .notification-icon {
                width: 40px;
                height: 40px;
                font-size: var(--font-base);
            }

            .notification-actions {
                flex-direction: column;
            }

            .notification-link, .delete-btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <!-- Modern Navbar -->
    <nav class="modern-navbar">
        <div class="navbar-container">
            <a href="home" class="navbar-brand">
                <i class="fas fa-exchange-alt"></i>
                Skill Swap
            </a>

            <button class="mobile-menu-toggle" onclick="toggleMobileMenu()">
                <i class="fas fa-bars"></i>
            </button>

            <div class="navbar-menu" id="navbarMenu">
                <a href="home" class="navbar-link nav-home">
                    <i class="fas fa-home"></i>
                    For You
                </a>
                <a href="jobboard" class="navbar-link nav-board">
                    <i class="fas fa-search"></i>
                    Browse All
                </a>
                <a href="add-skill" class="navbar-link nav-add">
                    <i class="fas fa-plus-circle"></i>
                    Add Skill
                </a>
                <a href="my-offers" class="navbar-link nav-offers">
                    <i class="fas fa-briefcase"></i>
                    My Skills
                </a>
                <a href="matches" class="navbar-link nav-matches">
                    <i class="fas fa-handshake"></i>
                    Matches
                </a>
                <a href="notifications" class="navbar-link nav-notifications active">
                    <i class="fas fa-bell"></i>
                    Notifications
                </a>
                <a href="profile" class="navbar-link nav-profile">
                    <i class="fas fa-user"></i>
                    Profile
                </a>
            </div>
        </div>
    </nav>

    <!-- Main Container -->
    <div class="notifications-container">
        <!-- Header -->
        <div class="header-section">
            <div class="header-title">
                <h1><i class="fas fa-bell"></i> การแจ้งเตือน</h1>
                <p>ติดตามความเคลื่อนไหวและกิจกรรมต่างๆ ของคุณ</p>
            </div>
        </div>

        <!-- Actions Bar -->
        <div class="actions-bar">
            <div class="unread-count">
                <strong>${unreadCount}</strong> การแจ้งเตือนที่ยังไม่อ่าน
            </div>
            <c:if test="${unreadCount > 0}">
                <form action="notifications/mark-all-read" method="post" style="margin: 0;">
                    <button type="submit" class="mark-all-btn">
                        <i class="fas fa-check-double"></i> ทำเครื่องหมายว่าอ่านทั้งหมด
                    </button>
                </form>
            </c:if>
        </div>

        <!-- Notifications List -->
        <c:choose>
            <c:when test="${not empty notifications}">
                <div class="notifications-list">
                    <c:forEach items="${notifications}" var="notification">
                        <div class="notification-card ${notification.read ? '' : 'unread'}">
                            <div class="notification-header">
                                <!-- Icon based on notification type -->
                                <div class="notification-icon ${notification.type.toLowerCase().replace('_', '-')}">
                                    <c:choose>
                                        <c:when test="${notification.type == 'SWAP_REQUEST'}">
                                            <i class="fas fa-paper-plane"></i>
                                        </c:when>
                                        <c:when test="${notification.type == 'SWAP_ACCEPTED'}">
                                            <i class="fas fa-check-circle"></i>
                                        </c:when>
                                        <c:when test="${notification.type == 'SWAP_REJECTED'}">
                                            <i class="fas fa-times-circle"></i>
                                        </c:when>
                                        <c:when test="${notification.type == 'MATCH_CREATED'}">
                                            <i class="fas fa-handshake"></i>
                                        </c:when>
                                        <c:when test="${notification.type == 'RATING_RECEIVED'}">
                                            <i class="fas fa-star"></i>
                                        </c:when>
                                        <c:when test="${notification.type == 'MATCH_COMPLETED'}">
                                            <i class="fas fa-trophy"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-bell"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="notification-content">
                                    <p class="notification-message">${notification.message}</p>
                                    <div class="notification-time">
                                        <i class="far fa-clock"></i>
                                        <script>
                                            const createdAt = new Date('${notification.createdAt}');
                                            const now = new Date();
                                            const diff = Math.floor((now - createdAt) / 1000); // seconds

                                            let timeAgo = '';
                                            if (diff < 60) {
                                                timeAgo = 'เมื่อสักครู่';
                                            } else if (diff < 3600) {
                                                const minutes = Math.floor(diff / 60);
                                                timeAgo = minutes + ' นาทีที่แล้ว';
                                            } else if (diff < 86400) {
                                                const hours = Math.floor(diff / 3600);
                                                timeAgo = hours + ' ชั่วโมงที่แล้ว';
                                            } else {
                                                const days = Math.floor(diff / 86400);
                                                timeAgo = days + ' วันที่แล้ว';
                                            }
                                            document.write(timeAgo);
                                        </script>
                                    </div>

                                    <div class="notification-actions">
                                        <c:if test="${not empty notification.linkUrl}">
                                            <a href="${notification.linkUrl}" class="notification-link">
                                                <i class="fas fa-arrow-right"></i> ดูรายละเอียด
                                            </a>
                                        </c:if>
                                        <form action="notifications/delete" method="post" style="display: inline; margin: 0;">
                                            <input type="hidden" name="notificationId" value="${notification.id}">
                                            <button type="submit" class="delete-btn">
                                                <i class="fas fa-trash"></i> ลบ
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <i class="fas fa-bell-slash"></i>
                    <h3>ไม่มีการแจ้งเตือน</h3>
                    <p>คุณไม่มีการแจ้งเตือนใดๆ ในขณะนี้</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        // Mobile Menu Toggle Function
        function toggleMobileMenu() {
            const menu = document.getElementById('navbarMenu');
            menu.classList.toggle('active');
        }

        // Close mobile menu when clicking outside
        document.addEventListener('click', function (event) {
            const navbar = document.querySelector('.modern-navbar');
            const menu = document.getElementById('navbarMenu');
            const toggle = document.querySelector('.mobile-menu-toggle');

            if (navbar && menu && toggle) {
                if (!navbar.contains(event.target)) {
                    menu.classList.remove('active');
                }
            }
        });
    </script>
</body>
</html>
