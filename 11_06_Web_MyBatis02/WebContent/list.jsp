
<%@page import="com.ict.mybatis.DAO"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> GuestBook list</title>
<style type="text/css">
	a {text-decoration: none;}
	table {width: 500px; border-collapse: collapse; }
	table, th, td {border:  1px solid black; padding: 3px;}
	table{text-align: center;}
	th{background-color: skyblue}
</style>
</head>
<body>
	<%
		WebApplicationContext context =
		WebApplicationContextUtils.getWebApplicationContext(application);
	
		DAO dao = (DAO)context.getBean("dao");
	    pageContext.setAttribute("list", dao.getList());
	%>
	<div align="center">
		<h2>방명록 : 전체화면</h2>
		<hr />
		<p>[<a href="write.jsp"> 방명록 쓰기 </a>]</p>
		<table>
			<thead>
				<tr>
					<th>번호</th><th>작성자</th><th>제목</th><th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4"><h2>해당 자료가 존재하지 않습니다.</h2></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${list}" varStatus="vs">
							<tr>
								<td> ${list.size()-vs.index }</td>
								<td>${k.name }</td>
								<td><a href="onelist.jsp?idx=${k.idx}">${k.subject }</a></td>
								<td>${k.regdate.substring(0,10)}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>










