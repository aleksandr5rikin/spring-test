<%--
  Created by IntelliJ IDEA.
  User: cocozub
  Date: 19.08.2016
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title>Fields</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.js"></script>
    <script src="resources/js/sockjs-0.3.4.min.js"></script>
    <script src="resources/js/stomp.min.js"></script>
    <script src="resources/js/subController.js"></script>
    <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
            crossorigin="anonymous">
  </head>
  <body>
	<div class="container">
		<div ng-app = "app" ng-controller = 'subscribeCtrl' id="response">
			<a href="/fields">Fields</a>
			<a href="/responses">{{tmp}}</a>
		</div>
		
		<form action="/fields/-1">
			<button class="btn btn-default" type="submit">Add Field</button>
		</form>

		<table class="table table-striped" border="1px" bordercolor="black" width=80% align="center">
			<thead>
				<tr>
					<td>Label</td>
					<td>Type</td>
					<td>Required</td>
					<td>Is Active</td>
					<td></td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${fields}" var="field">
					<tr>
						<td><c:out value="${field.name}" /></td>
						<td><c:out value="${field.type}" /></td>
						<td><input type="checkbox" disabled="disabled"
							<c:if test="${field.required == true}">checked="checked"</c:if>/></td>
						 <td><input type="checkbox" disabled="disabled"
							<c:if test="${field.active == true}">checked="checked"</c:if>/></td>
						<td><a href = "/fields/${field.id}">Edit</a></td>
						<td><a href = "/delete/${field.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
  </body>
</html>
