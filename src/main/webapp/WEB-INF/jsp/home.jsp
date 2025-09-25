<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Swap - Home Feed</title>

    <!-- Aurora Glass Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aurora-theme.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        /* Home Feed specific styles */
        .home-container {
            min-height: 100vh;
            background: var(--bg-gradient);
            padding: var(--space-lg);
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--space-xl);
        }

        .welcome-info h1 {
            font-size: var(--font-3xl);
            font-weight: 700;
            color: var(--text-glass);
            text-shadow: 0 2px 4px rgba(255, 255, 255, 0.8);
            margin-bottom: var(--space-xs);
        }

        .welcome-info p {
            font-size: var(--font-base);
            color: var(--text-glass-secondary);
            font-weight: 500;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: var(--space-md);
            padding: var(--space-md) var(--space-lg);
            background: var(--glass-bg-strong);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-lg);
            backdrop-filter: var(--blur-strength);
        }

        .user-avatar {
            width: 50px;
            height: 50px;
            background: var(--button-gradient);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-white);
            font-size: 20px;
        }

        .user-name {
            font-size: var(--font-base);
            font-weight: 600;
            color: var(--text-glass);
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
        }

        /* Search and Filter Section */
        .search-filter-section {
            margin-bottom: var(--space-xl);
        }

        .search-bar {
            display: flex;
            gap: var(--space-md);
            margin-bottom: var(--space-lg);
        }

        .search-input-group {
            flex: 1;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: var(--space-md) var(--space-md) var(--space-md) 50px;
            background: var(--glass-bg-strong);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-lg);
            font-size: var(--font-base);
            color: var(--text-glass);
            backdrop-filter: var(--blur-strength);
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .search-input:focus {
            border-color: var(--primary);
            box-shadow: var(--focus-ring);
            background: var(--glass-hover);
        }

        .search-icon {
            position: absolute;
            left: var(--space-md);
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-glass-secondary);
            font-size: 18px;
        }

        .search-button {
            padding: var(--space-md) var(--space-xl);
            white-space: nowrap;
        }

        .filter-row {
            display: flex;
            gap: var(--space-md);
            flex-wrap: wrap;
        }

        .filter-select {
            padding: var(--space-sm) var(--space-md);
            background: var(--glass-bg-strong);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-md);
            color: var(--text-glass);
            backdrop-filter: var(--blur-strength);
            font-size: var(--font-sm);
            min-width: 150px;
        }

        .clear-filters {
            padding: var(--space-sm) var(--space-md);
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            border-radius: var(--radius-md);
            color: var(--error);
            font-size: var(--font-sm);
            text-decoration: none;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .clear-filters:hover {
            background: rgba(239, 68, 68, 0.2);
            text-decoration: none;
        }

        /* Feed Section */
        .feed-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--space-lg);
        }

        .feed-title {
            font-size: var(--font-2xl);
            font-weight: 600;
            color: var(--text-glass);
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
        }

        .add-skill-button {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-lg);
            background: var(--button-gradient);
            color: var(--text-white);
            border: none;
            border-radius: var(--radius-md);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 600;
            transition: all var(--duration-normal) var(--smooth-easing);
            box-shadow: 0 4px 16px rgba(0, 122, 255, 0.3);
        }

        .add-skill-button:hover {
            transform: var(--hover-lift);
            box-shadow: 0 8px 32px rgba(0, 122, 255, 0.4);
            text-decoration: none;
            color: var(--text-white);
        }

        /* Skill Offers Grid */
        .skill-offers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: var(--space-lg);
            margin-bottom: var(--space-2xl);
        }

        .skill-offer-card {
            padding: var(--space-lg);
            transition: all var(--duration-normal) var(--smooth-easing);
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .skill-offer-card:hover {
            transform: var(--hover-lift);
            box-shadow: var(--glass-shadow-strong);
        }

        .skill-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--space-md);
        }

        .skill-category {
            padding: var(--space-xs) var(--space-sm);
            background: rgba(0, 122, 255, 0.15);
            color: var(--primary);
            border-radius: var(--radius-sm);
            font-size: var(--font-xs);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .skill-date {
            font-size: var(--font-xs);
            color: var(--text-glass-secondary);
            opacity: 0.8;
        }

        .skill-title {
            font-size: var(--font-xl);
            font-weight: 600;
            color: var(--text-glass);
            margin-bottom: var(--space-sm);
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
            line-height: 1.3;
        }

        .skill-description {
            font-size: var(--font-sm);
            color: var(--text-glass-secondary);
            line-height: 1.5;
            margin-bottom: var(--space-md);
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .skill-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: auto;
        }

        .skill-user {
            display: flex;
            align-items: center;
            gap: var(--space-sm);
        }

        .skill-user-avatar {
            width: 32px;
            height: 32px;
            background: var(--accent);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-white);
            font-size: 14px;
        }

        .skill-username {
            font-size: var(--font-sm);
            font-weight: 500;
            color: var(--text-glass);
        }

        .skill-location {
            display: flex;
            align-items: center;
            gap: var(--space-xs);
            font-size: var(--font-xs);
            color: var(--text-glass-secondary);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: var(--space-2xl);
            color: var(--text-glass-secondary);
        }

        .empty-state i {
            font-size: 64px;
            margin-bottom: var(--space-lg);
            opacity: 0.5;
        }

        .empty-state h3 {
            font-size: var(--font-xl);
            margin-bottom: var(--space-md);
            color: var(--text-glass);
        }

        /* Logout Section */
        .logout-section {
            text-align: center;
            padding: var(--space-lg);
            border-top: 1px solid var(--glass-border);
        }

        .logout-button {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-lg);
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            border-radius: var(--radius-md);
            color: var(--error);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 600;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .logout-button:hover {
            background: rgba(239, 68, 68, 0.2);
            transform: var(--hover-lift);
            text-decoration: none;
            color: var(--error);
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .header-section {
                flex-direction: column;
                gap: var(--space-md);
                text-align: center;
            }

            .search-bar {
                flex-direction: column;
            }

            .filter-row {
                justify-content: center;
            }

            .skill-offers-grid {
                grid-template-columns: 1fr;
                gap: var(--space-md);
            }

            .feed-header {
                flex-direction: column;
                gap: var(--space-md);
                text-align: center;
            }
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

    <!-- Main Container -->
    <div class="home-container">
        <div style="max-width: 1200px; margin: 0 auto;">

            <!-- Header Section -->
            <div class="header-section">
                <div class="welcome-info">
                    <h1><i class="fas fa-home"></i> Skill Swap Feed</h1>
                    <p>ค้นหาและแลกเปลี่ยนทักษะกับชุมชนของเรา</p>
                </div>

                <div class="user-profile">
                    <div class="user-avatar">
                        <i class="fas fa-user"></i>
                    </div>
                    <div>
                        <div class="user-name">${sessionScope.user.username}</div>
                        <a href="doLogout" style="font-size: 12px; color: var(--error); text-decoration: none;">
                            <i class="fas fa-sign-out-alt"></i> ออกจากระบบ
                        </a>
                    </div>
                </div>
            </div>

            <!-- Search and Filter Section -->
            <div class="glass-card search-filter-section">
                <form method="GET" action="home">
                    <div class="search-bar">
                        <div class="search-input-group">
                            <i class="fas fa-search search-icon"></i>
                            <input type="text"
                                   name="search"
                                   class="search-input"
                                   placeholder="ค้นหาทักษะที่สนใจ... เช่น Programming, Design, Marketing"
                                   value="${searchQuery}">
                        </div>
                        <button type="submit" class="btn btn-primary search-button">
                            <i class="fas fa-search"></i>
                            ค้นหา
                        </button>
                    </div>

                    <div class="filter-row">
                        <select name="categoryId" class="filter-select">
                            <option value="">หมวดหมู่ทั้งหมด</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}" ${selectedCategoryId == category.id ? 'selected' : ''}>
                                    ${category.categoryName}
                                </option>
                            </c:forEach>
                        </select>

                        <input type="text"
                               name="location"
                               class="filter-select"
                               placeholder="สถานที่"
                               value="${selectedLocation}"
                               style="min-width: 120px;">

                        <c:if test="${not empty searchQuery or not empty selectedLocation or not empty selectedCategoryId}">
                            <a href="home" class="clear-filters">
                                <i class="fas fa-times"></i>
                                ล้างตัวกรอง
                            </a>
                        </c:if>

                        <button type="submit" class="btn btn-glass" style="padding: var(--space-sm) var(--space-md);">
                            <i class="fas fa-filter"></i>
                            กรอง
                        </button>
                    </div>
                </form>
            </div>

            <!-- Feed Header -->
            <div class="feed-header">
                <h2 class="feed-title">
                    <c:choose>
                        <c:when test="${not empty searchQuery}">
                            ผลการค้นหา "${searchQuery}"
                        </c:when>
                        <c:when test="${not empty selectedLocation}">
                            ทักษะใน ${selectedLocation}
                        </c:when>
                        <c:otherwise>
                            ทักษะล่าสุด
                        </c:otherwise>
                    </c:choose>
                    <span style="font-size: var(--font-base); font-weight: normal; opacity: 0.7;">
                        (${skillOffers != null ? skillOffers.size() : 0} รายการ)
                    </span>
                </h2>

                <a href="add-skill" class="add-skill-button">
                    <i class="fas fa-plus-circle"></i>
                    แชร์ทักษะของคุณ
                </a>
            </div>

            <!-- Skill Offers Grid -->
            <c:choose>
                <c:when test="${not empty skillOffers}">
                    <div class="skill-offers-grid">
                        <c:forEach var="offer" items="${skillOffers}">
                            <div class="glass-card skill-offer-card">
                                <div class="skill-header">
                                    <span class="skill-category">
                                        <c:choose>
                                            <c:when test="${not empty offer.skill and not empty offer.skill.category}">
                                                ${offer.skill.category.categoryName}
                                            </c:when>
                                            <c:otherwise>ไม่ระบุหมวดหมู่</c:otherwise>
                                        </c:choose>
                                    </span>
                                    <span class="skill-date">
                                        <c:if test="${not empty offer.createdAt}">
                                            ${offer.createdAt.dayOfMonth}
                                            ${offer.createdAt.month.toString().substring(0,3).toLowerCase()}
                                            ${offer.createdAt.year}
                                        </c:if>
                                    </span>
                                </div>

                                <h3 class="skill-title">
                                    <c:out value="${not empty offer.title ? offer.title : 'ไม่มีชื่อ'}"/>
                                </h3>

                                <p class="skill-description">
                                    <c:out value="${not empty offer.description ? offer.description : 'ไม่มีรายละเอียด'}"/>
                                </p>

                                <div class="skill-footer">
                                    <div class="skill-user">
                                        <div class="skill-user-avatar">
                                            <c:choose>
                                                <c:when test="${not empty offer.user and not empty offer.user.username}">
                                                    ${offer.user.username.substring(0,1).toUpperCase()}
                                                </c:when>
                                                <c:otherwise>?</c:otherwise>
                                            </c:choose>
                                        </div>
                                        <span class="skill-username">
                                            <c:out value="${not empty offer.user.username ? offer.user.username : 'ไม่ระบุผู้ใช้'}"/>
                                        </span>
                                    </div>

                                    <c:if test="${not empty offer.location}">
                                        <div class="skill-location">
                                            <i class="fas fa-map-marker-alt"></i>
                                            <c:out value="${offer.location}"/>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="glass-card empty-state">
                        <i class="fas fa-search"></i>
                        <h3>ไม่พบทักษะที่ค้นหา</h3>
                        <p>ลองเปลี่ยนคำค้นหาหรือตัวกรองดู หรือ <a href="add-skill" style="color: var(--primary);">แชร์ทักษะแรกของคุณ</a></p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script>
        // Enhanced search functionality
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.querySelector('.search-input');
            const filterSelects = document.querySelectorAll('.filter-select');

            // Auto-submit on filter change
            filterSelects.forEach(select => {
                select.addEventListener('change', function() {
                    this.closest('form').submit();
                });
            });

            // Search suggestions (future enhancement)
            searchInput.addEventListener('input', function() {
                // Future: Add search suggestions
            });

            // Card click handlers
            const skillCards = document.querySelectorAll('.skill-offer-card');
            skillCards.forEach(card => {
                card.addEventListener('click', function() {
                    // Future: Navigate to skill detail page
                    console.log('Navigate to skill details');
                });
            });

            // Console branding
            console.log('%c🚀 Skill Swap Feed', 'color: #007AFF; font-size: 16px; font-weight: bold;');
            console.log('%cAurora Glass Theme System', 'color: #5856D6; font-size: 12px;');
            console.log('%c✨ Welcome to the Feed!', 'color: #32D74B; font-size: 14px;');
        });
    </script>
</body>
</html>