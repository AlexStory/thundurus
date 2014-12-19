(function() {
  angular.module('thundurus').controller('HomeController', function(pkmnFactory) {
    var vm;
    vm = this;
    vm.pokemon = [];
    vm.order = 'national_id';
    vm.reversed = false;
    vm.changed = false;
    vm.changeOrder = function(input) {
      if (input === vm.order) {
        vm.reversed = !vm.reversed;
      } else {
        vm.reversed = true;
      }
      vm.order = input;
    };
    pkmnFactory.setPokes(function(data) {
      return vm.pokemon = data;
    });
  });

}).call(this);
