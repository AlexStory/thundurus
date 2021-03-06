(function() {
  angular.module("thundurus").controller("NavController", function(fbFactory, $scope, $rootScope) {
    var ref, vm;
    vm = this;
    vm.showLog = function() {
      $('.logform').toggleClass('show');
    };
    ref = new Firebase('https://thundurus.firebaseio.com/');
    vm.register = function() {
      return ref.createUser({
        email: vm.email,
        password: vm.password
      }, function(error, authData) {
        if (error) {
          switch (error.code) {
            case "EMAIL_TAKEN":
              return console.log("The new user account cannot be created because the email is already in use.");
            case "INVALID_EMAIL":
              return console.log("The specified email is not a valid email.");
            default:
              return console.log("Error creating user:", error);
          }
        } else {
          console.log("User account created successfully!");
          ref.child('users').child(authData.uid).child('authData').set(authData);
          return vm.login();
        }
      });
    };
    vm.login = function() {
      return ref.authWithPassword({
        "email": vm.email,
        "password": vm.password
      }, function(error, authData) {
        if (error) {
          return console.log("Login Failed!", error);
        } else {
          console.log("Authenticated successfully with payload:", authData);
          $rootScope.user = ref.getAuth();
          ref.child('users').child(authData.uid).child('authData').set(authData);
          $scope.$apply();
          vm.showLog();
          vm.findTeams();
        }
      });
    };
    vm.getAuth = function() {
      var authData;
      authData = ref.getAuth();
      if (authData) {
        $rootScope.user = authData;
        $rootScope.teams = [];
        return;
      }
    };
    vm.unauth = function() {
      ref.unauth();
      $rootScope.user = null;
      return vm.showLog();
    };
    vm.findTeams = function() {
      return fbFactory.getTeams();
    };
    vm.getAuth();
  });

}).call(this);
