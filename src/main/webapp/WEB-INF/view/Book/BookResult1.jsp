<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="kopo.poly.dto.BookDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    //bookDTO 받아오기
    BookDTO bDTO = (BookDTO) request.getAttribute("bDTO");
    if(bDTO == null) {
        bDTO = new BookDTO();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%
        if(session.getAttribute("USER_ID") == null) { //로그인이 안되었을때
            //로그인 화면으로 이동
            response.sendRedirect("/user/loginForm1");
        } else {
    %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의예약-상세정보</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/app.css">
    <link rel="shortcut icon" href="/bootstrap/dist/assets/images/favicon.svg" type="image/x-icon">
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
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>나의 예약 상세조회</h3>
                        <p class="text-subtitle text-muted">회원님께서 예약하신 내역 입니다. </p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/index">홈페이지</a></li>
                                <li class="breadcrumb-item active" aria-current="page">예약 상세조회</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <section class="section">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="col"><%=CmmUtil.nvl(bDTO.getCare_nm())%> 의 예약입니다.</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">예약번호 : <%=bDTO.getBook_seq()%></div>
                                </div>
                                <div class="row">
                                    <div class="col">보호소주소 : <%=CmmUtil.nvl(bDTO.getCare_addr())%></div>
                                </div>
                                <div class="row">
                                    <div class="col">동물정보 : <%=CmmUtil.nvl(bDTO.getKind_cd())%></div>
                                </div>
                                <div class="row">
                                    <div class="col">예약자명 : <%=CmmUtil.nvl(bDTO.getUser_name())%></div>
                                </div>
                                <div class="row">
                                    <div class="col">예약자아이디 : <%=CmmUtil.nvl(bDTO.getUser_id())%></div>
                                </div>
                                <div class="row">
                                    <div class="col">예약일시 : <%=CmmUtil.nvl(bDTO.getReg_dt())%></div>
                                    <input type="text" class="col" name="startDate" autocomplete="off" id="newDate" required 안녕>
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                    <button class="btn btn-primary" style="width: 100px;" onclick="chgDate()">날짜변경</button>
                                    <br>
                                    <button class="btn btn-info" style="width: 100px;" onclick="location.href='/deleteBook?bookSeq=<%=bDTO.getBook_seq()%>'">예약취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <footer>
            <div class="footer clearfix mb-0 text-muted">
                <div class="float-start">
                    <p>2021 © Mazer</p>
                </div>
                <div class="float-end">
                    <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">A. Saugi</a></p>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="/bootstrap/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/bootstrap/dist/assets/js/bootstrap.bundle.min.js"></script>

<script src="/bootstrap/dist/assets/js/main.js"></script>
<!-- 데이트피커용 j쿼리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $("#newDate").datepicker();
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true
    });

    function chgDate() {
        let newDate = document.getElementById("newDate").value;
        if(newDate != null) {
            location.href="/updateBook?bookSeq=<%=bDTO.getBook_seq()%>" +"&newDate=" + newDate;
        }
    }
</script>
</body>
</html>
<%
    }
%>