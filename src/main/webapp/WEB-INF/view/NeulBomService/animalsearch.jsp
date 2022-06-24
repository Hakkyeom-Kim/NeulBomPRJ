<%@ page import="kopo.poly.dto.SidoDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kopo.poly.dto.SigunguDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<SidoDTO> pList = new ArrayList<>();
    List<SigunguDTO> rList = new ArrayList<>();

    pList = (List<SidoDTO>) request.getAttribute("SidoDTOList");
    rList = (List<SigunguDTO>) request.getAttribute("SigunguDTOList");

    if(pList == null) {
        pList = new ArrayList<>();
    }

    if(rList == null) {
        rList = new ArrayList<>();
    }

%>
<html lang="en"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select - Mazer Admin Dashboard</title>

    <!-- Include Choices CSS -->
    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/choices.js/choices.min.css">

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
                        <h3>동물정보 검색</h3>
                        <p class="text-subtitle text-muted">거주하시는 지역의 보호동물을 조회하세요!</p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Select</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <section class="bootstrap-select">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Search! </h4>
                            </div>

                            <!--여기서 부터 샐랙트-->
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <h6>조회하실 시도를 선택하세요</h6>
                                            <fieldset class="form-group">
                                                <select class="form-select" id="basicSelect" onchange="chgSido()">
                                                    <option value="">전체</option>
                                                    <%
                                                        for(SidoDTO pDTO : pList) {
                                                            String sidoName = pDTO.getSIDO_NAME();
                                                            String sidoCode = pDTO.getSIDO_CODE();
                                                    %>
                                                    <option value="<%=sidoCode%>"><%=sidoName%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <h6>조회하실 시군구를 선택하세요</h6>
                                            <fieldset class="form-group">
                                                <select class="form-select" id="disabledSelect">
                                                    <option value="">전체</option>
                                                </select>
                                            </fieldset>
                                            <fieldset class="form-group">
                                                <div class="col-md-6 mb-4">
                                                    <h6>관심 있으신 동물 종류를 선택하세요.</h6>
                                                <select class="form-select" id="animalSelect">
                                                    <option value="">전체</option>
                                                    <option value="417000">개</option>
                                                    <option value="422400">고양이</option>
                                                    <option value="429900">기타동물</option>
                                                </select>
                                                    <br>
                                                <button type="button" onclick="sendCode(1)" class="btn btn-primary">조회하기</button>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Bootstrap Select end -->

            <!-- Input Group Select start -->
            <section class="input-group-select">
                <div class="row" id="animalCardList">
                </div>

            </section>
            <!-- Bootstrap Select end -->

        </div>

        <footer>
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-primary">
                    <li class="page-item"><a class="page-link" href="#">Prev</a></li>
                    <li class="page-item active" name="pageNum"><a class="page-link" onclick="pageChange(1)">1</a></li>
                    <li class="page-item" name="pageNum"><a class="page-link" onclick="pageChange(2)">2</a></li>
                    <li class="page-item" name="pageNum"><a class="page-link" onclick="pageChange(3)">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
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

<!-- Include Choices JavaScript -->
<script src="/bootstrap/dist/assets/vendors/choices.js/choices.min.js"></script>

<script src="/bootstrap/dist/assets/js/main.js"></script>

<!-- j쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>

    let pageNum = 1;
    function pageChange(pageNumber) {
        pageNum = Number(pageNumber);
        console.log(pageNum);
        let pageLen = $("li[name=pageNum]").length;
        //배열에 값 주입
        for(let i=1; i<=pageLen; i++){
            if(i == pageNum) {
                console.log("같은 번호 : " + i);
                $("li[name=pageNum]").eq(i - 1).addClass('active');
            } else {
                console.log("다른 번호 : " + i);
                $("li[name=pageNum]").eq(i - 1).removeClass('active');
            }
        }
        sendCode(pageNum);
    }
    function sendCode(pageNumber) {
        let rSidoCode = document.getElementById("basicSelect").value;
        let rSigunguCode = document.getElementById("disabledSelect").value;
        let rAnimalCode = document.getElementById("animalSelect").value;
        console.log(rSidoCode);
        console.log(rSigunguCode);
        console.log(rAnimalCode);
        console.log(pageNumber);
        $("#animalCardList").empty();
        $.ajax({ // ajax 기본형태
            //////////////////// send(가는것)
            url : "/animalsearch",
            type : "get",
            dataType: "JSON",
            //	data : "t1=XYZ&t2=자차카", // 넘겨주는 데이터
            data : {
                sidoCode : rSidoCode,
                sigunguCode : rSigunguCode,
                animalCode : rAnimalCode,
                "pageNo" : pageNumber
            }, //위와동일

            //////////////////// recv
            success : function(data){ // status, xhr 생략가능
                console.log(data);
                let jsonObj = JSON.stringify(data);
                let myObject = JSON.parse(jsonObj);
                // let itemList = JSON.parse(myObject.item);
                for(let i = 0; i < myObject.item.length; i++) {
                    let item = myObject.item[i];
                    let itemJSON = JSON.stringify(item);
                    console.log(itemJSON);
                    let filename = item.filename; //동물사진
                    let noticeNo = item.noticeNo; //공고번호
                    let noticeEdt = item.noticeEdt; //등록일자
                    let kindCd = item.kindCd; //품종
                    let sexCd = item.sexCd; // 성별
                    let careNm = item.careNm; //보호장소
                    let processState = item.processState; //위치

                    let href = "animalInfo?filename=" + filename + "&noticeNo=" + noticeNo;
                    $("#animalCardList").append($(
                         `<div class="col-3" id="animalInfo">
                                <div class="card" style="width: 18rem;">
                                    <img src="\${filename}" style="width:287px; height:150px;"class="card-img-top" alt="...">
                                        <form method="post" action="/NeulBomService/animaldetail" class="card-body">
                                          <!--  <h5 class="card-title">Card title</h5> -->
                                            <p class="card-text">\${noticeNo}</p>
                                            <p class="card-text">\${noticeEdt}</p>
                                            <p class="card-text">\${kindCd}</p>
                                            <p class="card-text">\${sexCd}</p>
                                            <p class="card-text">\${careNm}</p>
                                            <p class="card-text">\${processState}</p>
                                            <input type="text" name="animalInfoJSON" value='\${itemJSON}' hidden />



                                            <button type="submit" class="btn btn-primary">상세조회</button>
                                        </form>
                                </div>
                            </div>`
                    ));



                }



                // let itemList = data.items.item;
                // console.log(itemList);
                // console.log(typeof(itemList));

                //	alert("success"); // 성공하면  success
                //	alert(data);
                //	alert(status);  // 상태를 반환한다 (success)
                //	alert(xhr.responseText); // html문서 형태 전체를 출력한다.
            },
            error : function(xhr, status, error) { // (파라미터 생략가능)
                alert("문제가 발생하였습니다. 다시 시도해 주세요.");
            },
            complete : function(xhr, status) { // (파라미터 생략가능)
                // alert("해당 지역의 보호동물을 조회 하였습니다.");
            }
            ////////////////////
        });
    }
</script>
<script>
    function chgSido() {
        let sigungu = document.getElementById("disabledSelect");
        let sidoCode = document.getElementById("basicSelect").value;
        while(sigungu.hasChildNodes()) {
            sigungu.removeChild(sigungu.firstChild);
        }
        let optionAll = document.createElement('option');
        optionAll.setAttribute('value', "");
        optionAll.innerText = "전체";
        sigungu.appendChild(optionAll);
        <%
            for(SigunguDTO sDTO : rList) {
                String sidoCode = sDTO.getUpr_Cd();
                String sigunguCode = sDTO.getOrg_Cd();
                String sigunguName = sDTO.getOrgdown_Nm();
        %>
            if(sidoCode == "<%= sidoCode%>") {
                let sigunguOption = document.createElement('option');
                sigunguOption.setAttribute('value', '<%=sigunguCode%>');
                sigunguOption.innerText = "<%=sigunguName%>";
                sigungu.appendChild(sigunguOption);
            }

        <%
            }
        %>

    }
</script>


</body>
</html>