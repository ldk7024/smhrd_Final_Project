<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="cpath" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>자유게시판 글쓰기</title>
    
    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/resources/https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/swiper.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
   
    <!-- 스크립트 부분 -->
    <script type="text/javascript">
    function goMain() {
       location.href = "${cpath}/main.do";
   }
    function goLogin() {
       location.href = "${cpath}/gologin.do";
   }
    function goboard() {
       location.href = "${cpath}/muscleBoardList.do";
   }
    function goMypage() {
       location.href = "${cpath}/gomypage.do";
   }
    function logout() {
       $.ajax({
          url : "${cpath}/logout.do",
          type:"get",
          success : function(){
             alert("로그아웃되었습니다.")
             location.href="${cpath}/test.do";
          },
          error : function(){alert("error");}
       });
    }
  
    </script>
     <style type="text/css">
 .button {
   display: inline-block;
    padding: 1rem 1.5rem 1rem 1.5rem;
    border: 1px solid #2492f9;
    border-radius: 30px;
    background-color: transparent;
    color: #2492f9;
    font-weight: 600;
    font-size: 0.875rem;
    line-height: 0;
    text-decoration: none;
    transition: all 0.2s;
    }
    .button:hover {
   background-color: #2492f9;
   color: #ffffff;
   text-decoration: none;
}
     
     </style>
   
   
   <!-- Favicon  -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
</head>
<body>
    
    <!-- Navigation -->
    <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <a class="navbar-brand logo-image" href="test.do"><img src="${pageContext.request.contextPath}/resources/images/logo.svg" alt="alternative"></a> 

            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text" href="index.html">Yavin</a> -->

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ms-auto navbar-nav-scroll">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="test.do">메인</a>
                    </li>
                    <c:if test="${userVO == null}">
                  <li class="nav-item"><a class="nav-link" href="gologin.do" >수어 음성번역 서비스</a></li>
               </c:if>
               
               <c:if test="${userVO != null}">
                  <li class="nav-item"><a class="nav-link" href="test.do#details">수어 음성번역 서비스</a></li>
               </c:if>
               
               <li class="nav-item"><a class="nav-link" href="test.do#services">수어 사전</a></li>
            
            <c:if test="${userVO == null}">
                  <li class="nav-item"><a class="nav-link" href="gologin.do">자유게시판</a></li>
               </c:if>
               <c:if test="${userVO != null}">
                  <li class="nav-item"><a class="nav-link" href="test.do#projects" onclick="board()">자유게시판</a></li>
               </c:if>
                <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">Drop</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown01">
                            <li><a class="dropdown-item" href="#details">수어음성번역</a></li>
                            <li><div class="dropdown-divider"></div></li>
                            <li><a class="dropdown-item" href="#services">수어사전</a></li>
                            <li><div class="dropdown-divider"></div></li>
                            <li><a class="dropdown-item" href="#projects" href="${cpath}/muscleBoardList.do">자유게시판</a></li>
                        </ul>
                    </li>
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
                    
                    
                    
                    
                    
             
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
   <article>

      <div class="container" role="main">

         <h4>자유게시판 글쓰기</h4>

                <form id="frm" method="post" action="${cpath}/boardInsert.do">
            <div class="mb-3">
               <label for="title">제목</label>


               <input type="text" class="form-control" name="title" name="title"  placeholder="제목을 입력해 주세요">

            </div>
            

            

            <div class="mb-3">

               <label for="content">내용</label>


               <textarea class="form-control" rows="5" name="content"  placeholder="내용을 입력해 주세요" ></textarea>

            </div>

            <div class="mb-3">
               <label for="reg_id">작성자</label>
                <textarea class="form-control" rows="1" readonly="readonly" name="id">${userVO.id}</textarea>
            </div>

            
         <div>
           <input type="submit" class="btn-outline-sm" value="저장" >  
                <button type="reset" class="button">글쓰기 취소</button>
         </div>
      </form>
         
         

      </div>

   </article>

</body>

</html>