<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="jumbotron">
<div class="p-5 mb-4 bg-light card rounded-3 shadow-lg">
	<div class="card-body">
	<div class="container-fluid py-4">

		<c:choose>
			<c:when test="${sessionScope.groupName ne null}">
				<h2 class="display-6">
					<c:out value="${sessionScope.groupName}" />
				</h2>
				<p class="lead">
					Welcome to <c:out value="${sessionScope.groupName}" /> portal.
				</p>
				<p>
					If you are interested to join <c:out value="${sessionScope.groupName}" />,
					please feel free to register your interest and someone from our
					team will be in touch with you.
				</p>

				<div class="d-grid gap-2 d-md-flex">
					<a href="registerInterest?interestType=Join Group" class="btn btn-primary btn-lg">
						<i class="bi bi-pencil-square me-1"></i> Register Interest
					</a>
					<c:if test="${sessionScope.user eq null || empty sessionScope.user}">
						<a href="login" class="btn btn-secondary btn-lg">
							<i class="bi bi-box-arrow-in-right me-1"></i> Login
						</a>
					</c:if>
				</div>

			</c:when>

			<c:otherwise>
				<h2 class="text-danger">Page Not Found!</h2>
				<p class="text-muted">Oops! You seem to have landed on an unknown page.</p>
			</c:otherwise>
		</c:choose>

	</div>
	</div>
</div>
</div>
<script>
  $('#myButton').on('click', function () {
  	 var $btn = $(this).button('loading')
   $(this).toggleClass('active');
    // business logic...
  //  $btn.button('reset')
  })
</script>