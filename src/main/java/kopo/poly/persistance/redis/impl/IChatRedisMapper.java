package kopo.poly.persistance.redis.impl;

import kopo.poly.dto.ChatMessageDTO;

import java.util.List;

public interface IChatRedisMapper {

    void saveRedisStringJSON(ChatMessageDTO cDTO) throws Exception;

    List<ChatMessageDTO> getChat(ChatMessageDTO cDTO) throws Exception;
}