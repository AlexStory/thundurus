angular.module "thundurus"
.config ($routeProvider) ->
  $routeProvider
    .when "/",
      templateUrl: 'views/_splash.html'
    .when "/pokemon",
      templateUrl: 'views/_home.html'
      controller: 'HomeController'
      controllerAs: 'home'
    .when "/teams",
      templateUrl: 'views/_teams.html'
      controller: 'Teamctrl'
      controllerAs: 'teamctrl'
    .when "/pokemon/:id",
      templateUrl: 'views/_pokepage.html'
      controller: 'pokepagectrl'
      controllerAs: 'pokectrl'
    .when "/teams/:id",
      templateUrl: 'views/_teampage.html'
      controller: 'teampagectrl'
      controllerAs: 'teamctrl'
    .otherwise
      redirectTo : '/'
    return
