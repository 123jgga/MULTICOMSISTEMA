package com.diseño.MultiCom.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*; 

@RestController
@RequestMapping("/")
@CrossOrigin(origins = "*")
public class infoController {
	@GetMapping("")
	public ResponseEntity<?> info(){
		return new ResponseEntity<String>("Api Rest Multicom, protected data.", HttpStatus.ACCEPTED);
	}
}
