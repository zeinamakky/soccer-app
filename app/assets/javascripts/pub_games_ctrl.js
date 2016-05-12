/* global angular */
(function() {
  angular.module("app").controller("pubGamesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/pub_games.json').then(function(response) {
        $scope.pubGames = response.data;
        console.log(response.data);
      });
    };
    
  });
  
})();