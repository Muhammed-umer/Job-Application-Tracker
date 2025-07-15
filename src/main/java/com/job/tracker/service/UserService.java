package com.job.tracker.service;

import com.job.tracker.entity.Users;

public interface UserService {
	Users findByUsername(String username);
    Users saveUser(Users user);
    boolean isEmailExists(String email);
    boolean isUsernameExists(String username);
}
