root = exports ? this

root.Wish = class Wish
  @makeWish: (options) ->
    if not Meteor.userId()
      throw new Meteor.Error 401, "Please log in"
    _.extend(options, owner: Meteor.userId(), createdAt: new Date())
    Wishes.insert(options)

root.Wishes = new Meteor.Collection "wishes"

Wishes.allow
  insert: (userId, doc) ->
    # the user must be logged in, and the document must be owned by the user
    userId and doc.owner == userId

  update: (userId, doc, fields, modifier) ->
    # can only change your own documents
    doc.owner == userId

  remove: (userId, doc) ->
    # can only remove your own documents
    doc.owner == userId

  fetch: ['owner']
