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
<script type="text/javascript">
	function update_ok(f) {
		f.action="update_ok.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="form.jsp" />
<br />
<hr />
<br />
<div align="center">
	<h1>  개인 정보 수정 </h1>
	<form method="post">
	<table>
		<thead>
			<tr>
				<th>NO</th><th>ID</th><th>PW</th><th>NAME</th>
				<th>AGE</th><th>ADDR</th><th>REGDATE</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty one_vo}">
					<tr><td colspan="7"><h2>자료 없음</h2></td></tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${one_vo.no }</td>
						<td>${one_vo.id }</td>
						<td>${one_vo.pw }</td>
						<td><input type="text" name="name" value="${one_vo.name }" size="20" /></td>
						<td><input type="text" name="age" value="${one_vo.age }" size="20" /></td>
						<td><input type="text" name="addr" value="${one_vo.addr }" size="20" /></td>
						<td>${one_vo.regdate.substring(0,10)}</td>
					</tr>					
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="7"><input type="button" value="정보수정" onclick="update_ok(this.form)" /> </td>
				<!-- 아이디로 갱신하기 위해서 id를 hidden으로 보냄 -->
				<input type="hidden" name="id" value="${one_vo.id }" />
			</tr>
		</tfoot>
	</table>
	</form>
</div>
</body>
</html>