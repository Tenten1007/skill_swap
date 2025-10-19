        document.addEventListener('DOMContentLoaded', function() {
            // Enhanced card animations
            const cards = document.querySelectorAll('.offer-card, .stat-card');

            cards.forEach((card, index) => {
                card.style.animationDelay = `${index * 0.1}s`;
                card.classList.add('animate-in');
            });

            // Add ripple effect to action buttons
            const buttons = document.querySelectorAll('.btn-action, .action-button');
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
        });

        function confirmDelete(offerId) {
            if (confirm('คุณแน่ใจหรือไม่ที่จะลบ Skill Offer นี้?\n\nการลบจะทำให้:\n- Skill Offer นี้ถูกลบถาวร\n- คำขอแลกเปลี่ยนที่เกี่ยวข้องจะถูกลบ\n- การกระทำนี้ไม่สามารถยกเลิกได้')) {
                // สร้าง form เพื่อส่ง POST request
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'delete-skill';

                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'skillOfferId';
                input.value = offerId;

                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            }
            return false; // ป้องกันการ navigate ของ link
        }

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

        // Add ripple animation
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
