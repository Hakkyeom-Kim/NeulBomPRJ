
package kopo.poly.service;

import kopo.poly.dto.ChatMessageDTO;

import java.util.List;

public interface IChatRedisService {

    void saveRedisStringJSON(ChatMessageDTO cDTO) throws Exception;

    List<ChatMessageDTO> getChat(ChatMessageDTO cDTO) throws Exception;

}