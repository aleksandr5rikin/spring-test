<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" ng-app="app">
  <head>
    <title>Create/Edit Field</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.js"></script>
    <script src="http://localhost:8080/resources/js/sockjs-0.3.4.min.js"></script>
    <script src="http://localhost:8080/resources/js/stomp.min.js"></script>
    <script src="http://localhost:8080/resources/js/subController.js"></script>
    <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
            crossorigin="anonymous"/>
  </head>
  <body
		
		<div class = "container" >
		
			<div ng-controller = 'subscribeCtrl'>
				<a href="/fields" target="_self">Fields</a> 
				<a href="/responses" target="_self">{{tmp}}</a>
			</div>

			<form name = "form" ng-controller="HttpPostCtrl">

				<div class="form-group">
					<label for="nameid">Label*:</label>
					<input class="form-control" id = "nameid" type="text" ng-model="name" required = "required"/>
				</div>

				<div class="form-group">
					<label for="typeid">Type*:</label>
					<select class="form-control" id = "typeid" ng-model="type" required = "required">
						<option value="single line text">Single line text</option>
						<option value="textares">Textares</option>
						<option value="radio button">Radio button</option>
						<option value="combobox">Combobox</option>
						<option value="date">Date</option>
					</select>
				</div>

				<div class="form-group" ng-show="checked = (type == 'radio button' || type == 'combobox')">
					<label for="optionid">Options:</label></br>
					<textarea class="form-control" id = "optionsid" ng-model="options" ng-list="&#10;" ng-trim="false" cols = "20" ng-required="checked"></textarea>
				</div>
				
				<div class="checkbox">
					<label>
						<input type="checkbox" ng-model="required" value = "true">Required
					</label>
					<label>
						<input type="checkbox" ng-model="active" value= true>Is Active
					</label>
				</div>
				
				<button class="btn btn-primary" ng-click="SendData()">Save</button>
				<button class="btn btn-primary" type="reset">Cancel</button>
				
			</form>
		</div>
    <script>
	  app.config(function($locationProvider) {
		  $locationProvider.html5Mode(
		  {
				enabled: true,
				requireBase: false
			}).hashPrefix('!');
	  })

	  app.controller("HttpPostCtrl", function ($scope, $http, $location) {

		  $scope.SendData = function () {
			  $scope.data = {
				  name: $scope.name,
				  type: $scope.type,
				  options: $scope.options,
				  required: $scope.required,
				  active: $scope.active
			  };

			  var url = $location.path();

			  $http.post(url, $scope.data)
		  };

	  });
    </script>
  </body>
</html>
