<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>สร้าง Skill Offer - Skill Swap</title>

    <!-- Aurora Glass Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aurora-theme.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/create-skill.css">
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
                <a href="add-skill" class="navbar-link nav-add active">
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

    <!-- Main Container -->
    <div class="create-skill-container">
        <!-- Header Section -->
        <div class="header-section">
            <div class="header-title">
                <h1><i class="fas fa-plus-circle"></i> สร้าง Skill Offer</h1>
                <p>แชร์ทักษะของคุณให้กับชุมชน</p>
            </div>
            
        </div>

        <!-- Form Container -->
        <div class="form-container">
            <!-- Success/Error Messages -->
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    ${error}
                </div>
            </c:if>

            <c:if test="${param.success == 'skill-created'}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    สร้าง Skill Offer สำเร็จแล้ว!
                </div>
            </c:if>

            <!-- Main Form -->
            <form method="POST" action="add-skill" class="glass-form" id="skillForm">

                <!-- Section 1: Basic Information -->
                <div class="form-section">
                    <h3 class="section-title">
                        <div class="section-icon">
                            <i class="fas fa-info-circle"></i>
                        </div>
                        ข้อมูลพื้นฐาน
                    </h3>

                    <!-- Title -->
                    <div class="form-group">
                        <label for="title" class="form-label">
                            <i class="fas fa-tag"></i>
                            <span>ชื่อทักษะ</span>
                            <span class="required-badge">จำเป็น</span>
                        </label>
                        <input type="text"
                               id="title"
                               name="title"
                               class="form-input"
                               placeholder="เช่น สอน JavaScript เบื้องต้น, ถ่ายรูปแนว Portrait, สอนทำอาหารไทย"
                               required>
                        <div class="form-hint">
                            <i class="fas fa-lightbulb"></i>
                            <span>ใช้ชื่อที่สั้น กระชับ และบอกถึงสิ่งที่คุณสอนได้ชัดเจน</span>
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="form-group">
                        <label for="description" class="form-label">
                            <i class="fas fa-align-left"></i>
                            <span>รายละเอียดทักษะ</span>
                            <span class="required-badge">จำเป็น</span>
                        </label>
                        <textarea id="description"
                                  name="description"
                                  class="form-textarea"
                                  placeholder="อธิบายทักษะของคุณ สิ่งที่จะสอน ประสบการณ์ และสิ่งที่ผู้เรียนจะได้รับ..."
                                  required></textarea>
                        <div class="form-hint">
                            <i class="fas fa-lightbulb"></i>
                            <span>เขียนรายละเอียดที่น่าสนใจ อธิบายว่าคุณมีประสบการณ์อะไร และผู้เรียนจะได้อะไรบ้าง</span>
                        </div>
                    </div>
                </div>

                <!-- Category and Level Row -->
                <div class="form-group half-width">
                    <label for="categoryId" class="form-label required">หมวดหมู่</label>
                    <div class="category-input-wrapper">
                        <i class="fas fa-layer-group category-icon" id="categoryIcon"></i>
                        <select id="categoryId" name="categoryId" class="form-select with-icon" required>
                            <option value="">เลือกหมวดหมู่</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}">${category.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group half-width">
                    <label for="level" class="form-label required">ระดับ</label>
                    <select id="level" name="level" class="form-select" required>
                        <option value="">เลือกระดับ</option>
                        <option value="Beginner">🌱 เริ่มต้น (Beginner)</option>
                        <option value="Intermediate">🚀 ปานกลาง (Intermediate)</option>
                        <option value="Advanced">⭐ ขั้นสูง (Advanced)</option>
                        <option value="Expert">👑 ผู้เชี่ยวชาญ (Expert)</option>
                    </select>
                </div>

                <!-- Time Commitment and Location Row -->
                <div class="form-group half-width">
                    <label for="timeCommitment" class="form-label">ระยะเวลา</label>
                    <select id="timeCommitment" name="timeCommitment" class="form-select">
                        <option value="">เลือกระยะเวลา</option>
                        <option value="1-2 ชั่วโมง">⏰ 1-2 ชั่วโมง</option>
                        <option value="ครึ่งวัน">🕐 ครึ่งวัน (4-5 ชั่วโมง)</option>
                        <option value="เต็มวัน">📅 เต็มวัน (8+ ชั่วโมง)</option>
                        <option value="หลายวัน">📆 หลายวัน</option>
                        <option value="ยืดหยุ่น">🔄 ยืดหยุ่นได้</option>
                    </select>
                </div>

                <div class="form-group half-width">
                    <label for="location" class="form-label">สถานที่</label>
                    <input type="text"
                           id="location"
                           name="location"
                           class="form-input"
                           placeholder="เช่น กรุงเทพ, เชียงใหม่, Online">
                </div>

                <!-- Submit Section -->
                <div class="submit-section">
                    <a href="home" class="btn-secondary">
                        <i class="fas fa-times"></i>
                        ยกเลิก
                    </a>
                    <button type="submit" class="btn-primary" id="submitBtn">
                        <i class="fas fa-plus-circle"></i>
                        สร้าง Skill Offer
                    </button>
                </div>
            </form>
        </div>
    </div>
    <!-- Custom Scripts -->
    <script src="${pageContext.request.contextPath}/js/create-skill.js"></script>
</body>
</html>