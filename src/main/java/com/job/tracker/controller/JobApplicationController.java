package com.job.tracker.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.job.tracker.entity.JobApplication;
import com.job.tracker.entity.Users;
import com.job.tracker.repo.UserRepo;
import com.job.tracker.service.JobApplicationService;
import com.job.tracker.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class JobApplicationController {

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private UserService userService;

    @Autowired
    private JobApplicationService jobApplicationService; // ✅ MISSING FIELD

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new Users());
        return "login";
    }

    @GetMapping("/")
    public String redirectToLogin() {
        return "redirect:/login";
    }

    @GetMapping("/signup")
    public String showSignupForm(Model model) {
        model.addAttribute("user", new Users());
        return "signup";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String username, 
                               @RequestParam String password,
                               Model model,
                               HttpSession session) {
        Optional<Users> dbUser = userRepo.findByUsername(username);

        if (dbUser.isPresent() && dbUser.get().getPassword().equals(password)) {
        	session.setAttribute("username", username); 
            return "redirect:/home?user=" + username;
        }

        model.addAttribute("error", "Invalid credentials!");
        return "login";
    }

    @PostMapping("/signup")
    public String processSignup(@RequestParam String email,
                                @RequestParam String username,
                                @RequestParam String password,	                        
                                Model model) {

        if (userService.isEmailExists(email)) {
            model.addAttribute("error", "User with this Email already exists!");
            return "signup";
        }

        if (userService.isUsernameExists(username)) {
            model.addAttribute("error", "Username already taken! please try again with new username");
            return "signup";
        }

        Users newUser = new Users();
        newUser.setEmail(email);
        newUser.setUsername(username);
        newUser.setPassword(password);
        userService.saveUser(newUser);

        model.addAttribute("message", "Signup successful! Please log in.");
        return "redirect:/login";
    }

    @GetMapping("/home")
    public String homePage(HttpSession session, Model model) {
       String username = (String) session.getAttribute("username");
        
        if (username == null) {
            return "redirect:/login";
        }

        model.addAttribute("username", username);
        model.addAttribute("applications", jobApplicationService.getAllByUsername(username));
        return "home"; 
    }
    @PostMapping("/save")
    public String saveApplication(@ModelAttribute JobApplication app,
                                  HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        Optional<Users> user = userRepo.findByUsername(username);
        user.ifPresent(app::setUser);

        jobApplicationService.saveApplication(app);
        return "redirect:/home";
    }
    @GetMapping("/add")
    public String showAddForm(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/login";
        }
        model.addAttribute("jobApplication", new JobApplication());
        return "add"; // will render add.jsp
    }
    
    @GetMapping("/edit")
    public String showEditForm(@RequestParam Long id, Model model) {
        JobApplication app = jobApplicationService.getById(id);
        model.addAttribute("application", app);
        return "edit"; // edit.jsp page
    }
    
    @GetMapping("/delete")
    public String deleteApplication(@RequestParam Long id, HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        jobApplicationService.deleteById(id);
        return "redirect:/home";
    }
    
    @PostMapping("/update")
    public String updateApplication(@ModelAttribute JobApplication app,
                                    HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        Optional<Users> user = userRepo.findByUsername(username);
        user.ifPresent(app::setUser);

        jobApplicationService.saveApplication(app);
        return "redirect:/home";
    }
}
