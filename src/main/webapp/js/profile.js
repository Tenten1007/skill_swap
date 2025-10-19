        // Thai month names
        function getThaiMonth(monthNumber) {
            const months = {
                'JANUARY': 'มกราคม',
                'FEBRUARY': 'กุมภาพันธ์',
                'MARCH': 'มีนาคม',
                'APRIL': 'เมษายน',
                'MAY': 'พฤษภาคม',
                'JUNE': 'มิถุนายน',
                'JULY': 'กรกฎาคม',
                'AUGUST': 'สิงหาคม',
                'SEPTEMBER': 'กันยายน',
                'OCTOBER': 'ตุลาคม',
                'NOVEMBER': 'พฤศจิกายน',
                'DECEMBER': 'ธันวาคม'
            };
            return months[monthNumber] || monthNumber;
        }

        // Mobile Menu Toggle Function (must be global for onclick)
        function toggleMobileMenu() {
            const menu = document.getElementById('navbarMenu');
            menu.classList.toggle('active');
        }

        document.addEventListener('DOMContentLoaded', function() {
            // Convert month names to Thai
            document.querySelectorAll('.review-date').forEach(function(dateElement) {
                const text = dateElement.textContent.trim();
                const parts = text.split(/\s+/);
                if (parts.length === 3) {
                    const day = parts[0];
                    const month = getThaiMonth(parts[1]);
                    const year = parseInt(parts[2]) + 543; // Convert to Buddhist Era
                    dateElement.textContent = day + ' ' + month + ' ' + year;
                }
            });
            // Enhanced animations
            const elements = document.querySelectorAll('.profile-card, .profile-details');

            elements.forEach((element, index) => {
                element.style.animationDelay = `${index * 0.2}s`;
                element.classList.add('animate-in');
            });

            // Add ripple effect to buttons
            const buttons = document.querySelectorAll('.profile-btn, .action-button');
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;

                    ripple.style.cssText = `
                        position: absolute;
                        border-radius: 50%;
                        background: rgba(255, 255, 255, 0.3);
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                        animation: ripple 0.6s linear;
                        pointer-events: none;
                    `;

                    this.appendChild(ripple);
                    setTimeout(() => ripple.remove(), 600);
                });
            });

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
        });

        // Add animation styles
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(2);
                    opacity: 0;
                }
            }

            @keyframes animate-in {
                0% {
                    opacity: 0;
                    transform: translateY(30px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-in {
                animation: animate-in 0.6s ease-out forwards;
            }
        `;
        document.head.appendChild(style);

        // Load notification count
        function loadNotificationCount() {
            fetch('notifications/count')
                .then(response => response.json())
                .then(data => {
                    const badge = document.getElementById('notificationBadge');
                    if (data.count > 0) {
                        badge.textContent = data.count > 99 ? '99+' : data.count;
                        badge.style.display = 'flex';
                    } else {
                        badge.style.display = 'none';
                    }
                })
                .catch(error => console.error('Error loading notification count:', error));
        }

        loadNotificationCount();
        setInterval(loadNotificationCount, 30000);
