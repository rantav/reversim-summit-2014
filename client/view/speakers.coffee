Template.speakers.speakers = ->
  User.allSpeakers()

Template.speakers.photo = (speaker) ->
  speaker.photoUrl(120)

Template.speakers.shouldDisplay = (speaker) ->
  speaker.hasProposalInStatus(['submitted'])