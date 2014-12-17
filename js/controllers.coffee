angular.module 'thundurus'
.controller 'HomeController', (pkmnFactory) ->
  vm = @
  vm.pokemon

  pkmnFactory.setPokes ->
    vm.pokemon = pkmnFactory.pokemon
    console.log(vm.pokemon)
  return
