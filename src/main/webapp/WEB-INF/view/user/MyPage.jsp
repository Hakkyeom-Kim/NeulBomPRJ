<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    UserInfoDTO pDTO = (UserInfoDTO) request.getAttribute("UserInfoDTO");

    if (pDTO == null) {
        pDTO = new UserInfoDTO();
    }
%>


<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/app.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/pages/auth.css">
</head>

<body>
<body>
<div id="app">
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
            <!__여기서부터 사이드 바__>
            <div class="sidebar-menu">
                <ul class="menu">
                    <li class="sidebar-title">NeulBom Service</li>

                    <li class="sidebar-item active ">
                        <a href="/NeulBomService/animalsearch" class='sidebar-link'>
                            <i class="bi bi-search"></i>
                            <span>동물조회</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="/notice/NoticeList" class='sidebar-link'>
                            <i class="bi bi-card-list"></i>
                            <span>자유게시판</span>
                        </a>
                    </li>


                    <li class="sidebar-item  ">
                        <a href="/chat/rooms" class='sidebar-link'>
                            <i class="bi bi-chat-dots"></i>

                            <span>채팅</span>
                        </a>
                    </li>




                    <!__유저 서비스__>
                    <li class="sidebar-title">User Service</li>

                    <li class="sidebar-item  ">
                        <a href="/user/MyPage" class='sidebar-link'>
                            <i class="bi bi-person-fill"></i>
                            <span>마이페이지</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="/Book/BookList" class='sidebar-link'>
                            <i class="bi bi-calendar-check"></i>
                            <span>나의예약</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="/customerCenter/csCenterMail" class='sidebar-link'>
                            <i class="bi bi-question-circle"></i>
                            <span>고객센터</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="/user/Logout" class='sidebar-link'>
                            <i class="bi bi-power"></i>
                            <span>로그아웃</span>
                        </a>
                    </li>
                </ul>
            </div>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
        </div>
    </div>
    <div id="main">
        <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none">
                <i class="bi bi-justify fs-3"></i>
            </a>
        </header>
        <%--사이드바 끝!!--%>
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">마이페이지</h3></div>
                            <div class="card-header">
                            </div>
                            <div class="card-body">
                                <div class="text-center small mb-3 text-muted">회원님의 계정정보를 확인해 보세요.</div>
                                <form name="f" method="post" accept-charset="UTF-8" action="/Updatemypage">
                                    <h6 class="text-left font-weight-light my-4">회원아이디 : <%=pDTO.getUser_id()%></h6>
                                    <hr/>
                                    <h6 class="text-left font-weight-light my-4">회원명 : <%=pDTO.getUser_name()%></h6>
                                    <hr/>
                                    <h6 class="text-left font-weight-light my-4">회원이메일 : <%=pDTO.getEmail()%></h6>
                                    <hr/>

                                    <div class="form-floating mb-3">
                                        <h6>회원명 변경하기</h6>
                                        <input class="form-control" name="user_name" type="text" name="user_name" placeholder="변경하실 회원명을 입력해 주세요." />
                                    </div>
                                            <button type="submit" class="btn btn-sm btn-primary button_color">회원정보 변경하기</button>
                                    <button type="button" class="btn btn-sm btn-danger button_color" onclick="deleteUser()">회원탈퇴</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</div>

<script src="bootstrap/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="bootstrap/dist/assets/js/bootstrap.bundle.min.js"></script>

<script src="bootstrap/dist/assets/vendors/apexcharts/apexcharts.js"></script>
<script src="bootstrap/dist/assets/js/pages/dashboard.js"></script>

<script src="bootstrap/dist/assets/js/main.js"></script>

<script>
    function deleteUser() {
        if(confirm("정말로 탈퇴하시겠습니까?")) {
            location.href = "/deleteUser";
        }
    }
</script>
</body>


</html>
