<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - Skill Swap</title>

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/edit-profile.css">
</head>

<body>
    <!-- Enhanced Background Effects -->
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <!-- Main Container -->
    <div class="edit-profile-container">
        <!-- Header Section -->
        <div class="header-section">
            <div class="header-title">
                <h1><i class="fas fa-user-edit"></i> แก้ไขโปรไฟล์</h1>
                <p>อัปเดตข้อมูลส่วนตัวของคุณ</p>
            </div>
            <div class="header-actions">
                <a href="profile" class="action-button btn-secondary">
                    <i class="fas fa-arrow-left"></i>
                    กลับไปโปรไฟล์
                </a>
            </div>
        </div>

        <!-- Content Container -->
        <div class="content-container">
            <!-- Error Messages -->
            <c:if test="${param.error == 'update-failed'}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>ไม่สามารถอัปเดตข้อมูลได้ กรุณาลองใหม่อีกครั้ง</span>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <!-- Form Container -->
            <form action="update-profile" method="post" class="form-container">
                <!-- Personal Information -->
                <div class="form-section">
                    <h3 class="section-title">
                        <div class="section-icon">
                            <i class="fas fa-user"></i>
                        </div>
                        ข้อมูลส่วนตัว
                    </h3>

                    <div class="form-grid">
                        <div class="form-group">
                            <label for="firstName" class="form-label">ชื่อ</label>
                            <input
                                type="text"
                                id="firstName"
                                name="firstName"
                                class="form-input"
                                value="${user.firstName}"
                                placeholder="กรุณาใส่ชื่อของคุณ"
                                required
                            >
                        </div>

                        <div class="form-group">
                            <label for="lastName" class="form-label">นามสกุล</label>
                            <input
                                type="text"
                                id="lastName"
                                name="lastName"
                                class="form-input"
                                value="${user.lastName}"
                                placeholder="กรุณาใส่นามสกุลของคุณ"
                                required
                            >
                        </div>

                        <div class="form-group">
                            <label for="email" class="form-label">อีเมล</label>
                            <input
                                type="email"
                                id="email"
                                name="email"
                                class="form-input"
                                value="${user.email}"
                                placeholder="example@email.com"
                                required
                            >
                        </div>

                        <div class="form-group">
                            <label for="phone" class="form-label">เบอร์โทร</label>
                            <input
                                type="tel"
                                id="phone"
                                name="phone"
                                class="form-input"
                                value="${user.phone}"
                                placeholder="081-234-5678"
                            >
                            <div class="form-hint">ไม่บังคับ - ใส่เบอร์โทรเพื่อให้ผู้อื่นติดต่อได้</div>
                        </div>

                        <div class="form-group">
                            <label for="location" class="form-label">ที่อยู่</label>
                            <input
                                type="text"
                                id="location"
                                name="location"
                                class="form-input"
                                value="${user.location}"
                                placeholder="กรุงเทพฯ, ประเทศไทย"
                            >
                            <div class="form-hint">เช่น เชียงใหม่, กรุงเทพฯ, ต่างประเทศ</div>
                        </div>
                    </div>
                </div>

                <!-- About Me -->
                <div class="form-section">
                    <h3 class="section-title">
                        <div class="section-icon">
                            <i class="fas fa-quote-left"></i>
                        </div>
                        เกี่ยวกับฉัน
                    </h3>

                    <div class="form-group full-width">
                        <label for="bio" class="form-label">แนะนำตัวเอง</label>
                        <textarea
                            id="bio"
                            name="bio"
                            class="form-textarea"
                            placeholder="เล่าให้ฟังหน่อยเกี่ยวกับตัวคุณ สิ่งที่ชอบ ความถนัด หรือสิ่งที่อยากเรียนรู้..."
                        >${user.bio}</textarea>
                        <div class="form-hint">แนะนำตัวเองให้คนอื่นรู้จักคุณมากขึ้น</div>
                    </div>
                </div>

                <!-- Social Links -->
                <div class="form-section">
                    <h3 class="section-title">
                        <div class="section-icon">
                            <i class="fas fa-link"></i>
                        </div>
                        ลิงก์โซเชียล
                    </h3>

                    <div class="form-grid">
                        <div class="form-group">
                            <label for="linkedin" class="form-label">LinkedIn</label>
                            <input
                                type="url"
                                id="linkedin"
                                name="linkedin"
                                class="form-input"
                                value="${user.linkedin}"
                                placeholder="https://linkedin.com/in/username"
                            >
                            <div class="form-hint">ลิงก์โปรไฟล์ LinkedIn ของคุณ</div>
                        </div>

                        <div class="form-group">
                            <label for="github" class="form-label">GitHub</label>
                            <input
                                type="url"
                                id="github"
                                name="github"
                                class="form-input"
                                value="${user.github}"
                                placeholder="https://github.com/username"
                            >
                            <div class="form-hint">ลิงก์ GitHub profile ของคุณ</div>
                        </div>
                    </div>
                </div>

                <!-- Form Actions -->
                <div class="form-actions">
                    <button type="submit" class="form-btn form-btn-primary">
                        <i class="fas fa-save"></i>
                        บันทึกการเปลี่ยนแปลง
                    </button>
                    <a href="profile" class="form-btn form-btn-secondary">
                        <i class="fas fa-times"></i>
                        ยกเลิก
                    </a>
                </div>
            </form>
        </div>
    </div>
    <!-- Custom Scripts -->
    <script src="${pageContext.request.contextPath}/js/edit-profile.js"></script>
</body>
</html>