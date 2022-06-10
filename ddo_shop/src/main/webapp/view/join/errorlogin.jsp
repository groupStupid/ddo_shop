<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login error</title>
	</head>
	<body>
		<script>
			alert("로그인이 필요합니다.");
			self.location = "/login";
		</script>
	</body>
</html>