package bit.data.controller;


import bit.data.dto.userdto;
import bit.data.service.userServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class userController {

    @Autowired
    userServiceInter userService;

    public void insert(userdto dto){
        userService.insertUser(dto);
    }

}
//hello2
