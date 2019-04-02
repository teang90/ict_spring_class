<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 검색</title>
<style type="text/css">
.main{
	margin-top: 3%;
}
table, tr, th, td {
	border: 1px solid #aaa;
	margin: auto;
	text-align:center;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="form.jsp" />
	<hr>
	<div class="main" align="center">
		<h3 align="center"> 전체 리스트 보기</h3>
		<table>
			<tbody>	
				<tr>
					<th>NO</th>
					<th>ID</th>
					<th>NAME</th>
					<th>PW</th>
					<th>AGE</th>
					<th>ADDR</th>
					<th>REGDATE</th>
				</tr>
				<c:forEach var="k" items="${onelist}" varStatus="vs">
				<tr>
					<td> ${onelist.size() - vs.index}</td>
					<td> ${k.id}</td>
					<td> ${k.name}</td>
					<td> ${k.pw}</td>
					<td> ${k.age}</td>
					<td> ${k.addr}</td>
					<td> ${k.regdate}</td>
				</tr>
				<c:if test="${empty onelist}">
					<tr>
						<td colspan="7"> 자료가 없습니다. </td>
					</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	
	
</body>
</html>