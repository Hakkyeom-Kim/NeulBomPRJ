package kopo.poly.Chat;

import kopo.poly.dto.ChatRoomDTO;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.util.*;

@Repository
public class ChatRoomRepository {

    private Map<String, ChatRoomDTO> chatRoomDTOMap;

    @PostConstruct
    private void init(){
        chatRoomDTOMap = new LinkedHashMap<>();
    }

    public List<ChatRoomDTO> findAllRooms(){
        //채팅방 생성 순서 최근 순으로 반환
        List<ChatRoomDTO> result = new ArrayList<>(chatRoomDTOMap.values());

        Collections.reverse(result);

        return result;
    }


    public List<ChatRoomDTO> findRoomsByUser(String userId){
        List<ChatRoomDTO> allRooms = new ArrayList<>(chatRoomDTOMap.values());
        List<ChatRoomDTO> result = new ArrayList<>();
        for(int i = 0; i < allRooms.size(); i++) {
            ChatRoomDTO cDTO = allRooms.get(i);
            if(cDTO.getRoomId().split("_")[0].equals(userId)) {
                result.add(cDTO);
                cDTO = null;
            }
        }
        //채팅방 생성 순서 최근 순으로 반환
        Collections.reverse(result);

        return result;
    }

    public List<ChatRoomDTO> findRoomsByAdmin(String userName){

        List<ChatRoomDTO> allRooms = new ArrayList<>(chatRoomDTOMap.values());
        List<ChatRoomDTO> result = new ArrayList<>();
        for(int i = 0; i < allRooms.size(); i++) {
            ChatRoomDTO cDTO = allRooms.get(i);
            if(cDTO.getRoomId().split("_")[1].equals(userName)) {
                result.add(cDTO);
                cDTO = null;
            }
        }
        //채팅방 생성 순서 최근 순으로 반환
        Collections.reverse(result);
        return result;
    }

    public ChatRoomDTO findRoomById(String id) {
        return chatRoomDTOMap.get(id);
    }

    public ChatRoomDTO createChatRoomDTO(String roomId){
        ChatRoomDTO room = ChatRoomDTO.create(roomId);
        chatRoomDTOMap.put(room.getRoomId(), room);

        return room;
    }
}