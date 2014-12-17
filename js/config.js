(function() {
  angular.module("thundurus").config(function($routeProvider) {
    return $routeProvider.when("/", {
      templateUrl: 'views/_home.html',
      controller: 'HomeController',
      controllerAs: 'home'
    });
  });

}).call(this);
