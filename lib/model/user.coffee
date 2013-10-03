root = exports ? this

root.User = class User
  @findOne: (idOrName) ->
    data = Meteor.users.findOne(idOrName)
    if not data
      data = Meteor.users.findOne({'profile.name': new RegExp('^' + idOrName + '$', 'i')})
    new User(data)

  constructor: (@data) ->


  photoUrl: (height) ->
    if @data.services
      if @data.services.google
        picture = @data.services.google.picture
        if picture and height
          picture = "#{picture}?sz=#{height}"
      else if @data.services.github
        picture = @data.services.github.picture
        if picture and height
          picture = "#{picture}&s=#{height}"
    if not picture
      if height
        picture = Cdn.cdnify("/img/user-#{height}x#{height}.png")
      else
        picture = Cdn.cdnify('/img/user.png')
    picture

