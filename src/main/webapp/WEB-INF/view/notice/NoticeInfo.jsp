<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.dto.NoticeDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    NoticeDTO rDTO = (NoticeDTO) request.getAttribute("rDTO");

//공지글 정보를 못불러왔다면, 객체 생성
    if (rDTO == null) {
        rDTO = new NoticeDTO();

    }

    String user_id = CmmUtil.nvl((String) session.getAttribute("USER_ID"));

//본인이 작성한 글만 수정 가능하도록 하기(1:작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
    int edit = 1;

//로그인 안했다면....
    if (user_id.equals("")) {
        edit = 3;

//본인이 작성한 글이면 2가 되도록 변경
    } else if (user_id.equals(CmmUtil.nvl(rDTO.getUser_id()))) {
        edit = 2;

    }

    System.out.println("user_id : " + CmmUtil.nvl(rDTO.getUser_id()));
    System.out.println("user_id : " + user_id);

%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 조회</title>
    <script type="text/javascript">

        //수정하기
        function doEdit() {
            if ("<%=edit%>" == 2) {
                location.href = "/notice/NoticeEditInfo?nSeq=<%=CmmUtil.nvl(rDTO.getNotice_seq())%>";

            } else if ("<%=edit%>" == 3) {
                alert("로그인 하시길 바랍니다.");

            } else {
                alert("본인이 작성한 글만 수정 가능합니다.");

            }
        }


        //삭제하기
        function doDelete() {
            if ("<%=edit%>" == 2) {
                if (confirm("작성한 글을 삭제하시겠습니까?")) {
                    location.href = "/notice/NoticeDelete?nSeq=<%=CmmUtil.nvl(rDTO.getNotice_seq())%>";

                }

            } else if ("<%=edit%>" == 3) {
                alert("로그인 하시길 바랍니다.");

            } else {
                alert("본인이 작성한 글만 삭제 가능합니다.");

            }
        }

        //목록으로 이동
        function doList() {
            location.href = "/notice/NoticeList";

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
        <!-- 여기서부터 페이지 소스 붙여넣기 -->
        <div class="page-heading">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    <h3>게시판</h3>
                </div>
                <div class="card-body" style="text-align: center">


                    <div class="row">
                        <div class="col-2" align="center"><h5>제목</h5></div>
                        <div class="col-2"><%=CmmUtil.nvl(rDTO.getTitle())%>
                        </div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-2" align="center"><h5>작성일</h5></div>
                        <div class="col-2"><%=CmmUtil.nvl(rDTO.getReg_dt())%>
                            <br>
                            <br>
                            <br>
                        </div>
                        <br>
                        <div class="col-2" align="center"><h5>조회수</h5></div>
                        <div class="col-2"><%=CmmUtil.nvl(rDTO.getRead_cnt())%>
                        </div>
                        <br>
                    </div>
                    <div class="row">
                        <div class="col-2" align="center"><h5>content</h5></div>
                        <div class="col-10" align="left"  height="300px" valign="top">
                            <%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>") %>
                        </div>
                    </div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <div class="row">

                        <div class="col" align="center" colspan="4">
                            <a href="javascript:doEdit();">[수정]</a>
                            <a href="javascript:doDelete();">[삭제]</a>
                            <a href="javascript:doList();">[목록]</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <!--</div>-->

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