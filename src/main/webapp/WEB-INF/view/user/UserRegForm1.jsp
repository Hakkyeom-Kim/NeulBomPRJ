<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- j쿼리 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <script type="text/javascript">
        //회원가입 정보의 유효성 체크하기
        function doRegUserCheck(f){

            if (f.user_id.value==""){
                alert("아이디를 입력하세요.");
                f.user_id.focus();
                return false;
            }

            if (f.user_name.value==""){
                alert("이름을 입력하세요.");
                f.user_name.focus();
                return false;
            }

            if (f.password.value==""){
                alert("비밀번호를 입력하세요.");
                f.password.focus();
                return false;
            }

            if (f.password2.value==""){
                alert("비밀번호확인을 입력하세요.");
                f.password2.focus();
                return false;
            }

            if (f.email.value==""){
                alert("이메일을 입력하세요.");
                f.email.focus();
                return false;
            }

            if (f.addr1.value==""){
                alert("주소를 입력하세요.");
                f.addr1.focus();
                return false;
            }

            if (f.addr2.value==""){
                alert("상세주소를 입력하세요.");
                f.addr2.focus();
                return false;
            }
        }
    </script>
    <script>
        //아이디 중복 검사
        function checkId() {
            let id = $('#inputFirstName').val();
            $.ajax({
                url:'/user/idCheck',
                type:'get',
                contentType:"application/json",
                data:{
                    'user_id': id
                },
                dataType: 'text',
                success:function (cnt) {
                    if (cnt != 1) {
                        $('#id_input_re_1').css("display","block");
                        $('#id_input_re_2').css("display","none");
                    }else {
                        $('#id_input_re_1').css("display","none");
                        $('#id_input_re_2').css("display","block");
                    }
                    console.log("성공");
                },
                error:function (){
                    alert("에러입니다")
                }
            });
        };
    </script>
    <style>
        #id_input_re_1{color: green; display: none;}
        #id_input_re_2{color: red; display: none;}
    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>늘봄 회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/app.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/pages/auth.css">
</head>

<body>
<form name="f" method="post" action="/user/insertUserInfo" onsubmit="return doRegUserCheck(this);">
<div id="auth">

    <div class="row h-100">
        <div class="col-lg-5 col-12">
            <div id="auth-left">
                <div class="auth-logo">
                    <a href="/user/Login"><img src="/bootstrap/dist/assets/images/logo/logo.png" alt="Logo" srcset="" style="width: 100%; height: 100%;"></a>
                </div>
                <h3 class="auth-title">늘봄 회원가입</h3>
                <p class="auth-subtitle mb-5">서비스 사용을 위해 회원가입을 해주세요</p>
                <p class="auth-subtitle mb-5">보호소, 병원 담당자는 이름을 소속기관 명으로 기입해주세요.</p>

                <form action="index.html">
                    <div class="form-group position-relative has-icon-left mb-4">
                        <input type="text" id="inputFirstName" class="form-control form-control-xl" name="user_id" placeholder="아이디를 입력해 주세요." required onchange="checkId()" />
                        <div class="form-control-icon">
                            <i class="bi bi-person-badge"></i>

                        </div>
                    </div>
                    <div class="row mb-3">
                        <div id="id_input_re_1" >사용 가능한 아이디 입니다.</div>
                        <div id="id_input_re_2" >아이디가 이미 존재합니다.</div>
                    </div>

                    <div class="form-group position-relative has-icon-left mb-4">
                        <input type="text" class="form-control form-control-xl" name="user_name" placeholder="이름을 입력해 주세요.">
                        <div class="form-control-icon">
                            <i class="bi bi-arrow-up-right-circle"></i>
                        </div>
                    </div>

                    <div class="form-group position-relative has-icon-left mb-4">
                        <input type="password" class="form-control form-control-xl" name="password" placeholder="비밀번호를 입력해주세요.">
                        <div class="form-control-icon">
                            <i class="bi bi-shield-lock"></i>
                        </div>
                    </div>

                    <div class="form-group position-relative has-icon-left mb-4">
                        <input type="password" class="form-control form-control-xl" name="password2" placeholder="비밀번호를 다시 한번 입력해주세요.">
                        <div class="form-control-icon">
                            <i class="bi bi-shield-lock"></i>
                        </div>
                    </div>

                    <div class="form-group position-relative has-icon-left mb-4">
                        <input type="email" class="form-control form-control-xl" name="email" placeholder="사용하실 이메일을 입력해주세요.">
                        <div class="form-control-icon">
                            <i class="bi bi-envelope-open"></i>
                        </div>
                    </div>

                    <div class="form-group position-relative has-icon-left mb-4">
                        <input type="text" class="form-control form-control-xl" name="addr1" placeholder="주소를 입력해주세요.">
                        <div class="form-control-icon">
                            <i class="bi bi-house"></i>
                        </div>
                    </div>

                    <div class="form-group position-relative has-icon-left mb-4">
                        <input type="text" class="form-control form-control-xl" name="addr2" placeholder="상세주소를 입력해주세요.">
                        <div class="form-control-icon">
                            <i class="bi bi-house"></i>
                        </div>
                    </div>
                    <div class="form-check form-switch">
                        <input class="form-check-input" name="user_type" type="checkbox" id="flexSwitchCheckDefault" value="true" onclick="btnChecked()">
                        <label class="form-check-label" for="flexSwitchCheckDefault">동물병원 담당자 이시면 체크해 주세요.</label>
                    </div>
                    <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">회원가입하기</button>
                </form>
                <div class="text-center mt-5 text-lg fs-4">
                    <p class='text-gray-600'>아이디가 있으신가요? <a href="/user/Login"
                                                                         class="font-bold">Log
                        in</a>.</p>
                </div>
            </div>
        </div>
        <div class="col-lg-7 d-none d-lg-block">
            <div id="auth-right">

            </div>
        </div>
    </div>

</div>
    <script>
        function btnChecked() {
            let checkBox = document.getElementById("flexSwitchCheckDefault");
            let TF = checkBox.checked;
            if(TF) {
                checkBox.value = true;
            } else {
                checkBox.value = false;
            }
            console.log(checkBox.value);
        }
    </script>
</form>
</body>

</html>