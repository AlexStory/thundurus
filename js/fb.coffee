angular.module 'thundurus'
.factory 'fbFactory', ($rootScope, $http) ->
  url = 'https://thundurus.firebaseio.com/'
  ref = new Firebase url

  getTeams = (cb)->
    $http.get  url + 'users/' + $rootScope.user.uid + '/teams/.json'
    .success (data) ->
      $rootScope.teams = []
      for d, v of data
        v = {} if v is ''
        v.teamName = d
        pokes = v.pokemon
        temp = []
        for e,f of pokes
          f = {} if f is ''
          f.pokeName = e
          temp.push f
        v.pokemon = temp
        $rootScope.teams.push v
      cb() if cb
      return
    return

  addPoke = (poke, cb)->
    teamlength = 0
    tooLarge = false
    sameTeam = false
    for team in $rootScope.teams
      teamlength = 0
      teamlength +=1 for d, v of team.pokemon
      tooLarge = on if teamlength > 5
      sameTeam = on if $rootScope.selected is team.teamName
      alert 'Teams Can not have more than six Pokemon!' if tooLarge and sameTeam
      if not tooLarge and sameTeam
        ref.child 'users'
        .child $rootScope.user.uid
        .child 'teams'
        .child $rootScope.selected
        .child 'pokemon'
        .push(poke)
      tooLarge = false
      sameTeam = false



  addTeam = (input="") ->
    ref.child 'users'
    .child $rootScope.user.uid
    .child 'teams'
    .push(input)
    getTeams()
    return

  deleteTeam =(id, cb)->
    $http.delete url + 'users/' + $rootScope.user.uid + '/teams/' + id + '.json'
    .success ->
      # for team in $rootScope.teams
        # $rootScope.teams.pop(team) if team.teamName is id
      getTeams()
      cb() if cb

  deletePoke =(id, poke)->
    $http.delete url + 'users/' + $rootScope.user.uid + '/teams/' + id + '/pokemon/' + poke + '.json'
    .success ->
      for team in $rootScope.teams
        for pokemon, i in team.pokemon
          pokemon if team.teamName is id and pokemon.pokeName is poke
      getTeams()


  getTeams: getTeams
  addPoke: addPoke
  addTeam: addTeam
  deleteTeam: deleteTeam
  deletePoke: deletePoke
