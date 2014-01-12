class @AgendaItem extends Minimongoid

  @_collection: new Meteor.Collection "agenda"


admin = (userId) ->
  user = User.find(userId)
  return user.admin() or user.moderator()

@AgendaItem._collection.allow
  insert: (userId, doc) -> admin(userId)
  update: (userId, doc, fields, modifier) -> admin(userId)
  remove: (userId, doc) -> admin(userId)
  fetch: []
