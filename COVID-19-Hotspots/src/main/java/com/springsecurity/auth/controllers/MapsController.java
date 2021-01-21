package com.springsecurity.auth.controllers;


import com.springsecurity.auth.models.Location;
import com.springsecurity.auth.services.MapsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;

@Controller
public class MapsController {
    private final MapsService mapsService;

    public MapsController(MapsService mapsService) {
        this.mapsService = mapsService;
    }

    @RequestMapping("heatMap")
    public String heatMap(Model model){
        List<Location> locations = mapsService.findAllLocations();
//        ArrayList<Double[]> arr = new ArrayList<>();
//        for (Location location: locations) {
//            Double[] locat = new Double[2];
//            locat[0] = location.getLang();
//            locat[1] = location.getLat();
//            arr.add(locat);
//        }
//        System.out.println(arr);
        model.addAttribute("arr", locations);
        return "Maps.jsp";
    }

    @RequestMapping("/inputMap")
    public String inputMap(){
        return "InputMap.jsp";
    }
    @RequestMapping("/addTest")
    public String add(@RequestParam("locations[]") List<Double[]> locations, @RequestParam("id") Long id){
        System.out.println("***************************************");
        System.out.println(locations);
        System.out.println(id);
        for (Double[] location : locations) {
            Location newLocation = new Location(location[0], location[1]) ;
            mapsService.createLocations(newLocation, id);
        }
        return "InputMap.jsp";
    }
}
