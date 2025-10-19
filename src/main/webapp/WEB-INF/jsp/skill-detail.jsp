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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/skill-detail.css">
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
<script src="${pageContext.request.contextPath}/js/skill-detail.js"></script>
</html>
