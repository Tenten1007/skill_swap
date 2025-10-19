package com.springboot.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.model.SkillOffer;
import com.springboot.model.User;
import com.springboot.repository.SkillOfferRepository;
import com.springboot.repository.SwapMatchRepository;
import com.springboot.repository.SwapRequestRepository;
import com.springboot.dto.SkillOfferDTO;
import com.springboot.dto.UserDTO;
import com.springboot.dto.DTOMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    private static final Logger log = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private SkillOfferRepository skillOfferRepository;

    @Autowired
    private SwapMatchRepository swapMatchRepository;

    @Autowired
    private SwapRequestRepository swapRequestRepository;

    @GetMapping("/home")
    public ModelAndView home(HttpSession session) {

        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login");
        }

        User user = (User) session.getAttribute("user");

        // Check if user is null
        if (user == null) {
            return new ModelAndView("redirect:/login?message=session-expired");
        }

        ModelAndView mav = new ModelAndView("home");

        try {
            // === PERSONALIZED FEED ===

            // 1. Recommended Skills (based on user's location)
            List<SkillOffer> recommendedSkills = new ArrayList<>();
            if (user.getLocation() != null && !user.getLocation().isEmpty()) {
                recommendedSkills = skillOfferRepository.findActiveOffersByLocation(user.getLocation())
                    .stream()
                    .filter(offer -> offer.getUser().getId() != user.getId())
                    .limit(6)
                    .collect(Collectors.toList());
            }

            // 2. Recent/Trending Skills (latest 8 skills, excluding user's own)
            List<SkillOffer> recentSkills = skillOfferRepository.findActiveOffersOrderByCreatedAtDesc()
                .stream()
                .filter(offer -> offer.getUser().getId() != user.getId())
                .limit(8)
                .collect(Collectors.toList());

            // 3. Skills Near You (same location as user)
            List<SkillOffer> nearbySkills = new ArrayList<>();
            if (user.getLocation() != null && !user.getLocation().isEmpty()) {
                nearbySkills = skillOfferRepository.findActiveOffersByLocation(user.getLocation())
                    .stream()
                    .filter(offer -> offer.getUser().getId() != user.getId())
                    .limit(4)
                    .collect(Collectors.toList());
            }

            // 4. User Statistics
            int totalMatches = swapMatchRepository.findByOffererId(user.getId()).size() +
                              swapMatchRepository.findByRequesterId(user.getId()).size();
            int pendingRequests = swapRequestRepository.findReceivedRequestsByUserId(user.getId())
                .stream()
                .filter(req -> "PENDING".equals(req.getStatus()))
                .collect(Collectors.toList())
                .size();
            int myActiveOffers = skillOfferRepository.findByUserId(user.getId())
                .stream()
                .filter(SkillOffer::isActive)
                .collect(Collectors.toList())
                .size();

            // Convert to DTOs for security
            List<SkillOfferDTO> recommendedDTOs = DTOMapper.toSkillOfferDTOList(recommendedSkills);
            List<SkillOfferDTO> recentDTOs = DTOMapper.toSkillOfferDTOList(recentSkills);
            List<SkillOfferDTO> nearbyDTOs = DTOMapper.toSkillOfferDTOList(nearbySkills);
            UserDTO userDTO = DTOMapper.toUserDTO(user);

            // Add to model
            mav.addObject("recommendedSkills", recommendedDTOs);
            mav.addObject("recentSkills", recentDTOs);
            mav.addObject("nearbySkills", nearbyDTOs);
            mav.addObject("user", userDTO);
            mav.addObject("totalMatches", totalMatches);
            mav.addObject("pendingRequests", pendingRequests);
            mav.addObject("myActiveOffers", myActiveOffers);

        } catch (Exception e) {
            log.error("Error in home: {}", e.getMessage(), e);
            // Handle error gracefully
            mav.addObject("recommendedSkills", new ArrayList<>());
            mav.addObject("recentSkills", new ArrayList<>());
            mav.addObject("nearbySkills", new ArrayList<>());
            mav.addObject("totalMatches", 0);
            mav.addObject("pendingRequests", 0);
            mav.addObject("myActiveOffers", 0);
            mav.addObject("error", "เกิดข้อผิดพลาดในการโหลดข้อมูล");
        }

        return mav;
    }
}