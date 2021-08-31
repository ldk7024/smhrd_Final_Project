<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- SEO Meta Tags -->
<meta name="description" content="Your description">
<meta name="author" content="Your name">

<!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
<meta property="og:site_name" content="" />
<!-- website name -->
<meta property="og:site" content="" />
<!-- website link -->
<meta property="og:title" content="" />
<!-- title shown in the actual shared post -->
<meta property="og:description" content="" />
<!-- description shown in the actual shared post -->
<meta property="og:image" content="" />
<!-- image link, make sure it's jpg -->
<meta property="og:url" content="" />
<!-- where do you want your post to link to -->
<meta name="twitter:card" content="summary_large_image">
<!-- to have large image post format in Twitter -->

<!-- Webpage Title -->
<title>너의 수어가 들려</title>

<!-- Styles -->
<link
   href="${pageContext.request.contextPath}https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap"
   rel="stylesheet">
<link
   href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
   rel="stylesheet">
<link
   href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css"
   rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/swiper.css"
   rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
   rel="stylesheet">

<!-- Favicon  -->
<link rel="icon"
   href="${pageContext.request.contextPath}/resources/images/favicon.png">
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
                  <li class="nav-item"><a class="nav-link" href="gologin.do"  id="clickButton1">수어 음성번역 서비스</a></li>
               </c:if>
               
               <c:if test="${userVO != null}">
                  <li class="nav-item"><a class="nav-link" href="index.do">수어 음성번역 서비스</a></li>
               </c:if>
               
               <li class="nav-item"><a class="nav-link" href="musclevideo.do">수어 사전</a></li>
            
            <c:if test="${userVO == null}">
                  <li class="nav-item"><a class="nav-link" href="gologin.do" id="clickButton">자유게시판</a></li>
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
   <!-- end of navbar -->
   <!-- end of navigation -->


   <!-- Header -->
   <header id="header" class="header">
      <img class="decoration-star"
         src="${pageContext.request.contextPath}/resources/images/decoration-star.svg"
         alt="alternative"> <img class="decoration-star-2"
         src="${pageContext.request.contextPath}/resources/images/decoration-star.svg"
         alt="alternative">
      <div class="container">
         <div class="row">
            <div class="col-lg-7 col-xl-5">
               <div class="text-container">
                  <h1 align="center">수어, 또 하나의 언어</h1>
                  <p class="p-large" align="right">보이는 언어, 수어로 통하는 세상</p>

               </div>
               <!-- end of text-container -->
            </div>
            <!-- end of col -->
            <div class="col-lg-5 col-xl-7">
               <div class="image-container">
                  <img class="img-fluid"
                     src="${pageContext.request.contextPath}/resources/images/main_project.png"
                     alt="alternative">
               </div>
               <!-- end of image-container -->
            </div>
            <!-- end of col -->
         </div>
         <!-- end of row -->
      </div>
      <!-- end of container -->
   </header>
   <!-- end of header -->

   <!-- Scripts -->
   <script
      src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   <!-- Bootstrap framework -->
   <script
      src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
   <!-- Swiper for image and text sliders -->
   <script
      src="${pageContext.request.contextPath}/resources/js/purecounter.min.js"></script>
   <!-- Purecounter counter for statistics numbers -->
   <script
      src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
   <!-- Custom scripts -->
</body>
<!-- 로그인이 않된경우에  -->
<script type="text/javascript">
 $("#clickButton").click (function () {
      alert("로그인이 필요한 페이지 입니다.");
   });
 $("#clickButton1").click (function () {
      alert("로그인이 필요한 페이지 입니다.");
   });
</script>   


</html>