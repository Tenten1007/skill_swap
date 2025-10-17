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
    <style>
        :root {
            --glass-bg: rgba(255, 255, 255, 0.08);
            --glass-border: rgba(255, 255, 255, 0.2);
            --glass-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            --glass-hover: rgba(255, 255, 255, 0.12);
            --blur-strength: blur(20px);
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
            --font-xs: 0.75rem;
            --font-sm: 0.875rem;
            --font-base: 1rem;
            --font-lg: 1.125rem;
            --font-xl: 1.25rem;
            --font-2xl: 1.5rem;
            --font-3xl: 1.875rem;
            --font-4xl: 2.25rem;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'SF Pro Display', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(-45deg,
                #0f0f23 0%,
                #1a1a2e 25%,
                #16213e 50%,
                #0f3460 75%,
                #533483 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            min-height: 100vh;
            color: var(--text-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: var(--space-lg);
        }

        @keyframes gradientShift {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        .rating-container {
            max-width: 600px;
            width: 100%;
            animation: slideInFromBottom 0.8s ease-out;
        }

        @keyframes slideInFromBottom {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .glass-card {
            background: linear-gradient(135deg,
                rgba(255, 255, 255, 0.15) 0%,
                rgba(255, 255, 255, 0.05) 100%);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-xl);
            backdrop-filter: blur(40px);
            box-shadow: 0 25px 80px rgba(0, 0, 0, 0.3),
                        inset 0 1px 0 rgba(255, 255, 255, 0.2);
            padding: var(--space-2xl);
        }

        .profile-box {
            text-align: center;
            padding: var(--space-xl);
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-lg);
            margin-bottom: var(--space-xl);
            position: relative;
            overflow: hidden;
        }

        .profile-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            animation: shimmer 3s infinite;
        }

        @keyframes shimmer {
            0%, 100% { left: -100%; }
            50% { left: 100%; }
        }

        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid rgba(255, 255, 255, 0.2);
            margin-bottom: var(--space-md);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .profile-image:hover {
            transform: scale(1.05);
            border-color: var(--primary);
            box-shadow: 0 15px 40px rgba(99, 102, 241, 0.4);
        }

        .profile-name {
            font-size: var(--font-2xl);
            font-weight: 700;
            margin-bottom: var(--space-xs);
            background: linear-gradient(135deg, var(--primary), var(--secondary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .profile-username {
            font-size: var(--font-base);
            color: var(--text-secondary);
            margin-bottom: var(--space-md);
        }

        .profile-stats {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: var(--space-sm);
            font-size: var(--font-lg);
            color: var(--warning);
        }

        .rating-stars {
            font-size: 50px;
            margin: var(--space-xl) 0;
            display: flex;
            justify-content: center;
            gap: var(--space-sm);
        }

        .star {
            cursor: pointer;
            color: rgba(255, 255, 255, 0.2);
            transition: all var(--duration-normal) var(--spring-easing);
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .star:hover,
        .star.active {
            color: #ffd700;
            transform: scale(1.2) rotate(10deg);
            text-shadow: 0 0 20px rgba(255, 215, 0, 0.6);
        }

        .form-group {
            margin-bottom: var(--space-xl);
        }

        label {
            display: block;
            margin-bottom: var(--space-md);
            font-weight: 600;
            font-size: var(--font-lg);
            color: var(--text-primary);
        }

        .comment-wrapper {
            position: relative;
            border-radius: var(--radius-lg);
            overflow: hidden;
        }

        textarea {
            width: 100%;
            padding: var(--space-lg);
            background: rgba(255, 255, 255, 0.08);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-lg);
            font-family: inherit;
            font-size: var(--font-base);
            color: var(--text-primary);
            resize: vertical;
            min-height: 120px;
            transition: all var(--duration-normal) var(--smooth-easing);
            backdrop-filter: blur(20px);
        }

        textarea::placeholder {
            color: var(--text-muted);
        }

        textarea:focus {
            outline: none;
            border-color: var(--primary);
            background: rgba(255, 255, 255, 0.12);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.2);
            transform: translateY(-2px);
        }

        .submit-button {
            width: 100%;
            padding: var(--space-lg) var(--space-2xl);
            background: var(--button-gradient);
            border: none;
            border-radius: var(--radius-lg);
            color: var(--text-primary);
            font-size: var(--font-lg);
            font-weight: 600;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: all var(--duration-normal) var(--spring-easing);
            box-shadow: 0 10px 30px rgba(99, 102, 241, 0.3);
        }

        .submit-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.6s ease;
        }

        .submit-button:hover::before {
            left: 100%;
        }

        .submit-button:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 15px 40px rgba(99, 102, 241, 0.5);
        }

        .submit-button:active {
            transform: translateY(-1px) scale(1.01);
        }

        .submit-button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
            transform: none;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            padding: var(--space-md) var(--space-lg);
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-md);
            color: var(--text-secondary);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 600;
            transition: all var(--duration-normal) var(--smooth-easing);
            margin-top: var(--space-lg);
        }

        .back-link:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: var(--primary);
            color: var(--text-primary);
            transform: translateX(-5px);
        }

        @media (max-width: 768px) {
            .glass-card {
                padding: var(--space-lg);
            }

            .profile-name {
                font-size: var(--font-xl);
            }

            .rating-stars {
                font-size: 40px;
                gap: var(--space-xs);
            }

            .submit-button {
                padding: var(--space-md) var(--space-lg);
                font-size: var(--font-base);
            }
        }
    </style>
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

    <script>
        const stars = document.querySelectorAll('.star');
        const scoreInput = document.getElementById('score');
        const form = document.getElementById('ratingForm');

        // ระบบให้คะแนนดาว
        stars.forEach(star => {
            star.addEventListener('click', function() {
                const value = this.getAttribute('data-value');
                scoreInput.value = value;
                
                stars.forEach(s => {
                    if (s.getAttribute('data-value') <= value) {
                        s.classList.add('active');
                    } else {
                        s.classList.remove('active');
                    }
                });
            });

            star.addEventListener('mouseenter', function() {
                const value = this.getAttribute('data-value');
                stars.forEach(s => {
                    if (s.getAttribute('data-value') <= value) {
                        s.style.color = '#ffd700';
                    }
                });
            });

            star.addEventListener('mouseleave', function() {
                stars.forEach(s => {
                    if (!s.classList.contains('active')) {
                        s.style.color = 'rgba(255, 255, 255, 0.2)';
                    }
                });
            });
        });

        // ตรวจสอบและแสดง alert เมื่อส่งฟอร์ม
        form.addEventListener('submit', function(e) {
            if (scoreInput.value === '0') {
                e.preventDefault();
                Swal.fire({
                    icon: 'warning',
                    title: 'กรุณาให้คะแนน',
                    text: 'โปรดเลือกดาวเพื่อให้คะแนนก่อนส่ง',
                    confirmButtonColor: '#6366F1',
                    background: 'linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 100%)',
                    color: '#ffffff',
                    backdrop: 'rgba(0, 0, 0, 0.8)'
                });
                return false;
            }

            // แสดง loading
            Swal.fire({
                title: 'กำลังส่งคะแนน...',
                allowOutsideClick: false,
                background: 'linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 100%)',
                color: '#ffffff',
                backdrop: 'rgba(0, 0, 0, 0.8)',
                didOpen: () => {
                    Swal.showLoading();
                }
            });
        });

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
</body>
</html>