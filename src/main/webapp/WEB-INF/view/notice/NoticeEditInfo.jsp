<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.NoticeDTO" %>
<%
	NoticeDTO rDTO = (NoticeDTO)request.getAttribute("rDTO");

//공지글 정보를 못불러왔다면, 객체 생성
	if (rDTO==null){
		rDTO = new NoticeDTO();

	}

	int access = 1; //(작성자 : 2 / 다른 사용자: 1)

	if (CmmUtil.nvl((String)session.getAttribute("USER_ID")).equals(
			CmmUtil.nvl(rDTO.getUser_id()))){
		access = 2;
	}
%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>자유게시판 조회</title>
	<script type="text/javascript">

		//작성자 여부체크
		function doOnload(){

			if ("<%=access%>"=="1"){
				alert("작성자만 수정할 수 있습니다.");
				location.href="/notice/NoticeList";

			}
		}

		//전송시 유효성 체크
		function doSubmit(f){
			if(f.title.value == ""){
				alert("제목을 입력하시기 바랍니다.");
				f.title.focus();
				return false;
			}

			if(calBytes(f.title.value) > 200){
				alert("최대 200Bytes까지 입력 가능합니다.");
				f.title.focus();
				return false;
			}

			var noticeCheck = false; //체크 여부 확인 변수
			for(var i=0;i<f.noticeYn.length;i++){
				if (f.noticeYn[i].checked){
					noticeCheck = true;
				}
			}

			if(noticeCheck==false){
				alert("공지글 여부를 선택하시기 바랍니다.");
				f.noticeYn[0].focus();
				return false;
			}

			if(f.contents.value == ""){
				alert("내용을 입력하시기 바랍니다.");
				f.contents.focus();
				return false;
			}

			if(calBytes(f.contents.value) > 4000){
				alert("최대 4000Bytes까지 입력 가능합니다.");
				f.contents.focus();
				return false;
			}


		}

		//글자 길이 바이트 단위로 체크하기(바이트값 전달)
		function calBytes(str){

			var tcount = 0;
			var tmpStr = new String(str);
			var strCnt = tmpStr.length;

			var onechar;
			for (i=0;i<strCnt;i++){
				onechar = tmpStr.charAt(i);

				if (escape(onechar).length > 4){
					tcount += 2;
				}else{
					tcount += 1;
				}
			}

			return tcount;
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
					<h3>나의 글 수정하기</h3>
				</div>
				<div class="card-body">
					<form name="f" method="post" action="/notice/NoticeUpdate" onsubmit="return doSubmit(this);">
						<input type="hidden" name="nSeq" value="<%=CmmUtil.nvl(request.getParameter("nSeq")) %>" />
						<div class="card-body" style="text-align: center">
							<div class="row btn-light">
								<div class="col-2" align="center"><h5>제목</h5></div>
								<div class="col-2"><input type="text" name="title" maxlength="100"
														  value="<%=CmmUtil.nvl(rDTO.getTitle()) %>" style="width: 450px"/>
								</div>
							</div>

							<div class="row">
								<div class="col-2" align="center"><h5>content</h5></div>
								<div class="col-2"  height="300px" valign="top">
													<textarea
															name="contents" style="width: 550px; height: 400px"
													><%=CmmUtil.nvl(rDTO.getContents()) %></textarea>
								</div>
							</div>

							<div class="row">
								<div class="col" align="center" colspan="2">
									<input type="submit" value="수정" />
									<input type="reset" value="다시 작성" />
								</div>
							</div>
						</div>
					</form>

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
<script src="/bootstrap/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/bootstrap/dist/assets/js/bootstrap.bundle.min.js"></script>

<script src="/bootstrap/dist/assets/vendors/apexcharts/apexcharts.js"></script>
<script src="/bootstrap/dist/assets/js/pages/dashboard.js"></script>

<script src="/bootstrap/dist/assets/js/main.js"></script>
</body>

</html>