<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
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
		<h3 align="center"> 회원 정보 수정</h3>
		<form action="update_ok.do" method="post">
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
				
				<c:forEach var="k" items="${uplist}" varStatus="vs">
				<tr>
					<td> ${onelist.size() - vs.index} </td>
					<td> <input type="text" name="id" value="${k.id}" > </td>
					<td> <input type="text" name="name" value="${k.name}" > </td>
					<td> <input type="text" name="pw" value="${k.pw}" > </td>
					<td> <input type="text" name="age" value="${k.age}" > </td>
					<td> <input type="text" name="addr" value="${k.addr}" > </td>
					<td> ${k.regdate} </td>
				</tr>
				<c:if test="${empty uplist}">
					<tr>
						<td colspan="7"> 자료가 없습니다. </td>
					</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
		<input type="submit" value="수정">
	</form>	
	</div>
	
	
	
	
</body>
</html>