
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.ict.db.DAO"%>
<%@page import="com.ict.db.VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> members2 전체보기</title>
<style type="text/css">
	table {width: 80% }
	table, th,td {border: 1px solid black; text-align: center;}
	th {background-color: skyblue;}
</style>
</head>
<body>
	<%
		WebApplicationContext context =
		WebApplicationContextUtils.getWebApplicationContext(application);
	
		DAO dao = (DAO)context.getBean("dao");
	    pageContext.setAttribute("list", dao.getList());
	%>
	<h2> 전체 리스트 </h2>
	<table>
		<thead>
			<tr>
				<th>NO</th><th>ID</th><th>PW</th><th>NAME</th>
				<th>AGE</th><th>ADDR</th><th>REGDATE</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list }">
					<tr><td colspan="7"><h2>원하는 자료가 존재하지 않습니다.</h2></td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list}">
					<tr>
						<td>${k.no }</td>
						<td>${k.id }</td>
						<td>${k.pw }</td>
						<td>${k.name }</td>
						<td>${k.age }</td>
						<td>${k.addr }</td>
						<td>${k.regdate }</td>
					</tr>
					</c:forEach>	
				</c:otherwise>
			</c:choose>
			
		</tbody>
	</table>
</body>
</html>










