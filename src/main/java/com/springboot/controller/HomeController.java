package com.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.model.SkillOffer;
import com.springboot.model.SkillCategory;
import com.springboot.model.User;
import com.springboot.repository.SkillOfferRepository;
import com.springboot.repository.SkillCategoryRepository;
import com.springboot.dto.SkillOfferDTO;
import com.springboot.dto.SkillCategoryDTO;
import com.springboot.dto.UserDTO;
import com.springboot.dto.DTOMapper;

import jakarta.servlet.http.HttpSession;

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
            @RequestParam(required = false) Integer categoryId,
            HttpSession session) {

        // Check if user is logged in
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return new ModelAndView("redirect:/login");
        }

        User user = (User) session.getAttribute("user");

        ModelAndView mav = new ModelAndView("home");

        try {
            // Get skill offers based on filters
            List<SkillOffer> skillOffers;

            if (search != null && !search.trim().isEmpty()) {
                skillOffers = skillOfferRepository.searchActiveOffers(search.trim());
            } else if (location != null && !location.trim().isEmpty()) {
                skillOffers = skillOfferRepository.findActiveOffersByLocation(location.trim());
            } else if (categoryId != null) {
                skillOffers = skillOfferRepository.findActiveOffersBySkillId(categoryId);
            } else {
                skillOffers = skillOfferRepository.findActiveOffersOrderByCreatedAtDesc();
            }

            // Get all categories for filter dropdown
            List<SkillCategory> categories = skillCategoryRepository.findAll();

            // Convert to DTOs for security
            List<SkillOfferDTO> skillOfferDTOs = DTOMapper.toSkillOfferDTOList(
                skillOffers != null ? skillOffers : new java.util.ArrayList<>()
            );
            List<SkillCategoryDTO> categoryDTOs = DTOMapper.toSkillCategoryDTOList(
                categories != null ? categories : new java.util.ArrayList<>()
            );
            UserDTO userDTO = DTOMapper.toUserDTO(user);

            mav.addObject("skillOffers", skillOfferDTOs);
            mav.addObject("categories", categoryDTOs);
            mav.addObject("searchQuery", search);
            mav.addObject("selectedLocation", location);
            mav.addObject("selectedCategoryId", categoryId);
            mav.addObject("user", userDTO);

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