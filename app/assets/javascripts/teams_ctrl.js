/* global angular */
(function() {
  angular.module("app").controller("teamsCtrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/teams.json').then(function(response) {
        $scope.teams = response.data;
        console.log(response.data);
      });
      $http.get('/api/v1/user_allegiances.json').then(function(response) {
        $scope.userAllegiances = response.data;
        console.log(response.data);
      });

    };

    $scope.addTeamToUserAllegiance = function(team_id, user_id) {
      var dupes = $scope.userAllegiances.filter(function(userAllegiance) {
        return userAllegiance.user_id === parseInt(user_id) && userAllegiance.team_id === parseInt(team_id);
      });
      console.log(dupes);
      if (dupes.length === 0) {
        var params = {
          team_id: team_id,
          user_id: user_id
        };
      //   dupes.push(params);

        $http.post('/api/v1/user_allegiances.json', params).then(function(response) {
          var notification = alertify.notify('Team added', 'success', 1, function() {  console.log('dismissed'); });
          // dupes = dupes + 1;
          console.log(response);
          $scope.userAllegiances.push(response.data);
        });
      } else {
        var notification = alertify.notify('Team already added', 'error', 1, function(){  console.log('dismissed'); });

      }

    };
    window.$scope = $scope;

  });

})();