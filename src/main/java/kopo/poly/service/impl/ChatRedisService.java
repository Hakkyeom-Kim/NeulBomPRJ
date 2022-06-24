package kopo.poly.service.impl;

import kopo.poly.dto.ChatMessageDTO;
import kopo.poly.persistance.redis.impl.IChatRedisMapper;
import kopo.poly.service.IChatRedisService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service("ChatRedisService")
public class ChatRedisService implements IChatRedisService {

    @Resource(name = "ChatRedisMapper")
    private IChatRedisMapper chatRedisMapper;

    @Override
    public void saveRedisStringJSON(ChatMessageDTO cDTO) throws Exception {
        log.info(this.getClass().getName() + ".saveRedisStringJSON start!");
        chatRedisMapper.saveRedisStringJSON(cDTO);
    }

    @Override
    public List<ChatMessageDTO> getChat(ChatMessageDTO cDTO) throws Exception {

        log.info(this.getClass().getName() + ".getChat Start!");

        return chatRedisMapper.getChat(cDTO);
    }

}