<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.js"></script>
    <script src="resources/js/sockjs-0.3.4.min.js"></script>
    <script src="resources/js/stomp.min.js"></script>
    <script src="resources/js/notifyController.js""></script>
	<link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
            crossorigin="anonymous">
	</head>
<body ng-app = "app" ng-controller = 'notifyCtrl'>
	<div class = "container">
		<div>
			<a href="/fields">Fields</a> 
			<a href="/responses">{{tmp}}</a>
		</div>
		
		<c:url var="registration" value="/registration"></c:url>
		<form:form role="form" commandName="user" action="${registration}" method="POST">
			<c:forEach items="${fields}" var="field" varStatus="loop">
				<div class="form-group">
				
					<form:label path="value[${loop.index}]">${field.name}<c:if test="${field.required == true}"><c:out value=" *" /></c:if></form:label>
					<form:input path="name[${loop.index}]" type="hidden" value = "${field.name}"/>
					
					<c:choose>
						<c:when test = "${field.type == 'single line text'}">
							<form:input class="form-control" path="value[${loop.index}]" type="text" required = "false"/>
						</c:when>
						<c:when test = "${field.type == 'textares'}">
							<form:textarea class="form-control" path="value[${loop.index}]" cols = "20" required = "required"/>
						</c:when>
						<c:when test = "${field.type == 'radio button'}">
							<div class="radio">
								<c:forEach items="${field.options}" var="option">
								    <div class="radio">
                                        <label>
                                            <form:radiobutton path="value[${loop.index}]" value = "${option.value}" required = "required"/>
                                            ${option.value}
                                        </label>
									</div>
								</c:forEach>
						</c:when>
						<c:when test = "${field.type == 'combobox'}">
							<form:select class="form-control" path="value[${loop.index}]" required = "required">
								<c:forEach items="${field.options}" var="option">
									<form:option value = "${option.value}">${option.value}</form:option>
								</c:forEach>
							</form:select>
						</c:when>
						<c:when test = "${field.type == 'date'}">
							<fmt:formatDate value="${existedEvent.date}"
											pattern="yyyy-MM-dd"
											var="formattedDate"/>
							<form:input class="form-control" path="value[${loop.index}]" value ="${formattedDate}" type="date" required = "required"/>
						</c:when>
					</c:choose>
				</div>
			</c:forEach>
			<button class="btn btn-primary" type="submit" ng-click = "notify()">Submit</button>
			<button class="btn btn-primary" type="reset">Reset</button>
		</form:form>
	</div>
</body>
</html>
