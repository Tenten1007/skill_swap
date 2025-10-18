package com.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.model.Notification;
import com.springboot.model.User;
import com.springboot.service.NotificationService;

import jakarta.servlet.http.HttpSession;

@Controller
public class NotificationController {

    @Autowired
    private NotificationService notificationService;

    // แสดงหน้า notifications
    @GetMapping("/notifications")
    public ModelAndView showNotifications(HttpSession session) {
        // Check if user is logged in
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:/login?message=login-required");
        }

        ModelAndView mav = new ModelAndView("notifications");

        // ดึง notifications ทั้งหมด
        List<Notification> notifications = notificationService.getAllNotificationsByUserId(user.getId());
        Long unreadCount = notificationService.countUnreadNotificationsByUserId(user.getId());

        mav.addObject("notifications", notifications);
        mav.addObject("unreadCount", unreadCount);

        return mav;
    }

    // นับจำนวน notifications ที่ยังไม่อ่าน (สำหรับ badge)
    @GetMapping("/notifications/count")
    @ResponseBody
    public Long getUnreadCount(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return 0L;
        }
        return notificationService.countUnreadNotificationsByUserId(user.getId());
    }

    // ทำเครื่องหมายว่าอ่านแล้ว
    @PostMapping("/notifications/mark-read")
    public String markAsRead(@RequestParam("notificationId") int notificationId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        notificationService.markAsRead(notificationId);
        return "redirect:/notifications";
    }

    // ทำเครื่องหมายว่าอ่านแล้วทั้งหมด
    @PostMapping("/notifications/mark-all-read")
    public String markAllAsRead(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        notificationService.markAllAsRead(user.getId());
        return "redirect:/notifications";
    }

    // ลบ notification
    @PostMapping("/notifications/delete")
    public String deleteNotification(@RequestParam("notificationId") int notificationId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        notificationService.deleteNotification(notificationId);
        return "redirect:/notifications";
    }
}