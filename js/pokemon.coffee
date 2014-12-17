angular.module "thundurus"
.factory "pkmnFactory", ($http) ->
  pokemon = []

  setPokes = (cb)->
    $http.get "doc.json"
      .success (data) ->
        for d,v of data
          pokemon.push v
        cb()
  pokemon : pokemon
  setPokes : setPokes
