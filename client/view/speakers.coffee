Template.speakers.speakers = -> @speakers

Template.speakers.photo = (speaker) ->
  speaker.photoUrl(120)

Template.speakers.proposals = -> @proposals()

statuses = ['submitted', 'accepted']
Template.speakers.shouldDisplay = (speaker) ->
  speaker.hasProposalInStatus(statuses)

Template.speakers.canSeeEmail = (speaker)->
  cur = User.current()
  (speaker and speaker.me()) or (cur and (cur.moderator() or cur.admin()))

Template.speakers.proposalCountStr = (speaker) ->
  count = speaker.proposalsInStatus(statuses).length
  if count == 1
    "One proposal"
  else
    "#{count} proposals"