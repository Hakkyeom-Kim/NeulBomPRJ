<%@ page import="kopo.poly.dto.ChatRoomDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kopo.poly.dto.BookDTO" %>
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

    <style>
        @media (min-width: 992px){
            .col-lg-5 {
                width: 100%;
            }
        }
        .card-body{
            max-width: 1272px;
            margin: 0 auto;
            padding: 0;
        }
        .gnb{
            text-align: center;
            padding-right: 0rem;
            padding-left: 0.2rem;
        }
        .text{
            color: #000;
        }
        .buttons{
            margin-bottom: 1rem;
            width: 8rem;
        }

    </style>
</head>

<body>
<div id="">
    <div id="sidebar" class="active">
        <div class="sidebar-wrapper active">
            <div class="sidebar-header">
                <div class="d-flex justify-content-between">
                    <div class="logo">
                        <a href="/index"><img src="/bootstrap/dist/assets/images/logo/logo.png" alt="Logo" srcset="" style="width: 100%; height: 100%;"></a>
                    </div>
                    <div class="toggler">
                        <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                    </div>
                </div>
            </div>
            <!__??????????????? ????????? ???__>
            <div class="sidebar-menu">
                <ul class="menu">
                    <li class="sidebar-title">NeulBom Service</li>

                    <li class="sidebar-item active ">
                        <a href="/NeulBomService/animalsearch" class='sidebar-link'>
                            <i class="bi bi-search"></i>
                            <span>????????????</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="/notice/NoticeList" class='sidebar-link'>
                            <i class="bi bi-card-list"></i>
                            <span>???????????????</span>
                        </a>
                    </li>


                    <li class="sidebar-item  ">
                        <a href="/chat/rooms" class='sidebar-link'>
                            <i class="bi bi-chat-dots"></i>

                            <span>??????</span>
                        </a>
                    </li>




                    <!__?????? ?????????__>
                    <li class="sidebar-title">User Service</li>

                    <li class="sidebar-item  ">
                        <a href="/user/MyPage" class='sidebar-link'>
                            <i class="bi bi-person-fill"></i>
                            <span>???????????????</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="/Book/BookList" class='sidebar-link'>
                            <i class="bi bi-calendar-check"></i>
                            <span>????????????</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="/customerCenter/csCenterMail" class='sidebar-link'>
                            <i class="bi bi-question-circle"></i>
                            <span>????????????</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="/user/Logout" class='sidebar-link'>
                            <i class="bi bi-power"></i>
                            <span>????????????</span>
                        </a>
                    </li>
                </ul>
            </div>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
        </div>
    </div>

    <div class="row h-100">
        <div class="col-lg-5 col-12">

            <div class="container">
                <br>
                <h4>???????????? ?????? ???????????? ????????? ?????????!</h4>
                <h6>?????? ????????? ????????? ???????????? ?????? ???????????? ???????????????.</h6>
                <br>
                <div class="row card-body gnb">
                    <div class="col-4"><h5>?????? ?????????</h5></div>
                    <hr/>


                </div>
                <br>
                <div>
                    <%
                        for(ChatRoomDTO roomDTO : roomList) {
                            String roomId = roomDTO.getRoomId();
                    %>

<%--                        <input type="text" name="book_seq" class="form-control" value="<%= book_seq%>" hidden>--%>
<%--                        <input type="text" name="Carenm" class="form-control" value="<%= Carenm%>" hidden>--%>
<%--                        <input type="text" name="Careaddr" class="form-control" value="<%= Careaddr%>" hidden>--%>
<%--                        <input type="text" name="Kindcd" class="form-control" value="<%= Kindcd%>" hidden>--%>
<%--                        <input type="text" name="user_name" class="form-control" value="<%= user_name%>" hidden>--%>
<%--                        <input type="text" name="user_id" class="form-control" value="<%= user_id%>" hidden>--%>
<%--                        <input type="text" name="reg_dt" class="form-control" value="<%= reg_dt%>" hidden>--%>




                        <%--before--%>
                        <div class="card-body">
                            <div class="card-body contine" style="text-align: center">

                                <div class="row card-body ">
                                    <div class="col-4">
                                        <b><%= roomId%></b>
                                    </div>
                                    <br><br>

<%--                                    <button class="btn btn-secondary buttons" href="/chat/room?roomId=<%=roomId%>">????????????</button>--%>
                                    <button class="btn btn-warning buttons">
                                        <a href="/chat/room?roomId=<%=roomId%>">
                                            ????????????
                                        </a>
                                    </button>
                                </div>

                                <hr>


                                <script src="/bootstrap/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
                                <script src="/bootstrap/dist/assets/js/bootstrap.bundle.min.js"></script>

                                <script src="/bootstrap/dist/assets/vendors/apexcharts/apexcharts.js"></script>
                                <script src="/bootstrap/dist/assets/js/pages/dashboard.js"></script>

                                <script src="/bootstrap/dist/assets/js/main.js"></script>



                            </div>

                        </div>



                    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%
    }
%>
</html>