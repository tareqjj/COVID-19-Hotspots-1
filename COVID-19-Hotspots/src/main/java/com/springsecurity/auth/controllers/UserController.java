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
    private final UserService userService;
    private final UserValidator userValidator;

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
            userService.saveUser(user, "ROLE_SUPER");
        else
            userService.saveUser(user, "ROLE_USER");
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
        if (loggedUser.getRoles().containsAll(userService.findRoleByName("ROLE_SUPER")))
            return "redirect:/super";
        return "redirect:/dashboard";

    }
    @RequestMapping("/dashboard")
    public String userDashboard(Principal principal, Model model) {
        String username = principal.getName();
        User loggedUser = userService.findByUsername(username);
        model.addAttribute("loggedUser", loggedUser);
        return "dashboard.jsp";
    }

    @RequestMapping(value = "/super")
    public String superDashboard(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("loggedUser", userService.findByUsername(username));
        model.addAttribute("allUsers", userService.allUsers());
        return "admin.jsp";
    }

    @RequestMapping("/admin")
    public String adminDashboard(Principal principal, Model model) {
        String username = principal.getName();
        User loggedUser = userService.findByUsername(username);
        model.addAttribute("loggedUser", loggedUser);
        return "dashboard.jsp";
    }

    @RequestMapping("/tester")
    public String testerDashboard(Principal principal, Model model) {
        String username = principal.getName();
        User loggedUser = userService.findByUsername(username);
        model.addAttribute("loggedUser", loggedUser);
        return "dashboard.jsp";
    }

    @RequestMapping("/destroy/{user_id}")
    public String destroy(@PathVariable("user_id") Long user_id) {
        userService.deleteUserById(user_id);
        return "redirect:/super";
    }

    @PostMapping("/super/updateRole/{user_id}")
    public String updateRole(@PathVariable("user_id") Long user_id, @RequestParam("roleAdmin") boolean roleAdmin, @RequestParam("roleTester") boolean roleTester, @RequestParam("roleUser") boolean roleUser) {
        User user = userService.findUserById(user_id);
        if (roleUser) {
            if (!user.getRoles().containsAll(userService.findRoleByName("ROLE_USER")))
                userService.addUserRole(user, "ROLE_USER");
        }
        else
            userService.removeUserRole(user, "ROLE_USER");

        if (roleTester) {
            if (!user.getRoles().containsAll(userService.findRoleByName("ROLE_TESTER")))
                userService.addUserRole(user, "ROLE_TESTER");
        }
        else
            userService.removeUserRole(user, "ROLE_TESTER");

        if (roleAdmin) {
            if (!user.getRoles().containsAll(userService.findRoleByName("ROLE_ADMIN")))
                userService.addUserRole(user, "ROLE_ADMIN");
        }
        else
            userService.removeUserRole(user, "ROLE_ADMIN");

        return "redirect:/super";
    }

}
