Template.about.moderators = ->
  User.allModerators()

Template.about.photo = (user)->
  user.photoUrl(120)