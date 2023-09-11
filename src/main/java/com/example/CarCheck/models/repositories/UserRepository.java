package com.example.CarCheck.models.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.CarCheck.models.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}

