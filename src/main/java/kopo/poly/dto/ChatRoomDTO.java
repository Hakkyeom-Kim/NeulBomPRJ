package kopo.poly.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.socket.WebSocketSession;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
public class ChatRoomDTO {

    private String roomId;
    private Set<WebSocketSession> sessions = new HashSet<>();
    //WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션

    public static ChatRoomDTO create(String roomId){
        ChatRoomDTO room = new ChatRoomDTO();

        room.roomId = roomId;
        return room;
    }
}