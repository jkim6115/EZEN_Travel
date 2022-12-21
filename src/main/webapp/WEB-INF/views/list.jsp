<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.name}</td>
				<td>${dto.age}</td>
				<td>${dto.loc}</td>
			</tr>
		</c:forEach>

</body>
</html>