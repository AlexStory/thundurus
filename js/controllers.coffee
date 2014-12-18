angular.module 'thundurus'
.controller 'HomeController', (pkmnFactory) ->
  vm = @
  vm.pokemon
  vm.order='national_id'
  vm.reversed = false
  vm.changed = false

  vm.changeOrder = (input) ->
    if input is vm.order then vm.reversed = !vm.reversed else vm.reversed = on
    vm.order = input
    return

  pkmnFactory.setPokes ->
    vm.pokemon = pkmnFactory.pokemon
    console.log vm.pokemon
  return
