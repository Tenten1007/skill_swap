package com.springboot.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.model.SwapMatch;
import com.springboot.model.User;
import com.springboot.repository.SwapMatchRepository;

@Service
public class SwapMatchService {

    @Autowired
    private SwapMatchRepository swapMatchRepository;

    public List<SwapMatch> getAllSwapMatches() {
        return swapMatchRepository.findAll();
    }

    public Optional<SwapMatch> getSwapMatchById(int id) {
        return swapMatchRepository.findById(id);
    }

    public List<SwapMatch> getSwapMatchesByUserId(int userId) {
        return swapMatchRepository.findByUserId(userId);
    }

    public List<SwapMatch> getSwapMatchesByOffererId(int userId) {
        return swapMatchRepository.findByOffererId(userId);
    }

    public List<SwapMatch> getSwapMatchesByRequesterId(int userId) {
        return swapMatchRepository.findByRequesterId(userId);
    }

    public List<SwapMatch> getSwapMatchesByOfferer(User offerer) {
        return swapMatchRepository.findByOfferer(offerer);
    }

    public List<SwapMatch> getSwapMatchesByRequester(User requester) {
        return swapMatchRepository.findByRequester(requester);
    }

    public List<SwapMatch> getSwapMatchesByStatus(String status) {
        return swapMatchRepository.findByStatus(status);
    }

    public SwapMatch saveSwapMatch(SwapMatch swapMatch) {
        if (swapMatch.getCreatedAt() == null) {
            swapMatch.setCreatedAt(LocalDateTime.now());
        }
        swapMatch.setUpdatedAt(LocalDateTime.now());
        return swapMatchRepository.save(swapMatch);
    }

    public SwapMatch updateSwapMatch(SwapMatch swapMatch) {
        swapMatch.setUpdatedAt(LocalDateTime.now());
        return swapMatchRepository.save(swapMatch);
    }

    public void deleteSwapMatch(int id) {
        swapMatchRepository.deleteById(id);
    }

    public SwapMatch updateSwapMatchStatus(int id, String status) {
        Optional<SwapMatch> swapMatch = swapMatchRepository.findById(id);
        if (swapMatch.isPresent()) {
            SwapMatch match = swapMatch.get();
            match.setStatus(status);
            match.setUpdatedAt(LocalDateTime.now());
            return swapMatchRepository.save(match);
        }
        return null;
    }
}