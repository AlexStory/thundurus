(function() {
  angular.module("thundurus").config(function($routeProvider) {
    $routeProvider.when("/", {
      templateUrl: 'views/_splash.html'
    }).when("/pokemon", {
      templateUrl: 'views/_home.html',
      controller: 'HomeController',
      controllerAs: 'home'
    }).otherwise({
      redirectTo: '/'
    });
  });

}).call(this);
