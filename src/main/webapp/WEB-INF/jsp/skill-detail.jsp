<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Skill Detail - Skill Swap</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
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
				<a href="profile" class="navbar-link nav-profile">
					<i class="fas fa-user"></i>
					Profile
				</a>
			</div>
		</div>
	</nav>

	<!-- Enhanced Floating Background Elements -->
	<div class="floating-particles">
		<div class="particle"
			style="top: 15%; left: 8%; width: 45px; height: 45px; background: var(--primary); border-radius: 50%; animation: floatParticle 18s ease-in-out infinite;"></div>
		<div class="particle"
			style="top: 70%; right: 12%; width: 35px; height: 35px; background: var(--secondary); transform: rotate(45deg); animation: floatParticle 22s ease-in-out infinite reverse;"></div>
		<div class="particle"
			style="bottom: 25%; left: 25%; width: 0; height: 0; border-left: 20px solid transparent; border-right: 20px solid transparent; border-bottom: 35px solid var(--accent); animation: floatParticle 26s ease-in-out infinite;"></div>
		<div class="particle"
			style="top: 85%; right: 35%; width: 40px; height: 40px; background: var(--success); border-radius: 30%; animation: floatParticle 32s ease-in-out infinite reverse;"></div>
	</div>

	<div class="skill-detail-container">
		<!-- Enhanced Breadcrumb Navigation -->
		<div class="breadcrumb-section">
			<a href="home" class="breadcrumb-link"> <i class="fas fa-home"></i>
				<span>หน้าแรก</span>
			</a> <i class="fas fa-chevron-right breadcrumb-separator"></i> <a
				href="jobboard" class="breadcrumb-link"> <i
				class="fas fa-clipboard-list"></i> <span>JobBoard</span>
			</a> <i class="fas fa-chevron-right breadcrumb-separator"></i> <span
				class="breadcrumb-current"> <i class="fas fa-eye"></i> <span>รายละเอียดสกิล</span>
			</span>
		</div>

		<!-- Success/Error Popup Notifications -->
		<c:if test="${not empty success}">
			<div class="notification-popup success">
				<i class="fas fa-check-circle"></i>
				<span>${success}</span>
			</div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="notification-popup error">
				<i class="fas fa-exclamation-circle"></i>
				<span>${error}</span>
			</div>
		</c:if>

		<!-- Enhanced Header Section -->
		<div class="glass-card skill-header-card">
			<div class="skill-header-content">
				<div class="skill-badge-container">
					<div class="skill-category-badge">
						<i class="fas fa-tag"></i>
						<c:out
							value="${skillOffer.categoryName != null ? skillOffer.categoryName : 'ไม่ระบุหมวดหมู่'}" />
					</div>
					<div class="skill-date-badge">
						<i class="fas fa-calendar-alt"></i>
						<c:if test="${skillOffer.createdAt != null}">
							${skillOffer.createdAt.dayOfMonth}
							${skillOffer.createdAt.month.toString().substring(0,3).toLowerCase()}
							${skillOffer.createdAt.year}
						</c:if>
					</div>
				</div>
				<h1 class="skill-main-title">
					<c:out value="${skillOffer.title}" />
				</h1>
				<div class="skill-status-indicator">
					<div class="status-dot active"></div>
					<span>พร้อมให้บริการ</span>
				</div>
			</div>
		</div>

		<!-- Enhanced Description Section -->
		<div class="glass-card description-card">
			<div class="section-header">
				<div class="section-icon">
					<i class="fas fa-align-left"></i>
				</div>
				<h3 class="section-title">รายละเอียดสกิล</h3>
			</div>
			<div class="description-content">
				<p>
					<c:out
						value="${skillOffer.description != null ? skillOffer.description : 'ไม่มีรายละเอียด'}" />
				</p>
			</div>
		</div>

		<!-- Enhanced User Information Section -->
		<div class="glass-card user-info-card">
			<div class="section-header">
				<div class="section-icon">
					<i class="fas fa-user-circle"></i>
				</div>
				<h3 class="section-title">ข้อมูลผู้ให้บริการ</h3>
			</div>
			<div class="user-info-content">
				<div class="user-avatar-section">
					<div class="user-avatar-large">
						<c:choose>
							<c:when test="${skillOffer.userName != null}">
								${skillOffer.userName.substring(0,1).toUpperCase()}
							</c:when>
							<c:otherwise>?</c:otherwise>
						</c:choose>
					</div>
					<div class="user-online-indicator">
						<div class="online-dot"></div>
					</div>
				</div>
				<div class="user-details">
					<div class="user-name">
						<i class="fas fa-user"></i>
						<c:choose>
							<c:when test="${skillOffer.userId != null}">
								<a href="user-profile?userId=${skillOffer.userId}" style="color: inherit; text-decoration: none; transition: color 0.3s;">
									<span style="cursor: pointer;" onmouseover="this.parentElement.style.color='var(--primary)'" onmouseout="this.parentElement.style.color='inherit'">
										<c:out value="${skillOffer.userName != null ? skillOffer.userName : 'ไม่ระบุผู้ใช้'}" />
									</span>
								</a>
							</c:when>
							<c:otherwise>
								<span><c:out value="${skillOffer.userName != null ? skillOffer.userName : 'ไม่ระบุผู้ใช้'}" /></span>
							</c:otherwise>
						</c:choose>
					</div>
					<c:if test="${skillOffer.userLocation != null}">
						<div class="user-location">
							<i class="fas fa-map-marker-alt"></i> <span><c:out
									value="${skillOffer.userLocation}" /></span>
						</div>
					</c:if>
					<div class="user-rating">
						<c:forEach begin="1" end="5" var="star">
							<i class="fas fa-star" style="color: ${star <= ownerAverageRating ? '#F59E0B' : 'rgba(255, 255, 255, 0.3)'}"></i>
						</c:forEach>
						<span class="rating-text">
							<c:choose>
								<c:when test="${ownerAverageRating > 0}">
									${ownerAverageRating} (${ownerTotalRatings} รีวิว)
								</c:when>
								<c:otherwise>
									ยังไม่มีรีวิว
								</c:otherwise>
							</c:choose>
						</span>
					</div>
					<c:if test="${skillOffer.userId != null}">
						<div style="margin-top: var(--space-md);">
							<a href="user-profile?userId=${skillOffer.userId}" class="view-profile-button" style="display: inline-flex; align-items: center; gap: var(--space-xs); padding: var(--space-sm) var(--space-md); background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%); color: white; text-decoration: none; border-radius: var(--radius-sm); font-size: var(--font-sm); font-weight: 600; transition: all 0.3s ease; box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);">
								<i class="fas fa-id-card"></i>
								<span>ดูโปรไฟล์เต็ม</span>
							</a>
						</div>
					</c:if>
				</div>
			</div>
		</div>

		<!-- Enhanced Skills Highlights -->
		<div class="glass-card skills-highlights-card">
			<div class="section-header">
				<div class="section-icon">
					<i class="fas fa-lightbulb"></i>
				</div>
				<h3 class="section-title">จุดเด่นของสกิลนี้</h3>
			</div>
			<div class="highlights-grid">
				<div class="highlight-item">
					<i class="fas fa-check-circle"></i> <span>ประสบการณ์ที่หลากหลาย</span>
				</div>
				<div class="highlight-item">
					<i class="fas fa-clock"></i> <span>ตอบกลับรวดเร็ว</span>
				</div>
				<div class="highlight-item">
					<i class="fas fa-handshake"></i> <span>เป็นมิตรและช่วยเหลือ</span>
				</div>
				<div class="highlight-item">
					<i class="fas fa-award"></i> <span>คุณภาพสูง</span>
				</div>
			</div>
		</div>

		<!-- Enhanced Swap Request Card -->
		<div class="glass-card swap-request-card">
			<div class="swap-request-header">
				<div class="swap-icon-wrapper">
					<i class="fas fa-exchange-alt"></i>
				</div>
				<div class="swap-header-text">
					<h3>ส่งคำขอแลกเปลี่ยนทักษะ</h3>
					<p>เลือกทักษะของคุณเพื่อแลกเปลี่ยนกับทักษะนี้</p>
				</div>
			</div>

			<form action="${pageContext.request.contextPath}/swap-request/create" method="post" class="swap-request-form">
				<input type="hidden" name="requestedSkillId" value="${skillOffer.id}">

				<!-- Select Your Skill -->
				<div class="form-group">
					<label class="form-label">
						<i class="fas fa-star"></i>
						<span>เลือกทักษะของคุณ</span>
					</label>
					<div class="custom-select-wrapper">
						<select name="offeredSkillId" class="custom-select" required>
							<option value="" disabled selected>เลือกทักษะที่ต้องการนำมาแลกเปลี่ยน</option>
							<c:forEach var="skill" items="${mySkills}">
								<option value="${skill.id}">${skill.title}</option>
							</c:forEach>
						</select>
						<i class="fas fa-chevron-down select-arrow"></i>
					</div>
					<c:if test="${empty mySkills}">
						<div class="form-hint warning">
							<i class="fas fa-exclamation-triangle"></i>
							<span>คุณยังไม่มีทักษะ <a href="add-skill" class="hint-link">สร้างทักษะใหม่</a></span>
						</div>
					</c:if>
				</div>

				<!-- Message Input -->
				<div class="form-group">
					<label class="form-label">
						<i class="fas fa-comment-dots"></i>
						<span>ข้อความถึงผู้ให้บริการ</span>
					</label>
					<div class="input-wrapper">
						<textarea name="message" class="custom-textarea" rows="3" placeholder="เขียนข้อความแนะนำตัวหรือบอกเหตุผลว่าทำไมต้องการแลกเปลี่ยนทักษะนี้...">สวัสดีครับ/ค่ะ ผมสนใจแลกเปลี่ยนทักษะกับคุณ มีประสบการณ์ในสิ่งที่คุณต้องการและพร้อมแบ่งปัน</textarea>
					</div>
					<div class="form-hint">
						<i class="fas fa-lightbulb"></i>
						<span>เขียนข้อความที่ดึงดูดใจเพื่อเพิ่มโอกาสได้รับการตอบรับ</span>
					</div>
				</div>

				<!-- Submit Button -->
				<button type="submit" class="swap-submit-button">
					<span class="button-icon-wrapper">
						<i class="fas fa-paper-plane"></i>
					</span>
					<span class="button-text">ส่งคำขอแลกเปลี่ยนทักษะ</span>
					<span class="button-shine"></span>
				</button>
			</form>

	</div>
