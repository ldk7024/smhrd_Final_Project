<%@page import="org.springframework.web.bind.annotation.RequestBody"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<%
	/* String data = request.getParameter("data"); */
%>

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
<!-- login css-->

<style type="text/css">
.coco-img {
	width: 60px;
	height: 60px;
	background-size: contain;
}
/* 음성API */
select {
	width: 150px;
	height: 45px;
	padding-left: 10px;
	font-size: 18px;
	color: black;
	border: 1px solid black;
	border-radius: 5px;
}
/* textarea {
width: 10%;
height: 120px;
padding: 10px;
box-sizing: border-box;
border: solid 2px #1E90FF;
border-radius: 5px;
font-size: 16px;
resize: both;

} */
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
</style>
<!-- login css-->

<!-- 글쓰기 들어가기 -->
<script type="text/javascript">
   // 로그인...
    $(document).ready(()=>{
       <c:if test="${ !empty sessionScope.uservo}">    
          alert("${sessionScope.uservo}");
          <c:remove var="uservo"/>    //속성을 삭제할때 쓰는것 setAttribute가 되어있는 변수mag를 삭제
       </c:if>
     });
   
    $(document).ready(()=>{
      board();
     });   
    
   
   
   
   function muscleBoardForm() {
      location.href = "${cpath}/muscleBoardForm.do";
   }
   
   
 //수어사전!
   function dic1() {  
         var word = $("#word").val();
         $.ajax({
            url : "${cpath}/musclevideoAjax1.do",
            type : "get",
            data : {"word" : word},
            dataType : "json",
            success : resultHtml1,
            error : function(error) {
               alert("에러다잉?");
            }
         });
      }
 
 
   function dic2() {  
       var word = $("#word1").val();
       $.ajax({
          url : "${cpath}/musclevideoAjax2.do",
          type : "get",
          data : {"word" : word},
          dataType : "json",
          success : resultHtml2,
          error : function(error) {
             alert("에러다잉?");
          }
       });
    }
      // dic()함수가 성공하면 html을 띄워줌
      function resultHtml1(obj) {
         //alert(JSON.stringify(data));   json 문자열로 출력
         //var html = "<h3>" + obj.word + "</h3>";
         var html = "<video width='800px' height='500px' autoplay controls src="+obj.video+">";
         html += "</video>";
         $("#list12").html(html);
      }
      function resultHtml2(vo) {
          //alert(JSON.stringify(data));   json 문자열로 출력
          //var html = "<h3>" + obj.word + "</h3>";
          var html = "<video width='800px' height='500px' autoplay controls src="+vo.video+">";
          html += "</video>";
          $("#list13").html(html);
       }
      //로그아웃
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
      
     function board() {
            $.ajax({
               url : "${cpath}/BoardListAjax.do",
               type : "get",
               dataType : "json",
               success : b,
               error : function(error) {
                  alert("에러다잉?");
               }
            });
         }
     function Form() {
        location.href = "${cpath}/muscleBoardForm.do";
   }
     function resultpage() {
        location.href = "${cpath}/test.do#result";
   }
     function backpage() {
        location.href = "${cpath}/test.do#details";
   }
      
      function b(data) { //data =>[{ }, { }....]
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
                 //html+="<td>"+obj.idx_b+"</td>";
                 html+="<td><a href='${cpath}/commentListAjax.do?idx_b="+obj.idx_b+"'>"+obj.title+"</a></td>";
                 html+="<td>"+obj.id+"</td>";
                 //html+="<td><button class='btn btn-warning btn-sm' onclick='delbtn("+index+")'>삭제(Ajax)</button></td>";
                 //html+="<td><button class='btn btn-warning btn-sm' onclick='delbtn("+obj.idx+")'>삭제(Ajax)</button></td>";
                 html+="</tr>";
             });
             html+="</table>";
             $("#bb").html(html);
           } 
      
   </script>
