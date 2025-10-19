<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Skill Offers - Skill Swap</title>

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/my-offers.css">
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
                <a href="my-offers" class="navbar-link nav-offers active">
                    <i class="fas fa-briefcase"></i>
                    My Skills
                </a>
                <a href="matches" class="navbar-link nav-matches">
                    <i class="fas fa-handshake"></i>
                    Matches
                </a>
                <a href="notifications" class="navbar-link nav-notifications">
                    <i class="fas fa-bell"></i>
                    Notifications
                    <span class="notification-badge" id="notificationBadge" style="display: none;"></span>
                </a>
                <a href="profile" class="navbar-link nav-profile">
                    <i class="fas fa-user"></i>
                    Profile
                </a>
            </div>
        </div>
    </nav>

    <!-- Enhanced Background Effects -->
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <!-- Main Container -->
    <div class="my-offers-container">
        <!-- Header Section -->
        <div class="header-section">
            <div class="header-title">
                <h1><i class="fas fa-briefcase"></i> My Skill Offers</h1>
                <p>จัดการทักษะที่คุณแชร์กับชุมชน</p>
            </div>
        </div>

        <!-- Content Container -->
        <div class="content-container">
            <!-- Success Message -->
            <c:if test="${param.success == 'skill-deleted'}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    <span>ลบ Skill Offer สำเร็จแล้ว</span>
                </div>
            </c:if>

            <!-- Error Messages -->
            <c:if test="${param.error == 'skill-not-found'}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>ไม่พบ Skill Offer ที่ต้องการลบ</span>
                </div>
            </c:if>
            <c:if test="${param.error == 'unauthorized'}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>คุณไม่มีสิทธิ์ลบ Skill Offer นี้</span>
                </div>
            </c:if>
            <c:if test="${param.error == 'delete-failed'}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>เกิดข้อผิดพลาดในการลบ Skill Offer กรุณาลองใหม่อีกครั้ง</span>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <!-- Stats Section -->
            <div class="stats-section">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-clipboard-list"></i>
                    </div>
                    <div class="stat-number">${skillOffers.size()}</div>
                    <div class="stat-label">Total Offers</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-eye"></i>
                    </div>
                    <div class="stat-number">
                        <c:set var="activeCount" value="0" />
                        <c:forEach var="offer" items="${skillOffers}">
                            <c:if test="${offer.active}">
                                <c:set var="activeCount" value="${activeCount + 1}" />
                            </c:if>
                        </c:forEach>
                        ${activeCount}
                    </div>
                    <div class="stat-label">Active Offers</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <div class="stat-number">
                        <c:choose>
                            <c:when test="${not empty skillOffers}">
                                ${skillOffers.get(0).createdAt.dayOfMonth}/${skillOffers.get(0).createdAt.monthValue}
                            </c:when>
                            <c:otherwise>--</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="stat-label">Last Created</div>
                </div>
            </div>

            <!-- Offers Section -->
            <div class="offers-section">
                <h2 class="section-title">
                    <i class="fas fa-star"></i>
                    รายการทักษะของคุณ
                </h2>

                <c:choose>
                    <c:when test="${not empty skillOffers}">
                        <div class="offers-grid">
                            <c:forEach var="offer" items="${skillOffers}">
                                <div class="offer-card">
                                    <div class="offer-header">
                                        <div>
                                            <h3 class="offer-title">${offer.title}</h3>
                                            <div class="offer-category">
                                                <c:choose>
                                                    <c:when test="${offer.categoryName == 'Programming'}">💻</c:when>
                                                    <c:when test="${offer.categoryName == 'Design'}">🎨</c:when>
                                                    <c:when test="${offer.categoryName == 'Marketing'}">📈</c:when>
                                                    <c:when test="${offer.categoryName == 'Photography'}">📸</c:when>
                                                    <c:when test="${offer.categoryName == 'Music'}">🎵</c:when>
                                                    <c:when test="${offer.categoryName == 'Language'}">🌍</c:when>
                                                    <c:when test="${offer.categoryName == 'Cooking'}">🍳</c:when>
                                                    <c:when test="${offer.categoryName == 'Fitness'}">💪</c:when>
                                                    <c:when test="${offer.categoryName == 'Writing'}">✍️</c:when>
                                                    <c:when test="${offer.categoryName == 'Business'}">💼</c:when>
                                                    <c:otherwise>🔧</c:otherwise>
                                                </c:choose>
                                                ${offer.categoryName}
                                            </div>
                                        </div>
                                        <div class="offer-status ${offer.active ? 'status-active' : 'status-inactive'}">
                                            <c:choose>
                                                <c:when test="${offer.active}">
                                                    <i class="fas fa-check-circle"></i> Active
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="fas fa-pause-circle"></i> Inactive
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>

                                    <p class="offer-description">${offer.description}</p>

                                    <div class="offer-meta">
                                        <div class="meta-item">
                                            <i class="fas fa-signal meta-icon"></i>
                                            <span>${offer.level}</span>
                                        </div>
                                        <c:if test="${not empty offer.timeCommitment}">
                                            <div class="meta-item">
                                                <i class="fas fa-clock meta-icon"></i>
                                                <span>${offer.timeCommitment}</span>
                                            </div>
                                        </c:if>
                                        <c:if test="${not empty offer.location}">
                                            <div class="meta-item">
                                                <i class="fas fa-map-marker-alt meta-icon"></i>
                                                <span>${offer.location}</span>
                                            </div>
                                        </c:if>
                                        <div class="meta-item">
                                            <i class="fas fa-calendar meta-icon"></i>
                                            <span>${offer.createdAt.dayOfMonth} ${offer.createdAt.month.toString().substring(0,3).toLowerCase()} ${offer.createdAt.year}</span>
                                        </div>
                                    </div>

                                    <div class="offer-actions">
                                        <a href="#" class="btn-action btn-edit">
                                            <i class="fas fa-edit"></i>
                                            แก้ไข
                                        </a>
                                        <a href="#" class="btn-action btn-delete" onclick="return confirmDelete(${offer.id})">
                                            <i class="fas fa-trash"></i>
                                            ลบ
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <div class="empty-icon">
                                <i class="fas fa-clipboard-list"></i>
                            </div>
                            <h3 class="empty-title">ยังไม่มี Skill Offers</h3>
                            <p class="empty-description">
                                คุณยังไม่ได้สร้าง Skill Offer ใด ๆ เริ่มต้นแชร์ทักษะของคุณกับชุมชนกันเลย!
                            </p>
                            <a href="add-skill" class="action-button btn-primary">
                                <i class="fas fa-plus-circle"></i>
                                สร้าง Skill แรกของคุณ
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- Custom Scripts -->
    <script src="${pageContext.request.contextPath}/js/my-offers.js"></script>
</body>
</html>