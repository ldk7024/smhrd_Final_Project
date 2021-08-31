<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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



<style type="text/css">
div#container{
   padding-left: 30%

}
* {
   margin: 0px;
   padding: 0px;
   text-decoration: none;
   font-family: sans-serif;
}

.body {
   background-color: #ffffff;
   padding: 150px;
}

.loginForm {
   position: absolute;
   width: 350px;
   height: 400px;
   padding: 30px, 20px;
   background-color: #FFFFFF;
   text-align: center;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   border-radius: 15px;
}

.loginForm h2 {
   text-align: center;
   margin: 30px;
}

.idForm {
   border-bottom: 2px solid #adadad;
   margin: 30px;
   padding: 10px 10px;
}

.passForm {
   border-bottom: 2px solid #adadad;
   margin: 30px;
   padding: 10px 10px;
}

.id {
   width: 100%;
   border: none;
   outline: none;
   color: #636e72;
   font-size: 16px;
   height: 25px;
   background: none;
}

.pw {
   width: 100%;
   border: none;
   outline: none;
   color: #636e72;
   font-size: 16px;
   height: 25px;
   background: none;
}

.btn {
   position: relative;
   left: 40%;
   transform: translateX(-50%);
   margin-bottom: 40px;
   width: 80%;
   height: 40px;
   background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
   background-position: left;
   background-size: 200%;
   color: white;
   font-weight: bold;
   border: none;
   cursor: pointer;
   transition: 0.4s;
   display: inline;
}

.btn:hover {
   background-position: right;
}

.bottomText {
   text-align: center;
}

.table {
   border: 1px solid #CCC;
   font-size: 13px;
   background-color: #F5F5F5;
   border-collapse: separate;
   border-radius: 10px;
   -moz-border-radius: 10px;
}

.table2 {
   border: 1px solid #CCC;
   font-size: 13px;
   background-color: #F5F5F5;
   border-collapse: separate;
   border-radius: 10px;
   -moz-border-radius: 10px;
}

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
<!-- 스크립트 부분 -->
<script type="text/javascript">
$(document).ready(()=>{
	location.href = "${cpath}/mypage.do";
   });


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
    function goDel(idx_c) {
    	alert(idx_c);
		location.href="${cpath}/reveiwDelete.do?idx_c="+idx_c;
	}
    </script>
