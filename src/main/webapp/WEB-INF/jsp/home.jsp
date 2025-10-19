<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c" uri="jakarta.tags.core" %> <%@
taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="th">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Skill Swap - Home Feed</title>

    <!-- Aurora Glass Theme -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/aurora-theme.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/home.css"
    />

    <!-- Icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
  </head>

  <body>
    <!-- Modern Sticky Navbar -->
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
          <a href="home" class="navbar-link nav-home active">
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
            <span
              class="notification-badge"
              id="notificationBadge"
              style="display: none"
            ></span>
          </a>
          <a href="profile" class="navbar-link nav-profile">
            <i class="fas fa-user"></i>
            Profile
          </a>
        </div>
      </div>
    </nav>

    <!-- Enhanced Background Effects -->
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
      <div style="max-width: 1200px; margin: 0 auto">
        <!-- Header Section -->
        <div class="header-section">
          <div class="welcome-info">
            <h1><i class="fas fa-sparkles"></i> For You</h1>
            <p>ทักษะที่แนะนำเฉพาะสำหรับคุณ</p>
          </div>

          <div class="user-section">
            <a href="doLogout" class="logout-button">
              <i class="fas fa-sign-out-alt"></i> ออกจากระบบ
            </a>
          </div>
        </div>

        <!-- Welcome Message -->
        <c:if test="${param.welcome == 'true'}">
          <div
            class="glass-card"
            style="
              margin-bottom: var(--space-xl);
              padding: var(--space-lg);
              background: rgba(59, 130, 246, 0.1);
              border: 1px solid rgba(59, 130, 246, 0.3);
              animation: slideInFromTop 0.5s ease-out;
            "
          >
            <div
              style="
                display: flex;
                align-items: center;
                gap: var(--space-sm);
                color: #ffffff;
              "
            >
              <i class="fas fa-hand-wave" style="font-size: 20px"></i>
              <span style="font-weight: 600; font-size: var(--font-base)"
                >ยินดีต้อนรับสู่ Skill Swap! 👋</span
              >
            </div>
            <p
              style="
                margin: var(--space-sm) 0 0 28px;
                color: rgba(255, 255, 255, 0.8);
                font-size: var(--font-sm);
              "
            >
              เข้าสู่ระบบสำเร็จแล้ว พร้อมแลกเปลี่ยนทักษะกับชุมชนของเรา
            </p>
          </div>
        </c:if>

        <!-- Success Message -->
        <c:if test="${param.success == 'skill-created'}">
          <div
            class="glass-card"
            style="
              margin-bottom: var(--space-xl);
              padding: var(--space-lg);
              background: rgba(16, 185, 129, 0.1);
              border: 1px solid rgba(16, 185, 129, 0.3);
              animation: slideInFromTop 0.5s ease-out;
            "
          >
            <div
              style="
                display: flex;
                align-items: center;
                gap: var(--space-sm);
                color: var(--success);
              "
            >
              <i class="fas fa-check-circle" style="font-size: 20px"></i>
              <span style="font-weight: 600; font-size: var(--font-base)"
                >สร้าง Skill Offer สำเร็จแล้ว! 🎉</span
              >
            </div>
            <p
              style="
                margin: var(--space-sm) 0 0 28px;
                color: rgba(16, 185, 129, 0.8);
                font-size: var(--font-sm);
              "
            >
              ทักษะของคุณถูกเพิ่มเข้าสู่ระบบแล้ว
              ผู้คนจะสามารถค้นหาและติดต่อคุณได้
            </p>
          </div>
        </c:if>

        <!-- Personal Stats Dashboard -->
        <div
          style="
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: var(--space-md);
            margin-bottom: var(--space-2xl);
          "
        >
          <div
            class="glass-card"
            style="padding: var(--space-lg); text-align: center"
          >
            <div style="font-size: 2.5rem; margin-bottom: var(--space-sm)">
              🎯
            </div>
            <div
              style="
                font-size: 2rem;
                font-weight: 700;
                color: var(--primary);
                margin-bottom: var(--space-xs);
              "
            >
              ${myActiveOffers}
            </div>
            <div
              style="color: var(--text-secondary); font-size: var(--font-sm)"
            >
              My Active Skills
            </div>
          </div>
          <div
            class="glass-card"
            style="padding: var(--space-lg); text-align: center"
          >
            <div style="font-size: 2.5rem; margin-bottom: var(--space-sm)">
              🤝
            </div>
            <div
              style="
                font-size: 2rem;
                font-weight: 700;
                color: var(--accent);
                margin-bottom: var(--space-xs);
              "
            >
              ${totalMatches}
            </div>
            <div
              style="color: var(--text-secondary); font-size: var(--font-sm)"
            >
              Total Matches
            </div>
          </div>
          <div
            class="glass-card"
            style="padding: var(--space-lg); text-align: center"
          >
            <div style="font-size: 2.5rem; margin-bottom: var(--space-sm)">
              ⏳
            </div>
            <div
              style="
                font-size: 2rem;
                font-weight: 700;
                color: var(--warning);
                margin-bottom: var(--space-xs);
              "
            >
              ${pendingRequests}
            </div>
            <div
              style="color: var(--text-secondary); font-size: var(--font-sm)"
            >
              Pending Requests
            </div>
          </div>
        </div>

        <!-- Recommended Skills Section -->
        <c:if test="${not empty recommendedSkills}">
          <div style="margin-bottom: var(--space-2xl)">
            <div class="feed-header">
              <h2 class="feed-title">
                <i class="fas fa-star" style="color: var(--warning)"></i>
                แนะนำสำหรับคุณ
                <span
                  style="
                    font-size: var(--font-base);
                    font-weight: normal;
                    opacity: 0.7;
                  "
                >
                  (ตามพื้นที่ของคุณ)
                </span>
              </h2>
            </div>
            <div class="skill-offers-grid">
              <c:forEach var="offer" items="${recommendedSkills}">
                <div class="glass-card skill-offer-card">
                  <div class="skill-header">
                    <span class="skill-category">${offer.categoryName}</span>
                    <span class="skill-level-badge ${offer.level}"
                      >${offer.level}</span
                    >
                  </div>
                  <h3 class="skill-title">${offer.title}</h3>
                  <p class="skill-description">${offer.description}</p>
                  <div class="skill-meta">
                    <span
                      ><i class="fas fa-user"></i>
                      <c:choose>
                        <c:when test="${offer.userId != null}">
                          <a
                            href="user-profile?userId=${offer.userId}"
                            style="
                              color: inherit;
                              text-decoration: none;
                              transition: color 0.3s;
                            "
                            onmouseover="this.style.color='var(--primary)'"
                            onmouseout="this.style.color='inherit'"
                            >${offer.userName}</a
                          >
                        </c:when>
                        <c:otherwise> ${offer.userName} </c:otherwise>
                      </c:choose>
                    </span>
                    <span
                      ><i class="fas fa-map-marker-alt"></i>
                      ${offer.location}</span
                    >
                  </div>
                  <div class="skill-footer">
                    <span class="time-commitment"
                      ><i class="fas fa-clock"></i>
                      ${offer.timeCommitment}</span
                    >
                    <a href="skill?id=${offer.id}" class="detail-button">
                      <span>ดูรายละเอียด</span>
                      <i class="fas fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </c:if>

        <!-- Recent/Trending Skills Section -->
        <c:if test="${not empty recentSkills}">
          <div style="margin-bottom: var(--space-2xl)">
            <div class="feed-header">
              <h2 class="feed-title">
                <i class="fas fa-fire" style="color: var(--error)"></i>
                ทักษะล่าสุด
                <span
                  style="
                    font-size: var(--font-base);
                    font-weight: normal;
                    opacity: 0.7;
                  "
                >
                  (อัพเดตใหม่)
                </span>
              </h2>
            </div>
            <div class="skill-offers-grid">
              <c:forEach var="offer" items="${recentSkills}">
                <div class="glass-card skill-offer-card">
                  <div class="skill-header">
                    <span class="skill-category">${offer.categoryName}</span>
                    <span class="skill-level-badge ${offer.level}"
                      >${offer.level}</span
                    >
                  </div>
                  <h3 class="skill-title">${offer.title}</h3>
                  <p class="skill-description">${offer.description}</p>
                  <div class="skill-meta">
                    <span
                      ><i class="fas fa-user"></i>
                      <c:choose>
                        <c:when test="${offer.userId != null}">
                          <a
                            href="user-profile?userId=${offer.userId}"
                            style="
                              color: inherit;
                              text-decoration: none;
                              transition: color 0.3s;
                            "
                            onmouseover="this.style.color='var(--primary)'"
                            onmouseout="this.style.color='inherit'"
                            >${offer.userName}</a
                          >
                        </c:when>
                        <c:otherwise> ${offer.userName} </c:otherwise>
                      </c:choose>
                    </span>
                    <span
                      ><i class="fas fa-map-marker-alt"></i>
                      ${offer.location}</span
                    >
                  </div>
                  <div class="skill-footer">
                    <span class="time-commitment"
                      ><i class="fas fa-clock"></i>
                      ${offer.timeCommitment}</span
                    >
                    <a href="skill?id=${offer.id}" class="detail-button">
                      <span>ดูรายละเอียด</span>
                      <i class="fas fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </c:if>

        <!-- Nearby Skills Section -->
        <c:if test="${not empty nearbySkills}">
          <div style="margin-bottom: var(--space-2xl)">
            <div class="feed-header">
              <h2 class="feed-title">
                <i
                  class="fas fa-location-dot"
                  style="color: var(--success)"
                ></i>
                ทักษะใกล้คุณ
                <span
                  style="
                    font-size: var(--font-base);
                    font-weight: normal;
                    opacity: 0.7;
                  "
                >
                  (${user.location})
                </span>
              </h2>
            </div>
            <div class="skill-offers-grid">
              <c:forEach var="offer" items="${nearbySkills}">
                <div class="glass-card skill-offer-card">
                  <div class="skill-header">
                    <span class="skill-category">${offer.categoryName}</span>
                    <span class="skill-level-badge ${offer.level}"
                      >${offer.level}</span
                    >
                  </div>
                  <h3 class="skill-title">${offer.title}</h3>
                  <p class="skill-description">${offer.description}</p>
                  <div class="skill-meta">
                    <span
                      ><i class="fas fa-user"></i>
                      <c:choose>
                        <c:when test="${offer.userId != null}">
                          <a
                            href="user-profile?userId=${offer.userId}"
                            style="
                              color: inherit;
                              text-decoration: none;
                              transition: color 0.3s;
                            "
                            onmouseover="this.style.color='var(--primary)'"
                            onmouseout="this.style.color='inherit'"
                            >${offer.userName}</a
                          >
                        </c:when>
                        <c:otherwise> ${offer.userName} </c:otherwise>
                      </c:choose>
                    </span>
                    <span
                      ><i class="fas fa-map-marker-alt"></i>
                      ${offer.location}</span
                    >
                  </div>
                  <div class="skill-footer">
                    <span class="time-commitment"
                      ><i class="fas fa-clock"></i>
                      ${offer.timeCommitment}</span
                    >
                    <a href="skill?id=${offer.id}" class="detail-button">
                      <span>ดูรายละเอียด</span>
                      <i class="fas fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </c:if>

        <!-- Empty State -->
        <c:if
          test="${empty recommendedSkills and empty recentSkills and empty nearbySkills}"
        >
          <div
            class="glass-card"
            style="padding: var(--space-2xl); text-align: center"
          >
            <div style="font-size: 4rem; margin-bottom: var(--space-lg)">
              🔍
            </div>
            <h3
              style="color: var(--text-primary); margin-bottom: var(--space-md)"
            >
              ยังไม่มีทักษะในระบบ
            </h3>
            <p
              style="
                color: var(--text-secondary);
                margin-bottom: var(--space-lg);
              "
            >
              เป็นคนแรกที่แชร์ทักษะของคุณกับชุมชน หรือลองค้นหาทักษะใน Browse All
            </p>
            <a href="add-skill" class="add-skill-button">
              <i class="fas fa-plus-circle"></i>
              เพิ่มทักษะแรกของคุณ
            </a>
          </div>
        </c:if>
      </div>
    </div>
  </body>

  <script src="${pageContext.request.contextPath}/js/home.js"></script>
</html>
