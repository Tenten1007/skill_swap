package com.springboot.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.dto.RatingDTO;
import com.springboot.dto.ReviewDTO;
import com.springboot.dto.UserRatingStatsDTO;
import com.springboot.model.Rating;
import com.springboot.model.SwapMatch;
import com.springboot.model.User;
import com.springboot.service.RatingService;
import com.springboot.service.SwapMatchService;
import com.springboot.service.UserService;
import com.springboot.service.NotificationService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/rating")
public class RatingController {

    @Autowired
    private RatingService ratingService;

    @Autowired
    private UserService userService;

    @Autowired
    private SwapMatchService swapMatchService;

    @Autowired
    private NotificationService notificationService;

    // แสดงหน้าให้คะแนน
    @GetMapping("/give")
    public ModelAndView showRatingPage(@RequestParam("userId") int userId,
                                       @RequestParam(value = "matchId", required = false) Integer matchId,
                                       HttpSession session) {
        ModelAndView mav = new ModelAndView("rating-form");

        System.out.println("=== DEBUG GET /rating/give ===");
        System.out.println("userId: " + userId);
        System.out.println("matchId ที่ส่งมา: " + matchId);

        // ดึงข้อมูล user ที่จะให้คะแนน
        Optional<User> userOpt = userService.getUserById(userId);
        if (!userOpt.isPresent()) {
            mav.setViewName("error");
            mav.addObject("message", "ไม่พบผู้ใช้");
            return mav;
        }

        User ratee = userOpt.get();

        // คำนวณคะแนนเฉลี่ย
        Double avgRating = ratingService.getAverageRatingByRateeId(userId);
        Long totalReviews = ratingService.getCountRatingsByRateeId(userId);

        // สร้าง DTO และใส่ matchId ถ้ามี
        RatingDTO ratingDTO = new RatingDTO();
        ratingDTO.setRateeId(userId);
        if (matchId != null) {
            ratingDTO.setSwapMatchId(matchId);
            System.out.println("✅ ใส่ matchId ใน DTO แล้ว: " + matchId);
        } else {
            System.out.println("⚠️ matchId เป็น null");
        }

        // ส่งข้อมูลไปหน้า view
        mav.addObject("ratee", ratee);
        mav.addObject("averageRating", avgRating != null ? avgRating : 0.0);
        mav.addObject("totalReviews", totalReviews != null ? totalReviews : 0);
        mav.addObject("ratingDTO", ratingDTO);
        mav.addObject("matchId", matchId); // ส่งไปอีกตัวเผื่อใช้ใน JSP

        return mav;
    }

    // บันทึกคะแนน
    @PostMapping("/submit")
    public ModelAndView submitRating(@ModelAttribute RatingDTO ratingDTO,
            @RequestParam(value = "swapMatchId", required = false) Integer swapMatchId,
            HttpSession session) {

        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            return new ModelAndView("redirect:/login");
        }

        Optional<User> rateeOpt = userService.getUserById(ratingDTO.getRateeId());
        if (!rateeOpt.isPresent()) {
            ModelAndView mav = new ModelAndView("error");
            mav.addObject("message", "ไม่พบผู้ใช้");
            return mav;
        }

        Rating rating = new Rating();
        rating.setRater(currentUser);
        rating.setRatee(rateeOpt.get());
        rating.setScore(ratingDTO.getScore());
        rating.setComment(ratingDTO.getComment());

        if (swapMatchId != null) {
            SwapMatch swapMatch = new SwapMatch();
            swapMatch.setId(swapMatchId);
            rating.setSwapMatch(swapMatch);
        }

        Rating savedRating = ratingService.saveRating(rating);

        // สร้าง notification สำหรับคนที่ถูกให้คะแนน
        User ratee = rateeOpt.get();
        notificationService.createRatingReceivedNotification(
            ratee,
            currentUser,
            ratingDTO.getScore(),
            savedRating.getId()
        );

        // ✅ เปลี่ยนจาก redirect:/rating-form เป็น redirect:/matches
        session.setAttribute("successMessage", "ขอบคุณที่ให้คะแนน! ความคิดเห็นของคุณมีค่ามาก");
        return new ModelAndView("redirect:/matches?tab=learning");
    }

    // แสดงโปรไฟล์พร้อมคะแนนและรีวิว
    @GetMapping("/profile")
    public ModelAndView showUserProfile(@RequestParam("userId") int userId) {
        ModelAndView mav = new ModelAndView("user-profile");

        // ดึงข้อมูล user
        Optional<User> userOpt = userService.getUserById(userId);
        if (!userOpt.isPresent()) {
            mav.setViewName("error");
            mav.addObject("message", "ไม่พบผู้ใช้");
            return mav;
        }

        User user = userOpt.get();

        // คำนวณสถิติ
        Double avgRating = ratingService.getAverageRatingByRateeId(userId);
        Long totalReviews = ratingService.getCountRatingsByRateeId(userId);

        UserRatingStatsDTO stats = new UserRatingStatsDTO(
            user.getId(),
            user.getUsername(),
            user.getFullName(),
            avgRating != null ? avgRating : 0.0,
            totalReviews != null ? totalReviews : 0
        );

        // ดึงรายการรีวิว
        List<Rating> ratings = ratingService.getRatingsByRateeId(userId);
        List<ReviewDTO> reviews = new ArrayList<>();

        for (Rating r : ratings) {
            ReviewDTO review = new ReviewDTO(
                r.getRater().getFullName(),
                r.getScore(),
                r.getComment(),
                r.getCreatedAt()
            );
            reviews.add(review);
        }

        mav.addObject("user", user);
        mav.addObject("stats", stats);
        mav.addObject("reviews", reviews);

        return mav;
    }

    // ลบ method successPage() ออก หรือคอมเมนต์ไว้
    /*
    @GetMapping("/success")
    public ModelAndView successPage() {
        return new ModelAndView("rating-success");
    }
    */
}
