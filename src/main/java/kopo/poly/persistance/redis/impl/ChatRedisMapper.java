package kopo.poly.persistance.redis.impl;

import kopo.poly.dto.ChatMessageDTO;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.TimeUnit;

@Slf4j
@Component("ChatRedisMapper")
public class ChatRedisMapper implements IChatRedisMapper {

    public final RedisTemplate<String, Object> redisDB;

    public ChatRedisMapper(RedisTemplate<String, Object> redisDB) {
        this.redisDB = redisDB;
    }



    @Override
    public void saveRedisStringJSON(ChatMessageDTO cDTO) throws Exception {

        log.info(this.getClass().getName() + ".saveRedisString Start");


        String roomKey = CmmUtil.nvl(cDTO.getRoomId());

        redisDB.setKeySerializer(new StringRedisSerializer());

        redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(ChatMessageDTO.class));

        redisDB.opsForList().rightPush(roomKey, cDTO);

        redisDB.expire(roomKey, 30, TimeUnit.DAYS);

        log.info(this.getClass().getName() + ".saveRedisStringJSON End!");

    }

    @Override
    public List<ChatMessageDTO> getChat(ChatMessageDTO cDTO) throws Exception {

        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".getChat Start!");

        // Redis에서 가져온 결과 저장할 객체
        List<ChatMessageDTO> rList = null;

        // 대화방 키 정보
        String roomKey = CmmUtil.nvl(cDTO.getRoomId());
        log.info("roomKey : " + roomKey);

        redisDB.setKeySerializer(new StringRedisSerializer()); // String 타입
        redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(ChatMessageDTO.class)); // JSON 타입
        if (redisDB.hasKey(roomKey)) {

            // 저장된 전체 레코드 가져오기
            rList = (List) redisDB.opsForList().range(roomKey, 0, -1);

        }

        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".getChat End!");

        return rList;
    }


}