package com.example.connect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.example.connect.mapper.MessageMapper;
import com.example.connect.model.Message;

import java.util.List;

@Controller
public class MessageController {

	@Autowired
	private MessageMapper messageMapper;

	@GetMapping("/messages")
	public ModelAndView listAll() {
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("messages", messageMapper.selectAllMessages());
		return mav;
	}

	@PostMapping("/update-cmtFlg")
	@ResponseBody
	public ResponseEntity<String> updateCmtFlg(@RequestBody List<Message> updates) {
	    updates.forEach(update -> {
	        messageMapper.updateCmtFlg(update.getId(), update.getCmtFlg());
	    });
	    return ResponseEntity.ok().body("{\"message\": \"CmtFlg updated successfully\"}");
	}
}