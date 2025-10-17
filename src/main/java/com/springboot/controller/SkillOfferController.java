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
import com.springboot.dto.SkillOfferDTO;
import com.springboot.dto.SkillCategoryDTO;
import com.springboot.dto.UserDTO;
import com.springboot.dto.DTOMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class SkillOfferController {

    @Autowired
    private SkillOfferRepository skillOfferRepository;

    @Autowired
    private SkillCategoryRepository skillCategoryRepository;

    @Autowired
    private SkillRepository skillRepository;

    @Autowired
    private com.springboot.repository.SwapRequestRepository swapRequestRepository;

    @Autowired
    private com.springboot.repository.RatingRepository ratingRepository;

    @Autowired
    private com.springboot.repository.SwapMatchRepository swapMatchRepository;

    @GetMapping("/my-offers")
    public ModelAndView showMyOffers(HttpSession session) {
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

        ModelAndView mav = new ModelAndView("my-offers");

        try {
            // Get user's skill offers
            List<SkillOffer> myOffers = skillOfferRepository.findByUserOrderByCreatedAtDesc(user);

            // Convert to DTOs for security
            List<SkillOfferDTO> myOfferDTOs = DTOMapper.toSkillOfferDTOList(myOffers);
            UserDTO userDTO = DTOMapper.toUserDTO(user);

            mav.addObject("skillOffers", myOfferDTOs);
            mav.addObject("user", userDTO);

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

        // Check if user is null
        if (user == null) {
            return new ModelAndView("redirect:/login?message=session-expired");
        }

        // Get all categories for dropdown - convert to DTOs
        List<SkillCategory> categories = skillCategoryRepository.findAll();
        List<SkillCategoryDTO> categoryDTOs = DTOMapper.toSkillCategoryDTOList(categories);
        UserDTO userDTO = DTOMapper.toUserDTO(user);

        mav.addObject("categories", categoryDTOs);
        mav.addObject("user", userDTO);

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
                // Convert categories to DTOs
                List<SkillCategory> categories = skillCategoryRepository.findAll();
                mav.addObject("categories", DTOMapper.toSkillCategoryDTOList(categories));
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
            // Convert categories to DTOs
            List<SkillCategory> categories = skillCategoryRepository.findAll();
            mav.addObject("categories", DTOMapper.toSkillCategoryDTOList(categories));
            return mav;
        }
    }

    @PostMapping("/delete-skill")
    public ModelAndView deleteSkillOffer(@RequestParam Integer skillOfferId, HttpSession session) {
        try {
            User user = (User) session.getAttribute("user");
            if (user == null) {
                return new ModelAndView("redirect:/login?message=session-expired");
            }

            // ตรวจสอบว่า SkillOffer มีอยู่จริง
            SkillOffer skillOffer = skillOfferRepository.findById(skillOfferId).orElse(null);
            if (skillOffer == null) {
                return new ModelAndView("redirect:/my-offers?error=skill-not-found");
            }

            // ตรวจสอบว่าเป็นเจ้าของ SkillOffer หรือไม่
            if (skillOffer.getUser().getId() != user.getId()) {
                return new ModelAndView("redirect:/my-offers?error=unauthorized");
            }

            // ขั้นตอนที่ 1: ค้นหา SwapMatch ที่เกี่ยวข้องกับ SkillOffer นี้ (ทั้ง offerSkill และ requestSkill)
            var relatedSwapMatches = swapMatchRepository.findByOfferSkillIdOrRequestSkillId(skillOfferId);
            int totalRatingsDeleted = 0;
            int totalSwapMatchesDeleted = 0;

            // ลบ Rating ที่เกี่ยวข้องกับแต่ละ SwapMatch ก่อน
            if (!relatedSwapMatches.isEmpty()) {
                for (var swapMatch : relatedSwapMatches) {
                    var ratings = ratingRepository.findBySwapMatchId(swapMatch.getId());
                    if (!ratings.isEmpty()) {
                        ratingRepository.deleteAll(ratings);
                        totalRatingsDeleted += ratings.size();
                    }
                }
                System.out.println("Deleted " + totalRatingsDeleted + " related ratings");

                // ลบ SwapMatch ทั้งหมด
                swapMatchRepository.deleteAll(relatedSwapMatches);
                totalSwapMatchesDeleted = relatedSwapMatches.size();
                System.out.println("Deleted " + totalSwapMatchesDeleted + " related swap matches");
            }

            // ขั้นตอนที่ 2: ค้นหาและลบ SwapRequest ที่เกี่ยวข้องกับ SkillOffer นี้
            var relatedSwapRequests = swapRequestRepository.findByRequestedSkillIdOrOfferedSkillId(skillOfferId);
            if (!relatedSwapRequests.isEmpty()) {
                swapRequestRepository.deleteAll(relatedSwapRequests);
                System.out.println("Deleted " + relatedSwapRequests.size() + " related swap requests");
            }

            // ขั้นตอนที่ 3: ลบ SkillOffer
            skillOfferRepository.delete(skillOffer);

            System.out.println("Successfully deleted SkillOffer with ID: " + skillOfferId);
            return new ModelAndView("redirect:/my-offers?success=skill-deleted");

        } catch (Exception e) {
            System.out.println("ERROR in deleteSkillOffer: " + e.getMessage());
            e.printStackTrace();
            return new ModelAndView("redirect:/my-offers?error=delete-failed");
        }
    }
}