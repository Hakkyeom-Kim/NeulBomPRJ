<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    session.getAttribute("USER_ID"); //예약하기 버튼 클릭 시 예약한 고객의 id, name을 받아옴
    session.getAttribute("USER_NAME");

%>
<%
    String JSON = (String) request.getAttribute("JSON");
    JSONParser parser = new JSONParser();
    Object obj = parser.parse(JSON);
    JSONObject jsonObj = (JSONObject) obj;
    String noticeNo = (String) jsonObj.get("noticeNo"); //공고번호
    String kindCd = (String) jsonObj.get("kindCd"); // 품종
    String colorCd = (String) jsonObj.get("colorCd"); //색상
    String sexCd = (String) jsonObj.get("sexCd"); // 성별
    String age = (String) jsonObj.get("age"); // 나이
    String weight = (String) jsonObj.get("weight"); // 몸무게
    String happenPlace = (String) jsonObj.get("happenPlace"); // 발견장소
    String happenDt = (String) jsonObj.get("happenDt"); // 접수일시
    String neuterYn = (String) jsonObj.get("neuterYn"); // 중성화 여부
    String specialMark = (String) jsonObj.get("specialMark"); //특징
    String noticeComment = (String) jsonObj.get("noticeComment"); //특이사항
    String orgNm = (String) jsonObj.get("orgNm"); //관활기관
    String processState = (String) jsonObj.get("processState"); // 상태
    String careNm = (String) jsonObj.get("careNm"); // 보호센터 이름
    String careAddr = (String) jsonObj.get("careAddr"); // 보호주소
    String chargeNm = (String) jsonObj.get("chargeNm"); // 담당자
    String officetel = (String) jsonObj.get("officetel"); // 담당자 연락처
    String filename = (String) jsonObj.get("filename"); // 동물 사진


    %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세조회</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/app.css">
    <link rel="stylesheet" href="/bootstrap/dist/assets/css/pages/auth.css">
    <style>
        #animalInfo > * {
            /*border-style: solid;*/
            /*border-width: medium;*/
            /*border-color: #2d499d;*/
        }

    </style>
</head>

<body>
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
    </div>
</div>

<div class="row">
    <div class="col-4">
        <div>
            <div id="animalInfo">
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>공고번호</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=noticeNo%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>품종</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=kindCd%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>색상</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=colorCd%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>성별</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=sexCd%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>나이/체중</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=age%><%=weight%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>발견장소</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=happenPlace%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>접수일시</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=happenDt%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>중성화</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=neuterYn%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>특징</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=specialMark%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>특이사항</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=noticeComment%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>관활기관</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=orgNm%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>상태</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=processState%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>보호센터</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8" id="careNms" value="set"><%=careNm%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>보호장소 주소</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%= careAddr%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>담당자</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=chargeNm%></div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-3"><h6>담당자 연락처</h6></div>
                    <div class="col-1">:</div>
                    <div class="col-8"><%=officetel%></div>
                </div>
                <hr/>
            </div>
        </div>
    </div>

    <div class="col-4">
        <div class="card">
            <div class="card-header">
                <h4>상세정보</h4>
                <p>조회하신 동물의 상세 정보입니다. 입양을 원하시는 경우 지금 바로 담당자에게 채팅을 남겨보세요!</p>
            </div>
            <div class="card-body">
                <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="<%=filename%>" class="d-block w-100" alt="...">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%--지도--%>
    <br>
    <div class="col-4">
        <div class="card">
            <div class="card-header">
                <h4>보호소 위치</h4>
                <p>해당동물의 현재 보호중인 위치 입니다.</p>
            </div>
            <div class="card-body">
                <div id="" class="carousel slide" data-bs-ride="carousel">
                    <p style="margin-top:-12px">
                        <em class="link">
                            <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">

                            </a>
                        </em>
                    </p>
                    <div id="map" style="width:100%;height:350px;"></div>

                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac74ed10e7aff62f9c741f98df6042e9&libraries=services"></script>
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                level: 3 // 지도의 확대 레벨
                            };

                        // 지도를 생성합니다
                        var map = new kakao.maps.Map(mapContainer, mapOption);

                        // 주소-좌표 변환 객체를 생성합니다
                        var geocoder = new kakao.maps.services.Geocoder();

                        // 보호장소 주소로 좌표를 검색합니다
                        geocoder.addressSearch('<%=careAddr%>', function(result, status) {

                            // 정상적으로 검색이 완료됐으면
                            if (status === kakao.maps.services.Status.OK) {

                                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                                // 결과값으로 받은 위치를 마커로 표시합니다
                                var marker = new kakao.maps.Marker({
                                    map: map,
                                    position: coords
                                });

                                // 인포윈도우로 보호장소명을 뜨웁니다
                                var infowindow = new kakao.maps.InfoWindow({
                                    content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=careNm%></div>'
                                });
                                infowindow.open(map, marker);

                                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                map.setCenter(coords);
                            }
                        });
                    </script>
                </div>

            </div>
        </div>
    </div>
    <div id="layoutAuthentication_footer">
    </div>
    <form action="/getUserInfo" method="post">
        <input type="hidden" value="<%=careNm%>" name="CARE_NM">
        <input type="hidden" value="<%=careAddr%>" name="CARE_ADDR">
        <input type="hidden" value="<%=kindCd%>" name="KIND_CD">
        <input type="hidden" value="<%=session.getAttribute("USER_ID")%>" name="USER_ID">

        <button type="submit" class="btn btn-success">예약하기</button>
        <button type="button" class="btn btn-sm btn-primary button_color" onclick="gochat()">담당자와 채팅하기</button>
        <button type="button" onclick="location.href='animalsearch'" class="btn btn-secondary">
            이전 페이지
        </button>
    </form>

</div>
<script>
    function gochat() {
        var careNm = "<%=careNm%>";
        console.log(careNm);
        location.href="/chat/room?careNm=" + careNm;
    }
</script>

</body>

</html>