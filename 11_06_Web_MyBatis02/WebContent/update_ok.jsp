<%@page import="com.ict.mybatis.DAO"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="com.ict.mybatis.VO" />
<jsp:setProperty property="*" name="vo"/>

<%
	WebApplicationContext context =
		WebApplicationContextUtils.getWebApplicationContext(application);

	DAO dao = (DAO)context.getBean("dao");
	dao.getUpdate(vo);
	response.sendRedirect("onelist.jsp?idx="+vo.getIdx());
%>