</head>
<body>

	<!-- Navigation -->
	<nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light"
		aria-label="Main navigation">
		<div class="container">

			<!-- Image Logo -->
			<a class="navbar-brand logo-image" href="#header"><img
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
						aria-current="page" href="#header">메인</a></li>
					<c:if test="${userVO == null}">
						<li class="nav-item"><a class="nav-link" href="gologin.do"
							id="clickButton1">수어 음성번역</a></li>
					</c:if>

					<c:if test="${userVO != null}">
						<li class="nav-item"><a class="nav-link" href="#details">수어
								음성번역</a></li>
					</c:if>

					<li class="nav-item"><a class="nav-link" href="#services">수어
							사전</a></li>

					<c:if test="${userVO == null}">
						<li class="nav-item"><a class="nav-link" href="gologin.do"
							id="clickButton">자유게시판</a></li>
					</c:if>
					<c:if test="${userVO != null}">
						<li class="nav-item"><a class="nav-link" href="#projects"
							onclick="board()">자유게시판</a></li>
					</c:if>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false">Drop</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="#details">수어음성번역</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="#services">수어사전</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="#projects"
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
						class="btn-outline-sm"
						href="${cpath}/mypage.do?id=${sessionScope.userVO.id}">마이페이지</a>
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
							src="${pageContext.request.contextPath}/resources/images/thisis.png"
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

	<!-- Details 1 -->
	<div id="details" class="basic-2">
		<div class="wrapper1">
			<div class="video-container">
				<div class="video-item">
					<h2 style="align-content: center;" id="comin2">촬영중...</h2>
					<img src="http://127.0.0.1:5001/" id="comin1">
				</div>
			</div>

		</div>
		<div class="wrapper2">
			<div class="video-container2"
				style="display: flex; width: 200px; padding: 1rem; justify-content: space-around; margin-right: 180px;">
				<button  onclick="closeCam()"
					style="display: inline-block; pading: 1rem 1.0rem 1rem 1.0rem; border: 1px solid #cc2973; border-radius: 30px; background-color: transparent; color: #cc2973; font-weight: 600; font-size: 0.875rem; line-height: 0; text-decoration: none; transition: all 0.2s;" id="comin3">중지</button>
					
				<button onclick="openCam()"
               		style="display: inline-block; padding: 1rem 1rem 1rem 1.0rem; border: 1px solid #2492f9; border-radius: 30px; background-color: transparent; color: #2492f9; font-weight: 600; font-size: 0.875rem; line-height: 0; text-decoration: none; transition: all 0.2s;">다시하기</button>
	
			</div>
		</div>
		
	</div>
	<!-- end of basic-2 -->
	<!-- end of details 1 -->


	<!-- result -->
	<div id="result" class="basic-2">
		<div style="margin-left: 5%;">
			<div class="coco-img">
				<a href="${cpath}/test.do#details"><img
					style="width: 50px; height: 50px;"
					src="${pageContext.request.contextPath}/resources/images/arrow.png"
					alt="..." /></a>
			</div>
		</div>
		<div class="wrapper3">
			<div class="video-container">
				<div class="video-item">
					<p>
						<span style="font-size: 300%"><strong>내가</strong></span> <span
							style="font-size: 150%">하고 싶은</span>
					</p>
					<p>
						<span style="font-size: 150%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이야기는....</span>
					</p>


						<textarea placeholder="잠시만 기다려 주세요." id="text" rows="5" cols="20"
							style="width: 450px; height: 315px; font-size: 20px; padding: 10px; box-sizing: border-box; border: 2px solid rgb(30, 144, 255); border-radius: 5px; font-size: 16px; resize: both; margin: 0px;"
							name="value"></textarea>


					<!--<input type='button' value='innerHTML' onclick='getInnerHTML()' /> -->



				</div>

			</div>
			<button id="btn-read">
				<img class="coco-img"
					src="${pageContext.request.contextPath}/resources/images/voice.png"
					alt="..." />
			</button>


			<div class="video-container">
				<div class="video-item">
					<p>
						<span style="font-size: 300%"><strong>나의</strong></span>
					</p>
					<p>
						<span style="font-size: 150%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대답은...</span>
					</p>

					<textarea placeholder="번역할 텍스트를 입력해주세요." name="word" id="word"
						rows="5" cols="20"
						style="width: 450px; height: 315px; font-size: xx-large; padding: 10px; box-sizing: border-box; border: 2px solid rgb(30, 144, 255); border-radius: 5px; font-size: 16px; resize: both; margin: 0px;"></textarea>
				</div>
			</div>
			<button>
				<a onclick="dic1()"><img class="coco-img"
					src="${pageContext.request.contextPath}/resources/images/video-camera (1).png"
					alt="..." /></a>
			</button>
		</div>
		<div id="list12"
			style="display: inline-block; text-align: center; padding: 100px; margin-left: 220px; width: 500px; height: 350"></div>
	</div>

	<script type="text/javascript">
     	/*  function minco(){
               $.ajax({
                url : 'http://127.0.0.1:5001/post',
                datatype: "json",
                type : 'post',
                contentType: "application/json",
                success : function(data){
                   var result = data;
                   document.getElementById('text').innerText = result
                },
                error : function(){alert("ajax 통신 실패")}
               })
                  }  */
    	setTimeout(minco,10000);
          function closeCam() {
        	  $("#comin1").css("display","none");
        	  $("#comin2").css("display","none");
        	  $("#comin3").css("display","none");
        	  location.href = "${cpath}/test.do#result";
        	  
		}
          function openCam() {
			$("#comin1").css("display","block");
			$("#comin2").css("display","block");
			$("#comin3").css("display","block");
		}
          document.getElementById("text").style.fontSize = '20px';
          document.getElementById("word").style.fontSize = '20px';
     </script>
     
	<script type="text/javascript">
		function speak(text, opt_prop) {
            if (typeof SpeechSynthesisUtterance === "undefined" || typeof window.speechSynthesis === "undefined") {
                alert("이 브라우저는 음성 합성을 지원하지 않습니다.")
                return
            }
            
            window.speechSynthesis.cancel() // 현재 읽고있다면 초기화

            const prop = opt_prop || {}

            const speechMsg = new SpeechSynthesisUtterance()
            speechMsg.rate = prop.rate || 1 // 속도: 0.1 ~ 10      
            speechMsg.pitch = prop.pitch || 1 // 음높이: 0 ~ 2
            speechMsg.lang = "ko-KR"
            speechMsg.text = text
            
            // SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
            window.speechSynthesis.speak(speechMsg)
        }


        // 이벤트 영역
        const selectLang = document.getElementById("select-lang")
        const text = document.getElementById("text")
        const btnRead = document.getElementById("btn-read")

        btnRead.addEventListener("click", e => {
            speak(text.value, {
                rate: 1,
                pitch: 1.2,
                lang: "ko-KR"
            })
        })
 
