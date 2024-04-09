package com.example.connect.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.example.connect.model.User;


@Mapper
public interface UserMapper {

	/**
	 * 全ユーザーを取得
	 * 
	 * @return 全ユーザーの情報
	 * 
	 */
	List<User> selectAllUsers();
}