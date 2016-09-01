/**
 * Created by cocozub on 01.09.2016.
 */
var app = angular.module("app", []);
 
app.controller('notifyCtrl', function ($scope, $timeout) {

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
            });
        });
    });
	
	$scope.notify = function () {
		$timeout(send, 300);
	};
	
	function send(){
		stompClient.send("/app/notify");
	};
});