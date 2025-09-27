package com.springboot.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.context.ApplicationContext;

import com.springboot.SpringBootApplicationMain;
import com.springboot.repository.UserRepository;
import com.springboot.repository.SkillCategoryRepository;
import com.springboot.repository.SkillRepository;
import com.springboot.repository.SkillOfferRepository;
import com.springboot.repository.SwapMatchRepository;
import com.springboot.repository.RatingRepository;

public class Run {
	public static void main(String[] args) {
		ApplicationContext context = SpringApplication.run(SpringBootApplicationMain.class, args);

		UserRepository userRepository = context.getBean(UserRepository.class);
		SkillCategoryRepository skillCategoryRepository = context.getBean(SkillCategoryRepository.class);
		SkillRepository skillRepository = context.getBean(SkillRepository.class);
		SkillOfferRepository skillOfferRepository = context.getBean(SkillOfferRepository.class);
		SwapMatchRepository swapMatchRepository = context.getBean(SwapMatchRepository.class);
		RatingRepository ratingRepository = context.getBean(RatingRepository.class);

		// Clear existing data (optional - for testing purposes)
		System.out.println("=== Starting Sample Data Creation ===");

		// Clear all existing data to ensure clean state
		System.out.println("Clearing existing data...");
		ratingRepository.deleteAll();
		swapMatchRepository.deleteAll();
		skillOfferRepository.deleteAll();
		skillRepository.deleteAll();
		skillCategoryRepository.deleteAll();
		userRepository.deleteAll();
		System.out.println("Data cleared successfully");

		// Create Sample Users
		System.out.println("Creating sample users...");
		User user1 = new User(0, "somsak", PasswordUtil.hashPassword("password123"), "somsak@email.com",
			"สมศักดิ์", "ใจดี", null, "นักพัฒนาเว็บไซต์ที่มีประสบการณ์ 5 ปี ชอบเรียนรู้เทคโนโลยีใหม่ๆ และแบ่งปันความรู้",
			"กรุงเทพมหานคร", "081-234-5678", "https://linkedin.com/in/somsak", "https://github.com/somsak",
			LocalDateTime.now().minusDays(30), null, new ArrayList<>());
		user1 = userRepository.save(user1);

		User user2 = new User(0, "malee", PasswordUtil.hashPassword("password123"), "malee@email.com",
			"มาลี", "สวยงาม", null, "UX/UI Designer ที่หลงใหลในการออกแบบที่ใช้งานง่าย อยากเรียนรู้การเขียนโปรแกรม",
			"เชียงใหม่", "082-345-6789", "https://linkedin.com/in/malee", null,
			LocalDateTime.now().minusDays(25), null, new ArrayList<>());
		user2 = userRepository.save(user2);

		User user3 = new User(0, "david", PasswordUtil.hashPassword("password123"), "david@email.com",
			"David", "Johnson", null, "Digital Marketing Expert with 8 years experience. Looking to learn web development skills.",
			"Bangkok", "083-456-7890", "https://linkedin.com/in/davidjohnson", "https://github.com/davidj",
			LocalDateTime.now().minusDays(20), null, new ArrayList<>());
		user3 = userRepository.save(user3);

		User user4 = new User(0, "siriporn", PasswordUtil.hashPassword("password123"), "siriporn@email.com",
			"ศิริพร", "เก่งเขียน", null, "นักเขียนคอนเทนต์และบล็อกเกอร์ มีประสบการณ์การเขียนมากกว่า 3 ปี อยากเรียนรู้การตลาดดิจิทัล",
			"ภูเก็ต", "084-567-8901", null, null,
			LocalDateTime.now().minusDays(15), null, new ArrayList<>());
		user4 = userRepository.save(user4);

		// Create Skill Categories
		System.out.println("Creating skill categories...");
		SkillCategory techCategory = skillCategoryRepository.save(
			new SkillCategory(0, "เทคโนโลยี", "ทักษะด้านเทคโนโลยีและการเขียนโปรแกรม", new ArrayList<>()));

		SkillCategory designCategory = skillCategoryRepository.save(
			new SkillCategory(0, "ดิไซน์", "ทักษะด้านการออกแบบและศิลปะ", new ArrayList<>()));

		SkillCategory marketingCategory = skillCategoryRepository.save(
			new SkillCategory(0, "การตลาด", "ทักษะด้านการตลาดและการขาย", new ArrayList<>()));

		SkillCategory languageCategory = skillCategoryRepository.save(
			new SkillCategory(0, "ภาษา", "ทักษะด้านภาษาต่างประเทศ", new ArrayList<>()));

		// Create Skills
		System.out.println("Creating skills...");
		Skill javaSkill = skillRepository.save(new Skill(0, "Java Programming", "การเขียนโปรแกรมภาษา Java", techCategory, new ArrayList<>()));
		Skill reactSkill = skillRepository.save(new Skill(0, "React.js", "การพัฒนา Frontend ด้วย React", techCategory, new ArrayList<>()));
		Skill uxSkill = skillRepository.save(new Skill(0, "UX/UI Design", "การออกแบบประสบการณ์ผู้ใช้และส่วนต่อประสาน", designCategory, new ArrayList<>()));
		Skill digitalMarketingSkill = skillRepository.save(new Skill(0, "Digital Marketing", "การตลาดดิจิทัล SEO, SEM, Social Media", marketingCategory, new ArrayList<>()));
		Skill contentWritingSkill = skillRepository.save(new Skill(0, "Content Writing", "การเขียนคอนเทนต์และบทความ", marketingCategory, new ArrayList<>()));
		Skill socialMediaSkill = skillRepository.save(new Skill(0, "Social Media Marketing", "การตลาดผ่านโซเชียลมีเดีย Facebook, Instagram, TikTok", marketingCategory, new ArrayList<>()));
		skillRepository.save(new Skill(0, "English", "ภาษาอังกฤษการสื่อสารและธุรกิจ", languageCategory, new ArrayList<>()));

		// Create Skill Offers
		System.out.println("Creating skill offers...");
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
		System.out.println("Creating swap matches...");
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
		System.out.println("Creating ratings...");
		ratingRepository.save(new Rating(0, user2, user1, match1, 5,
			"สอนดีมาก อธิบายเข้าใจง่าย และอดทนมาก ขอบคุณครับ!", LocalDateTime.now().minusDays(4)));

		ratingRepository.save(new Rating(0, user1, user2, match1, 4,
			"นักเรียนที่ตั้งใจมาก ถามคำถามดีๆ และฝึกฝนจริงจัง", LocalDateTime.now().minusDays(4)));

		ratingRepository.save(new Rating(0, user3, user2, match2, 5,
			"การออกแบบสวยมาก แนะนำเทคนิคใหม่ๆ ที่ไม่เคยรู้มาก่อน", LocalDateTime.now().minusDays(2)));

		ratingRepository.save(new Rating(0, user2, user3, match2, 5,
			"มีความคิดสร้างสรรค์มาก และเรียนรู้เร็วจริงๆ", LocalDateTime.now().minusDays(2)));

		// Print summary
		System.out.println("=== Sample Data Creation Complete ===");
		System.out.println("Users created: " + userRepository.count());
		System.out.println("Skill Categories created: " + skillCategoryRepository.count());
		System.out.println("Skills created: " + skillRepository.count());
		System.out.println("Skill Offers created: " + skillOfferRepository.count());
		System.out.println("Swap Matches created: " + swapMatchRepository.count());
		System.out.println("Ratings created: " + ratingRepository.count());
		System.out.println("=== Ready for testing! ===");

		// Verify data
		System.out.println("\n=== Data Verification ===");
		List<User> allUsers = userRepository.findAll();
		for (User user : allUsers) {
			System.out.println("User: " + user.getUsername() + " (" + user.getFullName() + ")");
		}

		List<SkillOffer> allOffers = skillOfferRepository.findAll();
		System.out.println("=== ALL SKILL OFFERS ===");
		for (int i = 0; i < allOffers.size(); i++) {
			SkillOffer offer = allOffers.get(i);
			System.out.println((i+1) + ". " + offer.getTitle() + " by " + offer.getUser().getUsername() +
					          " (Active: " + offer.isActive() + ")");
		}

		System.out.println("\n=== Swap Matches ===");
		List<SwapMatch> allMatches = swapMatchRepository.findAll();
		for (SwapMatch match : allMatches) {
			System.out.println("Match: " + match.getOfferer().getUsername() + " <-> " +
							   match.getRequester().getUsername() + " (" + match.getStatus() + ")");
		}

		System.out.println("\n=== Ratings ===");
		List<Rating> allRatings = ratingRepository.findAll();
		for (Rating rating : allRatings) {
			System.out.println("Rating: " + rating.getRater().getUsername() + " -> " +
							   rating.getRatee().getUsername() + " (" + rating.getScore() + "⭐)");
		}
	}
}