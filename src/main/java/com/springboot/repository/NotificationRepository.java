package com.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.springboot.model.Notification;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Integer> {

    // ดึง notifications ทั้งหมดของ user โดยเรียงจากใหม่ไปเก่า
    @Query("SELECT n FROM Notification n WHERE n.user.id = :userId ORDER BY n.createdAt DESC")
    List<Notification> findByUserIdOrderByCreatedAtDesc(@Param("userId") int userId);

    // ดึง notifications ที่ยังไม่อ่านของ user
    @Query("SELECT n FROM Notification n WHERE n.user.id = :userId AND n.isRead = false ORDER BY n.createdAt DESC")
    List<Notification> findUnreadByUserId(@Param("userId") int userId);

    // นับจำนวน notifications ที่ยังไม่อ่าน
    @Query("SELECT COUNT(n) FROM Notification n WHERE n.user.id = :userId AND n.isRead = false")
    Long countUnreadByUserId(@Param("userId") int userId);

    // ทำเครื่องหมายว่าอ่านแล้วทั้งหมด
    @Modifying
    @Query("UPDATE Notification n SET n.isRead = true, n.readAt = CURRENT_TIMESTAMP WHERE n.user.id = :userId AND n.isRead = false")
    void markAllAsReadByUserId(@Param("userId") int userId);

    // ลบ notifications เก่าที่อ่านแล้ว (เก็บไว้แค่ 30 วัน)
    @Modifying
    @Query("DELETE FROM Notification n WHERE n.user.id = :userId AND n.isRead = true AND n.readAt < :beforeDate")
    void deleteOldReadNotifications(@Param("userId") int userId, @Param("beforeDate") java.time.LocalDateTime beforeDate);
}
