document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('skillForm');
            const categorySelect = document.getElementById('categoryId');
            const categoryIcon = document.getElementById('categoryIcon');
            const submitBtn = document.getElementById('submitBtn');

            // Category icon mapping (same as home page)
            function getCategoryIcon(categoryName) {
                const categoryIcons = {
                    'Programming': 'fas fa-code',
                    'Design': 'fas fa-palette',
                    'Marketing': 'fas fa-chart-line',
                    'Photography': 'fas fa-camera',
                    'Music': 'fas fa-music',
                    'Language': 'fas fa-globe-americas',
                    'Cooking': 'fas fa-utensils',
                    'Fitness': 'fas fa-dumbbell',
                    'Writing': 'fas fa-feather-alt',
                    'Business': 'fas fa-briefcase'
                };

                return categoryIcons[categoryName] || 'fas fa-layer-group';
            }

            // Update category icon
            function updateCategoryIcon() {
                const selectedOption = categorySelect.options[categorySelect.selectedIndex];
                const categoryName = selectedOption.textContent.trim().replace(/^[^\s]+\s/, ''); // Remove emoji
                const iconClass = getCategoryIcon(categoryName);

                categoryIcon.className = iconClass + ' category-icon';
                categoryIcon.style.color = categorySelect.value ? 'var(--primary)' : 'rgba(255, 255, 255, 0.7)';
            }

            // Category change handler
            categorySelect.addEventListener('change', function() {
                updateCategoryIcon();
                validateField(this);
            });

            // Form validation
            function validateField(field) {
                const value = field.value.trim();

                if (field.hasAttribute('required') && !value) {
                    field.classList.add('error');
                    field.classList.remove('success');
                    return false;
                } else if (value) {
                    field.classList.add('success');
                    field.classList.remove('error');
                    return true;
                } else {
                    field.classList.remove('error', 'success');
                    return true;
                }
            }

            // Add validation to required fields
            const requiredFields = form.querySelectorAll('[required]');
            requiredFields.forEach(field => {
                field.addEventListener('blur', () => validateField(field));
                field.addEventListener('input', () => {
                    if (field.classList.contains('error')) {
                        validateField(field);
                    }
                });
            });

            // Form submit handler
            form.addEventListener('submit', function(e) {
                e.preventDefault();

                let isValid = true;
                requiredFields.forEach(field => {
                    if (!validateField(field)) {
                        isValid = false;
                    }
                });

                if (!isValid) {
                    // Scroll to first error
                    const firstError = form.querySelector('.error');
                    if (firstError) {
                        firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                        firstError.focus();
                    }
                    return;
                }

                // Add loading state
                form.classList.add('loading');
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> กำลังสร้าง...';

                // Submit form
                setTimeout(() => {
                    form.submit();
                }, 500);
            });

            // Enhanced input animations
            const inputs = form.querySelectorAll('.form-input, .form-textarea, .form-select');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-2px)';
                });

                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = '';
                });
            });

            // Initialize category icon
            updateCategoryIcon();
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