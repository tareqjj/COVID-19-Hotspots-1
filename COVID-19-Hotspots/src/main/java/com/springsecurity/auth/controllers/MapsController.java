package com.springsecurity.auth.controllers;


import com.springsecurity.auth.models.Location;
import com.springsecurity.auth.models.Test;
import com.springsecurity.auth.models.User;
import com.springsecurity.auth.services.MapsService;
import com.springsecurity.auth.services.TestService;
import com.springsecurity.auth.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.security.Principal;
import java.util.List;

@Controller
public class MapsController {
    private final MapsService mapsService;
    private final TestService testService;
    private final UserService userService;

    public MapsController(MapsService mapsService, TestService testService, UserService userService) {
        this.mapsService = mapsService;
        this.testService = testService;
        this.userService = userService;
    }

//    @RequestMapping("/heatMap")
//    public String heatMap(Model model){
//        List<Test> tests = testService.activePoints();
//        model.addAttribute("tests", tests);
////        System.out.println(tests);
//        return "maps/Maps.jsp";
//    }

    @RequestMapping("/inputMap")
    public String inputMap(){
        return "maps/InputMap.jsp";
    }

    @RequestMapping("/addTest")
    public String add(@RequestParam("locations[]") List<Double[]> locations, @RequestParam("id") Long id){
        Test test = new Test("Submitted");
        testService.creatTest(test);
        for (Double[] location : locations) {
            Location newLocation = new Location(location[0], location[1]);
            mapsService.createLocations(newLocation, id, test);
        }
        return "redirect:/home";
    }
    @RequestMapping("/home")
    public String home(Principal principal, Model model){
        if (principal != null) {
            String username = principal.getName();
            User loggedUser = userService.findByUsername(username);
            model.addAttribute("loggedUser", loggedUser);
        }
        List<Test> tests = testService.activePoints();
        model.addAttribute("tests", tests);
//        System.out.println(tests);
        return "home.jsp";
    }
}
