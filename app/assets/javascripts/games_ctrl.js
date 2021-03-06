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
      $http.get('/api/v1/pubs.json').then(function(response) {
        $scope.pubs = response.data;

      });
      $http.get('/api/v1/pub_games.json').then(function(response) {
        $scope.pubGames = response.data;

      });
      $http.get('/api/v1/user_games.json').then(function(response) {
        $scope.userGames = response.data;

      });
      $http.get('/api/v1/teams.json').then(function(response) {
        $scope.teams = response.data;

      });
      $http.get('/api/v1/teams.json').then(function(response) {
        $scope.teams = response.data;

      });

    };
    

    $scope.addGameToPubGame = function(pub_id, game_id, date) {

      var duplicate = $scope.pubGames.filter(function(pubGame) {
        return pubGame.game_id === parseInt(game_id) && pubGame.pub_id === parseInt(pub_id);
      });
      console.log(duplicate);
      // console.log(game_id, pub_id);
      if (duplicate.length === 0) {
        var params = {
          pub_id: pub_id,
          game_id: game_id,
          date: date
        };
        console.log(params);

        $http.post('/api/v1/pub_games.json', params).then(function(response) {
          var notification = alertify.notify('Game added', 'success', 1, function(){  console.log('dismissed'); });
          // console.log(response);
          $scope.pubGames.push(response.data);
        });
      } else {
          var notification = alertify.notify('Game already added', 'error', 1, function(){  console.log('dismissed'); });

      }

    };

    $scope.addGameToUserGame = function(pub_id, game_id, user_id) {

      var duplicates = $scope.userGames.filter(function(userGame) {
        return userGame.game_id === parseInt(game_id) && userGame.pub_id === parseInt(pub_id) && userGame.user_id === parseInt(user_id);
      });
      if (duplicates.length === 0) {
        var params = {
          pub_id: pub_id,
          game_id: game_id,
          user_id: user_id
        };
        console.log('addGameToUserGame', params);
        $http.post('/api/v1/user_games.json', params).then(function(response) {
          var notification = alertify.notify('Game added', 'success', 1, function(){  console.log('dismissed'); });
          console.log(response);
          $scope.userGames.push(response.data);

        });
      } else {
        var notification = alertify.notify('Game already added', 'error', 1, function(){  console.log('dismissed'); });
      }
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
      // console.log($scope.nochampMatches.length);

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

    $scope.equalDate = function(prop, value) {

      return function(item) {
        if (!value) {
          return true;
          console.log("games this day");

        }
        var d1 = new Date(item[prop]);
        var d2 = new Date(value);
        return d1.getMonth() === d2.getMonth() && d1.getDate() === d2.getDate() && d1.getFullYear() === d2.getFullYear();
        // if (!item) {
        //   document.getElementsByClassName("panel-body").innerHTML = "No matches on this date";
        // }
      }
    };

    window.$scope = $scope;
  });
})();
