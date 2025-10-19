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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/matches.css">
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
                <a href="matches" class="navbar-link nav-matches active">
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
    <div class="matches-container">
        <!-- Header Section -->
        <div class="header-section">
            <div class="header-title">
                <h1><i class="fas fa-handshake"></i> Matches</h1>
                <p>จัดการคำขอ Skill Swap และดูประวัติการแลกเปลี่ยน</p>
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

                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <div class="stat-number">${learningCount}</div>
                    <div class="stat-label">กำลังเรียนรู้</div>
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
                    <a href="?tab=learning" class="tab-button ${activeTab == 'learning' ? 'active' : ''}">
                        <i class="fas fa-graduation-cap"></i>
                        กำลังเรียน
                        <c:if test="${learningCount > 0}">
                            <span style="background: var(--success); color: white; border-radius: 50%; width: 20px; height: 20px; display: flex; align-items: center; justify-content: center; font-size: 0.75rem;">${learningCount}</span>
                        </c:if>
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
                                                <h3>คำขอจาก
                                                    <c:choose>
                                                        <c:when test="${request.requester.id != null}">
                                                            <a href="user-profile?userId=${request.requester.id}" style="color: inherit; text-decoration: none; transition: color 0.3s;" onmouseover="this.style.color='var(--primary)'" onmouseout="this.style.color='inherit'">${request.requester.username}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${request.requester.username}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </h3>
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
                                                <h3>ส่งคำขอไปยัง
                                                    <c:choose>
                                                        <c:when test="${request.requestedSkill.user.id != null}">
                                                            <a href="user-profile?userId=${request.requestedSkill.user.id}" style="color: inherit; text-decoration: none; transition: color 0.3s;" onmouseover="this.style.color='var(--primary)'" onmouseout="this.style.color='inherit'">${request.requestedSkill.user.username}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${request.requestedSkill.user.username}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </h3>
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

                    <!-- My Learning Tab -->
                    <c:if test="${activeTab == 'learning'}">
                        <c:choose>
                            <c:when test="${not empty myLearning}">
                                <div class="requests-grid">
                                    <c:forEach var="match" items="${myLearning}">
                                        <div class="request-card">
                                            <div class="request-header">
                                                <h3>
                                                    <c:choose>
                                                        <c:when test="${match.offerer.id == user.id}">
                                                            เรียนกับ
                                                            <a href="user-profile?userId=${match.requester.id}" style="color: inherit; text-decoration: none; transition: color 0.3s;" onmouseover="this.style.color='var(--primary)'" onmouseout="this.style.color='inherit'">${match.requester.username}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            เรียนกับ
                                                            <a href="user-profile?userId=${match.offerer.id}" style="color: inherit; text-decoration: none; transition: color 0.3s;" onmouseover="this.style.color='var(--primary)'" onmouseout="this.style.color='inherit'">${match.offerer.username}</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </h3>
                                                <div class="request-status status-${match.status.toLowerCase().replace('_', '_')}">
                                                    <c:choose>
                                                        <c:when test="${match.status == 'MATCHED'}">
                                                            <i class="fas fa-handshake"></i> จับคู่แล้ว
                                                        </c:when>
                                                        <c:when test="${match.status == 'IN_PROGRESS'}">
                                                            <i class="fas fa-book-reader"></i> กำลังเรียน
                                                        </c:when>
                                                        <c:when test="${match.status == 'COMPLETED'}">
                                                            <i class="fas fa-check-circle"></i> เสร็จสิ้น
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="fas fa-ban"></i> ${match.status}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>

                                            <div class="request-skills">
                                                <div class="skill-card">
                                                    <h4 class="skill-title">${match.offerSkill.title}</h4>
                                                    <div class="skill-meta">
                                                        <div>${match.offerSkill.skill.category.categoryName}</div>
                                                        <div>Level: ${match.offerSkill.level}</div>
                                                        <small>สอนโดย ${match.offerer.username}</small>
                                                    </div>
                                                </div>
                                                <div class="swap-arrow">
                                                    <i class="fas fa-exchange-alt"></i>
                                                </div>
                                                <div class="skill-card">
                                                    <h4 class="skill-title">${match.requestSkill.title}</h4>
                                                    <div class="skill-meta">
                                                        <div>${match.requestSkill.skill.category.categoryName}</div>
                                                        <div>Level: ${match.requestSkill.level}</div>
                                                        <small>สอนโดย ${match.requester.username}</small>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="request-meta">
                                                <span>
                                                    <i class="fas fa-calendar"></i>
                                                    เริ่ม: ${match.createdAt.dayOfMonth} ${match.createdAt.month.toString().substring(0,3).toLowerCase()} ${match.createdAt.year}
                                                </span>
                                                <c:if test="${match.updatedAt != null}">
                                                    <span>
                                                        <i class="fas fa-clock"></i>
                                                        อัปเดต: ${match.updatedAt.dayOfMonth}/${match.updatedAt.monthValue}
                                                    </span>
                                                </c:if>
                                            </div>

                                            <div class="request-actions">
                                                <c:choose>
                                                    <c:when test="${match.status == 'MATCHED'}">
                                                        <form method="post" action="start-learning" style="display: inline;">
                                                            <input type="hidden" name="matchId" value="${match.id}">
                                                            <button type="submit" class="btn-action btn-start">
                                                                <i class="fas fa-play"></i> เริ่มเรียน
                                                            </button>
                                                        </form>
                                                    </c:when>
                                                    <c:when test="${match.status == 'IN_PROGRESS'}">
                                                        <form method="post" action="complete-learning" style="display: inline;">
                                                            <input type="hidden" name="matchId" value="${match.id}">
                                                            <button type="submit" class="btn-action btn-complete">
                                                                <i class="fas fa-check"></i> สิ้นสุดการเรียน
                                                            </button>
                                                        </form>
                                                    </c:when>
                                                    <c:when test="${match.status == 'COMPLETED'}">
                                                        <c:choose>
                                                            <c:when test="${match.offerer.id == user.id}">
                                                                <a href="rating/give?userId=${match.requester.id}&matchId=${match.id}" class="btn-action btn-review">
                                                                    <i class="fas fa-star"></i> ให้คะแนน ${match.requester.username}
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="rating/give?userId=${match.offerer.id}&matchId=${match.id}" class="btn-action btn-review">
                                                                    <i class="fas fa-star"></i> ให้คะแนน ${match.offerer.username}
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="empty-state">
                                    <div class="empty-icon">
                                        <i class="fas fa-graduation-cap"></i>
                                    </div>
                                    <h3 class="empty-title">ยังไม่มีการแลกเปลี่ยนที่เริ่มแล้ว</h3>
                                    <p class="empty-description">
                                        เมื่อคุณยอมรับคำขอแลกเปลี่ยน จะปรากฏที่นี่เพื่อให้คุณติดตามการเรียนรู้
                                    </p>
                                    <a href="?tab=received" class="action-button btn-primary">
                                        <i class="fas fa-inbox"></i>
                                        ดูคำขอที่ได้รับ
                                    </a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

</body>
<script src="${pageContext.request.contextPath}/js/matches.js"></script>
</html>