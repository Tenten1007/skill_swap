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
