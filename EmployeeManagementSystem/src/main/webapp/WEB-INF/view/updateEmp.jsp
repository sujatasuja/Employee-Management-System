<%@page import="com.EMSbackend.in.entities.User"%>
<%
	User us = (User) session.getAttribute("user");

	if (us == null) {

		response.sendRedirect("login");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="../../shared/base.jsp"%>

</head>
<body>

	

	<div class="d-flex">
		<%@include file="../../shared/Sidebar.jsp"%>


		<div class="container">

			<section class="p-3 p-md-4 p-xl-5">
				<div class="container">
					<div class="row">
						<div class="col-12 col-md-6 bsb-tpl-bg-platinum">
							<div
								class="d-flex flex-column justify-content-between h-100 p-3 p-md-4 p-xl-5">
								<h3 class="m-0">Voilaa!</h3>
								<img class="img-fluid rounded mx-auto my-4" loading="lazy"
									src="${image}/empvector.jpg" width="500" height="80"
									alt="BootstrapBrain Logo">
							</div>
						</div>
						<div class="col-12 col-md-6 bsb-tpl-bg-lotion">
							<div class="p-3 p-md-4 p-xl-5">
								<div class="row">
									<div class="col-12">
										<div class="mb-5">
											<h2 class="h3">UPDATE EMPLOYEE</h2>

											<c:if test="${not empty sessionScope.msg}">
												<div class="alert text-center ${sessionScope.msg.cssClass}"
													role="alert">${sessionScope.msg.content}</div>
												<c:remove var="msg" scope="session" />
											</c:if>



											<h3 class="fs-6 fw-normal text-secondary m-0">Update
												your employees</h3>
										</div>
									</div>
								</div>
								<form action="${ContextRoot}/updated" method="post">

									<div class="row gy-3 gy-md-4 overflow-hidden">

										<div class="mb-3">
											<input type="number" class="form-control" name="emplId"
												placeholder="Enter product name" hidden="hidden"
												readonly="readonly" value="${employee.emplId}"
												id="exampleInputPassword1">
										</div>
										<div class="col-12">
											<label for="name" class="form-label">Employee Name </label> <input
												type="text" class="form-control  " name="name"
												id="firstName" placeholder=" Name" value="${employee.name}" />
											<div class="invalid-feedback"></div>

										</div>
										<div class="col-12">
											<label for="email" class="form-label">Employee Email</label>
											<input type="email" class="form-control" name="email"
												id="email" placeholder="name@example.com"
												value="${employee.email}">
											<div class="invalid-feedback"></div>

										</div>
										<div class="col-12">
											<label for="phone" class="form-label">Mobile Number </label>
											<input type="text" class="form-control " name="mobile"
												id="phone" placeholder=" mobile number"
												value="${employee.mobile}" />
											<div class="invalid-feedback"></div>

										</div>
										<div class="col-12">
											<label for="jobTitle" class="form-label">Employee Job
												Title </label> <input type="text" class="form-control  "
												name="job_title" id="firstName" placeholder=" job title"
												value="${employee.job_title}" />
											<div class="invalid-feedback"></div>

										</div>
										<div class="col-12">
											<label for="jobTitle" class="form-label">Employee
												Department </label> <input type="text" class="form-control "
												name="department" id="deparatment" placeholder=" department"
												value="${employee.department}" />
											<div class="invalid-feedback"></div>

										</div>
										<div class="col-12"></div>
										<div class="col-12">
											<div class="d-grid">
												<button class="btn bsb-btn-xl btn-primary" type="submit">Update
													Employee</button>
											</div>
										</div>
									</div>
									</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

	</div>



</body>


</html>