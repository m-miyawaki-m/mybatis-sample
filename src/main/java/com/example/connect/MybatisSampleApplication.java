package com.example.connect;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.connect.mapper")
public class MybatisSampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(MybatisSampleApplication.class, args);
	}
}