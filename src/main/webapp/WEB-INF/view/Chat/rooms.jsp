<%@ page import="kopo.poly.dto.ChatRoomDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    List<ChatRoomDTO> roomList = (List<ChatRoomDTO>) request.getAttribute("list");
    if(roomList == null) {
        roomList = new ArrayList<>();
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mazer Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/app.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/pages/auth.css">
</head>

<body>
<div id="auth">

    <div class="row h-100">
        <div class="col-lg-5 col-12">


            <div class="container">
                <div>
                    <%
                        for(ChatRoomDTO roomDTO : roomList) {
                            String roomId = roomDTO.getRoomId();
                    %>
                    <li><a href="/chat/room?roomId=<%=roomId%>"><%= roomId%></a></li>
<%--                    <ul th:each="room : ${list}">--%>
<%--                        <li><a th:href="@{/chat/room(roomId=${room.roomId})}">[[${room.name}]]</a></li>--%>
<%--                    </ul>--%>
                    <%
                        }
                    %>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

        </div>
        <div class="col-lg-7 d-none d-lg-block">
            <div id="auth-right">

            </div>
        </div>
    </div>

</div>
</body>

</html>