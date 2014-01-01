log = new Logger('startup');
Meteor.startup ->

  if process.env.METEOR_MIGRATIONS_OFF
    log.info("METEOR_MIGRATIONS_OFF is set, will not run migrations")
    return

  # Meteor.Migrations.add 'make me admin on vector', ((log) ->
  #   update = User._collection.update({'profile.name': 'Ran Tavory'},
  #     {$set: {'profile.role': 'administrator'}})
  #   log.info("Updated: #{update}"))

  Meteor.Migrations.add('multiple speakers', ((log) ->
    log.info('Migrating Users')
    User._collection.find().forEach((u) ->
      proposal_ids = Proposal._collection.find({user_id: u._id}).map((p) -> p._id)
      User._collection.update({_id: u._id}, {$set: {proposal_ids: proposal_ids}})
      log.info("#{u._id}: #{proposal_ids}")
    )
    log.info('Migrating Proposals')
    Proposal._collection.find().forEach((p) ->
      Proposal._collection.update({_id: p._id}, {$set: {speaker_ids: [p.user_id]}})
      log.info("#{p._id}: #{p.user_id}")
    )
  ), force: false)
