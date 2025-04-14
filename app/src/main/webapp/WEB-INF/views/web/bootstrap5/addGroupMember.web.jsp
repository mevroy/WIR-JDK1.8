<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="jumbotron">
	<div class="container py-5">
		<h2 class="mb-4">Add Group Member</h2>

		<form:form commandName="groupMember" action="saveGroupMember" method="post" id="groupMember">
			<div class="row">
				<div class="col-lg-6">
					<!-- Other fields omitted for brevity -->

					<div class="mb-3">
						<label for="birthday" class="form-label">DOB</label>
						<div class="input-group" id="birthdayPicker" data-td-target-input="nearest" data-td-target-toggle="nearest">
							<form:input path="birthday" cssClass="form-control" id="birthday" data-td-target="#birthday"/>
							<span class="input-group-text" data-td-target="#birthday" data-td-toggle="datetimepicker">
                            <i class="bi bi-calendar-date-fill"></i>
                        </span>
						</div>
					</div>

					<!-- Mobile and home phone omitted for brevity -->
				</div>

				<div class="col-lg-6">
					<!-- Member category & paid toggle omitted for brevity -->

					<div id="moreDetails" style="display: none;">
						<div class="mb-3">
							<label class="form-label">Membership Dates</label>
							<div class="input-group mb-2"  data-td-target-input="nearest" data-td-target-toggle="nearest">
								<span class="input-group-text" id="startDatePicker" data-td-toggle="datetimepicker"><i class="bi bi-calendar-date-fill"></i></span>
								<form:input path="membershipStartDate" cssClass="form-control" id="membershipStartDate" data-td-target="#membershipStartDate"/>
								<span class="input-group-text">TO</span>
								<form:input path="membershipEndDate" cssClass="form-control" id="membershipEndDate" data-td-target="#membershipEndDate"/>
							</div>
						</div>

						<!-- Remaining fields omitted for brevity -->
					</div>
				</div>

				<div class="col-12 mt-4">
					<form:hidden path="groupCode" id="groupCode"/>
					<input type="submit" value="SUBMIT" class="btn btn-primary btn-lg w-100 mb-2"/>
					<a href="${pageContext.request.contextPath}/${sessionScope.groupCode}/" class="btn btn-secondary btn-lg w-100">CANCEL</a>
				</div>
			</div>
		</form:form>
	</div>
</div>
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function () {
			// Init Tempus Dominus datetime pickers
			new tempusDominus.TempusDominus(document.getElementById('birthdayPicker'), {
				display: { components: { clock: false } },
				localization: { format: 'dd/MM/yyyy' }
			});

			new tempusDominus.TempusDominus(document.getElementById('startDatePicker'), {
				display: { components: { clock: false } },
				localization: { format: 'dd/MM/yyyy' }
			});

			// Hide/show paid member fields
			$('#moreDetails').hide();

			// jQuery validation
			$('#groupMember').validate({
				rules: {
					firstName: { required: true },
					lastName: { required: false },
					primaryEmail: { required: true, email: true },
					adultCount: { number: true },
					kidCount: { number: true },
					mobilephone: { maxlength: 13 },
					otherPhone: { maxlength: 13 },
					paidMembershipAmount: { number: true },
					memberCategoryCode: { required: true }
				},
				errorClass: "text-danger",
				errorElement: "div",
				highlight: function (element) {
					$(element).addClass("is-invalid");
				},
				unhighlight: function (element) {
					$(element).removeClass("is-invalid");
				}
			});

			buildGroupMemberCategoriesOptions('memberCategoryCode');
		});
	</script>