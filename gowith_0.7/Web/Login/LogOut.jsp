<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../CommonT.jsp" %>
<%
session.removeAttribute("SESSION_USER_ID");
session.removeAttribute("SESSION_Email");
session.removeAttribute("SESSION_Name");
session.removeAttribute("SESSION_PF_IMG");
session.removeAttribute("SESSION_INTRODUCE");
session.removeAttribute("SESSION_AUTH");
response.sendRedirect("../index.jsp");
%>