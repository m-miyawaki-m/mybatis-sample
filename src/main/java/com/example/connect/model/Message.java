package com.example.connect.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Message {
    private Long id;
    private Integer cmtFlg;
    private Integer delFlg;
    private String message;
    private Timestamp createdAt;
}