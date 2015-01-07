angular.module 'thundurus'
.controller 'teampagectrl', (fbFactory, $rootScope, $location) ->
  vm = @
  vm.team = {}
  vm.weakness = {}
  vm.weak = {}
  vm.strengths = {}
  matches = $location.$$path.match /\/teams\/(.*)/
  teamSrc = matches[1]
  fbFactory.getTeams ->
    for team in $rootScope.teams
      vm.team = team.pokemon if teamSrc is team.teamName
    console.log vm.team
    for pokemon in vm.team
      for type in pokemon.types
        checkStrengths type.name
    for weak, val of vm.weakness
      vm.strengths[weak] = Math.abs(val) if val < 0
    for key, val of vm.weakness
      vm.weak[key] = val if val > 0
    console.log vm.weakness

  obj = {}
  types = 'normal fighting flying poison ground rock bug ghost steel fire water grass electric psychic ice dragon dark fairy'.split ' '
  for type, i in types
    obj[types[i]] = {}
    for type, j in types
      obj[types[i]][types[j]]=0

  obj.normal.fighting = 1
  obj.normal.ghost = -2
  obj.fighting.flying = 1
  obj.fighting.rock = -1
  obj.fighting.bug = -1
  obj.fighting.psychic = 1
  obj.fighting.dark = -1
  obj.fighting.fairy = 1
  obj.flying.fighting = -1
  obj.flying.ground = -2
  obj.flying.rock = 1
  obj.flying.bug = -1
  obj.flying.grass = -1
  obj.flying.electric = 1
  obj.flying.ice = 1
  obj.poison.fighting = -1
  obj.poison.poison = -1
  obj.poison.ground = 1
  obj.poison.bug = -1
  obj.poison.grass = -1
  obj.poison.psychic = 1
  obj.poison.fairy = -1
  obj.ground.poison = -1
  obj.ground.rock = -1
  obj.ground.water = 1
  obj.ground.grass = 1
  obj.ground.electric = -2
  obj.ground.ice = 1
  obj.rock.normal = -1
  obj.rock.fighting = 1
  obj.rock.flying = -1
  obj.rock.poison = -1
  obj.rock.ground = 1
  obj.rock.steel = 1
  obj.rock.fire = -1
  obj.rock.water = 1
  obj.rock.grass = 1
  obj.bug.fighting = -1
  obj.bug.flying = 1
  obj.bug.ground = -1
  obj.bug.rock = 1
  obj.bug.fire = 1
  obj.bug.grass = -1
  obj.ghost.normal = -2
  obj.ghost.fighting = -2
  obj.ghost.poison = -1
  obj.ghost.bug = -1
  obj.ghost.ghost = 1
  obj.ghost.dark = 1
  obj.steel.normal = -1
  obj.steel.fighting = 1
  obj.steel.flying = -1
  obj.steel.poison = -2
  obj.steel.ground = 1
  obj.steel.rock = -1
  obj.steel.bug = -1
  obj.steel.steel = -1
  obj.steel.fire = 1
  obj.steel.grass = -1
  obj.steel.psychic = -1
  obj.steel.ice = -1
  obj.steel.dragon = -1
  obj.steel.fairy = -1
  obj.fire.ground = 1
  obj.fire.rock = 1
  obj.fire.bug = -1
  obj.fire.steel = -1
  obj.fire.fire = -1
  obj.fire.water = 1
  obj.fire.grass = -1
  obj.fire.ice = -1
  obj.fire.fairy = -1
  obj.water.steel = -1
  obj.water.fire = -1
  obj.water.water = -1
  obj.water.grass = 1
  obj.water.electric = 1
  obj.water.ice = -1
  obj.grass.flying = 1
  obj.grass.poison = 1
  obj.grass.ground = -1
  obj.grass.bug = 1
  obj.grass.fire = 1
  obj.grass.water = -1
  obj.grass.grass = -1
  obj.grass.electric = -1
  obj.grass.ice = 1
  obj.electric.flying = -1
  obj.electric.ground = 1
  obj.electric.steel = -1
  obj.electric.electric = -1
  obj.psychic.fighting = -1
  obj.psychic.bug = 1
  obj.psychic.ghost = 1
  obj.psychic.psychic = -1
  obj.psychic.dark = 1
  obj.ice.fighting = 1
  obj.ice.rock = 1
  obj.ice.steel = 1
  obj.ice.fire = 1
  obj.ice.ice = -1
  obj.dragon.fire = -1
  obj.dragon.water = -1
  obj.dragon.grass = -1
  obj.dragon.electric = -1
  obj.dragon.ice = 1
  obj.dragon.dragon = 1
  obj.dragon.fairy = 1
  obj.dark.fighting = 1
  obj.dark.bug = 1
  obj.dark.ghost = -1
  obj.dark.psychic = -2
  obj.dark.dark = -1
  obj.dark.fairy = 1
  obj.fairy.fighting = -1
  obj.fairy.poison = 1
  obj.fairy.bug = -1
  obj.fairy.steel = 1
  obj.fairy.dragon = -2
  obj.fairy.dark = -1
  console.log obj

  vm.weakness[a] = 0 for a,b of obj

  checkStrengths = (type) ->
    for ele, diff of obj[type]
      vm.weakness[ele] += diff

  return
