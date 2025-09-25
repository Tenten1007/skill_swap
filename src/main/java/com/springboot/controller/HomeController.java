package com.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.model.SkillOffer;
import com.springboot.model.SkillCategory;
import com.springboot.repository.SkillOfferRepository;
import com.springboot.repository.SkillCategoryRepository;

@Controller
public class HomeController {

    @Autowired
    private SkillOfferRepository skillOfferRepository;

    @Autowired
    private SkillCategoryRepository skillCategoryRepository;

    @GetMapping("/home")
    public ModelAndView home(
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String location,
            @RequestParam(required = false) Integer categoryId) {

        ModelAndView mav = new ModelAndView("home");

        try {
            // Get skill offers based on filters
            List<SkillOffer> skillOffers;

            if (search != null && !search.trim().isEmpty()) {
                skillOffers = skillOfferRepository.searchActiveOffers(search.trim());
                System.out.println("Search results: " + skillOffers.size());
            } else if (location != null && !location.trim().isEmpty()) {
                skillOffers = skillOfferRepository.findActiveOffersByLocation(location.trim());
                System.out.println("Location results: " + skillOffers.size());
            } else if (categoryId != null) {
                skillOffers = skillOfferRepository.findActiveOffersBySkillId(categoryId);
                System.out.println("Category results: " + skillOffers.size());
            } else {
                skillOffers = skillOfferRepository.findActiveOffersOrderByCreatedAtDesc();
                System.out.println("All active offers: " + skillOffers.size());
            }

            // Debug: Check total records in database
            List<SkillOffer> allOffers = skillOfferRepository.findAll();
            System.out.println("Total offers in database: " + allOffers.size());

            // Get all categories for filter dropdown
            List<SkillCategory> categories = skillCategoryRepository.findAll();
            System.out.println("Total categories: " + categories.size());

            mav.addObject("skillOffers", skillOffers != null ? skillOffers : new java.util.ArrayList<>());
            mav.addObject("categories", categories != null ? categories : new java.util.ArrayList<>());
            mav.addObject("searchQuery", search);
            mav.addObject("selectedLocation", location);
            mav.addObject("selectedCategoryId", categoryId);

        } catch (Exception e) {
            e.printStackTrace();
            // Handle error gracefully
            mav.addObject("skillOffers", new java.util.ArrayList<>());
            mav.addObject("categories", new java.util.ArrayList<>());
            mav.addObject("error", "เกิดข้อผิดพลาดในการโหลดข้อมูล");
        }

        return mav;
    }
}