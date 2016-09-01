/**
 * Created by cocozub on 30.08.2016.
 */

var app = angular.module("app", []);

app.controller('subscribeCtrl', function ($scope) {

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
});
