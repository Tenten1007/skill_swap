package com.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.springboot.model.SwapMatch;
import com.springboot.model.User;

@Repository
public interface SwapMatchRepository extends JpaRepository<SwapMatch, Integer> {

    @Query("SELECT sm FROM SwapMatch sm WHERE sm.offerer.id = :userId OR sm.requester.id = :userId")
    List<SwapMatch> findByUserId(@Param("userId") int userId);

    @Query("SELECT sm FROM SwapMatch sm WHERE sm.offerer.id = :userId")
    List<SwapMatch> findByOffererId(@Param("userId") int userId);

    @Query("SELECT sm FROM SwapMatch sm WHERE sm.requester.id = :userId")
    List<SwapMatch> findByRequesterId(@Param("userId") int userId);

    List<SwapMatch> findByOfferer(User offerer);

    List<SwapMatch> findByRequester(User requester);

    @Query("SELECT sm FROM SwapMatch sm WHERE sm.status = :status")
    List<SwapMatch> findByStatus(@Param("status") String status);

    // ค้นหา SwapMatch ที่เกี่ยวข้องกับ SkillOffer (ทั้ง offer และ request)
    @Query("SELECT sm FROM SwapMatch sm WHERE sm.offerSkill.id = :skillOfferId OR sm.requestSkill.id = :skillOfferId")
    List<SwapMatch> findByOfferSkillIdOrRequestSkillId(@Param("skillOfferId") int skillOfferId);
}