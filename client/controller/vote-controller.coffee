class @VoteController extends RouteController

  waitOn: ->
    q = {}
    if filterType = @params.filterType
      q.type = filterType
    if filterTag = @params.filterTag
      q.tags = filterTag
    Meteor.subscribe('proposals-min', q)

  after: -> document.title = "Vote | Reversim Summit 2014"

  tempalte: 'vote'

  data: ->
    speakers = User.allSpeakers()
    user = User.current()
    speakers = if user and (user.admin() or user.moderator()) then sort(speakers) else _.shuffle(speakers)
    return {
      page: 'vote'
      speakers: speakers
      filterType: @params.filterType
      filterTag: @params.filterTag
    }

sort = (speakers) ->
  _.sortBy(speakers, (speaker) ->
    - sum(speaker.proposals().map((p) -> p.voteCount()))
  )

sum = (arr) -> _.reduce(arr, (sum, num) -> sum + num)