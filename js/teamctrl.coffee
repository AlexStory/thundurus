angular.module 'thundurus'
.controller 'Teamctrl', (fbFactory, $rootScope, pkmnFactory, $location) ->
  vm = @
  pokemon=[]

  vm.edit = ''

  vm.changeEdit = (input)->
    if vm.edit is input then vm.edit = '' else vm.edit = input
    return
  vm.addTeam = ->
    fbFactory.addTeam()
    return

  vm.select = (teamName)->
    $rootScope.selected = teamName
    $location.path '/pokemon'

  vm.createRandom = ->
    temp = {}
    temp.pokemon ={}
    range = [0..5]
    for i in range
      num = Math.floor(Math.random()*719)
      poke = pokemon[num]
      delete poke.moves
      temp.pokemon[num] = poke
    fbFactory.addTeam(temp)
    fbFactory.getTeams()

  vm.addRandom = (team) ->
    old = $rootScope.selected
    newOne = team.teamName
    $rootScope.selected = newOne
    num = Math.floor(Math.random()*719)
    poke = pokemon[num]
    delete poke.moves
    fbFactory.addPoke(poke)
    $rootScope.selected = old
    fbFactory.getTeams()

  vm.deleteTeam = (id) ->
    fbFactory.deleteTeam(id)
    return

  vm.deletePoke = (id, poke) ->
    fbFactory.deletePoke(id, poke)
    vm.changeEdit(id)
    return

  pkmnFactory.setPokes (data)->
    pokemon = data

  fbFactory.getTeams()
  return
