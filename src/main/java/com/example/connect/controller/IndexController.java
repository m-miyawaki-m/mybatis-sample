package com.example.connect.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.connect.dto.MessagesDTO;
import com.example.connect.mapper.MessageMapper;
import com.example.connect.model.Message;

@Controller
public class IndexController {

	@Autowired
	private MessageMapper messageMapper;
	
    @GetMapping("/index")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("index"); // index.htmlテンプレートを指定
        return mav;
    }
    
    @GetMapping("/index/rest")
    @ResponseBody
    public ResponseEntity<MessagesDTO> listForRest() {
        List<Message> messages = messageMapper.selectUnitMessages();

        MessagesDTO messagesDTO = new MessagesDTO();
        messagesDTO.setMessages(messages);
        messagesDTO.setServerTimestamp(new Timestamp(System.currentTimeMillis()));

        return ResponseEntity.ok(messagesDTO);
    }
    
}