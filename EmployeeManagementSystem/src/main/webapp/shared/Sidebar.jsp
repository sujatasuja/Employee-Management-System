<%@page import="com.EMSbackend.in.entities.User"%>

<%
	User user = (User) session.getAttribute("user");

	if (user == null) {

		response.sendRedirect("login");
		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


</head>
<body>



	<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
		style="width: 280px;">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
			<svg class="bi me-2" width="40" height="32">
			<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">Sidebar</span>
		</a>
		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="#" class="nav-link active"
				aria-current="page"> <svg class="bi me-2" width="16" height="16">
					<use xlink:href="#home"></use></svg> Home
			</a></li>
			
			<li><a href="${ContextRoot}/addemployee" class="nav-link text-white"> <svg
						class="bi me-2" width="16" height="16">
					<use xlink:href="#table"></use></svg> Add Employee
			</a></li>
			<li><a href="${ContextRoot }/viewemployee/<%=user.getId() %>" class="nav-link text-white"> <svg
						class="bi me-2" width="16" height="16">
					<use xlink:href="#grid"></use></svg> View Employees
			</a></li>
			<li><a href="${ContextRoot }/logout" class="nav-link text-white"> <svg
						class="bi me-2" width="16" height="16">
					<use xlink:href="#people-circle"></use></svg> logout
			</a></li>
		</ul>
		<hr>
		</div>


</body>
</html>