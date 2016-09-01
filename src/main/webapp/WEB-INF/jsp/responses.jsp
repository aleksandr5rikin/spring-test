<%--
  Created by IntelliJ IDEA.
  User: cocozub
  Date: 20.08.2016
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.js"></script>
		<script src="resources/js/sockjs-0.3.4.min.js"></script>
      <script src="resources/js/stomp.min.js"></script>
      <script src="resources/js/subController.js"></script>
	  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <title>Responses</title>
  </head>
  <body>
	<div class="container">
        <div ng-app = "app" ng-controller = 'subscribeCtrl' id="response">
                <a href="/fields">Fields</a>
                <a href="/responses">{{tmp}}</a>
         </div>
         </br>
      <table class="table table-striped" border="1px" bordercolor="black" width=80% align="center">
          <thead>
			  <tr>
				  <c:forEach items="${fields}" var="field">
					  <td>${field.name}</td>
				  </c:forEach>
			  </tr>
		  </thead>
		  <tbody>
			  <c:forEach items="${users}" var="user">
				  <tr>
				  <c:forEach items="${fields}" var="field" varStatus="loop">
					<c:choose>
					  <c:when test="${user.fields[loop.index].field == field}">
						<td><c:out value="${user.fields[loop.index].value}" /></td>
					  </c:when>
					  <c:otherwise>
						<td><c:out value="N/A" /></td>
					  </c:otherwise>
					</c:choose>
				  </c:forEach>
				  </tr>
			  </c:forEach>
		  </tbody>
      </table>
	</div>
  </body>
</html>
