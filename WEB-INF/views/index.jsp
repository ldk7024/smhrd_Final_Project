<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="/muscle" />
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>cam-recording</title>
 <link href="/muscle/resources/css/styles.css" rel="stylesheet">
 <link href="/muscle/resources/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
/* * {
   margin: 0;
   padding: 0;
} */

html, body {
   width: 100%;
   height: 100%;
}

.wrapper1 {
   height: 70%;
   overflow: hidden;
   display: flex;
   flex-direction: row;
   justify-content: center;
   align-items: center;
}
.wrapper2 {
   overflow: hidden;
   display: flex;
   flex-direction: row;
   justify-content: center;
   align-items: center;
}

.video-container {
   display: flex;
   width: 550px;
   padding: 1rem;
   justify-content: space-around;
}
.video-container2 {
   display: flex;
   width: 200px;
   padding: 1rem;
   justify-content: space-evenly;
}

.video-item>h2 {
   text-align: center;
}

.video-item>video {
   width: 300px;
   height: 200px;
   border: 1px solid #333;
}

button{
    background-color:#e8ede9;
    border-radius:28px;
    border:1px solid #eff7f0;
    display:inline-block;
    cursor:pointer;
    color:#0d0c0d;
    font-family:Arial;
    font-size:16px;
    padding:11px 20px;
    text-decoration:none;
    text-shadow:0px 1px 0px #2f6627;
   

}
button:hover {
   background-color:#f1f7ed;
}
button:active {
   position:relative;
   top:1px;
}
</style>
<script type="text/javascript">
    <!-- 스크립트 부분 -->
    function logout() {
       $.ajax({
          url : "${cpath}/logout.do",
          type:"get",
          success : function(){
             alert("로그아웃되었습니다.")
             location.href="${cpath}/main.do";
          },
          error : function(){alert("error");}
       });
    }
    </script>
</head>
<body>
<!-- Navigation -->
   <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light"
      aria-label="Main navigation">
      <div class="container">

         <!-- Image Logo -->
         <a class="navbar logo-image" href="main.do"><img
            src="${pageContext.request.contextPath}/resources/images/logogeunjo.PNG"
            alt="alternative"></a>

         <!-- Text Logo - Use this if you don't have a graphic logo -->
         <!-- <a class="navbar-brand logo-text" href="index.html">Yavin</a> -->

         <button class="navbar-toggler p-0 border-0" type="button"
            id="navbarSideCollapse" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>

         <div class="navbar-collapse offcanvas-collapse"
            id="navbarsExampleDefault">
            <ul class="navbar-nav ms-auto navbar-nav-scroll">
               <li class="nav-item"><a class="nav-link active"
                  aria-current="page" href="main.do">메인</a></li>
                  
               <c:if test="${userVO == null}">
                  <li class="nav-item"><a class="nav-link" href="main.do"  id="clickButton1">수어 음성번역 서비스</a></li>
               </c:if>
               
               <c:if test="${userVO != null}">
                  <li class="nav-item"><a class="nav-link" href="index.do">수어음성번역 서비스</a></li>
               </c:if>
               
               <li class="nav-item"><a class="nav-link" href="musclevideo.do">수어 사전</a></li>
            
            <c:if test="${userVO == null}">
                  <li class="nav-item"><a class="nav-link" href="main.do" id="clickButton">자유게시판</a></li>
               </c:if>
               <c:if test="${userVO != null}">
                  <li class="nav-item"><a class="nav-link" href="muscleBoardList.do" >자유게시판</a></li>
               </c:if>
            </ul>
            <c:if test="${userVO == null}">
               <span class="nav-item"> <a class="btn-outline-sm"
                  href="gologin.do">로그인</a>
               </span>
            </c:if>

            <c:if test="${userVO != null }">
               <span class="nav-item"> ${userVO.name}님 환영합니다. <a
                  class="btn-outline-sm" href="mypage.do">마이페이지</a>
                  <button class="btn-outline-sm" onclick="logout()">로그아웃</button>
               </span>
            </c:if>

         </div>
         <!-- end of navbar-collapse -->
      </div>
      <!-- end of container -->
   </nav>


   <div style="height: 30%; overflow: hidden; flex-direction: row; display: flex; justify-content: center; align-items: center; margin-right: 30%;">
      <div class="video-container">
         <div class="video-item">
            <h2>촬영</h2>
            <video autoplay muted id="preview"></video>
         </div>
      </div>
      
      <div class="video-container">
         <div class="video-item">
            <h2>녹화확인</h2>
            <video id="recording"></video>
         </div>
      </div>
   </div>
   <div class="wrapper2">
      <div class="video-container2" style="margin-right: 190;">
         <button class="record-button" onclick="a()">녹화</button>
         <button class="stop-button">중지</button>
      </div>
      <div class="video-container2" style="margin-left: 190;">
         <button class="play-button">확인</button>
         <button><a class="download-button" name="coco" value="coco.mp4" style="text-decoration-line : none;"
            >보내기</a></button>
      </div>
   </div>
   
   <script src="/muscle/resources/js/camera.js"></script>
   <!-- <script src="script.js"></script> -->

</body>
</html>