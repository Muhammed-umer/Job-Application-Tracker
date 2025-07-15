package com.job.tracker.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.job.tracker.entity.JobApplication;

public interface JobApplicationRepo extends JpaRepository<JobApplication,Long>{

	List<JobApplication> findByUserId(Long userId);
	List<JobApplication> findByUserUsername(String username);

	// 🔍 Get filtered applications (e.g., only "Interview Scheduled")
	List<JobApplication> findByUserIdAndStatus(Long userId, String status);
}
