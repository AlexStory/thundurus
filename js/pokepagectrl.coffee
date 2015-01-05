angular.module 'thundurus'
.controller 'pokepagectrl', (fbFactory, $rootScope, $location, $http, $scope) ->
  vm = @
  vm.pokemon = {}

  $http.get "http://pokeapi.co/api/v1" + $location.$$path
  .success (data) ->
    vm.pokemon = data
    console.log vm.pokemon
    return
  return
