package com.bit.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home() {
		return "/home"; //WEB-INF/layout/main.jsp가 메인페이지로
	}
}
