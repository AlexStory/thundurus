angular.module "thundurus"
.controller "NavController", (fbFactory, $scope, $rootScope) ->
  vm = @

  vm.showLog = ->
    $ '.logform'
    .toggleClass 'show'
    return
  ref = new Firebase 'https://thundurus.firebaseio.com/'

  vm.register = ->
    ref.createUser
      email: vm.email
      password: vm.password
      , (error, authData) ->
        if error
          switch error.code
            when "EMAIL_TAKEN"
              console.log "The new user account cannot be created because the email is already in use."
            when "INVALID_EMAIL"
              console.log "The specified email is not a valid email."
            else
              console.log "Error creating user:", error
        else
          console.log "User account created successfully!"
          ref.child 'users'
          .child authData.uid
          .child 'authData'
          .set authData

  vm.login = ->
    ref.authWithPassword
      "email": vm.email,
      "password": vm.password
      , (error, authData) ->
        if (error)
          console.log "Login Failed!", error
        else
          console.log "Authenticated successfully with payload:", authData
          $rootScope.user = ref.getAuth()
          $scope.$apply()
          vm.showLog()
          return

  vm.getAuth = ->
    authData = ref.getAuth()
    if authData
      $rootScope.user = authData
      return
    return

  vm.unauth = ->
    ref.unauth()
    $rootScope.user = null
    vm.showLog()

  vm.getAuth()

  return
