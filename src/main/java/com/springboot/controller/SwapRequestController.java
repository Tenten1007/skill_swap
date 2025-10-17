package com.springboot.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springboot.model.SwapRequest;
import com.springboot.model.SkillOffer;
import com.springboot.model.User;
import com.springboot.repository.SwapRequestRepository;
import com.springboot.repository.SkillOfferRepository;
import com.springboot.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class SwapRequestController {

    @Autowired
    private SwapRequestRepository swapRequestRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SkillOfferRepository skillOfferRepository;

    @PostMapping("/swap-request/create")
    public String createSwapRequest(
            @RequestParam("requestedSkillId") int requestedSkillId,
            @RequestParam(value = "offeredSkillId", required = false) Integer offeredSkillId,
            @RequestParam("message") String message,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        // ดึงผู้ใช้จาก session
        User user = (User) session.getAttribute("user");
        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "กรุณา login ก่อน");
            return "redirect:/login";
        }

        // ดึง requested skill
        SkillOffer requestedSkill = skillOfferRepository.findById(requestedSkillId)
                .orElseThrow(() -> new RuntimeException("ไม่พบสกิลที่ต้องการ"));

        // ตรวจสอบว่ามีคำขอซ้ำหรือไม่ (same requester + requested skill + PENDING status)
        boolean hasPendingRequest = swapRequestRepository.findByRequesterIdAndRequestedSkillId(
            user.getId(), requestedSkillId
        ).stream().anyMatch(req -> "PENDING".equals(req.getStatus()));

        if (hasPendingRequest) {
            redirectAttributes.addFlashAttribute("error", "คุณได้ส่งคำขอแลกเปลี่ยนทักษะนี้ไปแล้ว กรุณารอการตอบรับ");
            return "redirect:/skill?id=" + requestedSkillId;
        }

        // ดึง offered skill (ถ้ามี)
        SkillOffer offeredSkill = null;
        if (offeredSkillId != null) {
            offeredSkill = skillOfferRepository.findById(offeredSkillId)
                    .orElseThrow(() -> new RuntimeException("ไม่พบสกิลของคุณที่จะเสนอ"));
        }

        // สร้าง SwapRequest
        SwapRequest request = new SwapRequest();
        request.setRequester(user);
        request.setRequestedSkill(requestedSkill);
        request.setOfferedSkill(offeredSkill);
        request.setMessage(message);
        request.setStatus("PENDING");
        request.setCreatedAt(LocalDateTime.now());
        request.setRespondedAt(null);

        // บันทึกลงฐานข้อมูล
        swapRequestRepository.save(request);

        redirectAttributes.addFlashAttribute("success", "ส่งคำขอแลกสกิลเรียบร้อยแล้ว! 🎉");

        // redirect กลับไปหน้า skill-detail
        return "redirect:/skill?id=" + requestedSkillId;
    }
}
