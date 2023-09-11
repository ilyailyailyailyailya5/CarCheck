package com.example.CarCheck.models.repositories;

import com.example.CarCheck.models.Part;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PartRepository extends JpaRepository<Part, Long> {
    List<Part> findByTitle(String title);
}
