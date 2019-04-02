<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style type="text/css">
	table { width:  70%;}
	table, th, td {border: 1px solid black ;text-align: center;}
	th { background-color: skyblue; }
</style>
</head>
<body>
<jsp:include page="form.jsp" />
<br />
<hr />
<br />
<div align="center">
	<h1>  개인 정보 보기 </h1>
	<table>
		<thead>
			<tr>
				<th>NO</th><th>ID</th><th>PW</th><th>NAME</th>
				<th>AGE</th><th>ADDR</th><th>REGDATE</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty vo}">
					<tr><td colspan="7"><h2>자료 없음</h2></td></tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${vo.no }</td>
						<td>${vo.id }</td>
						<td>${vo.pw }</td>
						<td>${vo.name }</td>
						<td>${vo.age }</td>
						<td>${vo.addr }</td>
						<td>${vo.regdate.substring(0,10) }</td>
					</tr>					
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
</body>
</html>