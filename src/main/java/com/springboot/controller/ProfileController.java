package com.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.model.User;
import com.springboot.model.UserManager;
import com.springboot.repository.SkillOfferRepository;
import com.springboot.repository.SwapRequestRepository;
import com.springboot.repository.RatingRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {

    @Autowired
    private UserManager userManager;

    @Autowired
    private SkillOfferRepository skillOfferRepository;

    @Autowired
    private SwapRequestRepository swapRequestRepository;

    @Autowired
    private RatingRepository ratingRepository;

    @GetMapping("/profile")
    public ModelAndView showProfile(HttpSession session) {
        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login?message=login-required");
        }

        User user = (User) session.getAttribute("user");
        ModelAndView mav = new ModelAndView("profile");


        try {
            // Get fresh user data from database
            User freshUser = userManager.getUserByUsername(username);
            if (freshUser != null) {
                user = freshUser;
                session.setAttribute("user", user); // Update session with fresh data
            }

            // Check if user is still null
            if (user == null) {
                return new ModelAndView("redirect:/login?message=session-expired");
            }

            // Get user statistics
            int totalOffers = skillOfferRepository.findByUserId(user.getId()).size();
            int sentRequests = swapRequestRepository.findSentRequestsByUserId(user.getId()).size();
            int receivedRequests = swapRequestRepository.findReceivedRequestsByUserId(user.getId()).size();

            // Get rating statistics
            Double averageRating = ratingRepository.getAverageRatingByRateeId(user.getId());
            Long totalRatings = ratingRepository.getCountRatingsByRateeId(user.getId());

            // If no ratings, set default values
            if (averageRating == null) averageRating = 0.0;
            if (totalRatings == null) totalRatings = 0L;

            mav.addObject("user", user);
            mav.addObject("totalOffers", totalOffers);
            mav.addObject("sentRequests", sentRequests);
            mav.addObject("receivedRequests", receivedRequests);
            mav.addObject("averageRating", averageRating);
            mav.addObject("totalRatings", totalRatings);

        } catch (Exception e) {
            System.out.println("ERROR in showProfile: " + e.getMessage());
            e.printStackTrace();
            mav.addObject("error", "เกิดข้อผิดพลาดในการโหลดข้อมูลโปรไฟล์");
            mav.addObject("user", user);
            mav.addObject("totalOffers", 0);
            mav.addObject("sentRequests", 0);
            mav.addObject("receivedRequests", 0);
            mav.addObject("averageRating", 0.0);
            mav.addObject("totalRatings", 0L);
        }

        return mav;
    }

    @GetMapping("/edit-profile")
    public ModelAndView showEditProfile(HttpSession session) {
        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login?message=login-required");
        }

        User user = (User) session.getAttribute("user");
        ModelAndView mav = new ModelAndView("edit-profile");

        try {
            // Get fresh user data from database
            User freshUser = userManager.getUserByUsername(username);
            if (freshUser != null) {
                user = freshUser;
                session.setAttribute("user", user);
            }

            // Check if user is still null
            if (user == null) {
                return new ModelAndView("redirect:/login?message=session-expired");
            }

            mav.addObject("user", user);

        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("error", "เกิดข้อผิดพลาดในการโหลดข้อมูล");
            mav.addObject("user", user);
        }

        return mav;
    }

    @PostMapping("/update-profile")
    public ModelAndView updateProfile(
            @RequestParam(required = false) String firstName,
            @RequestParam(required = false) String lastName,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String bio,
            @RequestParam(required = false) String location,
            @RequestParam(required = false) String phone,
            @RequestParam(required = false) String linkedin,
            @RequestParam(required = false) String github,
            HttpSession session) {

        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login?message=login-required");
        }

        User user = (User) session.getAttribute("user");


        try {
            // Get fresh user data from database
            User freshUser = userManager.getUserByUsername(username);
            if (freshUser != null) {
                user = freshUser;
            }

            // Check if user is still null
            if (user == null) {
                return new ModelAndView("redirect:/login?message=session-expired");
            }

            // Update user fields
            if (firstName != null && !firstName.trim().isEmpty()) {
                user.setFirstName(firstName.trim());
            }
            if (lastName != null && !lastName.trim().isEmpty()) {
                user.setLastName(lastName.trim());
            }
            if (email != null && !email.trim().isEmpty()) {
                user.setEmail(email.trim());
            }
            if (bio != null) {
                user.setBio(bio.trim());
            }
            if (location != null) {
                user.setLocation(location.trim());
            }
            if (phone != null) {
                user.setPhone(phone.trim());
            }
            if (linkedin != null) {
                user.setLinkedin(linkedin.trim());
            }
            if (github != null) {
                user.setGithub(github.trim());
            }

            // Update session with new data
            session.setAttribute("user", user);
            return new ModelAndView("redirect:/profile?success=updated");

        } catch (Exception e) {
            System.out.println("ERROR in updateProfile: " + e.getMessage());
            e.printStackTrace();
            return new ModelAndView("redirect:/edit-profile?error=update-failed");
        }
    }
}