package kopo.poly.controller;

import kopo.poly.Chat.ChatRoomRepository;
import kopo.poly.dto.ChatMessageDTO;
import kopo.poly.service.IChatRedisService;
import kopo.poly.service.IMailService;
import kopo.poly.util.EncryptUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/chat")
@Log4j2
public class RoomController {

    private final ChatRoomRepository repository;

    @Resource(name = "ChatRedisService")
    private IChatRedisService chatRedisService;

    /**
     *
     * login할때 session 담는 변수들 :
     * session.setAttribute("USER_ID", rDTO.getUser_id());
     * session.setAttribute("USER_TYPE", rDTO.getUser_type());
     * session.setAttribute("USER_NAME", rDTO.getUser_name());
     *
     * 사용자 -> USER_ID : 아이디, TYPE : 0, userName : 사용자이름
     * 관리자 -> userId : 아이디, TYPE : 1, userName : 보호소명
     *
     * 채팅방 생성 -> 사용자가 동물상세정보 페이지에서 채팅하기 버튼을 누름
     * -> /chat/room으로 보호소명 전달(get) -> repository에서 "사용자아이디_보호소명"으로 된 채팅방 있는지 검사
     * -> 없으면 만들기
     * finally 사용자아이디_보호소명을 model에 담아서 페이지 리턴
     * 채팅 페이지에서 위의 방이름이 redisKey로 저장된 채팅내역 불러오기
     *
     * 채팅방 조회 -> /chat/rooms 로 이동 -> session에 저장된 userTYPE 이 1이면 -> 관리자(보호소직원)
     * -> 채팅방 이름이 USERNAME(보호소명)으로 끝나는 채팅방 검색 -> return 채팅방리스트
     *
     * session에 저장된 userTYPE 이 0이면 -> 일반사용자
     * -> 채팅방 이름이 userId로 시작하는 채팅방 검색 -> return 채팅방 리스트
     *
     * websocket부분
     * 접속 버튼 누르면 stomp 접속
     *
     * 전달 메세지 : roomId(방이름), sender(보내는사람이름), message(보내는메세지)
     *
     * 접속 끊기 누르면 stomp 접속 해제 -> repository에서 채팅방 삭제(redis에는 채팅로그 존재)
     *
     *
     *
     *
     */

    //채팅방 목록 조회
    @GetMapping(value = "/rooms")
    public String rooms(ModelMap model, HttpSession session) throws Exception {

        log.info("# All Chat Rooms");

        int user_type = (int) session.getAttribute("USER_TYPE");
        if(user_type == 1) {
            model.addAttribute("list", repository.findRoomsByAdmin((String) session.getAttribute("USER_NAME")));
        } else {
            model.addAttribute("list", repository.findRoomsByUser((String) session.getAttribute("USER_ID")));
        }

        return "Chat/rooms";
    }

    //채팅방 조회
    @GetMapping("/room")
    public String getRoom(ModelMap model, HttpSession session, HttpServletRequest request) throws Exception {
        log.info("controller.getRoom start");
        int user_type = (int) session.getAttribute("USER_TYPE");
        if(user_type == 1) { //관리자면 어차피 채팅목록에서 선택해서 들어왔을거니까 바로 roomId 모델에 담아서 리턴

            String roomId = request.getParameter("roomId");
            log.info("입장하는 방 아이디 : " + roomId);

            model.addAttribute("roomId", roomId);
        } else {
            String userId = (String) session.getAttribute("USER_ID");
            //고객이 animalDetail에서 들어왔을 때
            String adminName = request.getParameter("careNm");
            if(adminName != null) { //animaldetail에서 들어온경우
                String roomId = userId + "_" + adminName;

                log.info("# get Chat Room, roomID : " + roomId);
                if(repository.findRoomById(roomId) == null) { //방이 없으면
                    repository.createChatRoomDTO(roomId);
                }
                model.addAttribute("roomId", roomId);  // 방아이디를 만들어서 JSP에 쏴줌

            } else { //유저가 채팅목록에서 들어온 경우
                String roomId = request.getParameter("roomId"); //방 아이디가 목록에 있으므로 그대로 JSP 전송
                model.addAttribute("roomId", roomId);

            }
        }

        return "/Chat/room";
    }

    @GetMapping("getChatList")
    @ResponseBody
    public List<ChatMessageDTO> getChatList(HttpServletRequest request) throws Exception {
        log.info("# getChatList start");
        String roomId = request.getParameter("roomId");
        ChatMessageDTO cDTO = new ChatMessageDTO();
        cDTO.setRoomId(roomId);
        List<ChatMessageDTO> rList = chatRedisService.getChat(cDTO);
        if(rList == null) {
            rList = new ArrayList<>();
        }
        return rList;
    }
}