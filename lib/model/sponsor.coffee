class @Sponsor extends Minimongoid

  @_collection: Vector.collections.sponsors
  # @_collection: new Meteor.Collection('sponsors')

  logo: (height) ->
    url = @logoUrl
    if url
      Cdn.cdnify(url)

@Sponsor._collection.allow
  insert: (userId, doc) ->
    User.find(userId).isAdmin()

  update: (userId, doc, fields, modifier) ->
    User.find(userId).isAdmin()
