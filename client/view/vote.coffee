Template.vote.speakers = -> _.shuffle(@speakers)

statuses = ['submitted']
Template.vote.shouldDisplay = (speaker) ->
  speaker.hasProposalInStatus(statuses)

Template.vote.photo = (speaker) ->
  speaker.photoUrl(120)

Template.vote.proposals = -> @proposals()
