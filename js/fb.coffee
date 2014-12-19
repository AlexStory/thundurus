angular.module 'thundurus'
.factory 'fbFactory', ($rootScope, $http) ->
  ref = new Firebase 'https://thundurus.firebaseio.com/'

  getTeams = ->
    $http.get ref + 'users/' + user.uid + '/teams/.json'
