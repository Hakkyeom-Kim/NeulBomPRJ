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
<!DOCTYPE html>
<html lang="UTF-8">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
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
        <link rel="stylesheet" href="css/style.css">
</head>

<body>
<div id="app">
    <div id="sidebar" class="active">
        <div class="sidebar-wrapper active">
            <div class="sidebar-header">
                <div class="d-flex justify-content-between">
                    <div class="logo">
                        <a href="/index"><img src="bootstrap/dist/assets/images/logo/logo.png" alt="Logo" srcset="" style="width: 100%; height: 100%;"></a>
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
                        <a href="NeulBomService/animalsearch" class='sidebar-link'>
                            <i class="bi bi-grid-fill"></i>
                            <span>동물조회</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="table-datatable.html" class='sidebar-link'>
                            <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                            <span>보호장소 검색</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="notice/NoticeList" class='sidebar-link'>
                            <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                            <span>자유게시판</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="table-datatable.html" class='sidebar-link'>
                            <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                            <span>정보공유게시판</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="table-datatable.html" class='sidebar-link'>
                            <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                            <span>채팅</span>
                        </a>
                    </li>




                    <!__유저 서비스__>
                    <li class="sidebar-title">User Service</li>

                    <li class="sidebar-item  ">
                        <a href="table-datatable.html" class='sidebar-link'>
                            <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                            <span>마이페이지</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="table-datatable.html" class='sidebar-link'>
                            <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                            <span>고객센터</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="table-datatable.html" class='sidebar-link'>
                            <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                            <span>예약내역</span>
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
    <!-- 여기서부터 페이지 소스 붙여넣기 -->
        <div class="page-heading">
            <h3><%=session.getAttribute("USER_ID")%>님, 안녕하세요;)</h3>
        </div>
        <!--<div class="page-content"-->
            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>자유게시판</h3>
                            <p class="text-subtitle text-muted">다양한 정보를 회원들과 공유해 보세요!</p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">DataTable</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                    <div class="card">
                        <div class="card-header">
                            <input type="button" onclick="noticeED()" value="글쓰기" />
                        </div>
                    </div>

                            <div class="row" id="table-striped">
                                <div class="col-12">
                                    <div class="card">
                                    <div class="card-content">


                                <div class="table-responsive">
                                    <div class="striped mb-0" id="table1">
                                        <div class="row btn-light"><!--로우 -->
                                            <div class="col-2">순번</div> <!--컬럼 -->
                                            <div class="col-4">제목</div>
                                            <div class="col-2">조회수</div>
                                            <div class="col-2">등록자</div>
                                            <div class="col-2">등록일</div>
                                        </div>
                                        <%
                                            for(NoticeDTO nDTO : rList) {
                                        %>
                                        <div class="row btn-light">
                                            <div class="col-2"><%= nDTO.getNotice_seq()%></div>
                                            <div class="col-4"><a href="javascript:doDetail('<%=CmmUtil.nvl(nDTO.getNotice_seq())%>');"><%= nDTO.getTitle()%></a></div>
                                            <div class="col-2"><%= nDTO.getRead_cnt()%></div>
                                            <div class="col-2"><%= nDTO.getReg_id()%></div>
                                            <div class="col-2"><%= nDTO.getReg_dt()%></div>
                                        </div>
                                        <%
                                            }
                                        %>
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
<script src="/bootstrap/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/bootstrap/dist/assets/js/bootstrap.bundle.min.js"></script>

<script src="/bootstrap/dist/assets/vendors/apexcharts/apexcharts.js"></script>
<script src="/bootstrap/dist/assets/js/pages/dashboard.js"></script>

<script src="/bootstrap/dist/assets/js/main.js"></script>
</body>

</html>