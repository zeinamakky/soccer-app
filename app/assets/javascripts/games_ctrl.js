/* global angular */
(function() {
  angular.module("app").controller("gamesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/games.json').then(function(response) {
        $scope.matches = response.data;
        console.log(response.data);
        
        var dateToday = new Date();
        $scope.todayJson = JSON.stringify(dateToday);
        // console.log($scope.today);  // "2014-01-01T23:28:56.782Z"
        $scope.today = JSON.parse($scope.todayJson);
        console.log($scope.today);

        // for (var i = 0; i < $scope.matches.length; i++) {
        //   $scope.matchDate = '"' + $scope.matches[i].date + '"';
      
        //   console.log($scope.matchDate);

        //   if ($scope.matchDate > new Date()) {
        //     console.log("yes");
        //   }
        // }
      });
    };
    $scope.sayYes = function() {
      console.log("yes!");
    };
    // $scope.dateFormat = function() {
    //   for (var i = 0; i < $scope.matches.length; i++) {
    //     $scope.matchDate = '"' + $scope.matches[i].date + '"';
      
    //     // console.log($scope.matchDate);

    //     if ($scope.matchDate > new Date()) {
    //       console.log("yes");
    //     }
    //   }
    // };
   
    $scope.upcomingMatches = function(match) {
      match.date;
    };
   


    $scope.showNewGames = function(match) {
      if (match.date >= $scope.dateToday) {
        return match;
      }
      
      
    };
    window.$scope = $scope;
  });
})();