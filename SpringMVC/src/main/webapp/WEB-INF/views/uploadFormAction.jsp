<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function goDown(uploadPath, uuid, fileName){
		var fileCallPath=uploadPath+"\\"+uuid+"_"+fileName;
		//alert(encodeURIComponent(fileCallPath));
		location.href="${cpath}/download.do?fileName="+encodeURIComponent(fileCallPath);
		//alert(fileCallPath);
	}


</script>
</head>
<body>
<div>
	<c:forEach var="vo" items="${list}">
	     <!-- a태그 눌렀을때 자바스크립트를 타고 함수 실행 문자열은 ''를 붙혀줌 -->
		<li><a href="javascript:goDown('${vo.uploadPath}','${vo.uuid}','${vo.fileName}')">${vo.fileName}</a></li>
	</c:forEach>
</div>
</body>
</html>