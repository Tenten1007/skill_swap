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