</div>




</body>
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
	--button-gradient: linear-gradient(135deg, var(--primary) 0%,
		var(--secondary) 100%);
	--text-primary: #FFFFFF;
	--text-secondary: rgba(255, 255, 255, 0.8);
	--text-muted: rgba(255, 255, 255, 0.6);
	--hover-lift: translateY(-2px);
	--spring-easing: cubic-bezier(0.175, 0.885, 0.32, 1.275);
	--smooth-easing: cubic-bezier(0.4, 0, 0.2, 1);
	--duration-normal: 0.3s;
	--space-xs: 4px;
	--space-sm: 8px;
	--space-md: 16px;
	--space-lg: 24px;
	--space-xl: 32px;
	--space-2xl: 48px;
	--radius-sm: 8px;
	--radius-md: 12px;
	--radius-lg: 16px;
	--radius-xl: 20px;
	--radius-full: 50%;
	--font-xs: 0.75rem;
	--font-sm: 0.875rem;
	--font-base: 1rem;
	--font-lg: 1.125rem;
	--font-xl: 1.25rem;
	--font-2xl: 1.5rem;
	--font-3xl: 1.875rem;
	--font-4xl: 2.25rem;
}

/* Enhanced Body and Background */
body {
	margin: 0;
	font-family: 'Inter', 'SF Pro Display', -apple-system,
		BlinkMacSystemFont, sans-serif;
	background: linear-gradient(-45deg, #0f0f23 0%, #1a1a2e 25%, #16213e 50%, #0f3460
		75%, #533483 100%);
	background-size: 400% 400%;
	animation: gradientShift 15s ease infinite;
	min-height: 100vh;
	color: #ffffff;
	overflow-x: hidden;
}

@
keyframes gradientShift { 0% {
	background-position: 0% 50%;
}

50


















%
{
background-position


















:


















100
















%
50
















%;
}
100


















%
{
background-position


















:


















0
















%
50
















%;
}
}

/* Enhanced Floating Particles */
.floating-particles {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	pointer-events: none;
	z-index: 1;
}

.particle {
	position: absolute;
	opacity: 0.12;
}

@
keyframes floatParticle { 0%, 100% {
	transform: translateY(0px) rotate(0deg);
	opacity: 0.1;
}

25


















%
{
transform


















:


















translateY
















(


















-15px


















)


















rotate
















(


















90deg


















)
















;
opacity


















:


















0
















.15
















;
}
50


















%
{
transform


















:


















translateY
















(


















-8px


















)


















rotate
















(


















180deg


















)
















;
opacity


















:


















0
















.12
















;
}
75


















%
{
transform


















:


















translateY
















(


















-20px


















)


















rotate
















(


















270deg


















)
















;
opacity


















:


















0
















.18
















;
}
}

/* === NAVBAR STYLES === */
.modern-navbar {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
	padding: var(--space-md) var(--space-lg);
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.08) 100%);
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
	transition: all var(--duration-normal) var(--smooth-easing);
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
	transition: all var(--duration-normal) var(--smooth-easing);
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
	transition: all var(--duration-normal) var(--smooth-easing);
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
		background: linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.08) 100%);
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

