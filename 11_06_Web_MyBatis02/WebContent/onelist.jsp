<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.ict.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	
	WebApplicationContext context =
	   WebApplicationContextUtils.getWebApplicationContext(application);
		
	DAO dao = (DAO)context.getBean("dao");
	session.setAttribute("onelist", dao.getOneList(idx));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 방 명 록 </title>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 500px; border-collapse:collapse; }
	table,tr,td{border: 1px solid black; padding: 3px}
</style>
<script type="text/javascript">
	function update_go(f) {
		f.action = "update.jsp";
		f.submit();
	}
    function delete_go(f) {
    	f.action = "delete.jsp";
		f.submit();
	}
	
</script>
</head>
<body>
	<div align="center">
		<h2>방명록 : 내용화면</h2>
		<hr />
		<p>[<a href="list.jsp">목록으로 이동</a>]</p>
		<form method="post">
		<table>
			<c:if test="${empty onelist}">
				<tr><td colspan="2"><h3> 해당 자료가 존재 하지 않습니다.</td></h3></tr>	
			</c:if>
		    <c:if test="${!empty onelist }">
		    	<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td>${onelist.name }</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td>${onelist.subject }</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td>${onelist.email }</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td>${onelist.pwd }</td>
				</tr>
				<tr>
					<td colspan="2">
						<pre>${onelist.content}</pre>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="button" value="수정" onclick="update_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="삭제" onclick="delete_go(this.form)" />
						</td>
					</tr>
				</tfoot>
			</table>
			</c:if>
		</form>
	</div>
</body>
</html>