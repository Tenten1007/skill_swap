package com.springboot.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.springboot.model.Skill;
import com.springboot.model.SkillCategory;

@Repository
public interface SkillRepository extends JpaRepository<Skill, Integer> {

    Optional<Skill> findBySkillName(String skillName);

    List<Skill> findByCategory(SkillCategory category);

    @Query("SELECT s FROM Skill s WHERE s.category.id = :categoryId")
    List<Skill> findByCategoryId(@Param("categoryId") int categoryId);

    @Query("SELECT s FROM Skill s WHERE s.skillName LIKE %:keyword%")
    List<Skill> findBySkillNameContaining(@Param("keyword") String keyword);

    Optional<Skill> findByCategoryAndSkillName(SkillCategory category, String skillName);
}