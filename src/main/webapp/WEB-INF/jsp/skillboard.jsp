<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JobBoard - Skill Swap</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/skillboard.css">
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
				<a href="jobboard" class="navbar-link nav-board active">
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
				<a href="profile" class="navbar-link nav-profile">
					<i class="fas fa-user"></i>
					Profile
				</a>
			</div>
		</div>
	</nav>

	<!-- Enhanced Floating Background Elements -->
	<div class="floating-particles">
		<div class="particle" style="top: 20%; left: 10%; width: 60px; height: 60px; background: var(--primary); border-radius: 50%; animation: floatParticle 20s ease-in-out infinite;"></div>
		<div class="particle" style="top: 60%; right: 15%; width: 40px; height: 40px; background: var(--secondary); transform: rotate(45deg); animation: floatParticle 25s ease-in-out infinite reverse;"></div>
		<div class="particle" style="bottom: 30%; left: 20%; width: 0; height: 0; border-left: 25px solid transparent; border-right: 25px solid transparent; border-bottom: 43px solid var(--accent); animation: floatParticle 30s ease-in-out infinite;"></div>
		<div class="particle" style="top: 80%; right: 30%; width: 50px; height: 50px; background: var(--success); border-radius: 20%; animation: floatParticle 35s ease-in-out infinite reverse;"></div>
		<div class="particle" style="top: 15%; right: 45%; width: 35px; height: 35px; background: var(--warning); border-radius: 30%; animation: floatParticle 28s ease-in-out infinite;"></div>
	</div>

	<div class="home-container">
		<div style="max-width: 1200px; margin: 0 auto;">

			<!-- Enhanced Header Section -->
			<div class="header-section">
				<div class="welcome-info">
					<h1>
						<i class="fas fa-clipboard-list" style="color: var(--primary); margin-right: 15px; font-size: 2.2rem;"></i>
						SkillBoard
					</h1>
					<p>ค้นพบและสำรวจทักษะทั้งหมดในระบบ พร้อมรายละเอียดครบถ้วน</p>
				</div>
			</div>

			<!-- Premium Search & Filter Section -->
			<div class="search-filter-section">
				<form method="GET" action="jobboard">
					<!-- Enhanced Search Bar -->
					<div class="search-bar">
						<div class="search-input-group">
							<input type="text" name="search" class="search-input"
								placeholder="ค้นหาทักษะที่คุณสนใจ เช่น Programming, Design, Photography..."
								value="${searchQuery}">
							<i class="fas fa-search search-icon"></i>
						</div>
						<button type="submit" class="search-button">
							<i class="fas fa-search"></i> ค้นหา
						</button>
					</div>

					<!-- Enhanced Filter Section -->
					<div class="filter-section-header">
						<i class="fas fa-sliders-h"></i>
						<span>กรองผลลัพธ์</span>
					</div>
					
					<div class="filter-row">
						<!-- Premium Category Filter -->
						<div class="custom-select-wrapper">
							<i class="fas fa-tags category-icon"></i>
							<select name="categoryId" class="filter-select">
								<option value="">หมวดหมู่ทั้งหมด</option>
								<c:forEach var="category" items="${categories}">
									<option value="${category.id}"
										${selectedCategoryId == category.id ? 'selected' : ''}>
										${category.categoryName}
									</option>
								</c:forEach>
							</select>
							<div class="dropdown-arrow"></div>
						</div>

						<!-- Enhanced Filter Button -->
						<button type="submit" class="filter-button">
							<i class="fas fa-filter"></i> กรอง
						</button>
						
						<!-- Clear Filter Button -->
						<c:if test="${not empty searchQuery or not empty selectedCategoryId}">
							<a href="jobboard" class="clear-filters">
								<i class="fas fa-times"></i> ล้างตัวกรอง
							</a>
						</c:if>
					</div>
				</form>
			</div>

			<!-- Enhanced Feed Header -->
			<div class="feed-header">
				<h2 class="feed-title">
					<i class="fas fa-briefcase" style="margin-right: 12px; color: var(--accent);"></i>
					<c:choose>
						<c:when test="${not empty searchQuery}">
							ผลการค้นหา "${searchQuery}"
						</c:when>
						<c:when test="${not empty selectedCategoryId}">
							หมวดหมู่ที่เลือก
						</c:when>
						<c:otherwise>
							ทักษะทั้งหมดในระบบ
						</c:otherwise>
					</c:choose>
					<c:if test="${not empty skillOffers}">
						<span style="font-size: var(--font-base); font-weight: 500; color: var(--text-secondary); margin-left: 12px;">
							(${skillOffers.size()} รายการ)
						</span>
					</c:if>
				</h2>
			</div>

			<!-- Enhanced Skill Offers Grid -->
			<div class="skill-offers-grid">
				<c:choose>
					<c:when test="${not empty skillOffers}">
						<c:forEach var="offer" items="${skillOffers}" varStatus="status">
							<div class="glass-card skill-offer-card" style="animation-delay: ${status.index * 0.1}s;">
								<div class="skill-header">
									<div class="skill-category">
										<i class="fas fa-tag"></i>
										<c:out value="${not empty offer.categoryName ? offer.categoryName : 'ไม่ระบุหมวดหมู่'}" />
									</div>
									<div class="skill-date">
										<i class="fas fa-calendar-alt" style="margin-right: 4px; opacity: 0.7;"></i>
										<c:if test="${not empty offer.createdAt}">
											${offer.createdAt.dayOfMonth}
											${offer.createdAt.month.toString().substring(0,3).toLowerCase()}
											${offer.createdAt.year}
										</c:if>
									</div>
								</div>

								<h3 class="skill-title">
									<c:out value="${offer.title}" />
								</h3>
								
								<p class="skill-description">
									<c:out value="${offer.description}" />
								</p>

								<div class="skill-footer">
									<div class="skill-user">
										<div class="skill-user-avatar">
											${offer.userName.substring(0,1).toUpperCase()}
										</div>
										<div>
											<div class="skill-username">
												<c:choose>
													<c:when test="${offer.userId != null}">
														<a href="user-profile?userId=${offer.userId}" style="color: inherit; text-decoration: none; transition: color 0.3s;" onmouseover="this.style.color='var(--primary)'" onmouseout="this.style.color='inherit'">
															<c:out value="${offer.userName}" />
														</a>
													</c:when>
													<c:otherwise>
														<c:out value="${offer.userName}" />
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>

									<c:if test="${not empty offer.location}">
										<div class="skill-location">
											<i class="fas fa-map-marker-alt"></i>
											<c:out value="${offer.location}" />
										</div>
									</c:if>
								</div>

								<!-- Enhanced Detail Button -->
								<div class="skill-actions">
									<a href="skill?id=${offer.id}" class="detail-button">
										<span>ดูรายละเอียด</span>
										<i class="fas fa-arrow-right"></i>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="glass-card empty-state">
							<i class="fas fa-search-minus"></i>
							<h3>ไม่พบทักษะที่คุณค้นหา</h3>
							<p>ลองเปลี่ยนคำค้นหาหรือเลือกหมวดหมู่อื่น หรือเป็นคนแรกที่เพิ่มทักษะใหม่!</p>
							<div class="empty-state-actions">
								<a href="add-skill" class="add-skill-button">
									<i class="fas fa-plus"></i>
									เพิ่มทักษะของคุณ
								</a>
								<a href="jobboard" class="secondary-button">
									<i class="fas fa-refresh"></i>
									ดูทั้งหมด
								</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/js/skillboard.js"></script>
</body>
</html>
