package com.springboot.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springboot.model.SkillCategory;

@Repository
public interface SkillCategoryRepository extends JpaRepository<SkillCategory, Integer> {

    Optional<SkillCategory> findByCategoryName(String categoryName);

    boolean existsByCategoryName(String categoryName);
}