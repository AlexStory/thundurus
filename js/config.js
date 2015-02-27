(function() {
  angular.module("thundurus").config(function($routeProvider) {
    $routeProvider.when("/", {
      templateUrl: 'views/splash.html'
    }).when("/pokemon", {
      templateUrl: 'views/home.html',
      controller: 'HomeController',
      controllerAs: 'home'
    }).when("/teams", {
      templateUrl: 'views/teams.html',
      controller: 'Teamctrl',
      controllerAs: 'teamctrl'
    }).when("/pokemon/:id", {
      templateUrl: 'views/pokepage.html',
      controller: 'pokepagectrl',
      controllerAs: 'pokectrl'
    }).when("/teams/:id", {
      templateUrl: 'views/teampage.html',
      controller: 'teampagectrl',
      controllerAs: 'teamctrl'
    }).otherwise({
      redirectTo: '/'
    });
  });

}).call(this);
