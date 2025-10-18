package com.springboot.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.model.Notification;
import com.springboot.model.User;
import com.springboot.repository.NotificationRepository;

@Service
public class NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;

    // สร้าง notification ใหม่
    public Notification createNotification(User user, String type, String message, Integer relatedId, String relatedType, String linkUrl) {
        Notification notification = new Notification(user, type, message, relatedId, relatedType, linkUrl);
        return notificationRepository.save(notification);
    }

    // ดึง notifications ทั้งหมดของ user
    public List<Notification> getAllNotificationsByUserId(int userId) {
        return notificationRepository.findByUserIdOrderByCreatedAtDesc(userId);
    }

    // ดึง notifications ที่ยังไม่อ่าน
    public List<Notification> getUnreadNotificationsByUserId(int userId) {
        return notificationRepository.findUnreadByUserId(userId);
    }

    // นับจำนวน notifications ที่ยังไม่อ่าน
    public Long countUnreadNotificationsByUserId(int userId) {
        return notificationRepository.countUnreadByUserId(userId);
    }

    // ทำเครื่องหมายว่าอ่านแล้ว
    @Transactional
    public void markAsRead(int notificationId) {
        Notification notification = notificationRepository.findById(notificationId).orElse(null);
        if (notification != null) {
            notification.markAsRead();
            notificationRepository.save(notification);
        }
    }

    // ทำเครื่องหมายว่าอ่านแล้วทั้งหมด
    @Transactional
    public void markAllAsRead(int userId) {
        notificationRepository.markAllAsReadByUserId(userId);
    }

    // ลบ notification
    public void deleteNotification(int notificationId) {
        notificationRepository.deleteById(notificationId);
    }

    // Helper methods สำหรับสร้าง notification แต่ละประเภท

    // เมื่อมีคนส่งคำขอแลกเปลี่ยนทักษะ
    public void createSwapRequestNotification(User receiver, User sender, String skillTitle, int swapRequestId) {
        String message = sender.getFullName() + " ขอแลกเปลี่ยนทักษะ \"" + skillTitle + "\" กับคุณ";
        String linkUrl = "/matches"; // ไปที่หน้า matches เพื่อดูคำขอ
        createNotification(receiver, "SWAP_REQUEST", message, swapRequestId, "SWAP_REQUEST", linkUrl);
    }

    // เมื่อคำขอถูกยอมรับ
    public void createSwapAcceptedNotification(User requester, User accepter, String skillTitle, int matchId) {
        String message = accepter.getFullName() + " ยอมรับคำขอแลกเปลี่ยนทักษะ \"" + skillTitle + "\" ของคุณแล้ว!";
        String linkUrl = "/matches";
        createNotification(requester, "SWAP_ACCEPTED", message, matchId, "SWAP_MATCH", linkUrl);
    }

    // เมื่อคำขอถูกปฏิเสธ
    public void createSwapRejectedNotification(User requester, User rejecter, String skillTitle, int swapRequestId) {
        String message = rejecter.getFullName() + " ปฏิเสธคำขอแลกเปลี่ยนทักษะ \"" + skillTitle + "\"";
        String linkUrl = "/skillboard";
        createNotification(requester, "SWAP_REJECTED", message, swapRequestId, "SWAP_REQUEST", linkUrl);
    }

    // เมื่อมี match ใหม่
    public void createMatchCreatedNotification(User user, User partner, String skillTitle, int matchId) {
        String message = "คุณได้จับคู่กับ " + partner.getFullName() + " สำหรับทักษะ \"" + skillTitle + "\" แล้ว!";
        String linkUrl = "/matches";
        createNotification(user, "MATCH_CREATED", message, matchId, "SWAP_MATCH", linkUrl);
    }

    // เมื่อได้รับการรีวิว
    public void createRatingReceivedNotification(User ratee, User rater, int score, int ratingId) {
        String message = rater.getFullName() + " ให้คะแนน " + score + " ดาวแก่คุณ";
        String linkUrl = "/profile";
        createNotification(ratee, "RATING_RECEIVED", message, ratingId, "RATING", linkUrl);
    }

    // เมื่อการเรียนเสร็จสมบูรณ์
    public void createMatchCompletedNotification(User user, User partner, String skillTitle, int matchId) {
        String message = "การเรียนทักษะ \"" + skillTitle + "\" กับ " + partner.getFullName() + " เสร็จสมบูรณ์แล้ว! อย่าลืมให้คะแนนกัน";
        String linkUrl = "/matches";
        createNotification(user, "MATCH_COMPLETED", message, matchId, "SWAP_MATCH", linkUrl);
    }

    // ลบ notifications เก่า (เรียกใช้เป็นระยะๆ หรือใน scheduled task)
    @Transactional
    public void cleanupOldNotifications(int userId) {
        LocalDateTime thirtyDaysAgo = LocalDateTime.now().minusDays(30);
        notificationRepository.deleteOldReadNotifications(userId, thirtyDaysAgo);
    }
}
