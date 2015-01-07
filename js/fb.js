(function() {
  angular.module('thundurus').factory('fbFactory', function($rootScope, $http) {
    var addPoke, addTeam, deletePoke, deleteTeam, getTeams, ref, url;
    url = 'https://thundurus.firebaseio.com/';
    ref = new Firebase(url);
    getTeams = function(cb) {
      $http.get(url + 'users/' + $rootScope.user.uid + '/teams/.json').success(function(data) {
        var d, e, f, pokes, temp, v;
        $rootScope.teams = [];
        for (d in data) {
          v = data[d];
          if (v === '') {
            v = {};
          }
          v.teamName = d;
          pokes = v.pokemon;
          temp = [];
          for (e in pokes) {
            f = pokes[e];
            if (f === '') {
              f = {};
            }
            f.pokeName = e;
            temp.push(f);
          }
          v.pokemon = temp;
          $rootScope.teams.push(v);
        }
        if (cb) {
          cb();
        }
      });
    };
    addPoke = function(poke, cb) {
      var d, sameTeam, team, teamlength, tooLarge, v, _i, _len, _ref, _ref1, _results;
      teamlength = 0;
      tooLarge = false;
      sameTeam = false;
      _ref = $rootScope.teams;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        team = _ref[_i];
        teamlength = 0;
        _ref1 = team.pokemon;
        for (d in _ref1) {
          v = _ref1[d];
          teamlength += 1;
        }
        if (teamlength > 5) {
          tooLarge = true;
        }
        if ($rootScope.selected === team.teamName) {
          sameTeam = true;
        }
        if (tooLarge && sameTeam) {
          alert('Teams Can not have more than six Pokemon!');
        }
        if (!tooLarge && sameTeam) {
          ref.child('users').child($rootScope.user.uid).child('teams').child($rootScope.selected).child('pokemon').push(poke);
        }
        tooLarge = false;
        _results.push(sameTeam = false);
      }
      return _results;
    };
    addTeam = function(input) {
      if (input == null) {
        input = "";
      }
      ref.child('users').child($rootScope.user.uid).child('teams').push(input);
      getTeams();
    };
    deleteTeam = function(id, cb) {
      return $http["delete"](url + 'users/' + $rootScope.user.uid + '/teams/' + id + '.json').success(function() {
        getTeams();
        if (cb) {
          return cb();
        }
      });
    };
    deletePoke = function(id, poke) {
      return $http["delete"](url + 'users/' + $rootScope.user.uid + '/teams/' + id + '/pokemon/' + poke + '.json').success(function() {
        var i, pokemon, team, _i, _j, _len, _len1, _ref, _ref1;
        _ref = $rootScope.teams;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          team = _ref[_i];
          _ref1 = team.pokemon;
          for (i = _j = 0, _len1 = _ref1.length; _j < _len1; i = ++_j) {
            pokemon = _ref1[i];
            if (team.teamName === id && pokemon.pokeName === poke) {
              pokemon;
            }
          }
        }
        return getTeams();
      });
    };
    return {
      getTeams: getTeams,
      addPoke: addPoke,
      addTeam: addTeam,
      deleteTeam: deleteTeam,
      deletePoke: deletePoke
    };
  });

}).call(this);
