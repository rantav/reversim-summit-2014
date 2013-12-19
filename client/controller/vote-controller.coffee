class @VoteController extends RouteController

  waitOn: -> Meteor.subscribe('speakers')

  after: -> document.title = "Vote | Reversim Summit 2014"

  tempalte: 'vote'

  data: ->
    page: 'vote'
    speakers: _.shuffle(User.allSpeakers())