/* Enhanced Container */
.skill-detail-container {
	max-width: 900px;
	margin: 0 auto;
	padding: var(--space-lg);
	padding-top: calc(80px + var(--space-lg));
	position: relative;
	z-index: 2;
}

/* Enhanced Glass Card */
.glass-card {
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%,
		rgba(255, 255, 255, 0.05) 100%);
	border: 2px solid rgba(255, 255, 255, 0.2);
	border-radius: var(--radius-xl);
	backdrop-filter: blur(40px);
	box-shadow: 0 25px 80px rgba(0, 0, 0, 0.1), inset 0 1px 0
		rgba(255, 255, 255, 0.2);
	margin-bottom: var(--space-xl);
	transition: all var(--duration-normal) var(--smooth-easing);
	animation: slideInFromBottom 0.8s ease-out;
}

@
keyframes slideInFromBottom { 0% {
	opacity: 0;
	transform: translateY(30px);
}

100


















%
{
opacity


















:


















1
















;
transform


















:


















translateY
















(


















0


















)
















;
}
}

/* Notification Popup */
.notification-popup {
	position: fixed;
	top: 20px;
	right: 20px;
	z-index: 9999;
	display: flex;
	align-items: center;
	gap: var(--space-md);
	padding: var(--space-lg) var(--space-xl);
	border-radius: var(--radius-lg);
	backdrop-filter: blur(40px);
	box-shadow: 0 25px 80px rgba(0, 0, 0, 0.3);
	animation: slideInFromTop 0.5s ease-out, fadeOut 0.5s ease-in 4.5s forwards;
	min-width: 300px;
	max-width: 500px;
}

