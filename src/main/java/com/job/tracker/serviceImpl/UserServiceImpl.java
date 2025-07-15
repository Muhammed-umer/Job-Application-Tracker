package com.job.tracker.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.tracker.entity.Users;
import com.job.tracker.repo.UserRepo;
import com.job.tracker.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
    private UserRepo userRepo;
	
	 public boolean isEmailExists(String email) {
	    return userRepo.findByEmail(email).isPresent();
	 }
	
	 public boolean isUsernameExists(String username) {
	      return userRepo.findByUsername(username).isPresent();
	 }
	 
    @Override
    public Users findByUsername(String username) {
        return userRepo.findByUsername(username).orElse(null);
    }

    @Override
    public Users saveUser(Users user) {
        return userRepo.save(user);
    }
}
