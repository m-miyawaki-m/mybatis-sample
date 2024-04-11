package com.example.connect.dto;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

import com.example.connect.model.Message;

@Data
public class MessagesDTO {
    private List<Message> messages;
    private Timestamp serverTimestamp;
}
