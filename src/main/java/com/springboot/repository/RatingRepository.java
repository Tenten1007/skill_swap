package com.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.springboot.model.Rating;
import com.springboot.model.User;

@Repository
public interface RatingRepository extends JpaRepository<Rating, Integer> {

    @Query("SELECT r FROM Rating r WHERE r.ratee.id = :userId")
    List<Rating> findByRateeId(@Param("userId") int userId);

    @Query("SELECT r FROM Rating r WHERE r.rater.id = :userId")
    List<Rating> findByRaterId(@Param("userId") int userId);

    List<Rating> findByRatee(User ratee);

    List<Rating> findByRater(User rater);

    @Query("SELECT AVG(r.score) FROM Rating r WHERE r.ratee.id = :userId")
    Double getAverageRatingByRateeId(@Param("userId") int userId);

    @Query("SELECT COUNT(r) FROM Rating r WHERE r.ratee.id = :userId")
    Long getCountRatingsByRateeId(@Param("userId") int userId);
}