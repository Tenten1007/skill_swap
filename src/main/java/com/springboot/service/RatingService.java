package com.springboot.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.model.Rating;
import com.springboot.model.User;
import com.springboot.repository.RatingRepository;

@Service
public class RatingService {

    @Autowired
    private RatingRepository ratingRepository;

    public List<Rating> getAllRatings() {
        return ratingRepository.findAll();
    }

    public Optional<Rating> getRatingById(int id) {
        return ratingRepository.findById(id);
    }

    public List<Rating> getRatingsByRateeId(int userId) {
        return ratingRepository.findByRateeId(userId);
    }

    public List<Rating> getRatingsByRaterId(int userId) {
        return ratingRepository.findByRaterId(userId);
    }

    public List<Rating> getRatingsByRatee(User ratee) {
        return ratingRepository.findByRatee(ratee);
    }

    public List<Rating> getRatingsByRater(User rater) {
        return ratingRepository.findByRater(rater);
    }

    public Double getAverageRatingByRateeId(int userId) {
        return ratingRepository.getAverageRatingByRateeId(userId);
    }

    public Long getCountRatingsByRateeId(int userId) {
        return ratingRepository.getCountRatingsByRateeId(userId);
    }

    public Rating saveRating(Rating rating) {
        if (rating.getCreatedAt() == null) {
            rating.setCreatedAt(LocalDateTime.now());
        }
        return ratingRepository.save(rating);
    }

    public Rating updateRating(Rating rating) {
        return ratingRepository.save(rating);
    }

    public void deleteRating(int id) {
        ratingRepository.deleteById(id);
    }
}