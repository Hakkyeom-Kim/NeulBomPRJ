<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>늘봄 고객센터</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/app.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/pages/auth.css">
</head>

<body>
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <article>
            <div class="container" role="main">
            <br>
                <h2 align="center">문의 게시글 작성</h2>
                <div id="google_translate_element"></div>
                <form name="form" id="form" role="form" method="post"
                      action="/customerCenter/csCenterMails">
                    <div class="mb-3">
                        <label for="title">제목</label> <input type="text"
                                                             class="form-control" name="title" id="title"
                                                             placeholder="제목을 입력해 주세요">
                    </div>
                    <div class="mb-3">
                        <label for="reg_id">주의사항</label> <input type="text"
                                                                class="form-control" id="reg_id"
                                                                placeholder="양식을 꼭 작성해주세요" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="content">내용</label>
                        <textarea class="form-control" rows="7" name="contents" id="content">
Name :
H/P :
E-mail :
Content :
</textarea>
                    </div>
                    <button type="submit" class="btn btn-sm btn-primary button_color" id="btnSave">문의하기</button>
                    <button type="button" onclick="location.href='/index'" class="btn btn-sm btn-primary button_color">이전 페이지</button>
                </form>
            </div>
        </article>
    </div>
    <div id="layoutAuthentication_footer">
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2022</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>

</div>
</body>

</html>
</html>
