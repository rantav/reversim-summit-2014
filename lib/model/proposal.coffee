root = exports ? this

root.Proposal = class Proposal
  @propose: (options) ->
    if not Meteor.userId()
      throw new Meteor.Error 401, "Please log in"
    _.extend(options, owner: Meteor.userId(), createdAt: new Date(), votes: {}, comments: [])
    Proposals.insert(options)

  @delete: (proposalData) ->
    Proposals.update(proposalData._id, $set: deleted: true)

root.Proposals = new Meteor.Collection "proposals"

Proposals.allow
  insert: (userId, doc) ->
    # the user must be logged in, and the document must be owned by the user
    userId and doc.owner == userId

  update: (userId, doc, fields, modifier) ->
    # can only change your own documents
    if doc.owner == userId then return true

    # can also vote
    if (userId and
        fields.length == 1 and
        fields[0] == 'votes' and
        modifier.$set and
        modifier.$set.hasOwnProperty("votes.#{userId}"))
      return true

  fetch: ['owner']

Proposals.deny
  update: (userId, doc, fields, modifier) ->
    # owner can't vote for himself
    doc.owner == userId and 'votes' in fields

  fetch: ['owner']
