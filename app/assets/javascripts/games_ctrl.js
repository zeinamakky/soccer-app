/* global angular */
(function() {
  angular.module("app").controller("gamesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/games.json').then(function(response) {
        $scope.matches = response.data;
        console.log(response.data);
      });
    };
    
    window.$scope = $scope;
  });
})();