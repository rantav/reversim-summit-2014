class @User extends Minimongoid

  @_collection: Meteor.users

  # @findOne: (idOrName) ->
  #   data = Meteor.users.findOne(idOrName)
  #   if not data
  #     data = Meteor.users.findOne({'profile.name': new RegExp('^' + idOrName + '$', 'i')})
  #   new User(data)

  @has_many: [
    {name: 'proposals'}
  ]

  @current: ->
    User.init(Meteor.user()) if Meteor.userId()

  name: -> @profile.name

  photoUrl: (height) ->
    if @services
      if @services.google
        picture = @services.google.picture
        if picture and height
          picture = "#{picture}?sz=#{height}"
      else if @services.github
        picture = @services.github.picture
        if picture and height
          picture = "#{picture}&s=#{height}"
      else if @services.facebook
        picture = "http://graph.facebook.com/#{@services.facebook.id}/picture/"
        if height
          picture = "#{picture}?height=#{height/2}&width=#{height/2}"
      else if @services.twitter
        picture = @services.twitter.profile_image_url
    if not picture
      if height
        picture = Cdn.cdnify("/img/user-#{height}x#{height}.png")
      else
        picture = Cdn.cdnify('/img/user.png')
    picture

