package dev.takitake.demo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TeaController {
	@RequestMapping("/tea")
	public String hello() {
		return "Tea!!";
	}
}
