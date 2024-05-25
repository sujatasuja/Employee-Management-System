<%@page import="com.EMSbackend.in.entities.User"%>
<%
User us = (User) session.getAttribute("user");

if (us == null) {

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

<%@include file="../../shared/base.jsp"%>
</head>
<body>
	<div>
		<div class=" d-flex " >
			<%@include file="../../shared/Sidebar.jsp"%>
		<div class="container ">	
			<h1 class="text-center">Your Profile</h1>
			<div class="container">
			<div class="row">
				<div class="col-md-10 offset-1">
					<div class="mb-5 d-flex justify-content-center">
						<img class=" w-50 img-fluid" src="${image}/Profile.png" alt="" />
					</div>
					<h1 class="text-center mb-5"><%=us.getName()%>
						</h1>
					<table class="table text-center table-striped">
						<tbody>
							<tr>
								<td>User ID</td>
								<td><span
									class="inline-flex rounded-sm bg-slate-200 px-2  font-semibold leading-5 text-md text-red-600">
										EMS<%=us.getId()%>
								</span></td>
							</tr>
							<tr>
								<td>User Name</td>
								<td><span
									class="text-green-700 font-bold text-lg uppercase"><%=us.getEmail()%></span></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
         </div>
		</div>




	</div>


</body>
</html>