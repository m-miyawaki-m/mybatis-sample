package com.example.connect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.connect.dto.MessagesDTO;
import com.example.connect.mapper.MessageMapper;
import com.example.connect.model.Message;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.sql.Timestamp;
import java.util.List;

@Controller
public class MessageController {

	@Autowired
	private MessageMapper messageMapper;

	@GetMapping("/messages")
	public ModelAndView init(@RequestParam(value = "id", required = false)Long messageId) throws JsonProcessingException {
        ModelAndView mav = new ModelAndView("messages");
        mav.addObject("messageId",messageId);
        return mav;
	}
	
    @GetMapping("/rest/messages")
    @ResponseBody
    public ResponseEntity<MessagesDTO> listAllMessagesForRest(@RequestParam(value = "id", required = false) Long messageId) {
        List<Message> messages = messageMapper.selectMessagesById(messageId);

        MessagesDTO messagesDTO = new MessagesDTO();
        messagesDTO.setMessages(messages);
        messagesDTO.setServerTimestamp(new Timestamp(System.currentTimeMillis()));

        return ResponseEntity.ok(messagesDTO);
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