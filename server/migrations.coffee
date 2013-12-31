log = new Logger('startup');
Meteor.startup ->

  if process.env.METEOR_MIGRATIONS_OFF
    log.info("METEOR_MIGRATIONS_OFF is set, will not run migrations")
    return

  # Meteor.Migrations.add 'make me admin on vector', ((log) ->
  #   update = User._collection.update({'profile.name': 'Ran Tavory'},
  #     {$set: {'profile.role': 'administrator'}})
  #   log.info("Updated: #{update}"))
  Meteor.Migrations.add('unedit all sessions', ((log) ->
    update = Proposal._collection.update({'editing': true},
      {$set: {'editing': false}},
      {multi: true})
    log.info("Updated: #{update}")))
