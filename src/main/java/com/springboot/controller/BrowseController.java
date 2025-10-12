package com.springboot.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.dto.DTOMapper;
import com.springboot.dto.SkillCategoryDTO;
import com.springboot.dto.SkillOfferDTO;
import com.springboot.dto.UserDTO;
import com.springboot.model.SkillCategory;
import com.springboot.model.SkillOffer;
import com.springboot.model.User;
import com.springboot.repository.SkillCategoryRepository;
import com.springboot.repository.SkillOfferRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class BrowseController {

	@Autowired
    private SkillOfferRepository skillOfferRepository;

    @Autowired
    private SkillCategoryRepository skillCategoryRepository;

	@GetMapping("/jobboard")
	public ModelAndView jobBoard(
	        @RequestParam(required = false) String search,
	        @RequestParam(required = false) Integer categoryId,
	        @RequestParam(required = false) String location,
	        @RequestParam(required = false) String level,
	        @RequestParam(required = false) String sortBy,
	        HttpSession session) {

	    ModelAndView mav = new ModelAndView("skillboard");

	    // Get user from session (optional for browse)
	    User user = (User) session.getAttribute("user");

	    try {
	        // === ADVANCED SEARCH & BROWSE ===

	        // Start with all active offers
	        List<SkillOffer> skillOffers = skillOfferRepository.findActiveOffersOrderByCreatedAtDesc();

	        // Apply search filter
	        if (search != null && !search.trim().isEmpty()) {
	            final String searchLower = search.trim().toLowerCase();
	            skillOffers = skillOffers.stream()
	                .filter(offer ->
	                    offer.getTitle().toLowerCase().contains(searchLower) ||
	                    offer.getDescription().toLowerCase().contains(searchLower) ||
	                    (offer.getSkill() != null && offer.getSkill().getSkillName().toLowerCase().contains(searchLower))
	                )
	                .collect(Collectors.toList());
	        }

	        // Apply category filter
	        if (categoryId != null) {
	            skillOffers = skillOffers.stream()
	                .filter(offer -> offer.getSkill() != null &&
	                               offer.getSkill().getCategory() != null &&
	                               offer.getSkill().getCategory().getId() == categoryId)
	                .collect(Collectors.toList());
	        }

	        // Apply location filter
	        if (location != null && !location.trim().isEmpty()) {
	            final String locationLower = location.trim().toLowerCase();
	            skillOffers = skillOffers.stream()
	                .filter(offer -> offer.getLocation() != null &&
	                               offer.getLocation().toLowerCase().contains(locationLower))
	                .collect(Collectors.toList());
	        }

	        // Apply level filter
	        if (level != null && !level.trim().isEmpty()) {
	            skillOffers = skillOffers.stream()
	                .filter(offer -> level.equalsIgnoreCase(offer.getLevel()))
	                .collect(Collectors.toList());
	        }

	        // Apply sorting
	        if ("oldest".equals(sortBy)) {
	            skillOffers = skillOffers.stream()
	                .sorted(Comparator.comparing(SkillOffer::getCreatedAt))
	                .collect(Collectors.toList());
	        } else if ("title".equals(sortBy)) {
	            skillOffers = skillOffers.stream()
	                .sorted(Comparator.comparing(SkillOffer::getTitle))
	                .collect(Collectors.toList());
	        }
	        // Default is already sorted by createdAt DESC

	        // Get all categories for filter dropdown
	        List<SkillCategory> categories = skillCategoryRepository.findAll();

	        // Get distinct locations for filter
	        List<String> locations = skillOfferRepository.findActiveOffersOrderByCreatedAtDesc().stream()
	            .map(SkillOffer::getLocation)
	            .filter(loc -> loc != null && !loc.isEmpty())
	            .distinct()
	            .sorted()
	            .collect(Collectors.toList());

	        // Convert to DTOs
	        List<SkillOfferDTO> skillOfferDTOs = DTOMapper.toSkillOfferDTOList(
	            skillOffers != null ? skillOffers : new ArrayList<>()
	        );
	        List<SkillCategoryDTO> categoryDTOs = DTOMapper.toSkillCategoryDTOList(
	            categories != null ? categories : new ArrayList<>()
	        );
	        UserDTO userDTO = user != null ? DTOMapper.toUserDTO(user) : null;

	        // Add to model
	        mav.addObject("skillOffers", skillOfferDTOs);
	        mav.addObject("categories", categoryDTOs);
	        mav.addObject("locations", locations);
	        mav.addObject("user", userDTO);

	        // Add filter parameters back to view
	        mav.addObject("searchQuery", search);
	        mav.addObject("selectedCategoryId", categoryId);
	        mav.addObject("selectedLocation", location);
	        mav.addObject("selectedLevel", level);
	        mav.addObject("selectedSort", sortBy);
	        mav.addObject("totalResults", skillOfferDTOs.size());

	    } catch (Exception e) {
	        e.printStackTrace();
	        mav.addObject("skillOffers", new ArrayList<>());
	        mav.addObject("categories", new ArrayList<>());
	        mav.addObject("locations", new ArrayList<>());
	        mav.addObject("totalResults", 0);
	        mav.addObject("error", "เกิดข้อผิดพลาดในการโหลดข้อมูล");
	    }

	    return mav;
	}
	
	@GetMapping("/skill")
	public ModelAndView skillDetail(@RequestParam("id") Integer id, HttpSession session) {
	    ModelAndView mav = new ModelAndView("skill-detail");

	    // ดึงสกิลที่ผู้ใช้กำลังดู
	    SkillOffer skillOffer = skillOfferRepository.findById(id)
	            .orElseThrow(() -> new RuntimeException("ไม่พบสกิล"));
	    mav.addObject("skillOffer", DTOMapper.toSkillOfferDTO(skillOffer));

	    // ดึงข้อมูลผู้ใช้จาก session
	    User user = (User) session.getAttribute("user");
	    if (user == null) {
	        // ถ้ายังไม่ login → redirect ไปหน้า login
	        return new ModelAndView("redirect:/login");
	    }

	    // ดึงสกิลทั้งหมดของผู้ใช้คนนี้
	    List<SkillOfferDTO> mySkills = skillOfferRepository.findByUserId(user.getId())
	            .stream()
	            .map(DTOMapper::toSkillOfferDTO)
	            .toList();

	    mav.addObject("mySkills", mySkills);

	    return mav;
	}



	
}