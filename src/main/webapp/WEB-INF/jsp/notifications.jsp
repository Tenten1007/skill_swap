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

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/notifications.css">
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
    <!-- Custom Scripts -->
    <script src="${pageContext.request.contextPath}/js/notifications.js"></script>
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
    <!-- Custom Scripts -->
    <script src="${pageContext.request.contextPath}/js/notifications.js"></script>
</body>
</html>