.notification-popup.success {
	background: linear-gradient(135deg, rgba(16, 185, 129, 0.9) 0%, rgba(5, 150, 105, 0.9) 100%);
	border: 2px solid rgba(16, 185, 129, 0.5);
	color: var(--text-primary);
}

.notification-popup.error {
	background: linear-gradient(135deg, rgba(239, 68, 68, 0.9) 0%, rgba(220, 38, 38, 0.9) 100%);
	border: 2px solid rgba(239, 68, 68, 0.5);
	color: var(--text-primary);
}

.notification-popup i {
	font-size: var(--font-xl);
}

.notification-popup span {
	font-weight: 600;
	font-size: var(--font-base);
}

@keyframes fadeOut {
	0% {
		opacity: 1;
		transform: translateY(0);
	}
	100% {
		opacity: 0;
		transform: translateY(-20px);
	}
}

/* Enhanced Breadcrumb */
.breadcrumb-section {
	display: flex;
	align-items: center;
	gap: var(--space-md);
	margin-bottom: var(--space-xl);
	padding: var(--space-md) var(--space-lg);
	background: rgba(255, 255, 255, 0.08);
	border-radius: var(--radius-lg);
	backdrop-filter: blur(20px);
	animation: slideInFromTop 0.6s ease-out;
}

@
keyframes slideInFromTop { 0% {
	opacity: 0;
	transform: translateY(-20px);
}

100


















%
{
opacity


















:


















1
















;
transform


















:


















translateY
















(


















0


















)
















;
}
}
.breadcrumb-link {
	display: flex;
	align-items: center;
	gap: var(--space-xs);
	color: var(--text-secondary);
	text-decoration: none;
	font-size: var(--font-sm);
	font-weight: 500;
	padding: var(--space-xs) var(--space-sm);
	border-radius: var(--radius-sm);
	transition: all var(--duration-normal) var(--smooth-easing);
}

.breadcrumb-link:hover {
	color: var(--primary);
	background: rgba(99, 102, 241, 0.1);
	transform: translateY(-1px);
}

.breadcrumb-separator {
	color: var(--text-muted);
	font-size: var(--font-xs);
}

.breadcrumb-current {
	display: flex;
	align-items: center;
	gap: var(--space-xs);
	color: var(--primary);
	font-size: var(--font-sm);
	font-weight: 600;
}

/* Enhanced Header Card */
.skill-header-card {
	padding: var(--space-2xl);
	position: relative;
	overflow: hidden;
}

.skill-header-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 4px;
	background: var(--button-gradient);
	border-radius: var(--radius-xl) var(--radius-xl) 0 0;
}

.skill-badge-container {
	display: flex;
	gap: var(--space-md);
	margin-bottom: var(--space-lg);
	flex-wrap: wrap;
}

