angular.module "thundurus"
.controller "NavController", ->
  vm = @
  vm.showLog = ->
    $ '.logform'
    .toggleClass 'show'
    return
  return
