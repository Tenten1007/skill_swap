<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ให้คะแนน ${ratee.fullName}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rating-form.css">
</head>
<body>
    <div class="rating-container">
        <div class="glass-card">
            <div class="profile-box">
                <c:if test="${not empty ratee.profileImage}">
                    <img src="${ratee.profileImage}" class="profile-image" alt="Profile">
                </c:if>
                <h2 class="profile-name">${ratee.fullName}</h2>
                <p class="profile-username">@${ratee.username}</p>
                <div class="profile-stats">
                    <i class="fas fa-star"></i>
                    <span>${averageRating}</span>
                    <span style="color: var(--text-muted);">(${totalReviews} รีวิว)</span>
                </div>
            </div>

            <form action="/rating/submit" method="post" id="ratingForm">
                <input type="hidden" name="rateeId" value="${ratee.id}">
                
                <div class="form-group">
                    <label><i class="fas fa-star" style="color: var(--warning);"></i> ให้คะแนน:</label>
                    <div class="rating-stars">
                        <span class="star" data-value="1">★</span>
                        <span class="star" data-value="2">★</span>
                        <span class="star" data-value="3">★</span>
                        <span class="star" data-value="4">★</span>
                        <span class="star" data-value="5">★</span>
                    </div>
                    <input type="hidden" name="score" id="score" value="0" required>
                </div>

                <div class="form-group">
                    <label><i class="fas fa-comment" style="color: var(--accent);"></i> ความคิดเห็น (ไม่บังคับ):</label>
                    <div class="comment-wrapper">
                        <textarea name="comment" rows="5" placeholder="แชร์ประสบการณ์ของคุณ..."></textarea>
                    </div>
                </div>

                <button type="submit" class="submit-button">
                    <i class="fas fa-paper-plane"></i> ส่งคะแนน
                </button>
            </form>

            <a href="/home" class="back-link">
                <i class="fas fa-arrow-left"></i> กลับหน้าหลัก
            </a>
        </div>
    </div>
    <!-- Custom Scripts -->
    <script>
        // แสดง success message หลังจาก redirect กลับมา
        <c:if test="${not empty sessionScope.successMessage}">
            Swal.fire({
                icon: 'success',
                title: 'ให้คะแนนสำเร็จ!',
                text: '${sessionScope.successMessage}',
                confirmButtonColor: '#10B981',
                timer: 3000,
                timerProgressBar: true,
                background: 'linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 100%)',
                color: '#ffffff',
                backdrop: 'rgba(0, 0, 0, 0.8)',
                showClass: {
                    popup: 'animate__animated animate__zoomIn'
                },
                hideClass: {
                    popup: 'animate__animated animate__zoomOut'
                }
            }).then(() => {
                window.location.href = '/home';
            });
            <% session.removeAttribute("successMessage"); %>
        </c:if>
    </script>
    <script src="${pageContext.request.contextPath}/js/rating-form.js"></script>
</body>
</html>