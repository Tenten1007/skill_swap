package com.springboot.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.model.Skill;
import com.springboot.model.SkillCategory;
import com.springboot.model.SkillOffer;
import com.springboot.model.User;
import com.springboot.repository.SkillCategoryRepository;
import com.springboot.repository.SkillOfferRepository;
import com.springboot.repository.SkillRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class SkillOfferController {

    @Autowired
    private SkillOfferRepository skillOfferRepository;

    @Autowired
    private SkillCategoryRepository skillCategoryRepository;

    @Autowired
    private SkillRepository skillRepository;

    @GetMapping("/my-offers")
    public ModelAndView showMyOffers(HttpSession session) {
        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login?message=login-required");
        }

        User user = (User) session.getAttribute("user");
        ModelAndView mav = new ModelAndView("my-offers");

        System.out.println("=== MY OFFERS DEBUG ===");
        System.out.println("Username: " + username);
        System.out.println("User object: " + user);
        System.out.println("User ID: " + (user != null ? user.getId() : "null"));

        try {
            // Get user's skill offers
            List<SkillOffer> myOffers = skillOfferRepository.findByUserOrderByCreatedAtDesc(user);
            System.out.println("Number of offers found: " + myOffers.size());

            for (SkillOffer offer : myOffers) {
                System.out.println("Offer: " + offer.getTitle() + " - Active: " + offer.isActive());
            }

            mav.addObject("skillOffers", myOffers);
            mav.addObject("user", user);

        } catch (Exception e) {
            System.out.println("ERROR in showMyOffers: " + e.getMessage());
            e.printStackTrace();
            mav.addObject("error", "เกิดข้อผิดพลาดในการโหลดข้อมูล");
            mav.addObject("skillOffers", new java.util.ArrayList<>());
        }

        return mav;
    }

    @GetMapping("/add-skill")
    public ModelAndView showCreateSkillForm(HttpSession session) {
        ModelAndView mav = new ModelAndView("create-skill");

        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        User user = (User) session.getAttribute("user");

        if (username == null) {
            // Redirect to login with message
            return new ModelAndView("redirect:/login?message=login-required");
        }

        // Get all categories for dropdown
        mav.addObject("categories", skillCategoryRepository.findAll());
        mav.addObject("user", user);

        return mav;
    }

    @PostMapping("/add-skill")
    public ModelAndView createSkillOffer(
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam Integer categoryId,
            @RequestParam String level,
            @RequestParam(required = false) String timeCommitment,
            @RequestParam(required = false) String location,
            HttpSession session) {

        try {
            User user = (User) session.getAttribute("user");
            if (user == null) {
                return new ModelAndView("redirect:/login");
            }

            // Find or create skill based on category
            SkillCategory category = skillCategoryRepository.findById(categoryId).orElse(null);
            if (category == null) {
                ModelAndView mav = new ModelAndView("create-skill");
                mav.addObject("error", "Invalid category selected");
                mav.addObject("categories", skillCategoryRepository.findAll());
                return mav;
            }

            // Create or find skill
            Skill skill = skillRepository.findByCategoryAndSkillName(category, title)
                    .orElseGet(() -> {
                        Skill newSkill = new Skill();
                        newSkill.setSkillName(title);
                        newSkill.setCategory(category);
                        newSkill.setDescription(description);
                        return skillRepository.save(newSkill);
                    });

            // Create skill offer
            SkillOffer skillOffer = new SkillOffer();
            skillOffer.setUser(user);
            skillOffer.setSkill(skill);
            skillOffer.setTitle(title);
            skillOffer.setDescription(description);
            skillOffer.setLevel(level);
            skillOffer.setTimeCommitment(timeCommitment);
            skillOffer.setLocation(location);
            skillOffer.setActive(true);
            skillOffer.setCreatedAt(LocalDateTime.now());

            skillOfferRepository.save(skillOffer);

            return new ModelAndView("redirect:/home?success=skill-created");

        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView mav = new ModelAndView("create-skill");
            mav.addObject("error", "เกิดข้อผิดพลาดในการสร้าง Skill Offer");
            mav.addObject("categories", skillCategoryRepository.findAll());
            return mav;
        }
    }
}