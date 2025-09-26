<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matches - Skill Swap</title>

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

            /* === Dark Background System === */
            --bg-gradient: linear-gradient(-45deg,
                #0f0f23 0%,
                #1a1a2e 25%,
                #16213e 50%,
                #0f3460 75%,
                #533483 100%);

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

        /* Matches Page Styles */
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

        .matches-container {
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
            top: 20%;
            left: 10%;
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border-radius: 50%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            top: 60%;
            right: 15%;
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, var(--secondary), var(--accent));
            transform: rotate(45deg);
            animation-delay: -8s;
        }

        .shape:nth-child(3) {
            bottom: 25%;
            left: 20%;
            width: 60px;
            height: 60px;
            background: var(--success);
            clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
            animation-delay: -15s;
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

        /* Stats Section */
        .stats-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: var(--space-lg);
            margin-bottom: var(--space-2xl);
        }

        .stat-card {
            background: linear-gradient(135deg,
                rgba(255, 255, 255, 0.25) 0%,
                rgba(255, 255, 255, 0.10) 50%,
                rgba(255, 255, 255, 0.05) 100%);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: var(--radius-xl);
            padding: var(--space-xl);
            backdrop-filter: blur(25px);
            box-shadow:
                0 15px 35px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            transition: all var(--duration-normal) var(--spring-easing);
            position: relative;
            overflow: hidden;
        }

        .stat-card:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow:
                0 25px 50px rgba(0, 0, 0, 0.15),
                0 0 0 1px rgba(99, 102, 241, 0.3);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            background: var(--button-gradient);
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: var(--text-white);
            margin-bottom: var(--space-md);
            box-shadow: 0 10px 25px rgba(99, 102, 241, 0.3);
        }

        .stat-number {
            font-size: var(--font-3xl);
            font-weight: 700;
            color: #ffffff;
            margin-bottom: var(--space-xs);
        }

        .stat-label {
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.8);
            font-weight: 500;
        }

        /* Tab Navigation */
        .tabs-section {
            background: linear-gradient(135deg,
                rgba(255, 255, 255, 0.15) 0%,
                rgba(255, 255, 255, 0.05) 100%);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-xl);
            backdrop-filter: blur(40px);
            padding: var(--space-lg);
            box-shadow:
                0 25px 80px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }

        .tabs-nav {
            display: flex;
            gap: var(--space-sm);
            margin-bottom: var(--space-xl);
            background: rgba(0, 0, 0, 0.1);
            padding: var(--space-sm);
            border-radius: var(--radius-lg);
        }

        .tab-button {
            flex: 1;
            padding: var(--space-md) var(--space-lg);
            border: none;
            background: transparent;
            color: rgba(255, 255, 255, 0.7);
            font-weight: 600;
            border-radius: var(--radius-md);
            cursor: pointer;
            transition: all var(--duration-normal) var(--spring-easing);
            text-decoration: none;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: var(--space-sm);
        }

        .tab-button.active {
            background: var(--button-gradient);
            color: var(--text-white);
            box-shadow: 0 8px 25px rgba(99, 102, 241, 0.4);
        }

        .tab-button:not(.active):hover {
            background: rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.9);
        }

        /* Request Cards */
        .requests-grid {
            display: grid;
            gap: var(--space-lg);
        }

        .request-card {
            background: linear-gradient(135deg,
                rgba(255, 255, 255, 0.2) 0%,
                rgba(255, 255, 255, 0.1) 100%);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: var(--radius-xl);
            padding: var(--space-xl);
            backdrop-filter: blur(25px);
            box-shadow:
                0 15px 35px rgba(0, 0, 0, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            transition: all var(--duration-normal) var(--spring-easing);
            position: relative;
            overflow: hidden;
        }

        .request-card:hover {
            transform: translateY(-5px) scale(1.01);
            box-shadow:
                0 25px 50px rgba(0, 0, 0, 0.15),
                0 0 0 1px rgba(99, 102, 241, 0.3);
        }

        .request-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--space-lg);
        }

        .request-status {
            padding: var(--space-xs) var(--space-sm);
            border-radius: var(--radius-sm);
            font-size: var(--font-sm);
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: var(--space-xs);
        }

        .status-pending {
            background: rgba(245, 158, 11, 0.2);
            color: var(--warning);
            border: 1px solid rgba(245, 158, 11, 0.3);
        }

        .status-accepted {
            background: rgba(16, 185, 129, 0.2);
            color: var(--success);
            border: 1px solid rgba(16, 185, 129, 0.3);
        }

        .status-rejected {
            background: rgba(239, 68, 68, 0.2);
            color: var(--error);
            border: 1px solid rgba(239, 68, 68, 0.3);
        }

        .status-cancelled {
            background: rgba(156, 163, 175, 0.2);
            color: var(--text-muted);
            border: 1px solid rgba(156, 163, 175, 0.3);
        }

        .request-skills {
            display: grid;
            grid-template-columns: 1fr auto 1fr;
            gap: var(--space-lg);
            align-items: center;
            margin-bottom: var(--space-lg);
        }

        .skill-card {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-lg);
            padding: var(--space-lg);
            text-align: center;
        }

        .skill-title {
            font-size: var(--font-lg);
            font-weight: 700;
            color: #ffffff;
            margin-bottom: var(--space-sm);
        }

        .skill-meta {
            font-size: var(--font-sm);
            color: rgba(255, 255, 255, 0.7);
        }

        .swap-arrow {
            font-size: 24px;
            color: var(--primary);
        }

        .request-message {
            background: rgba(255, 255, 255, 0.05);
            border-radius: var(--radius-md);
            padding: var(--space-md);
            margin-bottom: var(--space-lg);
            font-style: italic;
            color: rgba(255, 255, 255, 0.9);
        }

        .request-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: var(--font-sm);
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: var(--space-lg);
        }

        .request-actions {
            display: flex;
            gap: var(--space-sm);
            justify-content: flex-end;
        }

        .btn-action {
            padding: var(--space-sm) var(--space-md);
            border-radius: var(--radius-md);
            font-size: var(--font-sm);
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            transition: all var(--duration-normal) var(--spring-easing);
            border: 2px solid transparent;
            cursor: pointer;
        }

        .btn-accept {
            background: linear-gradient(135deg, var(--success), #059669);
            color: var(--text-white);
        }

        .btn-reject {
            background: rgba(239, 68, 68, 0.1);
            color: var(--error);
            border-color: rgba(239, 68, 68, 0.3);
        }

        .btn-cancel {
            background: rgba(156, 163, 175, 0.1);
            color: var(--text-muted);
            border-color: rgba(156, 163, 175, 0.3);
        }

        .btn-action:hover {
            transform: translateY(-2px) scale(1.05);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: var(--space-2xl);
        }

        .empty-icon {
            font-size: 4rem;
            color: rgba(255, 255, 255, 0.3);
            margin-bottom: var(--space-lg);
        }

        .empty-title {
            font-size: var(--font-2xl);
            font-weight: 700;
            color: #ffffff;
            margin-bottom: var(--space-md);
        }

        .empty-description {
            font-size: var(--font-base);
            color: rgba(255, 255, 255, 0.7);
            max-width: 400px;
            margin: 0 auto var(--space-xl);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .matches-container {
                padding: var(--space-md);
            }

            .header-section {
                flex-direction: column;
                gap: var(--space-md);
                text-align: center;
            }

            .request-skills {
                grid-template-columns: 1fr;
                gap: var(--space-md);
            }

            .swap-arrow {
                transform: rotate(90deg);
            }

            .stats-section {
                grid-template-columns: 1fr;
            }

            .tabs-nav {
                flex-direction: column;
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
    <div class="matches-container">
        <!-- Header Section -->
        <div class="header-section">
            <div class="header-title">
                <h1><i class="fas fa-handshake"></i> Matches</h1>
                <p>จัดการคำขอ Skill Swap และดูประวัติการแลกเปลี่ยน</p>
            </div>
            <div class="header-actions">
                <a href="home" class="action-button btn-secondary">
                    <i class="fas fa-search"></i>
                    ค้นหา Skills
                </a>
                <a href="my-offers" class="action-button btn-secondary">
                    <i class="fas fa-briefcase"></i>
                    My Offers
                </a>
                <a href="doLogout" class="action-button btn-secondary" style="background: rgba(239, 68, 68, 0.1); border-color: rgba(239, 68, 68, 0.3); color: var(--error);">
                    <i class="fas fa-sign-out-alt"></i>
                    ออกจากระบบ
                </a>
            </div>
        </div>

        <!-- Content Container -->
        <div class="content-container">
            <!-- Stats Section -->
            <div class="stats-section">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-paper-plane"></i>
                    </div>
                    <div class="stat-number">${sentCount}</div>
                    <div class="stat-label">คำขอที่ส่ง</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-inbox"></i>
                    </div>
                    <div class="stat-number">${receivedCount}</div>
                    <div class="stat-label">คำขอที่ได้รับ</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="stat-number">${pendingCount}</div>
                    <div class="stat-label">รอการตอบรับ</div>
                </div>
            </div>

            <!-- Tabs Section -->
            <div class="tabs-section">
                <!-- Tab Navigation -->
                <div class="tabs-nav">
                    <a href="?tab=received" class="tab-button ${activeTab == 'received' ? 'active' : ''}">
                        <i class="fas fa-inbox"></i>
                        คำขอที่ได้รับ
                        <c:if test="${pendingCount > 0}">
                            <span style="background: var(--error); color: white; border-radius: 50%; width: 20px; height: 20px; display: flex; align-items: center; justify-content: center; font-size: 0.75rem;">${pendingCount}</span>
                        </c:if>
                    </a>
                    <a href="?tab=sent" class="tab-button ${activeTab == 'sent' ? 'active' : ''}">
                        <i class="fas fa-paper-plane"></i>
                        คำขอที่ส่ง
                    </a>
                </div>

                <!-- Tab Content -->
                <div class="tab-content">
                    <!-- Received Requests Tab -->
                    <c:if test="${activeTab == 'received'}">
                        <c:choose>
                            <c:when test="${not empty receivedRequests}">
                                <div class="requests-grid">
                                    <c:forEach var="request" items="${receivedRequests}">
                                        <div class="request-card">
                                            <div class="request-header">
                                                <h3>คำขอจาก ${request.requester.username}</h3>
                                                <div class="request-status status-${request.status.toLowerCase()}">
                                                    <c:choose>
                                                        <c:when test="${request.status == 'PENDING'}">
                                                            <i class="fas fa-clock"></i> รอการตอบรับ
                                                        </c:when>
                                                        <c:when test="${request.status == 'ACCEPTED'}">
                                                            <i class="fas fa-check-circle"></i> ยอมรับแล้ว
                                                        </c:when>
                                                        <c:when test="${request.status == 'REJECTED'}">
                                                            <i class="fas fa-times-circle"></i> ปฏิเสธแล้ว
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="fas fa-ban"></i> ยกเลิกแล้ว
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>

                                            <div class="request-skills">
                                                <div class="skill-card">
                                                    <h4 class="skill-title">${request.offeredSkill.title}</h4>
                                                    <div class="skill-meta">
                                                        <div>${request.offeredSkill.skill.category.categoryName}</div>
                                                        <div>Level: ${request.offeredSkill.level}</div>
                                                    </div>
                                                </div>
                                                <div class="swap-arrow">
                                                    <i class="fas fa-exchange-alt"></i>
                                                </div>
                                                <div class="skill-card">
                                                    <h4 class="skill-title">${request.requestedSkill.title}</h4>
                                                    <div class="skill-meta">
                                                        <div>${request.requestedSkill.skill.category.categoryName}</div>
                                                        <div>Level: ${request.requestedSkill.level}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <c:if test="${not empty request.message}">
                                                <div class="request-message">
                                                    <i class="fas fa-quote-left"></i> ${request.message}
                                                </div>
                                            </c:if>

                                            <div class="request-meta">
                                                <span>
                                                    <i class="fas fa-calendar"></i>
                                                    ${request.createdAt.dayOfMonth} ${request.createdAt.month.toString().substring(0,3).toLowerCase()} ${request.createdAt.year}
                                                </span>
                                                <c:if test="${request.respondedAt != null}">
                                                    <span>
                                                        <i class="fas fa-reply"></i>
                                                        ตอบกลับ: ${request.respondedAt.dayOfMonth}/${request.respondedAt.monthValue}
                                                    </span>
                                                </c:if>
                                            </div>

                                            <c:if test="${request.status == 'PENDING'}">
                                                <div class="request-actions">
                                                    <form method="post" action="respond-swap" style="display: inline;">
                                                        <input type="hidden" name="requestId" value="${request.id}">
                                                        <input type="hidden" name="action" value="accept">
                                                        <button type="submit" class="btn-action btn-accept">
                                                            <i class="fas fa-check"></i> ยอมรับ
                                                        </button>
                                                    </form>
                                                    <form method="post" action="respond-swap" style="display: inline;">
                                                        <input type="hidden" name="requestId" value="${request.id}">
                                                        <input type="hidden" name="action" value="reject">
                                                        <button type="submit" class="btn-action btn-reject">
                                                            <i class="fas fa-times"></i> ปฏิเสธ
                                                        </button>
                                                    </form>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="empty-state">
                                    <div class="empty-icon">
                                        <i class="fas fa-inbox"></i>
                                    </div>
                                    <h3 class="empty-title">ยังไม่มีคำขอ Swap</h3>
                                    <p class="empty-description">
                                        คุณยังไม่ได้รับคำขอแลกเปลี่ยนสกิลใด ๆ ลองไปโพสต์สกิลของคุณเพื่อให้คนอื่นสามารถส่งคำขอมาได้!
                                    </p>
                                    <a href="add-skill" class="action-button btn-primary">
                                        <i class="fas fa-plus"></i>
                                        เพิ่ม Skill ของคุณ
                                    </a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:if>

                    <!-- Sent Requests Tab -->
                    <c:if test="${activeTab == 'sent'}">
                        <c:choose>
                            <c:when test="${not empty sentRequests}">
                                <div class="requests-grid">
                                    <c:forEach var="request" items="${sentRequests}">
                                        <div class="request-card">
                                            <div class="request-header">
                                                <h3>ส่งคำขอไปยัง ${request.requestedSkill.user.username}</h3>
                                                <div class="request-status status-${request.status.toLowerCase()}">
                                                    <c:choose>
                                                        <c:when test="${request.status == 'PENDING'}">
                                                            <i class="fas fa-clock"></i> รอการตอบรับ
                                                        </c:when>
                                                        <c:when test="${request.status == 'ACCEPTED'}">
                                                            <i class="fas fa-check-circle"></i> ยอมรับแล้ว
                                                        </c:when>
                                                        <c:when test="${request.status == 'REJECTED'}">
                                                            <i class="fas fa-times-circle"></i> ปฏิเสธแล้ว
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="fas fa-ban"></i> ยกเลิกแล้ว
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>

                                            <div class="request-skills">
                                                <div class="skill-card">
                                                    <h4 class="skill-title">${request.offeredSkill.title}</h4>
                                                    <div class="skill-meta">
                                                        <div>${request.offeredSkill.skill.category.categoryName}</div>
                                                        <div>Level: ${request.offeredSkill.level}</div>
                                                        <small>สกิลของคุณ</small>
                                                    </div>
                                                </div>
                                                <div class="swap-arrow">
                                                    <i class="fas fa-exchange-alt"></i>
                                                </div>
                                                <div class="skill-card">
                                                    <h4 class="skill-title">${request.requestedSkill.title}</h4>
                                                    <div class="skill-meta">
                                                        <div>${request.requestedSkill.skill.category.categoryName}</div>
                                                        <div>Level: ${request.requestedSkill.level}</div>
                                                        <small>สกิลที่ต้องการ</small>
                                                    </div>
                                                </div>
                                            </div>

                                            <c:if test="${not empty request.message}">
                                                <div class="request-message">
                                                    <i class="fas fa-quote-left"></i> ${request.message}
                                                </div>
                                            </c:if>

                                            <div class="request-meta">
                                                <span>
                                                    <i class="fas fa-calendar"></i>
                                                    ${request.createdAt.dayOfMonth} ${request.createdAt.month.toString().substring(0,3).toLowerCase()} ${request.createdAt.year}
                                                </span>
                                                <c:if test="${request.respondedAt != null}">
                                                    <span>
                                                        <i class="fas fa-reply"></i>
                                                        ตอบกลับ: ${request.respondedAt.dayOfMonth}/${request.respondedAt.monthValue}
                                                    </span>
                                                </c:if>
                                            </div>

                                            <c:if test="${request.status == 'PENDING'}">
                                                <div class="request-actions">
                                                    <form method="post" action="cancel-swap" style="display: inline;">
                                                        <input type="hidden" name="requestId" value="${request.id}">
                                                        <button type="submit" class="btn-action btn-cancel" onclick="return confirm('คุณแน่ใจหรือไม่ที่จะยกเลิกคำขอนี้?')">
                                                            <i class="fas fa-ban"></i> ยกเลิกคำขอ
                                                        </button>
                                                    </form>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="empty-state">
                                    <div class="empty-icon">
                                        <i class="fas fa-paper-plane"></i>
                                    </div>
                                    <h3 class="empty-title">ยังไม่ได้ส่งคำขอ Swap</h3>
                                    <p class="empty-description">
                                        คุณยังไม่ได้ส่งคำขอแลกเปลี่ยนสกิลใด ๆ ลองไปดูสกิลที่น่าสนใจในหน้าหลักแล้วส่งคำขอแลกเปลี่ยนกันเลย!
                                    </p>
                                    <a href="home" class="action-button btn-primary">
                                        <i class="fas fa-search"></i>
                                        ค้นหา Skills
                                    </a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Enhanced card animations
            const cards = document.querySelectorAll('.request-card, .stat-card');

            cards.forEach((card, index) => {
                card.style.animationDelay = `${index * 0.1}s`;
                card.classList.add('animate-in');
            });

            // Add ripple effect to buttons
            const buttons = document.querySelectorAll('.btn-action, .action-button');
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