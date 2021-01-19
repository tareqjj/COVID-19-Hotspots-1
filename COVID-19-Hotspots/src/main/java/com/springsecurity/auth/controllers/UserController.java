package com.springsecurity.auth.controllers;

import com.springsecurity.auth.models.User;
import com.springsecurity.auth.services.UserService;
import com.springsecurity.auth.validator.UserValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.Date;

@Controller
public class UserController {
    private UserService userService;
    private UserValidator userValidator;

    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }

    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result) {
        userValidator.validate(user, result);
        if (result.hasErrors())
            return "loginRegistration.jsp";
        if (userService.allUsers().isEmpty())
            userService.saveUserWithAdminRole(user);
        else
            userService.saveWithUserRole(user);
        return "redirect:/";
    }

    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, @ModelAttribute("user") User user, Principal principal, Model model) {
        if (error != null)
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        if (logout != null)
            model.addAttribute("logoutMessage", "Logout Successful!");
        return "loginRegistration.jsp";
    }


    @RequestMapping("/")
    public String routing(Principal principal) {
        String username = principal.getName();
        User loggedUser = userService.findByUsername(username);
        userService.updateLastSignIn(loggedUser);
        if (loggedUser.isRoleFlag())
            return "redirect:/admin";
        return "redirect:/dashboard";

    }
    @RequestMapping("/dashboard")
    public String dashboard(Principal principal, Model model) {
        String username = principal.getName();
        User loggedUser = userService.findByUsername(username);
        model.addAttribute("loggedUser", loggedUser);
        return "dashboard.jsp";
    }

    @RequestMapping(value = "/admin")
    public String admin(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("loggedUser", userService.findByUsername(username));
        model.addAttribute("allUsers", userService.allUsers());
        return "admin.jsp";
    }

    @RequestMapping("/destroy/{user_id}")
    public String destroy(@PathVariable("user_id") Long user_id) {
        userService.deleteUserById(user_id);
        return "redirect:/admin";
    }

    @RequestMapping("makeAdmin/{user_id}")
    public String makeAdmin(@PathVariable("user_id") Long user_id) {
        User user = userService.findUserById(user_id);
        userService.updateUserWithAdminRole(user);
        return "redirect:/admin";
    }
}
