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


	<div class=" d-flex ">

		<%@include file="../../shared/Sidebar.jsp"%>



		<div class="container card pe-15  " style="width: 60rem;">
			<div class="card-body ">

				<h1 class="text-center">Add Employee</h1>

				<form action="addedemp" method="post">


					<c:if test="${not empty sessionScope.msg}">
						<div class="alert text-center ${sessionScope.msg.cssClass}"
							role="alert">${sessionScope.msg.content}</div>
						<c:remove var="msg" scope="session" />
					</c:if>

					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Department</label>
						<input type="text" class="form-control" id="exampleInputEmail1"
							name="department" aria-describedby="emailHelp">

					</div>





					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Email</label>
						<input type="email" class="form-control" id="exampleInputEmail1"
							name="email" aria-describedby="emailHelp">
						<div id="emailHelp" class="form-text">We'll never share your
							email with anyone else.</div>
					</div>

					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Designation</label>
						<input type="text" class="form-control" id="exampleInputEmail1"
							name="job_title" aria-describedby="emailHelp">

					</div>

					<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Mobile</label>
						<input type="text" class="form-control" id="exampleInputEmail1"
							name="mobile" aria-describedby="emailHelp">

					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Name</label>
						<input type="text" class="form-control" id="exampleInputPassword1"
							name="name">
					</div>
					<div class="container text-center">

						<input class="btn btn-primary  " type="submit" value="Submit">

					</div>


				</form>


			</div>


		</div>
</body>
</html>