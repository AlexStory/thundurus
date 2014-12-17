(function() {
  angular.module('thundurus').controller('HomeController', function(pkmnFactory) {
    var vm;
    vm = this;
    vm.pokemon;
    pkmnFactory.setPokes(function() {
      vm.pokemon = pkmnFactory.pokemon;
      return console.log(vm.pokemon);
    });
  });

}).call(this);
