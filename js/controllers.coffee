angular.module 'thundurus'
.controller 'HomeController', (pkmnFactory, fbFactory, $rootScope) ->
  vm = @
  vm.pokemon = []
  vm.order='national_id'
  vm.reversed = false
  vm.changed = false

  vm.changeOrder = (input) ->
    if input is vm.order then vm.reversed = !vm.reversed else vm.reversed = on
    vm.order = input
    return

  pkmnFactory.setPokes (data)->
    vm.pokemon = data

  vm.add = (poke) ->
    delete poke.$$hashKey
    delete poke.moves
    fbFactory.addPoke(poke)
    return
  return
