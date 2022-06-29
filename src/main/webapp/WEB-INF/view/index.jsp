<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    session.getAttribute("USER_ID"); //세션 강제 적용, 로그인된 상태로 보여주기 위함
%>
<!DOCTYPE html>
<html lang="UTF-8">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>늘봄</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="bootstrap/dist/assets/css/bootstrap.css">

    <link rel="stylesheet" href="bootstrap/dist/assets/vendors/iconly/bold.css">

    <link rel="stylesheet" href="bootstrap/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="bootstrap/dist/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="bootstrap/dist/assets/css/app.css">
    <link rel="shortcut icon" href="bootstrap/dist/assets/images/favicon.svg" type="image/x-icon">
</head>

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

        <div class="page-heading">
            <h3><%=session.getAttribute("USER_ID")%>님, 안녕하세요 :)</h3>
        </div>
        <div class="page-content">
            <div class="card">
                <div class="card-content">
                    <img class="card-img-top img-fluid" src="/bootstrap/dist/assets/images/logo/leon.png" alt="Card image cap" style="height: 20rem">
                    <div class="card-body">
                        <h3 class="card-title">분양 대신 입양 어떠세요?</h3>
                        <p class="card-text">
                            늘봄은 언제나 봄처럼 활기차고 새롭게 살아가라는 뜻을가진 순우리말로,<br>
                            유기 혹은 구조된 동물들을 입양을 원하는 분들과 연결 시켜주는 서비스 입니다.
                            <br> 지금 바로 <%=session.getAttribute("USER_ID")%>님 근처의 유기동물을<br>
                            찾아보시고 채팅을 통해 편리하게 방문 예약을 해보세요!

                        </p>
                        <button type="button" onclick="location.href='/NeulBomService/animalsearch'" class="btn btn-sm btn-primary button_color">동물 찾아보기</button>
                    </div>
                </div>
            </div>

        </div>

        <footer>
            <div class="footer clearfix mb-0 text-muted">
                <div class="float-start">
                    <p>2022 &copy; PolyTechdataAnalysis</p>
                </div>
                <div class="float-end">
                    <p>developed <span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                            href="https://github.com/Hakkyeom-Kim">Hakkyeom</a></p>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="bootstrap/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="bootstrap/dist/assets/js/bootstrap.bundle.min.js"></script>

<script src="bootstrap/dist/assets/vendors/apexcharts/apexcharts.js"></script>
<script src="bootstrap/dist/assets/js/pages/dashboard.js"></script>

<script src="bootstrap/dist/assets/js/main.js"></script>
</body>

</html>