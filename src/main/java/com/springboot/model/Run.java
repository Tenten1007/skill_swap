package com.springboot.model;

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

	}
}