.skill-category-badge, .skill-date-badge {
	display: inline-flex;
	align-items: center;
	gap: var(--space-xs);
	padding: var(--space-sm) var(--space-md);
	border-radius: var(--radius-md);
	font-size: var(--font-sm);
	font-weight: 600;
}

.skill-category-badge {
	background: linear-gradient(135deg, var(--primary) 0%, var(--secondary)
		100%);
	color: var(--text-primary);
	box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
}

.skill-date-badge {
	background: rgba(255, 255, 255, 0.1);
	color: var(--text-secondary);
	border: 1px solid rgba(255, 255, 255, 0.2);
}

.skill-main-title {
	font-size: var(--font-4xl);
	font-weight: 800;
	background: linear-gradient(135deg, var(--text-primary) 0%,
		var(--text-secondary) 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
	line-height: 1.2;
	margin-bottom: var(--space-lg);
	letter-spacing: -0.02em;
}

.skill-status-indicator {
	display: flex;
	align-items: center;
	gap: var(--space-sm);
	color: var(--success);
	font-weight: 600;
}

.status-dot {
	width: 12px;
	height: 12px;
	border-radius: 50%;
	background: var(--success);
	animation: pulse 2s infinite;
}

@
keyframes pulse { 0% {
	box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.7);
}

70


















%
{
box-shadow


















:


















0


















0


















0


















10px


















rgba
















(


















16
,
185
,
129
,
0


















)
















;
}
100


















%
{
box-shadow


















:


















0


















0


















0


















0


















rgba
















(


















16
,
185
,
129
,
0


















)
















;
}
}

/* Enhanced Section Headers */
.section-header {
	display: flex;
	align-items: center;
	gap: var(--space-md);
	margin-bottom: var(--space-lg);
}

.section-icon {
	width: 48px;
	height: 48px;
	background: var(--button-gradient);
	border-radius: var(--radius-md);
	display: flex;
	align-items: center;
	justify-content: center;
	color: var(--text-primary);
	font-size: 20px;
	box-shadow: 0 8px 25px rgba(99, 102, 241, 0.3);
}

.section-title {
	font-size: var(--font-xl);
	font-weight: 700;
	color: var(--text-primary);
	margin: 0;
}

/* Enhanced Description Card */
.description-card {
	padding: var(--space-2xl);
}

.description-content p {
	font-size: var(--font-lg);
	line-height: 1.8;
	color: var(--text-secondary);
	margin: 0;
}

/* Enhanced User Info Card */
.user-info-card {
	padding: var(--space-2xl);
}

.user-info-content {
	display: flex;
	gap: var(--space-xl);
	align-items: center;
}

.user-avatar-section {
	position: relative;
}

.user-avatar-large {
	width: 100px;
	height: 100px;
	background: var(--button-gradient);
	border-radius: var(--radius-full);
	display: flex;
	align-items: center;
	justify-content: center;
	color: var(--text-primary);
	font-size: 2.5rem;
	font-weight: 700;
	box-shadow: 0 15px 40px rgba(99, 102, 241, 0.3);
}

.user-online-indicator {
	position: absolute;
	bottom: 5px;
	right: 5px;
	background: var(--text-primary);
	border-radius: 50%;
	padding: 4px;
}

.online-dot {
	width: 16px;
	height: 16px;
	background: var(--success);
	border-radius: 50%;
	animation: pulse 2s infinite;
}

.user-details {
	flex: 1;
}

.user-name, .user-location {
	display: flex;
	align-items: center;
	gap: var(--space-sm);
	margin-bottom: var(--space-md);
	font-size: var(--font-lg);
	color: var(--text-secondary);
}

.user-name {
	font-weight: 700;
	font-size: var(--font-xl);
	color: var(--text-primary);
}

.user-rating {
	display: flex;
	align-items: center;
	gap: var(--space-xs);
}

.user-rating i {
	color: var(--warning);
	font-size: var(--font-sm);
}

.rating-text {
	margin-left: var(--space-sm);
	color: var(--text-secondary);
	font-weight: 600;
}

/* Enhanced Skills Highlights */
.skills-highlights-card {
	padding: var(--space-2xl);
}

.highlights-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: var(--space-lg);
}

.highlight-item {
	display: flex;
	align-items: center;
	gap: var(--space-md);
	padding: var(--space-lg);
	background: rgba(255, 255, 255, 0.05);
	border: 1px solid rgba(255, 255, 255, 0.1);
	border-radius: var(--radius-md);
	transition: all var(--duration-normal) var(--smooth-easing);
}

