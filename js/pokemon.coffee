angular.module "thundurus"
.factory "pkmnFactory", ($http) ->
  pokemon = []

  setPokes = (cb)->
    $http.get "doc.json"
      .success (data) ->
        for d,v of data
          v.typeList = v.types.map (t) ->
            t.name
          .join('/')
          pokemon.push v
        cb()
  pokemon : pokemon
  setPokes : setPokes
