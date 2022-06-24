<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kopo.poly.dto.NoticeDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    session.getAttribute("USER_ID"); //세션 강제 적용, 로그인된 상태로 보여주기 위함

    List<NoticeDTO> rList = (List<NoticeDTO>) request.getAttribute("rList");

//게시판 조회 결과 보여주기
    if (rList == null) {
        rList = new ArrayList<NoticeDTO>();

    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>공지 리스트</title>
    <script type="text/javascript">

        //상세보기 이동
        function doDetail(seq) {
            location.href = "/notice/NoticeInfo?nSeq=" + seq;
        }
        function noticeED() { //게시판 글쓰기
            location.href = "/notice/NoticeReg"
        }

    </script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/iconly/bold.css">

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

<h2>Neulbom Cafe</h2>
<%=session.getAttribute("USER_ID")%>님 다른 늘봄 회원들과 다양한 정보를 공유해 보세요!
<hr/>
<br/>

<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-table me-1"></i>
        <h3>게시판</h3> <input type="button" class="btn btn-primary" onclick="noticeED()" value="글쓰기" />
    </div>
    <div class="card-body">
        <div class="card-body" style="text-align: center">
            <div class="row">
                <div class="col-2"><h5>순번</h5></div>
                <div class="col-4"><h5>제목</h5></div>
                <div class="col-2"><h5>조회수</h5></div>
                <div class="col-2"><h5>등록자</h5></div>
                <div class="col-2"><h5>등록일</h5></div>
                <hr/>
            </div>
                <%
                                for (int i = 0; i < rList.size(); i++) {
                                    NoticeDTO rDTO = rList.get(i);

                                    if (rDTO == null) {
                                        rDTO = new NoticeDTO();
                                    }

                            %>
            <div class="row">
                <div class="col-2">
                    <%
                        //공지글이라면, [공지]표시
                        if (CmmUtil.nvl(rDTO.getNotice_yn()).equals("Y")) {
                            out.print("<b>[공지]</b>");

                            //공지글이 아니라면, 글번호 보여주기
                        } else {
                            out.print(CmmUtil.nvl(rDTO.getNotice_seq()));

                        }
                    %></div>
                <div class="col-4">
                    <a href="javascript:doDetail('<%=CmmUtil.nvl(rDTO.getNotice_seq())%>');">
                        <%=CmmUtil.nvl(rDTO.getTitle()) %>
                    </a>
                </div>

                <div class="col-2"><%=CmmUtil.nvl(rDTO.getRead_cnt()) %>
                </div>
                <div class="col-2"><%=CmmUtil.nvl(rDTO.getUser_id()) %>
                </div>
                <div class="col-2"><%=CmmUtil.nvl(rDTO.getReg_dt()) %>
                </div>
                <hr/>
            </div>
                <%
                    }
                %>

            <script src="/bootstrap/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="/bootstrap/dist/assets/js/bootstrap.bundle.min.js"></script>

            <script src="/bootstrap/dist/assets/vendors/apexcharts/apexcharts.js"></script>
            <script src="/bootstrap/dist/assets/js/pages/dashboard.js"></script>

            <script src="/bootstrap/dist/assets/js/main.js"></script>
</body>

</html>