angular.module "thundurus"
.config ($routeProvider) ->
  $routeProvider
    .when "/",
      templateUrl: 'views/_splash.html'
    .when "/pokemon",
      templateUrl: 'views/_home.html'
      controller: 'HomeController'
      controllerAs: 'home'
    return
