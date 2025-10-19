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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
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
                <a href="notifications" class="navbar-link nav-notifications">
                    <i class="fas fa-bell"></i>
                    Notifications
                    <span class="notification-badge" id="notificationBadge" style="display: none;"></span>
                </a>
                <a href="profile" class="navbar-link nav-profile active">
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
    <div class="profile-container">
        <!-- Header Section -->
        <div class="header-section">
            <div class="header-title">
                <c:choose>
                    <c:when test="${isOwnProfile}">
                        <h1><i class="fas fa-user"></i> My Profile</h1>
                        <p>จัดการข้อมูลส่วนตัวและดูสถิติการใช้งาน</p>
                    </c:when>
                    <c:otherwise>
                        <h1><i class="fas fa-user"></i> ${user.fullName}</h1>
                        <p>โปรไฟล์ผู้ใช้และทักษะ</p>
                    </c:otherwise>
                </c:choose>
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

                    <c:if test="${isOwnProfile}">
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
                    </c:if>
                </div>

                <!-- Profile Details -->
                <div class="profile-details">
                    <!-- Personal Information -->
                    <c:if test="${isOwnProfile or not empty user.location}">
                        <div class="details-section">
                            <h3 class="section-title">
                                <div class="section-icon">
                                    <c:choose>
                                        <c:when test="${isOwnProfile}">
                                            <i class="fas fa-user"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-map-marker-alt"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <c:choose>
                                    <c:when test="${isOwnProfile}">ข้อมูลส่วนตัว</c:when>
                                    <c:otherwise>สถานที่</c:otherwise>
                                </c:choose>
                            </h3>

                            <c:choose>
                                <c:when test="${isOwnProfile}">
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
                                </c:when>
                                <c:otherwise>
                                    <div class="info-grid">
                                        <div class="info-item">
                                            <div class="info-label">Location</div>
                                            <div class="info-value">${user.location}</div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>

                    <!-- Bio Section -->
                    <c:if test="${isOwnProfile or not empty user.bio}">
                        <div class="details-section">
                            <h3 class="section-title">
                                <div class="section-icon">
                                    <i class="fas fa-quote-left"></i>
                                </div>
                                <c:choose>
                                    <c:when test="${isOwnProfile}">เกี่ยวกับฉัน</c:when>
                                    <c:otherwise>เกี่ยวกับ</c:otherwise>
                                </c:choose>
                            </h3>

                            <div class="bio-text ${empty user.bio ? 'empty' : ''}">
                                <c:choose>
                                    <c:when test="${not empty user.bio}">${user.bio}</c:when>
                                    <c:when test="${isOwnProfile}">ยังไม่ได้เขียนข้อมูลเกี่ยวกับตัวเอง คลิกแก้ไขโปรไฟล์เพื่อเพิ่มข้อมูล</c:when>
                                </c:choose>
                            </div>
                        </div>
                    </c:if>

                    <!-- Social Links -->
                    <c:if test="${isOwnProfile or not empty user.linkedin or not empty user.github}">
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
                                <c:if test="${isOwnProfile and empty user.linkedin and empty user.github}">
                                    <p class="info-value empty">ไม่ได้เพิ่มลิงก์โซเชียล คลิกแก้ไขโปรไฟล์เพื่อเพิ่ม</p>
                                </c:if>
                            </div>
                        </div>
                    </c:if>

                    <!-- Reviews Section -->
                    <div class="details-section">
                        <h3 class="section-title">
                            <div class="section-icon">
                                <i class="fas fa-star"></i>
                            </div>
                            รีวิวและความคิดเห็น (${totalRatings})
                        </h3>

                        <c:choose>
                            <c:when test="${not empty reviews}">
                                <div class="reviews-container">
                                    <c:forEach items="${reviews}" var="review">
                                        <div class="review-card">
                                            <div class="review-header">
                                                <div class="reviewer-info">
                                                    <div class="reviewer-avatar">
                                                        ${review.raterName.substring(0, 1)}
                                                    </div>
                                                    <div class="reviewer-details">
                                                        <div class="reviewer-name">${review.raterName}</div>
                                                        <div class="review-date">
                                                            ${review.createdAt.dayOfMonth}
                                                            ${review.createdAt.month}
                                                            ${review.createdAt.year}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="review-rating">
                                                    <c:forEach begin="1" end="5" var="star">
                                                        <span class="review-star <c:if test="${star <= review.score}">filled</c:if>">★</span>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="review-comment">
                                                <c:choose>
                                                    <c:when test="${not empty review.comment}">
                                                        ${review.comment}
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color: rgba(255, 255, 255, 0.4); font-style: italic;">ไม่มีความคิดเห็น</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="bio-text empty">
                                    ยังไม่มีรีวิว เมื่อคุณช่วยเหลือผู้อื่นในการแลกเปลี่ยนทักษะ พวกเขาจะสามารถให้คะแนนและรีวิวคุณได้
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- User's Skills -->
                    <c:if test="${not empty userOffers}">
                        <div class="details-section">
                            <h3 class="section-title">
                                <div class="section-icon">
                                    <i class="fas fa-lightbulb"></i>
                                </div>
                                ทักษะทั้งหมด
                            </h3>

                            <div class="skills-grid">
                                <c:forEach var="offer" items="${userOffers}">
                                    <div class="skill-card">
                                        <div class="skill-card-header">
                                            <div>
                                                <h4 class="skill-card-title">${offer.title}</h4>
                                                <span class="skill-level">${offer.level}</span>
                                            </div>
                                        </div>
                                        <p class="skill-card-description">
                                            <c:choose>
                                                <c:when test="${offer.description.length() > 100}">
                                                    ${offer.description.substring(0, 100)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${offer.description}
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                        <div class="skill-card-footer">
                                            <span class="skill-category">
                                                <i class="fas fa-tag"></i>
                                                ${offer.categoryName}
                                            </span>
                                            <a href="skill?id=${offer.id}" class="view-skill-link">
                                                ดูรายละเอียด <i class="fas fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

</body>
<script src="${pageContext.request.contextPath}/js/profile.js"></script>
</html>