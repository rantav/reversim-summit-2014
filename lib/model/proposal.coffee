class @Proposal extends Minimongoid

  notDeleted = $or: [{deleted: $exists: false}, {deleted: false}]

  @_collection: new Meteor.Collection "proposals"

  @belongs_to: [
    {name: 'user'}
  ]

  @propose: (options) ->
    if not Meteor.userId()
      throw new Meteor.Error 401, "Please log in"
    Proposal.create(options)

  @before_create: (attr) ->
    _.extend(attr, user_id: Meteor.userId(), votes: {}, comments: [], status: 'submitted')
    attr

  @count: ->
    @find(notDeleted).count()

  @all: (options)->
    @where(notDeleted, options)

  @types: ->
    full: 'Full Talk'
    ignite: 'Ignite Talk'
    workshop: 'Workshop'

  delete: ->
    @update(deleted: true)

  toggleEdit: ->
    @update(editing: (not @editing))

  # Does this proposal belong to the current user?
  mine: ->
    @user_id == Meteor.userId()

  typeName: ->
    Proposal.types()[@type]

@Proposal._collection.allow
  insert: (userId, doc) ->
    # the user must be logged in, and the document must be owned by the user
    userId and doc.user_id == userId

  update: (userId, doc, fields, modifier) ->
    # can only change your own documents
    if doc.user_id == userId then return true

    # Admins can also modify documents
    if User.current().admin() then return true

    # can also vote
    if (userId and
        fields.length == 1 and
        fields[0] == 'votes' and
        modifier.$set and
        modifier.$set.hasOwnProperty("votes.#{userId}"))
      return true

  fetch: ['user_id']

@Proposal._collection.deny
  update: (userId, doc, fields, modifier) ->
    # owner can't vote for himself
    doc.user_id == userId and 'votes' in fields

  fetch: ['user_id']
