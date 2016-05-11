/* global angular */
(function() {
  angular.module("app").controller("gamesCtrl", function($scope, $http) {
    $scope.setup = function() {

      $http.get('/api/v1/games.json').then(function(response) {
        $scope.matches = response.data;

        // console.log($scope.matches.length);
        
        var dateToday = new Date();
        $scope.todayJson = JSON.stringify(dateToday);
        $scope.today = JSON.parse($scope.todayJson);

      });
      $http.get('/api/v1/pubs.json').then(function(response){
        $scope.pubs = response.data;

      });
      $http.get('/api/v1/pub_games.json').then(function(response){
        $scope.pubGames = response.data;

      });

    };
    $scope.addGameToPubGame = function(pub_id, game_id) {
     
      var params = {
        pub_id: pub_id,
        game_id: game_id
      };
     // if ($scope.pubGames.indexOf(pub_id, game_id) === -1) {
      // $scope.pubGames.push(item);
    
      console.log('addGameToPubGame', params);
      $http.post('/api/v1/pub_games.json', params).then(function(response) {
        // console.log(response);
        var notification = alertify.notify('Game added', 'success', 5, function(){  console.log('dismissed'); });
        // alertify.success("game added");
        
      });
    // $scope.pub_games.push({pub_id: pub_id, game_id: game_id});
    // $scope.notification = alertify.notify('sample', 'success', 5, function(){  console.log('dismissed'); });
      // }
    };

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