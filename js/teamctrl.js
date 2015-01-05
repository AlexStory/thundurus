(function() {
  angular.module('thundurus').controller('Teamctrl', function(fbFactory, $rootScope, pkmnFactory, $location) {
    var pokemon, vm;
    vm = this;
    pokemon = [];
    vm.edit = '';
    vm.changeEdit = function(input) {
      if (vm.edit === input) {
        vm.edit = '';
      } else {
        vm.edit = input;
      }
    };
    vm.addTeam = function() {
      fbFactory.addTeam();
    };
    vm.select = function(teamName) {
      $rootScope.selected = teamName;
      return $location.path('/pokemon');
    };
    vm.createRandom = function() {
      var i, num, poke, range, temp, _i, _len;
      temp = {};
      temp.pokemon = {};
      range = [0, 1, 2, 3, 4, 5];
      for (_i = 0, _len = range.length; _i < _len; _i++) {
        i = range[_i];
        num = Math.floor(Math.random() * 719);
        poke = pokemon[num];
        delete poke.moves;
        temp.pokemon[num] = poke;
      }
      fbFactory.addTeam(temp);
      return fbFactory.getTeams();
    };
    vm.addRandom = function(team) {
      var newOne, num, old, poke;
      old = $rootScope.selected;
      newOne = team.teamName;
      $rootScope.selected = newOne;
      num = Math.floor(Math.random() * 719);
      poke = pokemon[num];
      delete poke.moves;
      fbFactory.addPoke(poke);
      $rootScope.selected = old;
      return fbFactory.getTeams();
    };
    vm.deleteTeam = function(id) {
      fbFactory.deleteTeam(id);
    };
    vm.deletePoke = function(id, poke) {
      fbFactory.deletePoke(id, poke);
      vm.changeEdit(id);
    };
    pkmnFactory.setPokes(function(data) {
      return pokemon = data;
    });
    fbFactory.getTeams();
  });

}).call(this);
