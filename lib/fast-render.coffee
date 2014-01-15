if Meteor.isServer
  FastRender.onAllRoutes (urlPath) ->
    # @subscribe('counts') # counts are disabled now
    @subscribe('sponsors', {}, {fields: {name: 1, logoSmallUrl: 1}})
    # register for me
    if Meteor.userId()
      @subscribe('users', {_id: Meteor.userId()})
      @subscribe('speakers', {_id: Meteor.userId()})