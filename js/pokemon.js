(function() {
  angular.module("thundurus").factory("pkmnFactory", function($http) {
    var pokemon, setPokes;
    pokemon = [];
    setPokes = function(cb) {
      return $http.get("doc.json").success(function(data) {
        var d, v;
        for (d in data) {
          v = data[d];
          pokemon.push(v);
        }
        return cb();
      });
    };
    return {
      pokemon: pokemon,
      setPokes: setPokes
    };
  });

}).call(this);
