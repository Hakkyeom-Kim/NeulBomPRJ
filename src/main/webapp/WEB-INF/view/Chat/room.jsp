<%@ page import="kopo.poly.dto.ChatMessageDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String roomId = (String) request.getAttribute("roomId");
    //roomId = 고객id_보호소명

    //유저명
    String writer = (String) session.getAttribute("USER_NAME");
%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/bootstrap/dist/assets/css/widgets/chat.css">

    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/app.css">
    <link rel="shortcut icon" href="/bootstrap/dist/assets/images/favicon.svg" type="image/x-icon">
    <!-- SockJS -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <!-- j쿼리 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>


    /**
     *  writer : 유저명 (사용자 = 이름, 관리자 = 보호소명)
     *  roomId : 방이름
     *
     */
    const writer = "<%=writer%>";
    const roomId = "<%=roomId%>";

    window.onload = function () {
        $("#outChat").hide();
        //아작스로 redis 채팅 내역 가져오기
        $.ajax({
            url: "getChatList",
            type: 'get',
            data: {
                "roomId": roomId
            },
            contentType: "application/json; charset=utf-8",
            dataType: "JSON",
            success: function(data) {
                for(let i = 0; i < data.length; i++) {
                    let chatOne = data[i];
                    let chatWriter = chatOne.writer;
                    let message = chatOne.message;
                    if (writer == chatWriter) {
                        $("#msgArea").append(`
                        <div class="chat">
                            <div class="chat-body">
                                <div class="chat-message">\${message}</div>
                            </div>
                        </div>
                        `)
                    } else {
                        $("#msgArea").append(`
                        <div class="chat chat-left">
                        <div class="chat-body">
                            <div class="chat-message">\${message}</div>
                        </div>
                    </div>
                        `)
                    }
                }
            },
            error: function(error) {

            }
        });
    }

    let sockJs;
    let stomp;
    //채팅창에서 나갔을 때
    function onClose() {
        stomp.send('/pub/chat/exit', {}, JSON.stringify({"roomId": roomId, "writer": writer}));
        stomp.disconnect();
        $("#outChat").hide();
        $("#inChat").show();
    }

    // 채팅창에 들어왔을 때
    function onOpen() {
        $("#outChat").show();
        $("#inChat").hide();
        sockJs = new SockJS("/stomp/chat");

        //1. SockJS를 내부에 들고있는 stomp를 내어줌
        stomp = Stomp.over(sockJs);

        //2. connection이 맺어지면 실행
        stomp.connect({}, function () {
            console.log("STOMP Connection")
            stomp.send('/pub/chat/enter', {}, JSON.stringify({"roomId": roomId, "writer": writer}));

            //4. subscribe(path, callback)으로 메세지를 받을 수 있음
            stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
                let content = JSON.parse(chat.body);
                let Mwriter = content.writer;
                let message = content.message;
                if (writer === Mwriter) {
                    $("#msgArea").append(`
                        <div class="chat">
                            <div class="chat-body">
                                <div class="chat-message">\${message}</div>
                            </div>
                        </div>
                    `)
                } else {
                    $("#msgArea").append(`
                        <div class="chat chat-left">
                        <div class="chat-body">
                            <div class="chat-message">\${message}</div>
                        </div>
                    </div>
                    `)

                }
            });
        });
    }

    function send(){
        if(document.getElementById("msg").value != '') {
            let msg = document.getElementById("msg");
            //3. send(path, header, message)로 메세지를 보낼 수 있음
            stomp.send('/pub/chat/message', {}, JSON.stringify({"roomId": roomId, "writer": writer, "message": msg.value}));

            msg.value = '';
        }
    }

</script>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mazer Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/bootstrap/dist//bootstrap/dist/assets/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap/dist//bootstrap/dist/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/bootstrap/dist//bootstrap/dist/assets/css/app.css">
    <link rel="stylesheet" href="/bootstrap/dist//bootstrap/dist/assets/css/pages/auth.css">

    <style>
        .container{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, 9%);
        }

    </style>
</head>

<body>
<div style="position: relative">
<div class="col-md-6 container" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, 100%);">
    <button type="button" class="btn btn-primary" id="inChat" onclick="onOpen()">접속하기</button>
    <button type="button" class="btn btn-secondary" id="outChat" onclick="onClose()">접속끊기</button>
    <button type="button" class="btn btn-success" onclick="location.href='/index'">이전페이지</button>
    <div class="card">
        <div class="card-header">
            <div class="media d-flex align-items-center">
                <div class="avatar me-3">
                    <img src="/bootstrap/dist/assets/images/faces/1.jpg" alt="" srcset="">
                    <span class="avatar-status bg-success"></span>
                </div>
                <div class="name flex-grow-1">
                    <h6 class="mb-0">NeulBom Talk</h6>
                    <span class="text-xs">늘봄톡으로 예약일정을 잡아보세요!</span>

                </div>
                <button class="btn btn-sm">
                    <i data-feather="x"></i>
                </button>
            </div>
        </div>
        <div id="chatDiv" class="card-body pt-4 bg-grey" style="overflow: scroll; height: 600px;">
            <div class="chat-content" id="msgArea">
            </div>
        </div>
        <div class="card-footer">
            <div class="message-form d-flex flex-direction-column align-items-center">
                <a href="http://" class="black"><i data-feather="smile"></i></a>
                <div class="d-flex flex-grow-1 ml-4">
                    <input type="text" class="form-control" placeholder="Type your message.." id="msg">
                    <button class="btn btn-outline-secondary input-group-text" type="button" onclick="send()">전송</button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>

</html>