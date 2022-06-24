package kopo.poly.controller;

import kopo.poly.dto.ChatMessageDTO;
import kopo.poly.service.IChatRedisService;
import kopo.poly.service.impl.ChatRedisService;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
@RequiredArgsConstructor
public class StompChatController {

    private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달

    @Resource(name = "ChatRedisService")
    private final IChatRedisService chatRedisService;

    //Client가 SEND할 수 있는 경로
    //stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
    //"/pub/chat/enter"
    @MessageMapping(value = "/chat/enter")
    public void enter(ChatMessageDTO message) throws Exception{
        message.setMessage(message.getWriter() + "님이 채팅방에 참여하였습니다.");

        chatRedisService.saveRedisStringJSON(message);
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }

    @MessageMapping(value = "/chat/exit")
    public void exit(ChatMessageDTO message) throws Exception{
        message.setMessage(message.getWriter() + "님이 채팅방에서 나가셨습니다.");

        chatRedisService.saveRedisStringJSON(message);
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }

    @MessageMapping(value = "/chat/message")
    public void message(ChatMessageDTO message) throws Exception{
        chatRedisService.saveRedisStringJSON(message);
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }
}