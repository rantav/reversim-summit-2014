class @User extends Minimongoid

  @_collection: Meteor.users

  @has_many: [
    {name: 'proposals'}
  ]

  @current: ->
    User.init(Meteor.user()) if Meteor.userId()

  @allSpeakers: ->
    User.where('profile.submitted': true)

  name: -> @profile.name
  bio: -> @profile.bio
  hasBio: -> !!@profile.bio
  me: -> @id == Meteor.userId()

  editing: -> @profile.editing
  toggleEdit: -> @update('profile.editing': not @editing())
  unedit: -> @update('profile.editing': false)

  hasProposalInStatus: (statuses) ->
    for p in @proposals()
      if p.status in statuses
        return true
    return false

  proposalsInStatus: (statuses) ->
    p for p in @proposals() when p.status in statuses

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

@User._collection.allow
  update: (userId, doc, fields, modifier) ->
    # can only change your own profile
    doc._id == userId

  fetch: ['_id']
