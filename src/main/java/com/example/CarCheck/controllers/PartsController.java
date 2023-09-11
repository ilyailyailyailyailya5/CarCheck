package com.example.CarCheck.controllers;

import com.example.CarCheck.models.Part;
import com.example.CarCheck.models.User;
import com.example.CarCheck.services.PartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class PartsController {
    private final PartService partService;

    @GetMapping("/")
    public String parts(@RequestParam(name = "searchWord",required = false) String title,
                        Principal principal, Model model){
        model.addAttribute("parts", partService.listParts(title));
        model.addAttribute("user", partService.getUserByPrincipal(principal));
        model.addAttribute("searchWord",title);
        return "parts";
    }
    @GetMapping("/part/{id}")
    public String partInfo(@PathVariable Long id, Model model, Principal principal){
        Part part = partService.getPartById(id);
        model.addAttribute("user", partService.getUserByPrincipal(principal));
        model.addAttribute("part", part);
        model.addAttribute("images", part.getImages());
        model.addAttribute("authorPart", part.getUser());
        return "partsinfo";

    }
    @PostMapping("/part/create")
    public String createPart(@RequestParam("file1") MultipartFile file1,
                             @RequestParam("file2") MultipartFile file2,
                             @RequestParam("file3") MultipartFile file3,
                             @RequestParam("file4") MultipartFile file4,
                             @RequestParam("file5") MultipartFile file5,
                             Part part, Principal principal) throws IOException {
        partService.savePart(principal, part, file1,file2,file3, file4, file5);
        return "redirect:/my/parts";
    }
    @PostMapping("/part/delete/{id}")
    public String deletePart(@PathVariable Long id, Principal principal){
        partService.deletePart(id);
        return "redirect:/my/parts";
    }
    @GetMapping("/my/parts")
    public String userParts(Principal principal, Model model){
        User user = partService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("parts", user.getParts());
        return "myparts";
    }

}

