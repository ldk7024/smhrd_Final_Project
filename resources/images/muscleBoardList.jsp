<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수어 자유게시판</title>
<!-- 스크립트 부분 -->
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" />

<script type="text/javascript">


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



function muscleBoardForm() {
   location.href = "${cpath}/muscleBoardForm.do";
}

  
                                   
 /*  function resultHtml(data) { //data =>[{ }, { }....]
    //alert(data);
      var html="<table class='table'>";
       html+="<tr>";
       html+="<td>번호</td>";
       html+="<td>제목</td>";
       html+="<td>작성자</td>";
       html+="</tr>";
       //반복문
          $.each(data, (index, obj)=>{
          html+="<tr>";
           html+="<td id='idx_b"+index+"'>"+obj.idx_b+"</td>";
           //html+="<td>"+obj.idx+"</td>";
           html+="<td>"+obj.title+"</td>";
           html+="<td>"+obj.title+"</td>";
           html+="<td>"+obj.id+"</td>";
           //html+="<td><button class='btn btn-warning btn-sm' onclick='delbtn("+index+")'>삭제(Ajax)</button></td>";
           //html+="<td><button class='btn btn-warning btn-sm' onclick='delbtn("+obj.idx+")'>삭제(Ajax)</button></td>";
           html+="</tr>";
       });
       html+="</table>";
       $("#list").html(html);
     }
 */
</script>

<style>
.board_in {
   position: absolute;
   left: 50%;
   transform: translateX(-50%);
}


.button{
   background-color:#e8ede9;
    height: 54px;
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
.button:hover {
   background-color:#f1f7ed;
}
.button:active {
   position:relative;
   top:1px;}
   
.table{
  border: 1px solid #CCC;
  font-size: 13px;
  color: white;
  background-color: #F5F5F5;
  
  border-collapse: separate;
  border-radius: 10px;
  -moz-border-radius: 10px;


}
}
</style>
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
   href="${pageContext.request.contextPath}/resources/https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap"
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

<!-- Navigation -->
</head>
<body>
   <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light"
      aria-label="Main navigation">
      <div class="container">

         <!-- Image Logo -->
         <a class="navbar logo-image" href="main.do
         "><img
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
                  <li class="nav-item"><a class="nav-link" href="index.do">수어 음성번역 서비스</a></li>
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
   <!-- end of navbar -->
   <!-- end of navigation -->
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
  
   <div class="container">
      <h4>자유게시판</h4>
      <br>
      <table class="table" id="list"  >
         <thead>
            <tr>
               <th>번호</th>
               <th>제목</th>
               <th>작성자</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="vo" items="${list}" >
               <tr>
                  <td>${vo.idx_b}</td>
                  <td><a href="${cpath}/commentListAjax.do?idx_b=${vo.idx_b}">${vo.title}</a></td>
                  <td>${vo.id}</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      <br>
      <a class="button" href="muscleBoardForm.do">글쓰기</a>
      </div>
     
</body>

</html>