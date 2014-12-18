(function() {
  angular.module("thundurus").controller("NavController", function() {
    var vm;
    vm = this;
    vm.showLog = function() {
      $('.logform').toggleClass('show');
    };
  });

})();
