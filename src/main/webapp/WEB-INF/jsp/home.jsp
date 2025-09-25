<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Swap - หน้าหลัก</title>

    <!-- Aurora Glass Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aurora-theme.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        /* Home-specific overrides for Aurora theme */
        .home-container {
            padding: var(--space-lg);
            min-height: 100vh;
        }

        .welcome-card {
            text-align: center;
            margin-bottom: var(--space-xl);
        }

        .welcome-title {
            font-size: var(--font-4xl);
            font-weight: 700;
            color: var(--text-glass);
            margin-bottom: var(--space-md);
            text-shadow: 0 2px 4px rgba(255, 255, 255, 0.8);
            letter-spacing: -0.02em;
        }

        .welcome-subtitle {
            font-size: var(--font-lg);
            color: var(--text-glass-secondary);
            font-weight: 500;
            margin-bottom: var(--space-xl);
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: var(--space-md);
            margin-bottom: var(--space-lg);
            padding: var(--space-lg);
            background: var(--glass-bg);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius-lg);
            backdrop-filter: var(--blur-strength);
        }

        .user-avatar {
            width: 60px;
            height: 60px;
            background: var(--button-gradient);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-white);
            font-size: 24px;
        }

        .user-details h3 {
            color: var(--text-glass);
            font-size: var(--font-xl);
            font-weight: 600;
            margin-bottom: var(--space-xs);
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
        }

        .user-details p {
            color: var(--text-glass-secondary);
            font-size: var(--font-sm);
            font-weight: 500;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.4);
        }

        .action-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: var(--space-lg);
            margin-bottom: var(--space-xl);
        }

        .action-card {
            padding: var(--space-xl);
            text-align: center;
            transition: all var(--duration-normal) var(--smooth-easing);
            cursor: pointer;
        }

        .action-card:hover {
            transform: var(--hover-lift);
        }

        .action-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto var(--space-lg);
            background: var(--button-gradient);
            border-radius: var(--radius-xl);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-white);
            font-size: 36px;
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .action-card:hover .action-icon {
            transform: scale(1.05) rotate(5deg);
        }

        .action-title {
            font-size: var(--font-xl);
            font-weight: 600;
            color: var(--text-glass);
            margin-bottom: var(--space-sm);
            text-shadow: 0 1px 2px rgba(255, 255, 255, 0.6);
        }

        .action-description {
            font-size: var(--font-sm);
            color: var(--text-glass-secondary);
            font-weight: 500;
            line-height: 1.5;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.4);
        }

        .logout-section {
            text-align: center;
            margin-top: var(--space-2xl);
            padding-top: var(--space-lg);
            border-top: 1px solid var(--glass-border);
        }

        .logout-button {
            display: inline-flex;
            align-items: center;
            gap: var(--space-sm);
            color: var(--text-glass);
            text-decoration: none;
            font-size: var(--font-sm);
            font-weight: 500;
            padding: var(--space-md) var(--space-lg);
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.2);
            border-radius: var(--radius-md);
            backdrop-filter: var(--blur-strength);
            transition: all var(--duration-normal) var(--smooth-easing);
        }

        .logout-button:hover {
            background: rgba(239, 68, 68, 0.2);
            border-color: rgba(239, 68, 68, 0.4);
            transform: var(--hover-lift);
            text-decoration: none;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .action-grid {
                grid-template-columns: 1fr;
                gap: var(--space-md);
            }

            .welcome-title {
                font-size: var(--font-3xl);
            }

            .user-info {
                flex-direction: column;
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

    <!-- Main Home Container -->
    <div class="home-container">
        <div class="glass-card form-container" style="max-width: 800px; margin: 0 auto;">
            <!-- Welcome Section -->
            <div class="welcome-card">
                <h1 class="welcome-title">
                    <i class="fas fa-home"></i>
                    ยินดีต้อนรับสู่ Skill Swap!
                </h1>
                <p class="welcome-subtitle">แพลตฟอร์มแลกเปลี่ยนทักษะ สร้างโอกาสใหม่</p>
            </div>

            <!-- User Info Section -->
            <div class="user-info">
                <div class="user-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div class="user-details">
                    <h3>สวัสดี, ${sessionScope.user.username}!</h3>
                    <p>เข้าสู่ระบบสำเร็จแล้ว - พร้อมสำหรับการแลกเปลี่ยนทักษะ</p>
                </div>
            </div>

            <!-- Action Cards -->
            <div class="action-grid">
                <div class="glass-card action-card">
                    <div class="action-icon">
                        <i class="fas fa-search"></i>
                    </div>
                    <h3 class="action-title">ค้นหาทักษะ</h3>
                    <p class="action-description">
                        ค้นหาและเรียนรู้ทักษะใหม่ๆ จากผู้เชี่ยวชาญในชุมชนของเรา
                    </p>
                </div>

                <div class="glass-card action-card">
                    <div class="action-icon">
                        <i class="fas fa-plus-circle"></i>
                    </div>
                    <h3 class="action-title">แชร์ทักษะ</h3>
                    <p class="action-description">
                        แบ่งปันความรู้และทักษะของคุณให้กับผู้ที่สนใจ
                    </p>
                </div>

                <div class="glass-card action-card">
                    <div class="action-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3 class="action-title">เชื่อมต่อ</h3>
                    <p class="action-description">
                        พบปะกับคนใหม่ๆ และสร้างเครือข่ายในการแลกเปลี่ยนทักษะ
                    </p>
                </div>

                <div class="glass-card action-card">
                    <div class="action-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <h3 class="action-title">รีวิวและคะแนน</h3>
                    <p class="action-description">
                        ให้คะแนนและรีวิวประสบการณ์การแลกเปลี่ยนทักษะ
                    </p>
                </div>
            </div>

            <!-- Quick Stats -->
            <div class="glass-card" style="padding: var(--space-lg); text-align: center; margin-bottom: var(--space-lg);">
                <h3 class="text-glass text-xl font-semibold m-md">สถิติด่วน</h3>
                <div class="flex justify-center gap-4 text-center">
                    <div>
                        <div class="text-2xl font-bold text-glass">0</div>
                        <div class="text-sm text-glass opacity-70">ทักษะที่เรียนรู้</div>
                    </div>
                    <div class="w-px bg-glass-border"></div>
                    <div>
                        <div class="text-2xl font-bold text-glass">0</div>
                        <div class="text-sm text-glass opacity-70">ทักษะที่แชร์</div>
                    </div>
                    <div class="w-px bg-glass-border"></div>
                    <div>
                        <div class="text-2xl font-bold text-glass">0</div>
                        <div class="text-sm text-glass opacity-70">คะแนนรีวิว</div>
                    </div>
                </div>
            </div>

            <!-- Logout Section -->
            <div class="logout-section">
                <a href="doLogout" class="logout-button">
                    <i class="fas fa-sign-out-alt"></i>
                    ออกจากระบบ
                </a>
            </div>
        </div>
    </div>

    <script>
        // Enhanced interactions
        document.addEventListener('DOMContentLoaded', function() {
            const actionCards = document.querySelectorAll('.action-card');

            actionCards.forEach(card => {
                card.addEventListener('click', function() {
                    // Add click animation
                    this.style.transform = 'scale(0.95)';
                    setTimeout(() => {
                        this.style.transform = '';
                    }, 150);

                    // Future: Add navigation to specific features
                    console.log('Feature coming soon:', this.querySelector('.action-title').textContent);
                });
            });

            // Console branding
            console.log('%c🚀 Skill Swap Home', 'color: #6366F1; font-size: 16px; font-weight: bold;');
            console.log('%cAurora Glass Theme System', 'color: #8B5CF6; font-size: 12px;');
            console.log('%c✨ Welcome, ${sessionScope.user.username}!', 'color: #10B981; font-size: 14px;');
        });
    </script>
</body>
</html>