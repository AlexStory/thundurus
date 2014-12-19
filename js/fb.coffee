angular.module 'thundurus'
.factory 'fbFactory', ($rootScope) ->
  ref = new Firebase 'https://thundurus.firebaseio.com/'
