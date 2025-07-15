package com.job.tracker.service;

import java.util.List;

import com.job.tracker.entity.JobApplication;

public interface JobApplicationService {
	List<JobApplication> getAllApplicationsByUser(Long userId);
    JobApplication saveApplication(JobApplication app);
    List<JobApplication> getAllByUsername(String username);
    JobApplication getById(Long id);
    void deleteById(Long id);
}
