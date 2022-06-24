<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>자유게시판 글쓰기</title>
	<script type="text/javascript">

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
		<!-- 여기서부터 페이지 소스 붙여넣기 -->
		<div class="page-heading">
			<div class="card mb-4">
				<div class="card-header">
					<h3>게시판 글쓰기</h3>
					<h6>다양한 글을 작성해 보세요!</h6>
					<i class="fas fa-table me-1"></i>

				</div>
				<div class="card-body">
					<form name="f" method="post" action="/notice/NoticeInsert" target= "ifrPrc" onsubmit="return doSubmit(this);">
						<div id="card-body" style="text-align: center">
							<col width="100px" />
							<col width="500px" />
							<div class="row btn-light">
								<div class="col-2" ><h6>제목</h6></div>
								<div class="col-2"><input type="text" name="title" maxlength="100" style="width: 450px" /></div>
							</div>
							<div class="row">
								<div class="col-2" align="center"><h6>공지글 여부</h6></div>
								<div class="col-2">예<input type="radio" name="noticeYn" value="Y" />
									아니오<input type="radio" name="noticeYn" value="N" />
								</div>
							</div>
							<div class="row">
								<div class="col-2" align="center"><h6>내용</h6></div>
									<textarea name="contents" style="width: 600px; height: 400px"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-2"  colspan="2">
									<input type="submit" class=" btn btn-primary" value="등록" />
									<input type="reset" class=" btn btn-secondary" value="다시작성" />
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