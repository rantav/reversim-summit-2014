Accounts.onCreateUser (options, user) ->
  # Take care of github details
  if (user.services.github)
      accessToken = user.services.github.accessToken
      result = Meteor.http.get("https://api.github.com/user", {
        params: {
          access_token: accessToken
        }
      })

      if (result.error) then throw result.error

      user.services.github.picture = result.data.avatar_url
      user.services.github.url = result.data.url
      user.services.github.html_url = result.data.html_url
      # Some GH users don't have a name. Use their usernames instead.
      if not options.profile.name then options.profile.name = user.services.github.username

  # Google login details take care of themselves

  # Now set up the profile
  if options.profile
    user.profile = options.profile
  else
    user.profile = {}

  user
