(function() {
  angular.module("thundurus").factory("pkmnFactory", function($http) {
    var pokemon, setPokes;
    pokemon = [];
    setPokes = function(cb) {
      return $http.get("doc.json").success(function(data) {
        var d, v;
        for (d in data) {
          v = data[d];
          v.typeList = v.types.map(function(t) {
            return t.name;
          }).join('/');
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
