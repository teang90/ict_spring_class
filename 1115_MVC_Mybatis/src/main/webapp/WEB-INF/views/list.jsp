<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체리스트</title>
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
	<h1>  전체 리스트 보기 </h1>
	<table>
		<thead>
			<tr>
				<th>NO</th><th>ID</th><th>PW</th><th>NAME</th>
				<th>AGE</th><th>ADDR</th><th>REGDATE</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr><td colspan="7"><h2>자료 없음</h2></td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list}" varStatus="vs">
						<tr>
							<td>${list.size() - vs.index }</td>
							<td>${k.id }</td>
							<td>${k.pw }</td>
							<td>${k.name }</td>
							<td>${k.age }</td>
							<td>${k.addr }</td>
							<td>${k.regdate.substring(0,10) }</td>
						</tr>					
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
</body>
</html>







