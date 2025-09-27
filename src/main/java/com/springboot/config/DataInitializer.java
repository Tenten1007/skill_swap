package com.springboot.config;

import java.time.LocalDateTime;
import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import com.springboot.model.*;
import com.springboot.repository.*;

@Component
public class DataInitializer implements ApplicationRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SkillCategoryRepository skillCategoryRepository;

    @Autowired
    private SkillRepository skillRepository;

    @Autowired
    private SkillOfferRepository skillOfferRepository;

    @Autowired
    private SwapMatchRepository swapMatchRepository;

    @Autowired
    private RatingRepository ratingRepository;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        // Check if data already exists
        long userCount = userRepository.count();
        if (userCount > 0) {
            System.out.println("Sample data already exists (" + userCount + " users found). Skipping data creation.");
            return;
        }

        initializeData();
    }

    private void initializeData() {
        try {
            // Create Sample Users
            PasswordUtil passwordUtil = PasswordUtil.getInstance();

            User user1 = new User(0, "somsak", passwordUtil.createPassword("password123", "Tenten"), "somsak@email.com",
            "สมศักดิ์", "ใจดี", null, "นักพัฒนาเว็บไซต์ที่มีประสบการณ์ 5 ปี ชอบเรียนรู้เทคโนโลยีใหม่ๆ และแบ่งปันความรู้",
            "กรุงเทพมหานคร", "081-234-5678", "https://linkedin.com/in/somsak", "https://github.com/somsak",
            LocalDateTime.now().minusDays(30), null, new ArrayList<>());
        user1 = userRepository.save(user1);

        User user2 = new User(0, "malee", passwordUtil.createPassword("password123", "Tenten"), "malee@email.com",
            "มาลี", "สวยงาม", null, "UX/UI Designer ที่หลงใหลในการออกแบบที่ใช้งานง่าย อยากเรียนรู้การเขียนโปรแกรม",
            "เชียงใหม่", "082-345-6789", "https://linkedin.com/in/malee", null,
            LocalDateTime.now().minusDays(25), null, new ArrayList<>());
        user2 = userRepository.save(user2);

        User user3 = new User(0, "david", passwordUtil.createPassword("password123", "Tenten"), "david@email.com",
            "David", "Johnson", null, "Digital Marketing Expert with 8 years experience. Looking to learn web development skills.",
            "Bangkok", "083-456-7890", "https://linkedin.com/in/davidjohnson", "https://github.com/davidj",
            LocalDateTime.now().minusDays(20), null, new ArrayList<>());
        user3 = userRepository.save(user3);

        User user4 = new User(0, "siriporn", passwordUtil.createPassword("password123", "Tenten"), "siriporn@email.com",
            "ศิริพร", "เก่งเขียน", null, "นักเขียนคอนเทนต์และบล็อกเกอร์ มีประสบการณ์การเขียนมากกว่า 3 ปี อยากเรียนรู้การตลาดดิจิทัล",
            "ภูเก็ต", "084-567-8901", null, null,
            LocalDateTime.now().minusDays(15), null, new ArrayList<>());
        user4 = userRepository.save(user4);
        
        User user5 = new User(0, "admin", passwordUtil.createPassword("1234", "Tenten"), "admin@email.com",
            "Admin", "a", null, "เป็นผู้ดูแลระบบ",
            "เชียงใหม่", "0891234567", null, null,
            LocalDateTime.now().minusDays(15), null, new ArrayList<>());
        user5 = userRepository.save(user5);

        // Create Skill Categories
        SkillCategory techCategory = skillCategoryRepository.save(
            new SkillCategory(0, "เทคโนโลยี", "ทักษะด้านเทคโนโลยีและการเขียนโปรแกรม", new ArrayList<>()));

        SkillCategory designCategory = skillCategoryRepository.save(
            new SkillCategory(0, "ดิไซน์", "ทักษะด้านการออกแบบและศิลปะ", new ArrayList<>()));

        SkillCategory marketingCategory = skillCategoryRepository.save(
            new SkillCategory(0, "การตลาด", "ทักษะด้านการตลาดและการขาย", new ArrayList<>()));

        SkillCategory languageCategory = skillCategoryRepository.save(
            new SkillCategory(0, "ภาษา", "ทักษะด้านภาษาต่างประเทศ", new ArrayList<>()));

        // Create Skills
        Skill javaSkill = skillRepository.save(new Skill(0, "Java Programming", "การเขียนโปรแกรมภาษา Java", techCategory, new ArrayList<>()));
        Skill reactSkill = skillRepository.save(new Skill(0, "React.js", "การพัฒนา Frontend ด้วย React", techCategory, new ArrayList<>()));
        Skill uxSkill = skillRepository.save(new Skill(0, "UX/UI Design", "การออกแบบประสบการณ์ผู้ใช้และส่วนต่อประสาน", designCategory, new ArrayList<>()));
        Skill digitalMarketingSkill = skillRepository.save(new Skill(0, "Digital Marketing", "การตลาดดิจิทัล SEO, SEM, Social Media", marketingCategory, new ArrayList<>()));
        Skill contentWritingSkill = skillRepository.save(new Skill(0, "Content Writing", "การเขียนคอนเทนต์และบทความ", marketingCategory, new ArrayList<>()));
        Skill socialMediaSkill = skillRepository.save(new Skill(0, "Social Media Marketing", "การตลาดผ่านโซเชียลมีเดีย Facebook, Instagram, TikTok", marketingCategory, new ArrayList<>()));
        skillRepository.save(new Skill(0, "English", "ภาษาอังกฤษการสื่อสารและธุรกิจ", languageCategory, new ArrayList<>()));

        // Create Skill Offers
        SkillOffer offer1 = skillOfferRepository.save(new SkillOffer(0, user1, javaSkill, "สอน Java Programming สำหรับผู้เริ่มต้น",
            "สอนการเขียนโปรแกรม Java จากพื้นฐานจนถึงขั้นสูง มีประสบการณ์การสอนและพัฒนาระบบมามากกว่า 5 ปี",
            "Intermediate", "3-4 ชั่วโมงต่อสัปดาห์", "Online หรือ กรุงเทพฯ", true,
            LocalDateTime.now().minusDays(10), null, new ArrayList<>()));

        SkillOffer offer2 = skillOfferRepository.save(new SkillOffer(0, user2, uxSkill, "UX/UI Design Workshop",
            "สอนการออกแบบ User Experience และ User Interface ตั้งแต่พื้นฐานจนสามารถทำงานได้จริง",
            "Beginner", "2-3 ชั่วโมงต่อสัปดาห์", "เชียงใหม่ หรือ Online", true,
            LocalDateTime.now().minusDays(8), null, new ArrayList<>()));

        SkillOffer offer3 = skillOfferRepository.save(new SkillOffer(0, user3, digitalMarketingSkill, "Digital Marketing Complete Course",
            "สอนการตลาดดิจิทัลครบครัน SEO, Google Ads, Facebook Ads, Analytics พร้อมเคสสตั้ดีจริง",
            "Advanced", "4-5 ชั่วโมงต่อสัปดาห์", "Bangkok หรือ Online", true,
            LocalDateTime.now().minusDays(6), null, new ArrayList<>()));

        SkillOffer offer4 = skillOfferRepository.save(new SkillOffer(0, user4, contentWritingSkill, "Content Writing & Copywriting",
            "สอนการเขียนคอนเทนต์ที่น่าสนใจ การเขียน Copywriting ที่ขายได้ พร้อมเทคนิคการหาไอเดีย",
            "Intermediate", "2-3 ชั่วโมงต่อสัปดาห์", "Online เท่านั้น", true,
            LocalDateTime.now().minusDays(4), null, new ArrayList<>()));

        SkillOffer offer5 = skillOfferRepository.save(new SkillOffer(0, user1, reactSkill, "React.js Development Workshop",
            "พัฒนา Web Application ด้วย React.js ตั้งแต่พื้นฐานถึงขั้นสูง รวมถึง Redux และ React Hooks",
            "Advanced", "4-6 ชั่วโมงต่อสัปดาห์", "กรุงเทพฯ", true,
            LocalDateTime.now().minusDays(2), null, new ArrayList<>()));

        SkillOffer offer6 = skillOfferRepository.save(new SkillOffer(0, user2, socialMediaSkill, "Social Media Marketing Intensive",
            "เรียนรู้การทำ Social Media Marketing แบบเข้มข้น Facebook, Instagram, TikTok สำหรับธุรกิจ",
            "Beginner", "3-4 ชั่วโมงต่อสัปดาห์", "เชียงใหม่ หรือ Online", true,
            LocalDateTime.now().minusDays(1), null, new ArrayList<>()));

        // Create Swap Matches
        SwapMatch match1 = swapMatchRepository.save(new SwapMatch(0, user1, user2, offer1, offer2, "completed",
            LocalDateTime.now().minusDays(15), LocalDateTime.now().minusDays(5)));

        SwapMatch match2 = swapMatchRepository.save(new SwapMatch(0, user2, user3, offer2, offer3, "completed",
            LocalDateTime.now().minusDays(12), LocalDateTime.now().minusDays(3)));

        swapMatchRepository.save(new SwapMatch(0, user3, user4, offer3, offer4, "in_progress",
            LocalDateTime.now().minusDays(8), null));

        swapMatchRepository.save(new SwapMatch(0, user4, user1, offer4, offer5, "pending",
            LocalDateTime.now().minusDays(5), null));

        swapMatchRepository.save(new SwapMatch(0, user1, user2, offer5, offer6, "pending",
            LocalDateTime.now().minusDays(3), null));

        // Create Ratings
        ratingRepository.save(new Rating(0, user2, user1, match1, 5,
            "สอนดีมาก อธิบายเข้าใจง่าย และอดทนมาก ขอบคุณครับ!", LocalDateTime.now().minusDays(4)));

        ratingRepository.save(new Rating(0, user1, user2, match1, 4,
            "นักเรียนที่ตั้งใจมาก ถามคำถามดีๆ และฝึกฝนจริงจัง", LocalDateTime.now().minusDays(4)));

        ratingRepository.save(new Rating(0, user3, user2, match2, 5,
            "การออกแบบสวยมาก แนะนำเทคนิคใหม่ๆ ที่ไม่เคยรู้มาก่อน", LocalDateTime.now().minusDays(2)));

        ratingRepository.save(new Rating(0, user2, user3, match2, 5,
            "มีความคิดสร้างสรรค์มาก และเรียนรู้เร็วจริงๆ", LocalDateTime.now().minusDays(2)));


        } catch (Exception e) {
            System.err.println("Error creating sample data: " + e.getMessage());
            e.printStackTrace();
        }
    }
}