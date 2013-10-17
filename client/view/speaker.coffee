Template.speaker.events

  'click .edit': ->
    @speaker.toggleEdit()

  'click .save': (event, context) ->
    name = context.find("#name").value
    bio = context.find("#bio").value
    @speaker.update('profile.editing': false, 'profile.name': name, 'profile.bio': bio)

Template.speaker.speaker = -> @speaker

Template.speaker.photo = ->
  @speaker.photoUrl(120)

Template.speaker.editMode = ->
  @speaker.editing() and @speaker.me()

Template.speaker.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.speaker.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')