</head>
<body>
   <!-- Navigation -->
   <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light"
      aria-label="Main navigation">
      <div class="container">

         <!-- Image Logo -->
         <a class="navbar-brand logo-image" href="test.do#header"><img
            src="${pageContext.request.contextPath}/resources/images/logo.svg"
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
                  aria-current="page" href="test.do#header">메인</a></li>
               <c:if test="${userVO == null}">
                  <li class="nav-item"><a class="nav-link" href="gologin.do"
                     id="clickButton1">수어 음성번역</a></li>
               </c:if>

               <c:if test="${userVO != null}">
                  <li class="nav-item"><a class="nav-link" href="test.do#details">수어
                        음성번역</a></li>
               </c:if>

               <li class="nav-item"><a class="nav-link" href="test.do#services">수어
                     사전</a></li>

               <c:if test="${userVO == null}">
                  <li class="nav-item"><a class="nav-link" href="gologin.do"
                     id="clickButton">자유게시판</a></li>
               </c:if>
               <c:if test="${userVO != null}">
                  <li class="nav-item"><a class="nav-link" href="test.do#projects"
                     onclick="board()">자유게시판</a></li>
               </c:if>
              
               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" href="#" id="dropdown01"
                  data-bs-toggle="dropdown" aria-expanded="false">Drop</a>
                  <ul class="dropdown-menu" aria-labelledby="dropdown01">
                     <li><a class="dropdown-item" href="test.do#details">수어음성번역</a></li>
                     <li><div class="dropdown-divider"></div></li>
                     <li><a class="dropdown-item" href="test.do#services">수어사전</a></li>
                     <li><div class="dropdown-divider"></div></li>
                     <li><a class="dropdown-item" href="test.do#projects"
                        href="${cpath}/muscleBoardList.do">자유게시판</a></li>
                  </ul></li>
                 
            </ul>
            <c:if test="${userVO == null}">
               <span class="nav-item"> <a class="btn-outline-sm"
                  href="gologin.do">로그인</a>
               </span>
            </c:if>
            <c:if test="${userVO != null }">
               <span class="nav-item"> ${userVO.name}님 환영합니다. <a
                  class="btn-outline-sm" href="${cpath}/mypage.do?id=${sessionScope.userVO.id}">마이페이지</a>
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
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <div>
      <div id="container">
         <h1>마이페이지</h1>
         <br>
         <div id="content" class="section_home">
            <div class="column">
               <!-- 프로필 설정 -->
                              <br>  
                               <div>
                                    <div>
                                    <div class="sh_header" method="post">
                                       <h5>${userVO.name}님의 프로필</h5>
                                       <br>
                                    </div>
                                    <div style="display: flex;" class="mypage_content" align="center">
                                       <dl class="sh_lst">
                                          <dt class="blind">프로필 사진</dt>
                                          <dd class="pic_desc">
                                             <a href="#" onclick=""> <img
                                                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTKGHtsIRlZzaNQC8MRJNgaA-wH72qvskIKg&usqp=CAU"
                                                width="200" height="200" alt=""> <span
                                                class="spimg img_frame"></span>
                                             </a>
                                          </dd>
                                          <dt class="blind">&nbsp;</dt>
                                          <dd class="intro_desc">&nbsp;</dd>
                                          </dl>
                                          <div>
                  <div class="card-body">
                    <div class="table-responsive">
                        <form action="${cpath}/memberupdate.do">
                        <table style="width: 500px;" class="table">
                            <tbody>
                            <tr>
                                <td align="left" style="font-weight: bold" width="80px">아이디</td>
                                <td>
                                    <input type="text" name="id" class="form-control" readonly="readonly" value="${list.id}">
                                </td>
                                </tr>
                                <tr>
                                <td align="left" style="font-weight: bold">이름</td>
                                <td>
                                    <input type="text" name="name" class="form-control" value="${list.name}" readonly="readonly">
                                </td>                        
                            </tr>
                            <tr>
                                <td align="left" style="font-weight: bold">비밀번호</td>
                                <td>
                                    <input type="password" name="pw" class="form-control" value="${list.pw}">                                    
                                </td>
                            </tr>  
                            <tr>
                                <td align="left" style="font-weight: bold">전화번호</td>
                                <td>
                                    <input type="tel" name="tel" class="form-control" value="${list.tel}">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <button type="submit" class="btn-outline-sm">수정</button>
                     <button type="reset" class="button">취소</button>
                     </form>
                    </div>
                </div>
            </div>
          
            </div>
         </div>
         </div>
      <div class="column">
         <br> <br>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <!-- 게시판 작성 내역 -->
         <div class="sh_group">
            <div class="sh_header">
               <h5>${list.name}님이 자유게시판에 작성한 내용</h5>
            </div>
            <br>
            
            <table class="table" id="list" style="width: 730px">
               <thead>
                  <tr>
                     
                     <th>번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                  </tr>
               </thead>
               <tbody>
                 <c:forEach var="list3" items="${list3}" >
               <tr>
                  
                  <td><input type="text" name="idx_b" class="form-control" value="${list3.idx_b}" readonly="readonly"></td>
                  <td><a name="title" class="form-control" readonly="readonly" href="${cpath}/commentListAjaxmy.do?idx_b=${list3.idx_b}">${list3.title}</a></td>
                  <%-- <td><a href="${cpath}/commentListAjax.do?idx_b=${vo.idx_b}">${vo.title}</a></td> --%>
                  <td><input type="text" name="id" class="form-control" value="${list3.id}" readonly="readonly"></td>
               </tr>
            </c:forEach>
               </tbody>
            </table>
           
          
         </div>
        <br> <br>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <!-- 댓글 작성내역 -->
         <div>
         <h5>${list.name}님이 작성한 댓글 내용</h5>
         <br>
         </div>
         <form method="post" action="${cpath}/reveiwupdate.do">
            <div>
               <table class="table" style="width: 730px">
                  <thead>
                     <tr>
                        <th>선택</th>
                        <th>댓글 번호</th>
                        <th>댓글내용</th>
                        <th>작성자</th>
                     </tr>
                  </thead>
                    <c:forEach var="vo" items="${list4}" >
                  <tr>
                  <td><input type="checkbox" name="checkboxName"></td>
                  <td><input type="text" name="idx_c" class="form-control" value="${vo.idx_c}" readonly="readonly"></td>
                  <td><input type="text" name="comment" class="form-control" value="${vo.comment}"></td>
                  <td><input type="text" name="id" class="form-control" value="${vo.id}" readonly="readonly"></td>
               </tr>
                  </c:forEach>
               </table>
           </div>
             <div>
        <%--  <c:forEach var="vo" items="${list4}" >   --%>    
               <p class="btn_area_btm1">
                  <button type="submit" value="수정" class="btn-outline-sm">수정</button>
                  <a class="btn-outline-sm" href="${cpath}/reveiwDelete.do?idx_c=${vo.idx_c}">삭제</a> 
                  <%-- <input type="button" class="btn-outline-sm" onclick="goDel(${idx_c})" value="삭제"> --%> 
               </p>
       <%-- </c:forEach> --%>
             </div>                
            </form>
         </div>

      </div>
         </div>
         </div>
         </div>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</body>

</html>