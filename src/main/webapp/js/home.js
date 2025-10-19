
                    // Enhanced Interactive Functionality
                    document.addEventListener('DOMContentLoaded', function () {
                        const searchInput = document.querySelector('.search-input');
                        const filterSelects = document.querySelectorAll('.filter-select');
                        const skillCards = document.querySelectorAll('.skill-offer-card');
                        const addSkillButton = document.querySelector('.add-skill-button');

                        // Category select is now simple, no icon animation needed

                        // Enhanced dropdown interactions with premium animations
                        filterSelects.forEach(select => {
                            const wrapper = select.closest('.custom-select-wrapper');
                            const dropdownArrow = wrapper.querySelector('.dropdown-arrow');

                            // Enhanced premium dropdown interactions
                            select.addEventListener('focus', function () {
                                wrapper.classList.add('dropdown-focused');
                                wrapper.style.transform = 'translateY(-4px) scale(1.02)';
                                wrapper.style.boxShadow = '0 25px 60px rgba(99, 102, 241, 0.3), 0 0 0 3px rgba(99, 102, 241, 0.4)';
                            });

                            select.addEventListener('blur', function () {
                                setTimeout(() => {
                                    wrapper.classList.remove('dropdown-focused');
                                    wrapper.style.transform = '';
                                    wrapper.style.boxShadow = '';
                                }, 150);
                            });

                            // Enhanced mouseenter/mouseleave
                            wrapper.addEventListener('mouseenter', function () {
                                if (!wrapper.classList.contains('dropdown-focused')) {
                                    this.style.transform = 'translateY(-4px) scale(1.02)';
                                    this.style.boxShadow = '0 20px 50px rgba(99, 102, 241, 0.25), 0 0 0 1px rgba(255, 255, 255, 0.3)';
                                }
                            });

                            wrapper.addEventListener('mouseleave', function () {
                                if (!wrapper.classList.contains('dropdown-focused')) {
                                    this.style.transform = '';
                                    this.style.boxShadow = '';
                                }
                            });

                            // Add hover effect for options to preview icons
                            select.addEventListener('mouseover', function (e) {
                                if (e.target.tagName === 'OPTION') {
                                    const optionText = e.target.textContent;
                                    const previewIcon = getCategoryIcon(optionText);
                                    const iconElement = wrapper.querySelector('.category-icon');

                                    // Store current icon
                                    if (!iconElement.dataset.originalIcon) {
                                        iconElement.dataset.originalIcon = iconElement.className;
                                    }

                                    // Preview new icon with subtle animation
                                    iconElement.className = previewIcon + ' category-icon';
                                    iconElement.style.transform = 'translateY(-50%) scale(1.1)';
                                    iconElement.style.filter = 'drop-shadow(0 0 8px rgba(99, 102, 241, 0.6))';
                                }
                            });

                            select.addEventListener('mouseout', function () {
                                const iconElement = wrapper.querySelector('.category-icon');
                                if (iconElement.dataset.originalIcon) {
                                    // Restore original icon
                                    iconElement.className = iconElement.dataset.originalIcon;
                                    iconElement.style.transform = 'translateY(-50%) scale(1)';
                                    iconElement.style.filter = 'drop-shadow(0 0 4px rgba(255, 255, 255, 0.2))';
                                }
                            });

                            // Auto-submit on change with enhanced feedback and animations
                            select.addEventListener('change', function () {
                                // Clear the original icon data since we're changing
                                const iconElement = wrapper.querySelector('.category-icon');
                                delete iconElement.dataset.originalIcon;
                                // Add spectacular loading animation
                                const form = this.closest('form');
                                const filterSection = document.querySelector('.search-filter-section');

                                // Create loading overlay with glassmorphism
                                const loadingOverlay = document.createElement('div');
                                loadingOverlay.style.cssText = `
                        position: absolute;
                        top: 0;
                        left: 0;
                        right: 0;
                        bottom: 0;
                        background: rgba(99, 102, 241, 0.1);
                        backdrop-filter: blur(10px);
                        border-radius: var(--radius-xl);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        z-index: 1000;
                        opacity: 0;
                        transition: all 0.3s ease;
                    `;

                                const loader = document.createElement('div');
                                loader.style.cssText = `
                        width: 40px;
                        height: 40px;
                        border: 3px solid rgba(255, 255, 255, 0.3);
                        border-radius: 50%;
                        border-top: 3px solid var(--primary);
                        animation: spin 1s linear infinite;
                        box-shadow: 0 0 20px rgba(99, 102, 241, 0.5);
                    `;

                                loadingOverlay.appendChild(loader);
                                filterSection.style.position = 'relative';
                                filterSection.appendChild(loadingOverlay);

                                // Animate in loading overlay
                                setTimeout(() => {
                                    loadingOverlay.style.opacity = '1';
                                }, 10);

                                // Category select is now simple, no icon needed

                                // Add enhanced delay for better UX
                                setTimeout(() => {
                                    form.submit();
                                }, 500);
                            });
                        });

                        // Get the correct icon class for a category
                        function getCategoryIcon(categoryName) {
                            // Complete enhanced icon mapping with modern FontAwesome icons
                            const categoryIcons = {
                                // Thai text
                                'หมวดหมู่ทั้งหมด': 'fas fa-th-large',
                                'หมวดหมู่': 'fas fa-th-large',
                                'ทั้งหมด': 'fas fa-th-large',

                                // English categories
                                'Programming': 'fas fa-laptop-code',
                                'Design': 'fas fa-paint-brush',
                                'Marketing': 'fas fa-bullhorn',
                                'Photography': 'fas fa-camera',
                                'Music': 'fas fa-music',
                                'Language': 'fas fa-globe',
                                'Cooking': 'fas fa-utensils',
                                'Fitness': 'fas fa-dumbbell',
                                'Writing': 'fas fa-pen',
                                'Business': 'fas fa-briefcase',

                                // Additional variations and alternatives
                                'Web Development': 'fas fa-laptop-code',
                                'Mobile Development': 'fas fa-mobile-alt',
                                'Data Science': 'fas fa-chart-bar',
                                'AI': 'fas fa-robot',
                                'Graphic Design': 'fas fa-paint-brush',
                                'UI/UX': 'fas fa-pencil-ruler',
                                'Digital Marketing': 'fas fa-bullhorn',
                                'SEO': 'fas fa-search',
                                'Video': 'fas fa-video',
                                'Audio': 'fas fa-volume-up',
                                'Teaching': 'fas fa-chalkboard-teacher',
                                'Translation': 'fas fa-language',
                                'Sports': 'fas fa-running',
                                'Health': 'fas fa-heartbeat',
                                'Finance': 'fas fa-calculator',
                                'Management': 'fas fa-users-cog',

                                // Generic fallback patterns
                                'Tech': 'fas fa-microchip',
                                'Art': 'fas fa-palette',
                                'Media': 'fas fa-photo-video',
                                'Education': 'fas fa-graduation-cap',
                                'Health': 'fas fa-plus-square'
                            };

                            // Enhanced detection with multiple matching strategies
                            let iconClass = 'fas fa-layer-group'; // default

                            // Strategy 1: Exact match
                            if (categoryIcons[categoryName.trim()]) {
                                iconClass = categoryIcons[categoryName.trim()];
                            } else {
                                // Strategy 2: Contains match (case insensitive)
                                const lowerCategoryName = categoryName.toLowerCase();
                                let found = false;

                                Object.keys(categoryIcons).forEach(category => {
                                    if (!found && lowerCategoryName.includes(category.toLowerCase())) {
                                        iconClass = categoryIcons[category];
                                        found = true;
                                    }
                                });

                                // Strategy 3: Keyword matching
                                if (!found) {
                                    if (lowerCategoryName.includes('program') || lowerCategoryName.includes('code') || lowerCategoryName.includes('dev')) {
                                        iconClass = 'fas fa-code';
                                    } else if (lowerCategoryName.includes('design') || lowerCategoryName.includes('art')) {
                                        iconClass = 'fas fa-palette';
                                    } else if (lowerCategoryName.includes('market') || lowerCategoryName.includes('sale')) {
                                        iconClass = 'fas fa-chart-line';
                                    } else if (lowerCategoryName.includes('photo') || lowerCategoryName.includes('camera')) {
                                        iconClass = 'fas fa-camera';
                                    } else if (lowerCategoryName.includes('music') || lowerCategoryName.includes('sound')) {
                                        iconClass = 'fas fa-music';
                                    } else if (lowerCategoryName.includes('language') || lowerCategoryName.includes('lang')) {
                                        iconClass = 'fas fa-globe-americas';
                                    } else if (lowerCategoryName.includes('cook') || lowerCategoryName.includes('food')) {
                                        iconClass = 'fas fa-utensils';
                                    } else if (lowerCategoryName.includes('fit') || lowerCategoryName.includes('sport') || lowerCategoryName.includes('exercise')) {
                                        iconClass = 'fas fa-dumbbell';
                                    } else if (lowerCategoryName.includes('writ') || lowerCategoryName.includes('content')) {
                                        iconClass = 'fas fa-feather-alt';
                                    } else if (lowerCategoryName.includes('business') || lowerCategoryName.includes('manage')) {
                                        iconClass = 'fas fa-briefcase';
                                    }
                                }
                            }

                            return iconClass;
                        }

                        // Enhanced category icon update with premium animations
                        function updateCategoryIconEnhanced(selectElement, withAnimation = true) {
                            const wrapper = selectElement.closest('.custom-select-wrapper');
                            const iconElement = wrapper.querySelector('.category-icon');
                            const selectedOption = selectElement.options[selectElement.selectedIndex];

                            // Get symbol from data-symbol attribute
                            let newSymbol = selectedOption.getAttribute('data-symbol');
                            if (!newSymbol) {
                                newSymbol = '📋'; // default symbol
                            }

                            if (!withAnimation) {
                                // Simple update without animation for initial load
                                iconElement.textContent = newSymbol;
                                return;
                            }

                            // Premium multi-stage animation with particle effects
                            iconElement.style.transition = 'all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275)';
                            iconElement.style.transform = 'translateY(-50%) scale(0) rotate(-180deg)';
                            iconElement.style.opacity = '0';
                            iconElement.style.filter = 'blur(4px)';

                            // Create sparkle effect
                            createSparkleEffect(wrapper);

                            setTimeout(() => {
                                iconElement.textContent = newSymbol;
                                iconElement.style.transform = 'translateY(-50%) scale(1.3) rotate(0deg)';
                                iconElement.style.opacity = '1';
                                iconElement.style.filter = 'blur(0px) drop-shadow(0 0 12px rgba(99, 102, 241, 0.8))';

                                setTimeout(() => {
                                    iconElement.style.transform = 'translateY(-50%) scale(1.15) rotate(0deg)';
                                    iconElement.style.filter = 'drop-shadow(0 0 8px rgba(99, 102, 241, 0.4))';

                                    setTimeout(() => {
                                        iconElement.style.transform = 'translateY(-50%) scale(1) rotate(0deg)';
                                        iconElement.style.filter = 'drop-shadow(0 0 4px rgba(255, 255, 255, 0.2))';
                                    }, 200);
                                }, 200);
                            }, 300);
                        }

                        // Create enhanced sparkle particle effect for icon change
                        function createSparkleEffect(wrapper) {
                            const sparkleCount = 12;
                            const iconElement = wrapper.querySelector('.category-icon');
                            const iconRect = iconElement.getBoundingClientRect();
                            const wrapperRect = wrapper.getBoundingClientRect();

                            const animations = ['sparkleAnimation', 'sparkleAnimation2', 'sparkleAnimation3'];
                            const colors = [
                                'linear-gradient(45deg, var(--primary), var(--accent))',
                                'linear-gradient(45deg, var(--secondary), var(--success))',
                                'linear-gradient(45deg, var(--accent), var(--warning))'
                            ];

                            for (let i = 0; i < sparkleCount; i++) {
                                const sparkle = document.createElement('div');
                                const animationName = animations[i % 3];
                                const color = colors[i % 3];
                                const size = Math.random() * 3 + 2; // 2-5px

                                sparkle.style.cssText = `
                        position: absolute;
                        width: ${size}px;
                        height: ${size}px;
                        background: ${color};
                        border-radius: 50%;
                        pointer-events: none;
                        z-index: 1000;
                        left: ${iconRect.left - wrapperRect.left + iconRect.width / 2}px;
                        top: ${iconRect.top - wrapperRect.top + iconRect.height / 2}px;
                        transform: translate(-50%, -50%);
                        animation: ${animationName} 1s ease-out forwards;
                        animation-delay: ${i * 80}ms;
                        box-shadow: 0 0 8px rgba(99, 102, 241, 0.9);
                    `;

                                wrapper.appendChild(sparkle);

                                // Remove sparkle after animation
                                setTimeout(() => {
                                    if (sparkle.parentNode) {
                                        sparkle.parentNode.removeChild(sparkle);
                                    }
                                }, 1200 + (i * 80));
                            }
                        }

                        // Enhanced search input interactions with modern effects
                        searchInput.addEventListener('focus', function () {
                            this.parentElement.classList.add('search-focused');
                            // Add glow effect
                            this.style.boxShadow = '0 0 0 4px rgba(99, 102, 241, 0.2), 0 20px 40px rgba(0, 0, 0, 0.15)';
                        });

                        searchInput.addEventListener('blur', function () {
                            this.parentElement.classList.remove('search-focused');
                            setTimeout(() => {
                                if (this.value.length === 0) {
                                    this.style.boxShadow = '';
                                    this.style.borderColor = 'rgba(255, 255, 255, 0.2)';
                                }
                            }, 150);
                        });

                        // Real-time search validation with visual feedback
                        searchInput.addEventListener('input', function () {
                            const length = this.value.length;

                            if (length > 2) {
                                this.style.borderColor = 'var(--success)';
                                this.style.boxShadow = '0 0 0 3px rgba(16, 185, 129, 0.2)';
                                // Add checkmark icon
                                const existingIcon = this.parentElement.querySelector('.validation-icon');
                                if (existingIcon) existingIcon.remove();

                                const icon = document.createElement('i');
                                icon.className = 'fas fa-check-circle validation-icon';
                                icon.style.cssText = `
                        position: absolute;
                        right: 20px;
                        top: 50%;
                        transform: translateY(-50%);
                        color: var(--success);
                        z-index: 4;
                        animation: bounceIn 0.3s ease-out;
                    `;
                                this.parentElement.appendChild(icon);
                            } else if (length > 0) {
                                this.style.borderColor = 'var(--warning)';
                                this.style.boxShadow = '0 0 0 3px rgba(245, 158, 11, 0.2)';
                                // Remove validation icon
                                const existingIcon = this.parentElement.querySelector('.validation-icon');
                                if (existingIcon) existingIcon.remove();
                            } else {
                                this.style.borderColor = 'rgba(255, 255, 255, 0.2)';
                                this.style.boxShadow = '';
                                // Remove validation icon
                                const existingIcon = this.parentElement.querySelector('.validation-icon');
                                if (existingIcon) existingIcon.remove();
                            }

                            // Search suggestions simulation
                            if (length > 1) {
                                setTimeout(() => this.simulateSearchSuggestions(), 300);
                            }
                        });

                        // Simulate search suggestions
                        searchInput.simulateSearchSuggestions = function () {
                            // Remove existing suggestions
                            const existingSuggestions = document.querySelector('.search-suggestions');
                            if (existingSuggestions) {
                                existingSuggestions.remove();
                            }

                            if (this.value.length < 2) return;

                            // Create suggestions dropdown
                            const suggestions = document.createElement('div');
                            suggestions.className = 'search-suggestions';
                            suggestions.style.cssText = `
                    position: absolute;
                    top: 100%;
                    left: 0;
                    right: 0;
                    background: rgba(255, 255, 255, 0.95);
                    border: 1px solid rgba(255, 255, 255, 0.3);
                    border-radius: var(--radius-lg);
                    backdrop-filter: blur(20px);
                    z-index: 1000;
                    margin-top: 8px;
                    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
                    max-height: 200px;
                    overflow-y: auto;
                    animation: fadeInUp 0.3s ease-out;
                `;

                            // Sample suggestions based on input
                            const query = this.value.toLowerCase();
                            const sampleSuggestions = [
                                'Programming', 'Web Development', 'Mobile App Development',
                                'Graphic Design', 'UI/UX Design', 'Digital Marketing',
                                'Photography', 'Video Editing', 'Music Production',
                                'Language Teaching', 'Cooking', 'Fitness Training'
                            ].filter(item => item.toLowerCase().includes(query)).slice(0, 5);

                            sampleSuggestions.forEach((suggestion, index) => {
                                const item = document.createElement('div');
                                item.className = 'suggestion-item';
                                item.textContent = suggestion;
                                item.style.cssText = `
                        padding: 12px 16px;
                        cursor: pointer;
                        transition: all 0.2s ease;
                        color: #333;
                        font-weight: 500;
                        border-bottom: ${index < sampleSuggestions.length - 1 ? '1px solid rgba(255, 255, 255, 0.3)' : 'none'};
                    `;

                                item.addEventListener('mouseenter', function () {
                                    this.style.background = 'rgba(99, 102, 241, 0.1)';
                                    this.style.color = 'var(--primary)';
                                });

                                item.addEventListener('mouseleave', function () {
                                    this.style.background = 'transparent';
                                    this.style.color = '#333';
                                });

                                item.addEventListener('click', () => {
                                    searchInput.value = suggestion;
                                    suggestions.remove();
                                    searchInput.dispatchEvent(new Event('input'));
                                });

                                suggestions.appendChild(item);
                            });

                            if (sampleSuggestions.length > 0) {
                                this.parentElement.appendChild(suggestions);

                                // Remove suggestions when clicking outside
                                setTimeout(() => {
                                    document.addEventListener('click', function removeSuggestions(e) {
                                        if (!suggestions.contains(e.target) && e.target !== searchInput) {
                                            suggestions.remove();
                                            document.removeEventListener('click', removeSuggestions);
                                        }
                                    });
                                }, 100);
                            }
                        };

                        // Enhanced card interactions
                        skillCards.forEach((card, index) => {
                            // Add ripple effect on click
                            card.addEventListener('click', function (e) {
                                const ripple = document.createElement('div');
                                const rect = this.getBoundingClientRect();
                                const size = Math.max(rect.width, rect.height);
                                const x = e.clientX - rect.left - size / 2;
                                const y = e.clientY - rect.top - size / 2;

                                ripple.style.cssText = `
                        position: absolute;
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                        background: radial-gradient(circle, rgba(255,255,255,0.3) 0%, transparent 70%);
                        border-radius: 50%;
                        pointer-events: none;
                        animation: ripple 0.6s linear;
                        z-index: 10;
                    `;

                                this.appendChild(ripple);

                                setTimeout(() => ripple.remove(), 600);

                            });

                            // Add hover tilt effect
                            card.addEventListener('mouseenter', function (e) {
                                const rect = this.getBoundingClientRect();
                                const centerX = rect.left + rect.width / 2;
                                const centerY = rect.top + rect.height / 2;
                                const deltaX = (e.clientX - centerX) / rect.width;
                                const deltaY = (e.clientY - centerY) / rect.height;

                                this.style.transform = `
                        translateY(-8px)
                        scale(1.02)
                        rotateX(${deltaY * 5}deg)
                        rotateY(${deltaX * 5}deg)
                    `;
                            });

                            card.addEventListener('mouseleave', function () {
                                this.style.transform = 'translateY(0) scale(1) rotateX(0) rotateY(0)';
                            });

                            // Add mouse move parallax effect
                            card.addEventListener('mousemove', function (e) {
                                const rect = this.getBoundingClientRect();
                                const centerX = rect.left + rect.width / 2;
                                const centerY = rect.top + rect.height / 2;
                                const deltaX = (e.clientX - centerX) / rect.width;
                                const deltaY = (e.clientY - centerY) / rect.height;

                                this.style.transform = `
                        translateY(-8px)
                        scale(1.02)
                        rotateX(${deltaY * 3}deg)
                        rotateY(${deltaX * 3}deg)
                    `;
                            });
                        });

                        // Add smooth scroll to top functionality
                        let isScrolling = false;
                        window.addEventListener('scroll', function () {
                            if (!isScrolling) {
                                window.requestAnimationFrame(function () {
                                    const scrolled = window.pageYOffset;
                                    const rate = scrolled * -0.5;

                                    // Parallax effect for floating shapes
                                    const shapes = document.querySelectorAll('.shape');
                                    shapes.forEach((shape, index) => {
                                        const speed = (index + 1) * 0.3;
                                        shape.style.transform = `translateY(${rate * speed}px)`;
                                    });

                                    isScrolling = false;
                                });
                            }
                            isScrolling = true;
                        });

                        // Add comprehensive CSS animations
                        if (!document.querySelector('#enhanced-styles')) {
                            const enhancedStyles = document.createElement('style');
                            enhancedStyles.id = 'enhanced-styles';
                            enhancedStyles.textContent = `
                    @keyframes ripple {
                        0% {
                            transform: scale(0);
                            opacity: 1;
                        }
                        100% {
                            transform: scale(1);
                            opacity: 0;
                        }
                    }

                    @keyframes bounceIn {
                        0% {
                            transform: translateY(-50%) scale(0.3);
                            opacity: 0;
                        }
                        50% {
                            transform: translateY(-50%) scale(1.1);
                            opacity: 0.8;
                        }
                        100% {
                            transform: translateY(-50%) scale(1);
                            opacity: 1;
                        }
                    }

                    @keyframes fadeInUp {
                        0% {
                            opacity: 0;
                            transform: translateY(10px);
                        }
                        100% {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    @keyframes shimmer {
                        0% {
                            background-position: -200px 0;
                        }
                        100% {
                            background-position: calc(200px + 100%) 0;
                        }
                    }

                    .search-focused::after {
                        width: 100% !important;
                    }

                    /* Custom scrollbar for suggestions */
                    .search-suggestions::-webkit-scrollbar {
                        width: 6px;
                    }

                    .search-suggestions::-webkit-scrollbar-track {
                        background: rgba(255, 255, 255, 0.1);
                        border-radius: 3px;
                    }

                    .search-suggestions::-webkit-scrollbar-thumb {
                        background: var(--primary);
                        border-radius: 3px;
                    }

                    .search-suggestions::-webkit-scrollbar-thumb:hover {
                        background: var(--primary-hover);
                    }

                    /* Loading state for forms */
                    .form-loading {
                        opacity: 0.6;
                        pointer-events: none;
                        position: relative;
                    }

                    .form-loading::before {
                        content: '';
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        width: 20px;
                        height: 20px;
                        margin: -10px 0 0 -10px;
                        border: 2px solid rgba(255, 255, 255, 0.3);
                        border-radius: 50%;
                        border-top-color: var(--primary);
                        animation: spin 1s ease-in-out infinite;
                        z-index: 1000;
                    }

                    @keyframes spin {
                        to {
                            transform: rotate(360deg);
                        }
                    }

                    /* Sparkle animation for category icon changes */
                    @keyframes sparkleAnimation {
                        0% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(0deg);
                        }
                        20% {
                            opacity: 1;
                            transform: translate(-50%, -50%) scale(1.2) rotate(90deg);
                        }
                        100% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(360deg) translate(30px, 30px);
                        }
                    }

                    @keyframes sparkleAnimation2 {
                        0% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(0deg);
                        }
                        20% {
                            opacity: 1;
                            transform: translate(-50%, -50%) scale(1) rotate(180deg);
                        }
                        100% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(360deg) translate(-25px, 35px);
                        }
                    }

                    @keyframes sparkleAnimation3 {
                        0% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(0deg);
                        }
                        20% {
                            opacity: 1;
                            transform: translate(-50%, -50%) scale(0.8) rotate(270deg);
                        }
                        100% {
                            opacity: 0;
                            transform: translate(-50%, -50%) scale(0) rotate(360deg) translate(20px, -30px);
                        }
                    }

                    /* Enhanced pulsing glow effect */
                    @keyframes pulseGlow {
                        0%, 100% {
                            box-shadow: 0 0 5px rgba(99, 102, 241, 0.3);
                        }
                        50% {
                            box-shadow: 0 0 20px rgba(99, 102, 241, 0.8), 0 0 30px rgba(99, 102, 241, 0.4);
                        }
                    }

                    /* Dropdown arrow rotation animation */
                    @keyframes arrowRotate {
                        from {
                            transform: translateY(-50%) rotate(0deg);
                        }
                        to {
                            transform: translateY(-50%) rotate(180deg);
                        }
                    }
                `;
                            document.head.appendChild(enhancedStyles);
                        }

                        // Add entrance animation for all elements
                        const observerOptions = {
                            threshold: 0.1,
                            rootMargin: '0px 0px -50px 0px'
                        };

                        const observer = new IntersectionObserver((entries) => {
                            entries.forEach(entry => {
                                if (entry.isIntersecting) {
                                    entry.target.classList.add('animate-in');
                                }
                            });
                        }, observerOptions);

                        // Observe all skill cards for scroll animations
                        skillCards.forEach(card => {
                            card.style.opacity = '0';
                            card.style.transform = 'translateY(50px)';
                            card.style.transition = 'all 0.6s ease-out';
                            observer.observe(card);
                        });

                        // Add animate-in class styles
                        const animateStyles = document.createElement('style');
                        animateStyles.textContent = `
                .animate-in {
                    opacity: 1 !important;
                    transform: translateY(0) !important;
                }
            `;
                        document.head.appendChild(animateStyles);

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

                        if (!navbar.contains(event.target) && menu.classList.contains('active')) {
                            menu.classList.remove('active');
                        }
                    });

                    // Close mobile menu when clicking on a link
                    document.querySelectorAll('.navbar-link').forEach(link => {
                        link.addEventListener('click', function () {
                            document.getElementById('navbarMenu').classList.remove('active');
                        });
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

                    // Load count on page load
                    loadNotificationCount();

                    // Refresh count every 30 seconds
                    setInterval(loadNotificationCount, 30000);
