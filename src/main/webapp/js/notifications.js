const createdAt = new Date('${notification.createdAt}');
                                            const now = new Date();
                                            const diff = Math.floor((now - createdAt) / 1000); // seconds

                                            let timeAgo = '';
                                            if (diff < 60) {
                                                timeAgo = 'เมื่อสักครู่';
                                            } else if (diff < 3600) {
                                                const minutes = Math.floor(diff / 60);
                                                timeAgo = minutes + ' นาทีที่แล้ว';
                                            } else if (diff < 86400) {
                                                const hours = Math.floor(diff / 3600);
                                                timeAgo = hours + ' ชั่วโมงที่แล้ว';
                                            } else {
                                                const days = Math.floor(diff / 86400);
                                                timeAgo = days + ' วันที่แล้ว';
                                            }
                                            document.write(timeAgo);