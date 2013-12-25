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
    page: 'vote'
    speakers: _.shuffle(User.allSpeakers())
    filterType: @params.filterType
    filterTag: @params.filterTag