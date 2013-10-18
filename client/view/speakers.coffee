Template.speakers.speakers = ->
  User.allSpeakers()

Template.speakers.photo = (speaker) ->
  speaker.photoUrl(120)

statuses = ['submitted']
Template.speakers.shouldDisplay = (speaker) ->
  speaker.hasProposalInStatus(statuses)

Template.speakers.proposalCountStr = (speaker) ->
  count = speaker.proposalsInStatus(statuses).length
  if count == 1
    "One proposal"
  else
    "#{count} proposals"