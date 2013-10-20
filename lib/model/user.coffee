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
  trackRecord: -> @profile.trackRecord

  me: -> @id == Meteor.userId()

  editing: -> @profile.editing
  toggleEdit: -> @update('profile.editing': not @editing())
  unedit: -> @update('profile.editing': false)

  hasProposalInStatus: (statuses) ->
    for p in @proposals()
      if p.status in statuses
        return true
    return false

  admin: -> @hasRole('admin') or @name() == 'Ran Tavory'
  moderator: -> @hasRole('moderator')

  hasRole: (role) -> @roles and @roles[role]

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
    user = User.find(userId)
    admin = user and user.admin()
    if 'roles' in fields
      return if admin then true else false
    # can only change your own profile
    if doc._id == userId then return true
    if admin then return true
    false

  remove: (userId, doc) ->
    user = User.find(userId)
    admin = user and user.admin()
    admin # only admins can remove

  fetch: ['_id', 'roles']

