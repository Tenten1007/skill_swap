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