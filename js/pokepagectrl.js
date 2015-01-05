(function() {
  angular.module('thundurus').controller('pokepagectrl', function(fbFactory, $rootScope, $location, $http, $scope) {
    var vm;
    vm = this;
    vm.pokemon = {};
    $http.get("http://pokeapi.co/api/v1" + $location.$$path).success(function(data) {
      vm.pokemon = data;
      console.log(vm.pokemon);
    });
  });

}).call(this);
