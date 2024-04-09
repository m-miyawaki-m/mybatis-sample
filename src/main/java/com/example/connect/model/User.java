package com.example.connect.model;

import lombok.Data;

/**
 * ユーザー情報を格納するデータ
 *
 */
@Data
public class User {

	/** ID */
	private int userId;
	/** 氏名 */
	private String name;
	/** 年齢 */
	private int age;
}