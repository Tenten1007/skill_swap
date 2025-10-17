package com.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.springboot.model.SkillOffer;
import com.springboot.model.User;

@Repository
public interface SkillOfferRepository extends JpaRepository<SkillOffer, Integer> {

    List<SkillOffer> findByUser(User user);

    @Query("SELECT so FROM SkillOffer so WHERE so.user.id = :userId")
    List<SkillOffer> findByUserId(@Param("userId") int userId);

    @Query("SELECT so FROM SkillOffer so WHERE so.isActive = true ORDER BY so.createdAt DESC")
    List<SkillOffer> findActiveOffersOrderByCreatedAtDesc();

    @Query("SELECT so FROM SkillOffer so WHERE so.isActive = true AND so.location LIKE %:location%")
    List<SkillOffer> findActiveOffersByLocation(@Param("location") String location);

    @Query("SELECT so FROM SkillOffer so WHERE so.isActive = true AND so.skill.id = :skillId")
    List<SkillOffer> findActiveOffersBySkillId(@Param("skillId") int skillId);

    @Query("SELECT so FROM SkillOffer so WHERE so.isActive = true AND so.skill.category.id = :categoryId")
    List<SkillOffer> findActiveOffersByCategoryId(@Param("categoryId") int categoryId);

    @Query("SELECT so FROM SkillOffer so WHERE so.isActive = true AND (so.title LIKE %:keyword% OR so.description LIKE %:keyword%)")
    List<SkillOffer> searchActiveOffers(@Param("keyword") String keyword);

    List<SkillOffer> findByUserOrderByCreatedAtDesc(User user);
}