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
<html lang="en" ng-app = "app" >
  <head>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.js"></script>
		<script src="resources/js/sockjs-0.3.4.min.js"></script>
		<script src="resources/js/stomp.min.js"></script>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>Responses</title>
  </head>
  <body ng-controller = "dataCtrl as ctrl">
	<div class="container">
        <div id="response">
                <a href="/fields">Fields</a>
                <a href="/responses">{{tmp}}</a>
        </div>
        </br>
      <table ng-controller = "dataCtrl as ctrl"  class="table table-striped" border="1px" bordercolor="black" width=80% align="center">
          <thead>
				<tr>
					<td ng-repeat="field in ctrl.fields"><span ng-bind="field.name"></span></td>
				</tr>
		  </thead>
		  <tbody>
				<tr ng-repeat="user in ctrl.users">
					<td ng-repeat = "field in ctrl.fields track by $index">{{user.fields[$index].value ? user.fields[$index].value : "N/A"}}</td>
				</tr>
		  </tbody>
		  
      </table>
	</div>
	<script>
		var app = angular.module('app', []);
		
		angular.module('app').factory('Users',  ['$http', '$q', function($http, $q){
			// Book is a class which we can use for retrieving and 
			// updating data on the server
			var factory = {
				fetchAllUsers: fetchAllUsers
			};
 
			return factory;
			// a static method to retrieve Book by ID
			function fetchAllUsers() {
				var deferred = $q.defer();
				$http.get('/getusers')
					.then(
					function (response) {
						deferred.resolve(response.data);
					},
					function(errResponse){
						console.error('Error while fetching Users');
						deferred.reject(errResponse);
					}
				);
				return deferred.promise;
			}
			
		}]);
		
		app.factory('Fields', ['$http', '$q', function($http, $q) {
			var factory = {
				fetchAllFields: fetchAllFields
			};
 
			return factory;
			// a static method to retrieve Book by ID
			function fetchAllFields() {
				var deferred = $q.defer();
				$http.get('/getfields')
					.then(
					function (response) {
						deferred.resolve(response.data);
					},
					function(errResponse){
						console.error('Error while fetching Fields');
						deferred.reject(errResponse);
					}
				);
				return deferred.promise;
			}
		}]);
		
		angular.module('app').controller('dataCtrl', ['$scope', 'Users', 'Fields', function ($scope, Users, Fields) {
			
			var self = this;
			self.users = [];
			self.fields = [];
			
			fetchAllUsers();
			fetchAllFields();
 
			function fetchAllUsers(){
				Users.fetchAllUsers()
					.then(
					function(d) {
						self.users = d;
					},
					function(errResponse){
						console.error('Error while fetching Users');
					}
				);
			}
			
			function fetchAllFields(){
				Fields.fetchAllFields()
					.then(
					function(d) {
						self.fields = d;
					},
					function(errResponse){
						console.error('Error while fetching Fields');
					}
				);
			}
			
			var stompClient = null;

			$scope.tmp = '';

			var socket = new SockJS('/notify');
			stompClient = Stomp.over(socket);
			stompClient.connect({}, function(frame) {
				console.log('Connected: ' + frame);
				stompClient.subscribe('/app/notify', function(responses){
					$scope.$apply(function() {
						$scope.tmp = responses.body;
					});
				});
				stompClient.subscribe('/topic/notify', function(responses){
					$scope.$apply(function() {
						$scope.tmp = responses.body;
						fetchAllUsers();
					});
				});
			});
			
		}]);
	</script>
  </body>
</html>
