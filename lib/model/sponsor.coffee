class @Sponsor extends Minimongoid

  @_collection: Vector.collections.sponsors

@Sponsor._collection.allow
  insert: (userId, doc) ->
    User.find(userId).isAdmin()

  update: (userId, doc, fields, modifier) ->
    User.find(userId).isAdmin()
