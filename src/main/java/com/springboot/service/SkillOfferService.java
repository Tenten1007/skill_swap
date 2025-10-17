package com.springboot.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.model.SkillOffer;
import com.springboot.model.User;
import com.springboot.repository.SkillOfferRepository;

@Service
public class SkillOfferService {

    @Autowired
    private SkillOfferRepository skillOfferRepository;

    public List<SkillOffer> getAllSkillOffers() {
        return skillOfferRepository.findAll();
    }

    public Optional<SkillOffer> getSkillOfferById(int id) {
        return skillOfferRepository.findById(id);
    }

    public List<SkillOffer> getSkillOffersByUser(User user) {
        return skillOfferRepository.findByUser(user);
    }

    public List<SkillOffer> getSkillOffersByUserId(int userId) {
        return skillOfferRepository.findByUserId(userId);
    }

    public List<SkillOffer> getActiveSkillOffers() {
        return skillOfferRepository.findActiveOffersOrderByCreatedAtDesc();
    }

    public List<SkillOffer> getActiveSkillOffersByLocation(String location) {
        return skillOfferRepository.findActiveOffersByLocation(location);
    }

    public List<SkillOffer> getActiveSkillOffersBySkillId(int skillId) {
        return skillOfferRepository.findActiveOffersBySkillId(skillId);
    }

    public List<SkillOffer> searchActiveSkillOffers(String keyword) {
        return skillOfferRepository.searchActiveOffers(keyword);
    }

    public SkillOffer saveSkillOffer(SkillOffer skillOffer) {
        if (skillOffer.getCreatedAt() == null) {
            skillOffer.setCreatedAt(LocalDateTime.now());
        }
        skillOffer.setUpdatedAt(LocalDateTime.now());
        return skillOfferRepository.save(skillOffer);
    }

    public SkillOffer updateSkillOffer(SkillOffer skillOffer) {
        skillOffer.setUpdatedAt(LocalDateTime.now());
        return skillOfferRepository.save(skillOffer);
    }

    public void deleteSkillOffer(int id) {
        skillOfferRepository.deleteById(id);
    }

    public void deactivateSkillOffer(int id) {
        Optional<SkillOffer> skillOffer = skillOfferRepository.findById(id);
        if (skillOffer.isPresent()) {
            SkillOffer offer = skillOffer.get();
            offer.setActive(false);
            offer.setUpdatedAt(LocalDateTime.now());
            skillOfferRepository.save(offer);
        }
    }
}