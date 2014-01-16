Template.vote.speakers = -> @speakers

statuses = ['submitted', 'accepted', 'maybe next time']
Template.vote.shouldDisplay = (speaker) ->
  speaker.hasProposalInStatus(statuses)

Template.vote.photo = (speaker) ->
  speaker.photoUrl(120)

Template.vote.proposals = -> @proposals()

Template.vote.filterByTypeUrl = ->
  Router.path('vote') + "?filterType=#{@type}"

Template.vote.filterByTagUrl = ->
  Router.path('vote') + "?filterTag=#{@}"

Template.vote.votersCount = ->
  _.keys(countVotes(@speakers)).length

Template.vote.votersAverage = ->
  average(_.values(countVotes(@speakers)))

Template.vote.totalVotes = -> sum(_.values(countVotes(@speakers)))

Template.vote.name = (userId) ->
  console.log(userId)
  user = User.find(userId)
  if user
    return user.name()

Template.vote.topVoters = ->
  arr = []
  for voter, votes of countVotes(@speakers)
    arr.push({voter: voter, votes: votes})
  arr = _.sortBy(arr, (item) -> -item.votes)
  arr = arr.slice(0, 5)
  for v in arr
    user = User.find(v.voter)
    if user then v.name = user.name()
  arr

# Counts the votes for each voter. Returns a map of voters -> count
countVotes = (speakers) ->
  voters = {}
  for speaker in speakers
    for proposal in speaker.proposals()
      for voter, vote of proposal.votes
        if vote
          if voters[voter]
            voters[voter] += 1
          else
            voters[voter] =  1
  voters


sum = (arr) -> _.reduce(arr, ((sum, num) -> sum + num), 0)
average = (arr) -> if arr.length then sum(arr) / arr.length else 0


Template.vote.canSeeResults = ->
  u = User.current()
  u and (u.admin() or u.moderator())

Template.vote.events
  'click .sign-in': ->
    Accounts._loginButtonsSession.set('dropdownVisible', true)

  'click .accept': ->
    @update({status: 'accepted'})

  'click .reject': ->
    @update({status: 'maybe next time'})
