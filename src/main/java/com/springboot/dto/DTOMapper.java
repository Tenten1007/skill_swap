package com.springboot.dto;

import java.util.List;
import java.util.stream.Collectors;

import com.springboot.model.SkillCategory;
import com.springboot.model.SkillOffer;
import com.springboot.model.User;

/**
 * Utility class for converting Entity objects to DTO objects
 * Centralizes mapping logic and ensures consistent data transformation
 */
public class DTOMapper {

    // User Entity to UserDTO
    public static UserDTO toUserDTO(User user) {
        if (user == null) return null;

        return new UserDTO(
            user.getId(),
            user.getUsername(),
            user.getFullName(),
            user.getProfileImage(),
            user.getBio(),
            user.getLocation(),
            user.getCreatedAt()
        );
    }

    // User Entity to UserProfileDTO
    public static UserProfileDTO toUserProfileDTO(User user) {
        if (user == null) return null;

        return new UserProfileDTO(
            user.getId(),
            user.getUsername(),
            user.getEmail(),
            user.getFirstName(),
            user.getLastName(),
            user.getProfileImage(),
            user.getBio(),
            user.getLocation(),
            user.getPhone(),
            user.getLinkedin(),
            user.getGithub(),
            user.getCreatedAt(),
            user.getUpdatedAt()
        );
    }

    // SkillOffer Entity to SkillOfferDTO
    public static SkillOfferDTO toSkillOfferDTO(SkillOffer skillOffer) {
        if (skillOffer == null) return null;

        User user = skillOffer.getUser();
        String userName = user != null ? user.getUsername() : "";
        String userFullName = user != null ? user.getFullName() : "";
        String userProfileImage = user != null ? user.getProfileImage() : null;
        String userLocation = user != null ? user.getLocation() : "";

        String skillName = skillOffer.getSkill() != null ?
                          skillOffer.getSkill().getSkillName() : "";
        String categoryName = skillOffer.getSkill() != null &&
                             skillOffer.getSkill().getCategory() != null ?
                             skillOffer.getSkill().getCategory().getCategoryName() : "";

        return new SkillOfferDTO(
            skillOffer.getId(),
            skillOffer.getTitle(),
            skillOffer.getDescription(),
            skillOffer.getLevel(),
            skillOffer.getTimeCommitment(),
            skillOffer.getLocation(),
            skillOffer.isActive(),
            skillOffer.getCreatedAt(),
            userName,
            userFullName,
            userProfileImage,
            userLocation,
            skillName,
            categoryName
        );
    }

    // SkillCategory Entity to SkillCategoryDTO
    public static SkillCategoryDTO toSkillCategoryDTO(SkillCategory category) {
        if (category == null) return null;

        int skillCount = category.getSkills() != null ? category.getSkills().size() : 0;

        return new SkillCategoryDTO(
            category.getId(),
            category.getCategoryName(),
            category.getDescription(),
            skillCount
        );
    }

    // List conversion methods
    public static List<UserDTO> toUserDTOList(List<User> users) {
        return users.stream()
                   .map(DTOMapper::toUserDTO)
                   .collect(Collectors.toList());
    }

    public static List<SkillOfferDTO> toSkillOfferDTOList(List<SkillOffer> skillOffers) {
        return skillOffers.stream()
                         .map(DTOMapper::toSkillOfferDTO)
                         .collect(Collectors.toList());
    }

    public static List<SkillCategoryDTO> toSkillCategoryDTOList(List<SkillCategory> categories) {
        return categories.stream()
                        .map(DTOMapper::toSkillCategoryDTO)
                        .collect(Collectors.toList());
    }

    // Reverse mapping (DTO to Entity) - for form submissions
    public static void updateUserFromProfileDTO(User user, UserProfileDTO dto) {
        if (user == null || dto == null) return;

        user.setFirstName(dto.getFirstName());
        user.setLastName(dto.getLastName());
        user.setBio(dto.getBio());
        user.setLocation(dto.getLocation());
        user.setPhone(dto.getPhone());
        user.setLinkedin(dto.getLinkedin());
        user.setGithub(dto.getGithub());
        user.setProfileImage(dto.getProfileImage());
        // Note: Username, email, password are not updated here for security
    }
}