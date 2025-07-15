package com.job.tracker.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.job.tracker.entity.Users;

public interface UserRepo extends JpaRepository<Users,Long>{

    Optional<Users> findByUsername(String username); // ✅ remove static

    Optional<Users> findByEmail(String email);
}