.highlight-item:hover {
	background: rgba(255, 255, 255, 0.1);
	transform: translateY(-2px);
}

.highlight-item i {
	color: var(--success);
	font-size: var(--font-lg);
}

.highlight-item span {
	font-weight: 600;
	color: var(--text-secondary);
}

/* Enhanced Swap Request Card */
.swap-request-card {
	padding: var(--space-2xl);
	background: linear-gradient(135deg, rgba(99, 102, 241, 0.08) 0%, rgba(139, 92, 246, 0.05) 100%);
	border: 2px solid rgba(99, 102, 241, 0.3);
}

.swap-request-header {
	display: flex;
	align-items: center;
	gap: var(--space-lg);
	margin-bottom: var(--space-2xl);
	padding-bottom: var(--space-xl);
	border-bottom: 2px solid rgba(255, 255, 255, 0.1);
}

.swap-icon-wrapper {
	width: 60px;
	height: 60px;
	background: var(--button-gradient);
	border-radius: var(--radius-lg);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 24px;
	color: var(--text-primary);
	box-shadow: 0 10px 30px rgba(99, 102, 241, 0.4);
	animation: rotateIcon 3s ease-in-out infinite;
}

@keyframes rotateIcon {
	0%, 100% { transform: rotate(0deg); }
	50% { transform: rotate(180deg); }
}

.swap-header-text h3 {
	font-size: var(--font-2xl);
	font-weight: 700;
	color: var(--text-primary);
	margin: 0 0 var(--space-xs) 0;
}

.swap-header-text p {
	font-size: var(--font-sm);
	color: var(--text-muted);
	margin: 0;
}

.swap-request-form {
	display: flex;
	flex-direction: column;
	gap: var(--space-2xl);
}

/* Form Group */
.form-group {
	display: flex;
	flex-direction: column;
	gap: var(--space-md);
}

.form-label {
	display: flex;
	align-items: center;
	gap: var(--space-sm);
	font-size: var(--font-base);
	font-weight: 600;
	color: var(--text-primary);
}

.form-label i {
	color: var(--primary);
	font-size: var(--font-lg);
}

/* Custom Select */
.custom-select-wrapper {
	position: relative;
}

.custom-select {
	width: 100%;
	padding: var(--space-lg) var(--space-xl);
	padding-right: calc(var(--space-xl) + 30px);
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.05) 100%);
	border: 2px solid rgba(255, 255, 255, 0.2);
	border-radius: var(--radius-lg);
	color: var(--text-primary);
	font-size: var(--font-base);
	font-weight: 500;
	font-family: 'Inter', sans-serif;
	cursor: pointer;
	transition: all 0.3s var(--smooth-easing);
	backdrop-filter: blur(20px);
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
}

.custom-select:hover {
	border-color: var(--primary);
	background: linear-gradient(135deg, rgba(99, 102, 241, 0.15) 0%, rgba(139, 92, 246, 0.1) 100%);
	transform: translateY(-2px);
	box-shadow: 0 8px 25px rgba(99, 102, 241, 0.3);
}

.custom-select:focus {
	outline: none;
	border-color: var(--primary);
	background: linear-gradient(135deg, rgba(99, 102, 241, 0.2) 0%, rgba(139, 92, 246, 0.15) 100%);
	box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.15), 0 10px 30px rgba(99, 102, 241, 0.4);
	transform: translateY(-2px);
}

.custom-select option {
	background: #1a1a2e;
	color: var(--text-primary);
	padding: var(--space-md);
	font-weight: 500;
}

.select-arrow {
	position: absolute;
	right: var(--space-lg);
	top: 50%;
	transform: translateY(-50%);
	color: var(--primary);
	font-size: var(--font-base);
	pointer-events: none;
	transition: all 0.3s var(--smooth-easing);
}

.custom-select:focus ~ .select-arrow {
	transform: translateY(-50%) rotate(180deg);
}

/* Custom Textarea */
.input-wrapper {
	position: relative;
}

.custom-textarea {
	width: 100%;
	padding: var(--space-lg);
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.05) 100%);
	border: 2px solid rgba(255, 255, 255, 0.2);
	border-radius: var(--radius-lg);
	color: var(--text-primary);
	font-size: var(--font-base);
	font-weight: 400;
	font-family: 'Inter', sans-serif;
	line-height: 1.6;
	resize: vertical;
	min-height: 100px;
	transition: all 0.3s var(--smooth-easing);
	backdrop-filter: blur(20px);
}

.custom-textarea::placeholder {
	color: var(--text-muted);
}

