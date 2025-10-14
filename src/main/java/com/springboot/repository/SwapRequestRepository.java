package com.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.springboot.model.SwapRequest;


@Repository
public interface SwapRequestRepository extends JpaRepository<SwapRequest, Integer> {

    // คำขอที่ผู้ใช้ส่งไป (Sent Requests)
    @Query("SELECT sr FROM SwapRequest sr WHERE sr.requester.id = :userId ORDER BY sr.createdAt DESC")
    List<SwapRequest> findSentRequestsByUserId(@Param("userId") int userId);

    // คำขอที่ผู้ใช้ได้รับ (Received Requests)
    @Query("SELECT sr FROM SwapRequest sr WHERE sr.requestedSkill.user.id = :userId ORDER BY sr.createdAt DESC")
    List<SwapRequest> findReceivedRequestsByUserId(@Param("userId") int userId);

    // ค้นหาคำขอตามสถานะ
    @Query("SELECT sr FROM SwapRequest sr WHERE sr.requester.id = :userId AND sr.status = :status ORDER BY sr.createdAt DESC")
    List<SwapRequest> findSentRequestsByUserIdAndStatus(@Param("userId") int userId, @Param("status") String status);

    @Query("SELECT sr FROM SwapRequest sr WHERE sr.requestedSkill.user.id = :userId AND sr.status = :status ORDER BY sr.createdAt DESC")
    List<SwapRequest> findReceivedRequestsByUserIdAndStatus(@Param("userId") int userId, @Param("status") String status);

    // คำขอที่รอการตอบรับ (สำหรับผู้ได้รับคำขอ)
    @Query("SELECT sr FROM SwapRequest sr WHERE sr.requestedSkill.user.id = :userId AND sr.status = 'PENDING' ORDER BY sr.createdAt DESC")
    List<SwapRequest> findPendingRequestsForUser(@Param("userId") int userId);

    // ตรวจสอบว่ามีการส่งคำขอ swap แล้วหรือไม่
    @Query("SELECT COUNT(sr) > 0 FROM SwapRequest sr WHERE sr.requester.id = :requesterId AND sr.requestedSkill.id = :skillId AND sr.status = 'PENDING'")
    boolean existsPendingRequestBetweenUserAndSkill(@Param("requesterId") int requesterId, @Param("skillId") int skillId);

    // ดึงคำขอตาม requester และ requested skill
    @Query("SELECT sr FROM SwapRequest sr WHERE sr.requester.id = :requesterId AND sr.requestedSkill.id = :skillId ORDER BY sr.createdAt DESC")
    List<SwapRequest> findByRequesterIdAndRequestedSkillId(@Param("requesterId") int requesterId, @Param("skillId") int skillId);

    // ดึงคำขอทั้งหมดของผู้ใช้ (ทั้งส่งและได้รับ)
    @Query("SELECT sr FROM SwapRequest sr WHERE sr.requester.id = :userId OR sr.requestedSkill.user.id = :userId ORDER BY sr.createdAt DESC")
    List<SwapRequest> findAllRequestsByUserId(@Param("userId") int userId);

    // ค้นหา SwapRequest ที่เกี่ยวข้องกับ SkillOffer (สำหรับการลบ)
    @Query("SELECT sr FROM SwapRequest sr WHERE sr.requestedSkill.id = :skillOfferId OR sr.offeredSkill.id = :skillOfferId")
    List<SwapRequest> findByRequestedSkillIdOrOfferedSkillId(@Param("skillOfferId") int skillOfferId);
}