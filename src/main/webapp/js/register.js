// Enhanced form interactions
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('.register-form');
            const button = form.querySelector('button[type="submit"]');

            // Prevent double submission
            form.addEventListener('submit', function(e) {
                if (button.hasAttribute('data-submitting')) {
                    e.preventDefault();
                    return false;
                }

                button.setAttribute('data-submitting', 'true');
                button.style.opacity = '0.7';
                button.style.pointerEvents = 'none';
            });

            // Console branding
            console.log('%c🚀 Skill Swap Register', 'color: #6366F1; font-size: 16px; font-weight: bold;');
            console.log('%cAurora Glass Theme System', 'color: #8B5CF6; font-size: 12px;');
        });