.custom-textarea:hover {
	border-color: var(--primary);
	background: linear-gradient(135deg, rgba(99, 102, 241, 0.15) 0%, rgba(139, 92, 246, 0.1) 100%);
	transform: translateY(-2px);
	box-shadow: 0 8px 25px rgba(99, 102, 241, 0.3);
}

.custom-textarea:focus {
	outline: none;
	border-color: var(--primary);
	background: linear-gradient(135deg, rgba(99, 102, 241, 0.2) 0%, rgba(139, 92, 246, 0.15) 100%);
	box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.15), 0 10px 30px rgba(99, 102, 241, 0.4);
	transform: translateY(-2px);
}

/* Form Hint */
.form-hint {
	display: flex;
	align-items: center;
	gap: var(--space-sm);
	font-size: var(--font-sm);
	color: var(--text-muted);
	padding: var(--space-sm) var(--space-md);
	background: rgba(255, 255, 255, 0.05);
	border-radius: var(--radius-sm);
	border-left: 3px solid var(--primary);
}

.form-hint i {
	color: var(--primary);
}

.form-hint.warning {
	border-left-color: var(--warning);
	background: rgba(245, 158, 11, 0.1);
}

.form-hint.warning i {
	color: var(--warning);
}

.hint-link {
	color: var(--primary);
	text-decoration: underline;
	font-weight: 600;
	transition: color 0.3s ease;
}

.hint-link:hover {
	color: var(--primary-hover);
}

/* Submit Button */
.swap-submit-button {
	position: relative;
	width: 100%;
	padding: var(--space-xl) var(--space-2xl);
	background: var(--button-gradient);
	border: none;
	border-radius: var(--radius-lg);
	color: var(--text-primary);
	font-size: var(--font-lg);
	font-weight: 700;
	cursor: pointer;
	overflow: hidden;
	box-shadow: 0 10px 40px rgba(99, 102, 241, 0.4);
	transition: all 0.4s var(--spring-easing);
	display: flex;
	align-items: center;
	justify-content: center;
	gap: var(--space-md);
}

.swap-submit-button::before {
	content: '';
	position: absolute;
	top: 0;
	left: -100%;
	width: 100%;
	height: 100%;
	background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
	transition: left 0.5s;
}

.swap-submit-button:hover::before {
	left: 100%;
}

.swap-submit-button:hover {
	transform: translateY(-4px) scale(1.02);
	box-shadow: 0 15px 50px rgba(99, 102, 241, 0.6);
}

.swap-submit-button:active {
	transform: translateY(-2px) scale(0.98);
}

.button-icon-wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 32px;
	height: 32px;
	background: rgba(255, 255, 255, 0.2);
	border-radius: 50%;
	transition: all 0.3s ease;
}

.swap-submit-button:hover .button-icon-wrapper {
	transform: rotate(15deg) scale(1.1);
	background: rgba(255, 255, 255, 0.3);
}

.button-text {
	position: relative;
	z-index: 1;
}

.my-skill-selection {
	margin-bottom: var(--space-xl);
	padding: var(--space-lg);
	background: rgba(255, 255, 255, 0.05);
	border: 1px solid rgba(255, 255, 255, 0.1);
	border-radius: var(--radius-md);
	transition: all var(--duration-normal) var(--smooth-easing);
}

.my-skill-selection:hover {
	background: rgba(255, 255, 255, 0.08);
	border-color: rgba(255, 255, 255, 0.2);
}

.my-skill-selection label {
	display: block;
	color: var(--text-primary);
	font-size: var(--font-base);
	font-weight: 600;
	margin-bottom: var(--space-md);
	display: flex;
	align-items: center;
	gap: var(--space-sm);
}

.my-skill-selection label::before {
	content: '🔄';
	font-size: var(--font-lg);
}

.my-skill-selection select {
	width: 100%;
	padding: var(--space-md) var(--space-lg);
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%,
		rgba(255, 255, 255, 0.05) 100%);
	border: 2px solid rgba(255, 255, 255, 0.2);
	border-radius: var(--radius-md);
	color: var(--text-primary);
	font-size: var(--font-base);
	font-weight: 500;
	cursor: pointer;
	transition: all var(--duration-normal) var(--smooth-easing);
	backdrop-filter: blur(20px);
	appearance: none;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right var(--space-md) center;
	background-size: 20px;
	padding-right: var(--space-2xl);
}

.my-skill-selection select:hover {
	border-color: var(--primary);
	background: linear-gradient(135deg, rgba(99, 102, 241, 0.15) 0%,
		rgba(139, 92, 246, 0.1) 100%);
	transform: translateY(-2px);
	box-shadow: 0 8px 25px rgba(99, 102, 241, 0.2);
}

