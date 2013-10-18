Template.speakers.speakers = ->
  User.allSpeakers()

Template.speakers.photo = (speaker) ->
  speaker.photoUrl(120)