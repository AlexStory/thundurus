angular.module "thundurus"
.config ($routeProvider) ->
  $routeProvider
    .when "/",
    templateUrl: 'views/_home.html'
    controller: 'HomeController'
    controllerAs: 'home'
