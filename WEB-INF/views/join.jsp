<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="cpath" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>너의 수어가 들려</title>    
    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/resources/https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/swiper.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
   <style type="text/css">
    <style type="text/css">
    *{
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;
  
}

body {
  background-color:#ffffff ;
}

.loginForm {
  position:absolute;
  width:300px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.loginForm h2{
  text-align: center;
  margin: 30px;
}

.idForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.passForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}

.bottomText {
  text-align: center;
}   
    </style>
    <!-- 스크립트 부분 -->
 
   <!-- Favicon  -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
</head>
<body>
    
    <!-- Navigation -->
    <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <a class="navbar logo-image" href="main.do"><img src="${pageContext.request.contextPath}/resources/images/logogeunjo.PNG" alt="alternative"></a> 
   
            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text" href="index.html">Yavin</a> -->

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ms-auto navbar-nav-scroll">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="main.do">메인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.do">수어 음성번역 서비스</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="musclevideo.do">수어 사전</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="muscleBoardList.do">자유게시판</a>
                    </li>
                </ul>
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->
     <!-- Header -->
    <header id="header" class="header">
        <img class="decoration-star" src="${pageContext.request.contextPath}/resources/images/decoration-star.svg" alt="alternative">
        <img class="decoration-star-2" src="${pageContext.request.contextPath}/resources/images/decoration-star.svg" alt="alternative">
        <!-- end of container -->
    </header>
 <body width="100%" height="100%">
    <!-- <form action="gologin.do" method="post" class="loginForm" action="userInsert.do"> -->
    <form method="get" class="loginForm" action="${cpath}/userInsert.do">
      <h2>회원가입</h2>
      <div class="idForm">
        <input type="text" class="id" placeholder="아이디" name="id">
      </div>
      <div class="passForm">
        <input type="password" class="pw" placeholder="비밀번호" name="pw">
      </div>
       <!-- <div class="passForm">
        <input type="password" class="pw" placeholder="비밀번호 확인" name="pwconfirm">
      </div> -->
       <div class="passForm">
        <input type="text" class="pw" placeholder="이름" name="name"> 
      </div>
      <div class="passForm">
        <input type="tel" class="pw" placeholder="전화번호" name="tel">
      </div>
      
      
      <button type="submit" class="btn">회원가입</button>
      <div class="bottomText">
           기존 아이디가 있으신가요? <a href="gologin.do">로그인</a>
      </div>
    </form>
    </body>
</html>