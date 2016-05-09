/* global angular */
(function() {
  angular.module("app").controller("gamesCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/games.json').then(function(response) {
        $scope.matches = response.data;
        console.log($scope.matches.length);
        
        var dateToday = new Date();
        $scope.todayJson = JSON.stringify(dateToday);
        // console.log($scope.today);  // "2014-01-01T23:28:56.782Z"
        $scope.today = JSON.parse($scope.todayJson);
        // console.log($scope.today);

      });
    };
    // var matches = $scope.matches;
    // $scope.noUpcomingMatches = [];
    // for (var i = 0; i < matches.length; i++) {
    //   if ($scope.matches[i].date > $scope.today) {
    //     $scope.noUpcomingMatches.push($scope.matches[i]);
    //   }
    // }
    // console.log($scope.noUpcomingMatches);
    $scope.nochampMatches = [];
    $scope.nopremMatches = [];
    $scope.noereMatches = [];
    $scope.noligueMatches = [];
    $scope.nobuliMatches = [];
    $scope.noserieMatches = [];

    $scope.noUpcomingMatches = function() {
      $scope.matches.forEach(function(match) {
        if (match.date > $scope.today) {
          if (match.league === "Champions League") {
            $scope.nochampMatches.push(match);
          } else if (match.league === "Premier League") {
            $scope.nopremMatches.push(match);
          } else if (match.league === "Ligue 1") {
            $scope.noligueMatches.push(match);
          } else if (match.league === "Bundesliga") {
            $scope.nobuliMatches.push(match);
          } else if (match.league === "Serie A") {
            $scope.noserieMatches.push(match);
          } else if (match.league === "Eredivisie") {
            $scope.noereMatches.push(match);
          }
        }
      });
      console.log($scope.nochampMatches.length);

      if ($scope.nochampMatches.length === 0) {
        document.getElementById('noChampMatches').innerHTML = "No upcoming matches.";
      } else {
        document.getElementById('noChampMatches').innerHTML = " ";
      }
      if ($scope.nopremMatches.length === 0) {
        document.getElementById('noPremMatches').innerHTML = "No upcoming matches.";
      } else {
        document.getElementById('noPremMatches').innerHTML = " ";
      }
      if ($scope.nobuliMatches.length === 0) {
        document.getElementById('noBuliMatches').innerHTML = "No upcoming matches.";
      } else
      {
        document.getElementById('noBuliMatches').innerHTML = " ";
      }
      if ($scope.noereMatches.length === 0) {
        document.getElementById('noEreMatches').innerHTML = "No upcoming matches.";
      } else {
        document.getElementById('noEreMatches').innerHTML = " ";
      }
      if ($scope.noserieMatches.length === 0) {
        document.getElementById('noSerieMatches').innerHTML = "No upcoming matches.";
      } else {
        document.getElementById('noSerieMatches').innerHTML = " ";
      }
      if ($scope.noligueMatches.length === 0) {
        document.getElementById('noLigueMatches').innerHTML = "No upcoming matches.";
      } else {
        document.getElementById('noLigueMatches').innerHTML = " ";
      }
    };
    window.$scope = $scope;
  });
})();