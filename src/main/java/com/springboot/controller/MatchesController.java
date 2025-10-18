package com.springboot.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.model.SwapRequest;
import com.springboot.model.User;
import com.springboot.repository.SwapRequestRepository;
import com.springboot.service.NotificationService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MatchesController {

    @Autowired
    private SwapRequestRepository swapRequestRepository;

    @Autowired
    private com.springboot.repository.SwapMatchRepository swapMatchRepository;

    @Autowired
    private NotificationService notificationService;

    @GetMapping("/matches")
    public ModelAndView showMatches(HttpSession session,
                                  @RequestParam(value = "tab", defaultValue = "received") String tab) {
        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login?message=login-required");
        }

        User user = (User) session.getAttribute("user");

        // Check if user is null
        if (user == null) {
            return new ModelAndView("redirect:/login?message=session-expired");
        }

        ModelAndView mav = new ModelAndView("matches");

        try {
            List<SwapRequest> sentRequests = swapRequestRepository.findSentRequestsByUserId(user.getId());
            List<SwapRequest> receivedRequests = swapRequestRepository.findReceivedRequestsByUserId(user.getId());
            List<SwapRequest> pendingRequests = swapRequestRepository.findPendingRequestsForUser(user.getId());

            // Fetch SwapMatch data for My Learning tab
            List<com.springboot.model.SwapMatch> myLearning = swapMatchRepository.findByUserId(user.getId());

            mav.addObject("sentRequests", sentRequests);
            mav.addObject("receivedRequests", receivedRequests);
            mav.addObject("pendingRequests", pendingRequests);
            mav.addObject("myLearning", myLearning);
            mav.addObject("user", user);
            mav.addObject("activeTab", tab);

            // Count statistics
            mav.addObject("sentCount", sentRequests.size());
            mav.addObject("receivedCount", receivedRequests.size());
            mav.addObject("pendingCount", pendingRequests.size());
            mav.addObject("learningCount", myLearning.size());

        } catch (Exception e) {
            System.out.println("ERROR in showMatches: " + e.getMessage());
            e.printStackTrace();
            mav.addObject("error", "เกิดข้อผิดพลาดในการโหลดข้อมูล Matches");
            mav.addObject("sentRequests", List.of());
            mav.addObject("receivedRequests", List.of());
            mav.addObject("pendingRequests", List.of());
            mav.addObject("myLearning", List.of());
            mav.addObject("sentCount", 0);
            mav.addObject("receivedCount", 0);
            mav.addObject("pendingCount", 0);
            mav.addObject("learningCount", 0);
        }

        return mav;
    }

    @PostMapping("/respond-swap")
    public ModelAndView respondToSwap(@RequestParam int requestId,
                                    @RequestParam String action,
                                    HttpSession session) {
        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login?message=login-required");
        }

        User user = (User) session.getAttribute("user");

        // Check if user is null
        if (user == null) {
            return new ModelAndView("redirect:/login?message=session-expired");
        }

        try {
            SwapRequest request = swapRequestRepository.findById(requestId).orElse(null);

            if (request == null) {
                return new ModelAndView("redirect:/matches?error=request-not-found");
            }

            // Verify user owns the requested skill
            if (request.getRequestedSkill().getUser().getId() != user.getId()) {
                return new ModelAndView("redirect:/matches?error=unauthorized");
            }

            // Update request status
            if ("accept".equals(action)) {
                request.setStatus("ACCEPTED");
                request.setRespondedAt(LocalDateTime.now());
                swapRequestRepository.save(request);

                // Create SwapMatch when accepting
                com.springboot.model.SwapMatch swapMatch = new com.springboot.model.SwapMatch();
                swapMatch.setOfferer(request.getRequestedSkill().getUser());
                swapMatch.setRequester(request.getRequester());
                swapMatch.setOfferSkill(request.getRequestedSkill());
                swapMatch.setRequestSkill(request.getOfferedSkill());
                swapMatch.setStatus("MATCHED");
                swapMatch.setCreatedAt(LocalDateTime.now());

                com.springboot.model.SwapMatch savedMatch = swapMatchRepository.save(swapMatch);

                // สร้าง notifications สำหรับทั้งสองฝ่าย
                notificationService.createSwapAcceptedNotification(
                    request.getRequester(),
                    user,
                    request.getRequestedSkill().getTitle(),
                    savedMatch.getId()
                );

                notificationService.createMatchCreatedNotification(
                    request.getRequester(),
                    user,
                    request.getRequestedSkill().getTitle(),
                    savedMatch.getId()
                );

                notificationService.createMatchCreatedNotification(
                    user,
                    request.getRequester(),
                    request.getRequestedSkill().getTitle(),
                    savedMatch.getId()
                );

            } else if ("reject".equals(action)) {
                request.setStatus("REJECTED");
                request.setRespondedAt(LocalDateTime.now());
                swapRequestRepository.save(request);

                // สร้าง notification สำหรับผู้ถูกปฏิเสธ
                notificationService.createSwapRejectedNotification(
                    request.getRequester(),
                    user,
                    request.getRequestedSkill().getTitle(),
                    request.getId()
                );
            }

            String message = "accept".equals(action) ? "accepted" : "rejected";
            return new ModelAndView("redirect:/matches?success=" + message);

        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("redirect:/matches?error=response-failed");
        }
    }

    @PostMapping("/cancel-swap")
    public ModelAndView cancelSwap(@RequestParam int requestId, HttpSession session) {
        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login?message=login-required");
        }

        User user = (User) session.getAttribute("user");

        // Check if user is null
        if (user == null) {
            return new ModelAndView("redirect:/login?message=session-expired");
        }

        try {
            SwapRequest request = swapRequestRepository.findById(requestId).orElse(null);

            if (request == null) {
                return new ModelAndView("redirect:/matches?error=request-not-found");
            }

            // Verify user is the requester
            if (request.getRequester().getId() != user.getId()) {
                return new ModelAndView("redirect:/matches?error=unauthorized");
            }

            // Only allow cancellation if request is still pending
            if (request.isPending()) {
                request.setStatus("CANCELLED");
                request.setRespondedAt(LocalDateTime.now());
                swapRequestRepository.save(request);
            }

            return new ModelAndView("redirect:/matches?success=cancelled");

        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("redirect:/matches?error=cancel-failed");
        }
    }

    @PostMapping("/start-learning")
    public ModelAndView startLearning(@RequestParam int matchId, HttpSession session) {
        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login?message=login-required");
        }

        User user = (User) session.getAttribute("user");

        // Check if user is null
        if (user == null) {
            return new ModelAndView("redirect:/login?message=session-expired");
        }

        try {
            com.springboot.model.SwapMatch swapMatch = swapMatchRepository.findById(matchId).orElse(null);

            if (swapMatch == null) {
                return new ModelAndView("redirect:/matches?tab=learning&error=match-not-found");
            }

            // Verify user is part of the swap (either offerer or requester)
            if (swapMatch.getOfferer().getId() != user.getId() &&
                swapMatch.getRequester().getId() != user.getId()) {
                return new ModelAndView("redirect:/matches?tab=learning&error=unauthorized");
            }

            // Only allow starting if status is MATCHED
            if ("MATCHED".equals(swapMatch.getStatus())) {
                swapMatch.setStatus("IN_PROGRESS");
                swapMatch.setUpdatedAt(LocalDateTime.now());
                swapMatchRepository.save(swapMatch);
            }

            return new ModelAndView("redirect:/matches?tab=learning&success=started");

        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("redirect:/matches?tab=learning&error=start-failed");
        }
    }

    @PostMapping("/complete-learning")
    public ModelAndView completeLearning(@RequestParam int matchId, HttpSession session) {
        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login?message=login-required");
        }

        User user = (User) session.getAttribute("user");

        // Check if user is null
        if (user == null) {
            return new ModelAndView("redirect:/login?message=session-expired");
        }

        try {
            com.springboot.model.SwapMatch swapMatch = swapMatchRepository.findById(matchId).orElse(null);

            if (swapMatch == null) {
                return new ModelAndView("redirect:/matches?tab=learning&error=match-not-found");
            }

            // Verify user is part of the swap (either offerer or requester)
            if (swapMatch.getOfferer().getId() != user.getId() &&
                swapMatch.getRequester().getId() != user.getId()) {
                return new ModelAndView("redirect:/matches?tab=learning&error=unauthorized");
            }

            // Only allow completing if status is IN_PROGRESS
            if ("IN_PROGRESS".equals(swapMatch.getStatus())) {
                swapMatch.setStatus("COMPLETED");
                swapMatch.setUpdatedAt(LocalDateTime.now());
                swapMatchRepository.save(swapMatch);

                // สร้าง notifications สำหรับทั้งสองฝ่าย
                User partner = swapMatch.getOfferer().getId() == user.getId() ?
                               swapMatch.getRequester() : swapMatch.getOfferer();

                notificationService.createMatchCompletedNotification(
                    user,
                    partner,
                    swapMatch.getOfferSkill().getTitle(),
                    swapMatch.getId()
                );

                notificationService.createMatchCompletedNotification(
                    partner,
                    user,
                    swapMatch.getOfferSkill().getTitle(),
                    swapMatch.getId()
                );
            }

            return new ModelAndView("redirect:/matches?tab=learning&success=completed");

        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("redirect:/matches?tab=learning&error=complete-failed");
        }
    }
}