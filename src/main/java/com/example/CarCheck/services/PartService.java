package com.example.CarCheck.services;

import com.example.CarCheck.models.Image;
import com.example.CarCheck.models.Part;
import com.example.CarCheck.models.User;
import com.example.CarCheck.models.repositories.PartRepository;
import com.example.CarCheck.models.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class PartService {
    private final PartRepository partRepository;
    private final UserRepository userRepository;

    public List<Part> listParts(String title){
        if (title != null) return partRepository.findByTitle(title);
        return partRepository.findAll();
    }

    public void savePart(Principal principal, Part part, MultipartFile file1, MultipartFile file2, MultipartFile file3, MultipartFile file4, MultipartFile file5) throws IOException{
        part.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        Image image4;
        Image image5;
        if (file1.getSize() != 0){
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            part.addImageToPart(image1);
        }
        if (file2.getSize() != 0){
            image2 = toImageEntity(file2);
            part.addImageToPart(image2);
        }
        if (file3.getSize() != 0){
            image3 = toImageEntity(file3);
            part.addImageToPart(image3);
        }
        if (file2.getSize() != 0){
            image4 = toImageEntity(file4);
            part.addImageToPart(image4);
        }
        if (file3.getSize() != 0){
            image5 = toImageEntity(file5);
            part.addImageToPart(image5);
        }

        log.info("Saving new Part. Title: {}; Price: {}", part.getTitle(), part.getPrice());
        Part partFromDb = partRepository.save(part);
        partFromDb.setPreviewImageId(partFromDb.getImages().get(0).getId());
        partRepository.save(part);
    }
    public User getUserByPrincipal(Principal principal){
        if (principal == null ) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deletePart(Long id) {
        partRepository.deleteById(id);
    }

    public Part getPartById(Long id) {
        return partRepository.findById(id).orElse(null);
    }
}
