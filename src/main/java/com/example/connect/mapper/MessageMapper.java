package com.example.connect.mapper;

import com.example.connect.model.Message;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MessageMapper {
	List<Message> selectAllMessages();
	
	List<Message> selectUnitMessages();
	
    List<Message> selectMessagesById(@Param("messageId") Long messageId);
	
	void updateCmtFlg(@Param("id") Long id, @Param("cmtFlg") Integer cmtFlg);
}