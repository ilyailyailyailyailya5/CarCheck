package com.example.CarCheck;

import com.example.CarCheck.models.Part;
import com.example.CarCheck.models.repositories.PartRepository;
import com.example.CarCheck.models.repositories.UserRepository;
import com.example.CarCheck.services.PartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@Slf4j
class PartServiceTest {
    @Mock
    private PartRepository partRepository;

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private PartService partService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    void listParts() {
        List<Part> parts = new ArrayList<>();
        parts.add(new Part(1L, "Mercedes"));
        parts.add(new Part(2L, "Audi"));
        when(partRepository.findAll()).thenReturn(parts);
        List<Part> result = partService.listParts(null);
        Assertions.assertEquals(parts, result);
    }

    @Test
    void listPartsByTitle() {
        List<Part> parts = new ArrayList<>();
        parts.add(new Part(1L, "Mercedes"));
        when(partRepository.findByTitle("part1")).thenReturn(parts);
        List<Part> result = partService.listParts("part1");
        Assertions.assertEquals(parts, result);
    }
    @Test
    void getPartById() {
        Part part = new Part(1L, "Audi");
        when(partRepository.findById(part.getId())).thenReturn(java.util.Optional.ofNullable(part));
        Part result = partService.getPartById(part.getId());
        Assertions.assertEquals(part, result);
    }
}