</script>


	<!-- Services -->
	<div id="services" class="cards-1 bg-gray">
		<div class="container">
			<form method="post" class="inner"
				style="position: absolute; left: 50%; transform: translateX(-50%);">
				<div>
					<input type="text" name="word1" id="word1"
						style="border-radius: 28px; height: 40px; width: 400px; background: #ffffff;">
					<a onclick="dic2()" class="btn-outline-sm"> 검색</a>
				</div>

				<div id="list13" style="margin-top: 100px;"></div>

			</form>
		</div>
	</div>


	<!-- Projects -->
	<div id="projects" class="cards-2">
		<div class="container">
			<h4>자유게시판</h4>
			<br>
			<table class="table" id="bb">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list1}">
						<tr>
							<td><a>${vo.idx_b}</a></td>
							<td><a href="${cpath}/commentListAjax.do?idx_b=${vo.idx_b}">${vo.title}</a></td>
							<td>${vo.id}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<br> <a class="btn-outline-sm" onclick="muscleBoardForm()">글쓰기</a>
		</div>
	</div>



	<!-- Footer -->
	<div class="footer bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="footer-col first">
						<h6>About Website</h6>
						<p class="p-small">He oppose at thrown desire of no.
							Announcing impression unaffected day his are unreserved
							indulgence. Him hard find read are you</p>
					</div>
					<!-- end of footer-col -->
					<div class="footer-col second">
						<h6>Links</h6>
						<ul class="list-unstyled li-space-lg p-small">
							<li>Important: <a href="terms.html">Terms & Conditions</a>,
								<a href="privacy.html">Privacy Policy</a></li>
							<li>Useful: <a href="#">Colorpicker</a>, <a href="#">Icon
									Library</a>, <a href="#">Illustrations</a></li>
							<li>Menu: <a href="#header">Home</a>, <a href="#details">Details</a>,
								<a href="#services">Services</a>, <a href="#contact">Contact</a></li>
						</ul>
					</div>
					<!-- end of footer-col -->
					<div class="footer-col third">
						<span class="fa-stack"> <a href="#your-link"> <i
								class="fas fa-circle fa-stack-2x"></i> <i
								class="fab fa-facebook-f fa-stack-1x"></i>
						</a>
						</span> <span class="fa-stack"> <a href="#your-link"> <i
								class="fas fa-circle fa-stack-2x"></i> <i
								class="fab fa-twitter fa-stack-1x"></i>
						</a>
						</span> <span class="fa-stack"> <a href="#your-link"> <i
								class="fas fa-circle fa-stack-2x"></i> <i
								class="fab fa-pinterest-p fa-stack-1x"></i>
						</a>
						</span> <span class="fa-stack"> <a href="#your-link"> <i
								class="fas fa-circle fa-stack-2x"></i> <i
								class="fab fa-instagram fa-stack-1x"></i>
						</a>
						</span>
						<p class="p-small">
							We would love to hear from you <a href="mailto:contact@site.com"><strong>contact@site.com</strong></a>
						</p>
					</div>
					<!-- end of footer-col -->
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of footer -->
	<!-- end of footer -->


	<!-- Copyright -->
	<div class="copyright bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p class="p-small">
						Copyright © <a href="#your-link">Your name</a>
					</p>
				</div>
				<!-- end of col -->
			</div>
			<!-- enf of row -->

			<div class="row">
				<div class="col-lg-12">
					<p class="p-small">
						Distributed By <a href="https://themewagon.com/">Themewagon</a>
					</p>
				</div>
				<!-- end of col -->
			</div>
			<!-- enf of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of copyright -->
	<!-- end of copyright -->


	<!-- Back To Top Button -->
	<button onclick="topFunction()" id="myBtn">
		<img
			src="${pageContext.request.contextPath}/resources/images/up-arrow.png"
			alt="alternative">
	</button>
	<!-- end of back to top button -->

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
	<script src="${pageContext.request.contextPath}/resources/js/camera.js"></script>
</body>
<script type="text/javascript">
let msg = "";
msg = ${msg};
console.log(msg);
if(msg != "none") {
   alert(msg);
   location.reload;
}
</script>
</html>