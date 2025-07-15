package com.job.tracker.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.tracker.entity.JobApplication;
import com.job.tracker.repo.JobApplicationRepo;
import com.job.tracker.service.JobApplicationService;
@Service
public class JobApplicationServiceImpl implements JobApplicationService {

    @Autowired
    private JobApplicationRepo jobRepo;

    @Override
    public List<JobApplication> getAllApplicationsByUser(Long userId) {
        return jobRepo.findByUserId(userId);
    }

    @Override
    public JobApplication saveApplication(JobApplication app) {
        return jobRepo.save(app);
    }
    
    @Override
    public List<JobApplication> getAllByUsername(String username) {
        return jobRepo.findByUserUsername(username);
    }
    
    @Override
    public JobApplication getById(Long id) {
        return jobRepo.findById(id).orElse(null);
    }

    @Override
    public void deleteById(Long id) {
        jobRepo.deleteById(id);
    }
        
    
}