.my-skill-selection select:focus {
	outline: none;
	border-color: var(--primary);
	background: linear-gradient(135deg, rgba(99, 102, 241, 0.2) 0%,
		rgba(139, 92, 246, 0.15) 100%);
	box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1), 0 8px 25px
		rgba(99, 102, 241, 0.3);
}

.my-skill-selection select option {
	background: #1a1a2e;
	color: var(--text-primary);
	padding: var(--space-md);
	font-weight: 500;
}

.my-skill-selection select option:hover {
	background: var(--primary);
}

/* Animation on load */
.my-skill-selection {
	animation: slideInFromLeft 0.6s ease-out;
}

@
keyframes slideInFromLeft { 0% {
	opacity: 0;
	transform: translateX(-30px);
}

100














%
{
opacity














:














1












;
transform














:














translateX












(














0














)












;
}
}

/* Mobile Responsive */
@media ( max-width : 768px) {
	.my-skill-selection {
		padding: var(--space-md);
	}
	.my-skill-selection select {
		font-size: var(--font-sm);
	}
}

/* Enhanced Mobile Responsiveness */
@media ( max-width : 768px) {
	.skill-detail-container {
		padding: var(--space-md);
	}
	.skill-main-title {
		font-size: var(--font-2xl);
	}
	.user-info-content {
		flex-direction: column;
		text-align: center;
		gap: var(--space-lg);
	}
	.user-avatar-large {
		width: 80px;
		height: 80px;
		font-size: 2rem;
	}
	.highlights-grid {
		grid-template-columns: 1fr;
	}
	.breadcrumb-section {
		flex-wrap: wrap;
		gap: var(--space-sm);
	}

	/* Swap Request Card Mobile */
	.swap-request-card {
		padding: var(--space-lg);
	}

	.swap-request-header {
		flex-direction: column;
		text-align: center;
		gap: var(--space-md);
	}

	.swap-icon-wrapper {
		width: 50px;
		height: 50px;
		font-size: 20px;
		margin: 0 auto;
	}

	.swap-header-text h3 {
		font-size: var(--font-xl);
	}

	.custom-select,
	.custom-textarea {
		font-size: var(--font-sm);
		padding: var(--space-md) var(--space-lg);
	}

	.swap-submit-button {
		padding: var(--space-lg) var(--space-xl);
		font-size: var(--font-base);
	}

	.button-icon-wrapper {
		width: 28px;
		height: 28px;
	}

	.notification-popup {
		left: var(--space-md);
		right: var(--space-md);
		min-width: auto;
	}
}
</style>

<script>
		// Enhanced Interactive Features
		document.addEventListener('DOMContentLoaded', function() {
			// Add smooth scroll effect
			document.querySelectorAll('a[href^="#"]').forEach(anchor => {
				anchor.addEventListener('click', function (e) {
					e.preventDefault();
					document.querySelector(this.getAttribute('href')).scrollIntoView({
						behavior: 'smooth'
					});
				});
			});

			// Form validation and enhancement
			const swapForm = document.querySelector('.swap-request-form');
			const submitButton = document.querySelector('.swap-submit-button');
			const customSelect = document.querySelector('.custom-select');
			const customTextarea = document.querySelector('.custom-textarea');

			if (swapForm) {
				// Form submit animation
				swapForm.addEventListener('submit', function(e) {
					if (submitButton) {
						submitButton.disabled = true;
						submitButton.innerHTML = '<span class="button-icon-wrapper"><i class="fas fa-spinner fa-spin"></i></span><span class="button-text">กำลังส่งคำขอ...</span>';
					}
				});

				// Select change animation
				if (customSelect) {
					customSelect.addEventListener('change', function() {
						this.style.transform = 'scale(1.02)';
						setTimeout(() => {
							this.style.transform = '';
						}, 200);
					});
				}

				// Textarea character counter (optional enhancement)
				if (customTextarea) {
					customTextarea.addEventListener('input', function() {
						const length = this.value.length;
						if (length > 200) {
							this.style.borderColor = 'var(--warning)';
						} else {
							this.style.borderColor = '';
						}
					});
				}
			}

			// Auto-dismiss notifications
			const notifications = document.querySelectorAll('.notification-popup');
			notifications.forEach(notification => {
				setTimeout(() => {
					notification.style.animation = 'fadeOut 0.5s ease-in forwards';
					setTimeout(() => {
						notification.remove();
					}, 500);
				}, 5000);
			});
		});

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