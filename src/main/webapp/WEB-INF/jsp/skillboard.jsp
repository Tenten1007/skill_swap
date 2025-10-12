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
</head>
<body>
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
				
				<!-- Enhanced Navigation Actions -->
				<div class="user-section">
					<div class="action-buttons">
						<a href="home" class="action-button home-btn">
							<i class="fas fa-home"></i>
							<span>หน้าแรก</span>
						</a>
						<a href="add-skill" class="action-button add-skill-btn">
							<i class="fas fa-plus"></i>
							<span>เพิ่มสกิล</span>
						</a>
					</div>
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
												<c:out value="${offer.userName}" />
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

	<style>
		/* Enhanced Color Palette and Variables */
		:root {
			--primary: #6366F1;
			--primary-hover: #4F46E5;
			--secondary: #8B5CF6;
			--accent: #06B6D4;
			--success: #10B981;
			--warning: #F59E0B;
			--error: #EF4444;
			--button-gradient: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
			
			--text-primary: #FFFFFF;
			--text-secondary: rgba(255, 255, 255, 0.8);
			--text-muted: rgba(255, 255, 255, 0.6);
			
			--hover-lift: translateY(-2px);
			--spring-easing: cubic-bezier(0.175, 0.885, 0.32, 1.275);
			--smooth-easing: cubic-bezier(0.4, 0, 0.2, 1);
			--duration-normal: 0.3s;
			
			--space-xs: 4px; --space-sm: 8px; --space-md: 16px; 
			--space-lg: 24px; --space-xl: 32px; --space-2xl: 48px;
			
			--radius-sm: 8px; --radius-md: 12px; --radius-lg: 16px; 
			--radius-xl: 20px; --radius-full: 50%;
			
			--font-xs: 0.75rem; --font-sm: 0.875rem; --font-base: 1rem; 
			--font-lg: 1.125rem; --font-xl: 1.25rem; --font-2xl: 1.5rem; 
			--font-3xl: 1.875rem;
		}

		/* Enhanced Body and Background */
		body {
			margin: 0;
			font-family: 'Inter', 'SF Pro Display', -apple-system, BlinkMacSystemFont, sans-serif;
			background: linear-gradient(-45deg, #0f0f23 0%, #1a1a2e 25%, #16213e 50%, #0f3460 75%, #533483 100%);
			background-size: 400% 400%;
			animation: gradientShift 15s ease infinite;
			min-height: 100vh;
			color: #ffffff;
			overflow-x: hidden;
		}

		@keyframes gradientShift {
			0% { background-position: 0% 50%; }
			50% { background-position: 100% 50%; }
			100% { background-position: 0% 50%; }
		}

		/* Enhanced Floating Particles */
		.floating-particles {
			position: fixed;
			top: 0; left: 0; width: 100%; height: 100%;
			pointer-events: none; z-index: 1;
		}

		.particle {
			position: absolute;
			opacity: 0.15;
		}

		@keyframes floatParticle {
			0%, 100% {
				transform: translateY(0px) rotate(0deg);
				opacity: 0.1;
			}
			25% {
				transform: translateY(-20px) rotate(90deg);
				opacity: 0.2;
			}
			50% {
				transform: translateY(-10px) rotate(180deg);
				opacity: 0.15;
			}
			75% {
				transform: translateY(-25px) rotate(270deg);
				opacity: 0.25;
			}
		}

		/* Enhanced Container */
		.home-container {
			min-height: 100vh;
			padding: var(--space-lg);
			position: relative;
			z-index: 2;
		}

		/* Enhanced Header Section */
		.header-section {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin-bottom: var(--space-xl);
			padding: var(--space-lg);
			background: linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 100%);
			border: 2px solid rgba(255, 255, 255, 0.2);
			border-radius: var(--radius-xl);
			backdrop-filter: blur(40px);
			box-shadow: 0 25px 80px rgba(0, 0, 0, 0.1), inset 0 1px 0 rgba(255, 255, 255, 0.2);
			animation: slideInFromTop 0.8s ease-out;
		}

		@keyframes slideInFromTop {
			0% { opacity: 0; transform: translateY(-30px); }
			100% { opacity: 1; transform: translateY(0); }
		}

		.welcome-info h1 {
			font-size: var(--font-3xl);
			font-weight: 700;
			background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 30%, var(--accent) 60%, var(--success) 100%);
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
			background-clip: text;
			background-size: 200% 200%;
			margin-bottom: var(--space-xs);
			animation: textGradientShift 4s ease-in-out infinite;
			letter-spacing: -0.02em;
		}

		@keyframes textGradientShift {
			0%, 100% { background-position: 0% 50%; filter: hue-rotate(0deg); }
			50% { background-position: 100% 50%; filter: hue-rotate(20deg); }
		}

		.welcome-info p {
			font-size: var(--font-base);
			color: var(--text-secondary);
			font-weight: 500;
		}

		/* Enhanced Action Buttons */
		.user-section {
			display: flex;
			flex-direction: column;
			gap: var(--space-sm);
			align-items: flex-end;
		}

		.action-buttons {
			display: flex;
			gap: var(--space-sm);
			flex-wrap: wrap;
		}

		.action-button {
			display: inline-flex;
			align-items: center;
			gap: var(--space-xs);
			padding: var(--space-sm) var(--space-md);
			border-radius: var(--radius-md);
			font-size: var(--font-sm);
			font-weight: 600;
			text-decoration: none;
			transition: all var(--duration-normal) var(--smooth-easing);
			position: relative;
			overflow: hidden;
			backdrop-filter: blur(20px);
			border: 1px solid;
		}

		.home-btn {
			background: rgba(16, 185, 129, 0.1);
			border-color: rgba(16, 185, 129, 0.3);
			color: var(--success);
		}

		.add-skill-btn {
			background: var(--button-gradient);
			border-color: var(--primary);
			color: var(--text-white);
		}

		.action-button:hover {
			transform: translateY(-2px) scale(1.05);
			text-decoration: none;
		}

		.home-btn:hover {
			background: rgba(16, 185, 129, 0.2);
			box-shadow: 0 8px 25px rgba(16, 185, 129, 0.3);
			color: var(--success);
		}

		.add-skill-btn:hover {
			box-shadow: 0 8px 25px rgba(99, 102, 241, 0.4);
			color: var(--text-white);
		}

		/* Enhanced Search Filter Section */
		.search-filter-section {
			margin-bottom: var(--space-xl);
			padding: var(--space-xl);
			background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.05) 100%);
			border: 1px solid rgba(255, 255, 255, 0.2);
			border-radius: var(--radius-xl);
			backdrop-filter: blur(40px);
			box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
			animation: slideInFromLeft 0.8s ease-out 0.2s both;
		}

		@keyframes slideInFromLeft {
			0% { opacity: 0; transform: translateX(-50px); }
			100% { opacity: 1; transform: translateX(0); }
		}

		.search-bar {
			display: flex;
			gap: var(--space-lg);
			margin-bottom: var(--space-xl);
		}

		.search-input-group {
			flex: 1;
			position: relative;
			border-radius: var(--radius-xl);
		}

		.search-input {
			width: 80%;
			padding: var(--space-lg) var(--space-lg) var(--space-lg) 60px;
			background: rgba(255, 255, 255, 0.1);
			border: 2px solid rgba(255, 255, 255, 0.2);
			border-radius: var(--radius-xl);
			font-size: var(--font-lg);
			font-weight: 500;
			color: #ffffff;
			backdrop-filter: blur(20px);
			transition: all var(--duration-normal) var(--smooth-easing);
			letter-spacing: 0.02em;
		}

		.search-input::placeholder {
			color: rgba(255, 255, 255, 0.6);
			font-weight: 400;
		}

		.search-input:focus {
			border-color: var(--primary);
			background: rgba(255, 255, 255, 0.15);
			box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.2), 0 20px 40px rgba(0, 0, 0, 0.15);
			transform: translateY(-2px);
			outline: none;
		}

		.search-icon {
			position: absolute;
			left: var(--space-lg);
			top: 50%;
			transform: translateY(-50%);
			color: rgba(255, 255, 255, 0.7);
			font-size: 20px;
			z-index: 3;
			transition: all var(--duration-normal) var(--smooth-easing);
		}

		.search-input:focus + .search-icon {
			color: var(--primary);
			transform: translateY(-50%) scale(1.1);
		}

		.search-button {
			padding: var(--space-lg) var(--space-2xl);
			background: var(--button-gradient);
			border: none;
			border-radius: var(--radius-xl);
			color: var(--text-white);
			font-size: var(--font-base);
			font-weight: 600;
			white-space: nowrap;
			cursor: pointer;
			transition: all var(--duration-normal) var(--smooth-easing);
			box-shadow: 0 10px 30px rgba(99, 102, 241, 0.3);
		}

		.search-button:hover {
			transform: translateY(-3px) scale(1.05);
			box-shadow: 0 15px 40px rgba(99, 102, 241, 0.4);
		}

		.filter-section-header {
			display: flex;
			align-items: center;
			gap: var(--space-sm);
			margin-bottom: var(--space-md);
			font-size: var(--font-sm);
			font-weight: 600;
			color: var(--text-secondary);
			text-transform: uppercase;
			letter-spacing: 0.1em;
		}

		.filter-row {
			display: grid;
			grid-template-columns: 1fr auto auto;
			gap: var(--space-lg);
			align-items: center;
		}

		/* Premium Category Dropdown */
		.custom-select-wrapper {
			position: relative;
			border-radius: var(--radius-xl);
			background: linear-gradient(135deg, rgba(99, 102, 241, 0.08) 0%, rgba(139, 92, 246, 0.06) 50%, rgba(6, 182, 212, 0.04) 100%);
			backdrop-filter: blur(40px);
			box-shadow: 0 10px 30px rgba(99, 102, 241, 0.15);
			transition: all var(--duration-normal) var(--spring-easing);
		}

		.custom-select-wrapper:hover {
			transform: translateY(-4px) scale(1.02);
			box-shadow: 0 20px 50px rgba(99, 102, 241, 0.25);
		}

		.category-icon {
			position: absolute;
			left: var(--space-lg);
			top: 50%;
			transform: translateY(-50%);
			font-size: 18px;
			color: rgba(255, 255, 255, 0.8);
			z-index: 6;
			transition: all var(--duration-normal) var(--smooth-easing);
		}

		.filter-select {
			width: 100%;
			padding: var(--space-lg) 60px var(--space-lg) 55px;
			background: transparent;
			border: none;
			border-radius: var(--radius-xl);
			color: #ffffff;
			font-size: var(--font-base);
			font-weight: 600;
			cursor: pointer;
			appearance: none;
			z-index: 5;
		}

		.filter-select:focus {
			outline: none;
			color: var(--primary);
		}

		.dropdown-arrow {
			position: absolute;
			right: var(--space-lg);
			top: 50%;
			width: 12px;
			height: 12px;
			pointer-events: none;
			z-index: 6;
			transform: translateY(-50%);
		}

		.dropdown-arrow::before, .dropdown-arrow::after {
			content: '';
			position: absolute;
			width: 8px;
			height: 2px;
			background: rgba(255, 255, 255, 0.7);
			border-radius: 2px;
			transition: all var(--duration-normal) var(--smooth-easing);
		}

		.dropdown-arrow::before {
			transform: rotate(45deg) translate(2px, 2px);
		}

		.dropdown-arrow::after {
			transform: rotate(-45deg) translate(-2px, 2px);
		}

		/* Enhanced Buttons */
		.filter-button, .clear-filters {
			display: inline-flex;
			align-items: center;
			gap: var(--space-xs);
			padding: var(--space-md) var(--space-lg);
			border-radius: var(--radius-lg);
			font-size: var(--font-sm);
			font-weight: 600;
			text-decoration: none;
			transition: all var(--duration-normal) var(--smooth-easing);
			backdrop-filter: blur(20px);
			border: 2px solid;
			cursor: pointer;
		}

		.filter-button {
			background: linear-gradient(135deg, rgba(99, 102, 241, 0.2) 0%, rgba(139, 92, 246, 0.2) 100%);
			border-color: rgba(99, 102, 241, 0.3);
			color: var(--primary);
		}

		.clear-filters {
			background: linear-gradient(135deg, rgba(239, 68, 68, 0.2) 0%, rgba(220, 38, 38, 0.2) 100%);
			border-color: rgba(239, 68, 68, 0.3);
			color: #ff6b6b;
		}

		.filter-button:hover, .clear-filters:hover {
			transform: translateY(-2px) scale(1.05);
			text-decoration: none;
		}

		.filter-button:hover {
			background: linear-gradient(135deg, rgba(99, 102, 241, 0.3) 0%, rgba(139, 92, 246, 0.3) 100%);
			box-shadow: 0 10px 25px rgba(99, 102, 241, 0.3);
		}

		.clear-filters:hover {
			background: linear-gradient(135deg, rgba(239, 68, 68, 0.3) 0%, rgba(220, 38, 38, 0.3) 100%);
			box-shadow: 0 10px 25px rgba(239, 68, 68, 0.3);
			color: #ff5252;
		}

		/* Feed Header */
		.feed-header {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin-bottom: var(--space-lg);
			flex-wrap: wrap;
			gap: var(--space-md);
		}

		.feed-title {
			font-size: var(--font-2xl);
			font-weight: 600;
			color: #ffffff;
			display: flex;
			align-items: center;
		}

		/* Enhanced Skill Cards Grid */
		.skill-offers-grid {
			display: grid;
			grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
			gap: var(--space-lg);
			position: relative;
		}

		.glass-card {
			background: linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 100%);
			border: 2px solid rgba(255, 255, 255, 0.2);
			border-radius: var(--radius-xl);
			backdrop-filter: blur(40px);
			box-shadow: 0 25px 80px rgba(0, 0, 0, 0.1), inset 0 1px 0 rgba(255, 255, 255, 0.2);
			animation: slideInUp 0.6s ease-out both;
		}

		@keyframes slideInUp {
			0% { opacity: 0; transform: translateY(50px); }
			100% { opacity: 1; transform: translateY(0); }
		}

		.skill-offer-card {
			padding: var(--space-lg);
			transition: all var(--duration-normal) var(--smooth-easing);
			cursor: pointer;
			position: relative;
			overflow: hidden;
			border-left: 4px solid transparent;
			display: flex;
			flex-direction: column;
		}

		.skill-offer-card:hover {
			transform: translateY(-8px) scale(1.02);
			box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
			border-left-color: var(--primary);
		}

		.skill-header {
			display: flex;
			justify-content: space-between;
			align-items: flex-start;
			margin-bottom: var(--space-md);
		}

		.skill-category {
			background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
			color: var(--text-white);
			padding: var(--space-xs) var(--space-sm);
			border-radius: var(--radius-sm);
			font-size: var(--font-xs);
			font-weight: 600;
			text-transform: uppercase;
			letter-spacing: 0.05em;
			display: inline-flex;
			align-items: center;
			gap: var(--space-xs);
			box-shadow: 0 2px 8px rgba(99, 102, 241, 0.3);
		}

		.skill-date {
			font-size: var(--font-xs);
			color: var(--text-muted);
			display: flex;
			align-items: center;
			gap: var(--space-xs);
		}

		.skill-title {
			font-size: var(--font-xl);
			font-weight: 700;
			color: #ffffff;
			margin-bottom: var(--space-md);
			line-height: 1.3;
		}

		.skill-description {
			font-size: var(--font-sm);
			color: var(--text-muted);
			line-height: 1.6;
			margin-bottom: var(--space-lg);
			display: -webkit-box;
			-webkit-line-clamp: 3;
			-webkit-box-orient: vertical;
			overflow: hidden;
		}

		.skill-footer {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin-bottom: var(--space-lg);
			padding-top: var(--space-md);
			border-top: 1px solid rgba(255, 255, 255, 0.1);
		}

		.skill-user {
			display: flex;
			align-items: center;
			gap: var(--space-sm);
		}

		.skill-user-avatar {
			width: 40px;
			height: 40px;
			background: var(--button-gradient);
			border-radius: var(--radius-full);
			display: flex;
			align-items: center;
			justify-content: center;
			font-size: var(--font-base);
			font-weight: 700;
			color: var(--text-primary);
			box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
		}

		.skill-username {
			font-size: var(--font-sm);
			font-weight: 600;
			color: var(--text-secondary);
		}

		.skill-location {
			display: flex;
			align-items: center;
			gap: var(--space-xs);
			font-size: var(--font-xs);
			color: var(--text-muted);
			padding: var(--space-xs) var(--space-sm);
			background: rgba(255, 255, 255, 0.05);
			border-radius: var(--radius-sm);
		}

		/* Enhanced Detail Button */
		.skill-actions {
			margin-top: auto;
			display: flex;
			padding-top: var(--space-md);
		}

		.detail-button {
			display: flex;
			align-items: center;
			justify-content: center;
			gap: var(--space-md);
			width: 100%;
			padding: var(--space-lg) var(--space-xl);
			background: var(--button-gradient);
			border: none;
			border-radius: var(--radius-lg);
			color: var(--text-primary);
			font-size: var(--font-base);
			font-weight: 700;
			text-decoration: none;
			cursor: pointer;
			position: relative;
			overflow: hidden;
			transition: all 0.4s var(--spring-easing);
			box-shadow: 0 8px 25px rgba(99, 102, 241, 0.4);
		}

		.detail-button::before {
			content: '';
			position: absolute;
			top: 0;
			left: -100%;
			width: 100%;
			height: 100%;
			background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
			transition: left 0.6s;
		}

		.detail-button:hover::before {
			left: 100%;
		}

		.detail-button:hover {
			transform: translateY(-4px) scale(1.03);
			box-shadow: 0 15px 45px rgba(99, 102, 241, 0.6);
			text-decoration: none;
			color: var(--text-primary);
		}

		.detail-button:active {
			transform: translateY(-2px) scale(1.01);
		}

		.detail-button i {
			font-size: var(--font-lg);
			transition: transform 0.3s var(--spring-easing);
		}

		.detail-button:hover i {
			transform: translateX(5px);
		}

		/* Empty State */
		.empty-state {
			text-align: center;
			padding: var(--space-2xl);
		}

		.empty-state i {
			font-size: 64px;
			color: var(--text-muted);
			margin-bottom: var(--space-lg);
		}

		.empty-state h3 {
			font-size: var(--font-2xl);
			margin-bottom: var(--space-md);
		}

		.empty-state p {
			color: var(--text-secondary);
			margin-bottom: var(--space-xl);
		}

		.empty-state-actions {
			display: flex;
			gap: var(--space-md);
			justify-content: center;
			flex-wrap: wrap;
		}

		.add-skill-button, .secondary-button {
			display: inline-flex;
			align-items: center;
			gap: var(--space-sm);
			padding: var(--space-md) var(--space-lg);
			border-radius: var(--radius-lg);
			font-size: var(--font-sm);
			font-weight: 600;
			text-decoration: none;
			transition: all var(--duration-normal) var(--smooth-easing);
		}

		.add-skill-button {
			background: var(--button-gradient);
			color: var(--text-primary);
			box-shadow: 0 8px 25px rgba(99, 102, 241, 0.3);
		}

		.secondary-button {
			background: rgba(255, 255, 255, 0.1);
			color: var(--text-secondary);
			border: 1px solid rgba(255, 255, 255, 0.2);
		}

		.add-skill-button:hover,  .secondary-button:hover {
			transform: translateY(-2px) scale(1.05);
			text-decoration: none;
		}

		.add-skill-button:hover {
			box-shadow: 0 12px 35px rgba(99, 102, 241, 0.5);
			color: var(--text-primary);
		}

		.secondary-button:hover {
			background: rgba(255, 255, 255, 0.15);
			color: var(--primary);
		}

		/* Mobile Responsive */
		@media (max-width: 768px) {
			.skill-offers-grid {
				grid-template-columns: 1fr;
			}

			.filter-row {
				grid-template-columns: 1fr;
			}

			.search-bar {
				flex-direction: column;
			}

			.header-section {
				flex-direction: column;
				text-align: center;
			}

			.user-section {
				align-items: center;
			}
		}
	</style>
</body>
</html>
