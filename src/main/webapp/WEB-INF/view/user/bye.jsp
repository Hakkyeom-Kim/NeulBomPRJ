<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="seo & digital marketing">
    <meta name="keywords" content="marketing,digital marketing,creative, agency, startup,promodise,onepage, clean, modern,seo,business, company">
    <meta name="author" content="Themefisher.com">

    <title>Promodise - seo and digital marketing solution </title>
    <!-- bootstrap.min css -->
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.css">
    <!-- Icofont Css -->
    <link rel="stylesheet" href="plugins/fontawesome/css/all.css">
    <!-- animate.css -->
    <link rel="stylesheet" href="plugins/animate-css/animate.css">
    <!-- Icofont -->
    <link rel="stylesheet" href="plugins/icofont/icofont.css">

    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="css/style.css">


</head>


<body data-spy="scroll" data-target=".fixed-top">

<!--MAIN HEADER AREA END -->
<!--MAIN BANNER AREA START -->
<div class="page-banner-area page-contact" id="page-banner">
    <div class="overlay dark-overlay"></div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 m-auto text-center col-sm-12 col-md-12">
                <div class="banner-content content-padding">
                    <h1 class="text-white">I'm here</h1>
                    <p>I'm here는 전국 유기동물들의 가족을 만들어주는 사이트 입니다.</p>
                    <p>서비스 이용을 위해 회원가입을 해주세요.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--MAIN HEADER AREA END -->

<!--  FOOTER AREA START  -->
<section id="footer" class="section-padding">
    <!--여기서부터 회원가입 css-->
    <div class="container-fluid px-4">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원가입</h3></div>
                    <div class="card-body">
                        <form name="f" method="post" action="/user/insertUserInfo" onsubmit="return doRegUserCheck(this);">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3"> <!--name="user_id"만 추가하기-->
                                        <input class="form-control" id="inputEmail" name="user_id" type="text" placeholder="아이디를 입력해주세요." />
                                        <label for="inputEmail">아이디</label>
                                    </div>
                                </div>

                            </div>

                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputname" name="user_name" type="text" placeholder="이름을 입력해주세요" />
                                <label for="inputEmail">이름</label>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <input class="form-control" id="inputPassword" name="password" type="password" placeholder="비밀번호를 입력해주세요." />
                                        <label for="inputPassword">비밀번호</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <input class="form-control" id="inputPasswordConfirm" name="password2" type="password" placeholder="비밀번호를 한번 더 입력해 주세요." />
                                        <label for="inputPasswordConfirm">비밀번호 확인</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputemail" name="email" type="email" placeholder="이메일을 입력해주세요" />
                                <label for="inputEmail">이메일</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputaddr1" name="addr1" type="text" placeholder="주소를 입력해 주세요" />
                                <label for="inputEmail">주소</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputaddr2" name="addr2" type="text" placeholder="상세주소를 입력해 주세요" />
                                <label for="inputEmail">상세주소</label>
                            </div>
                            <div class="mt-4 mb-0">
                                <div class="d-grid"><input type="submit" class="btn btn-primary btn-block" value="회원가입">회원가입하기</input></div>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center py-3">
                        <div class="small"><a href="hello">아이디가 있으신가요? 로그인 하러가기</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--  FOOTER AREA END  -->


<!--
Essential Scripts
=====================================-->


<!-- Main jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4.3.1 -->
<script src="plugins/bootstrap/js/popper.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Woow animtaion -->
<script src="plugins/counterup/wow.min.js"></script>
<script src="plugins/counterup/jquery.easing.1.3.js"></script>
<!-- Counterup -->
<script src="plugins/counterup/jquery.waypoints.js"></script>
<script src="plugins/counterup/jquery.counterup.min.js"></script>

<!-- Google Map -->
<script src="plugins/google-map/gmap3.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>
<!-- Contact Form -->
<script src="plugins/jquery/contact.js"></script>
<script src="js/custom.js"></script>

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
</body>
</html>