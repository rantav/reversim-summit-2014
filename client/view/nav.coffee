Template.nav.activeClass = (name) ->
  if @page == name then 'active' else ''

count = (col) ->
  data = Counts.findOne(col)
  if data then return data.count

Template.nav.wishes = -> count('wishes')

Template.nav.proposals = -> count('proposals')

Template.nav.speakers = -> count('speakers')

Template.nav.users = ->
  User.count()

Template.nav.canSeeHidden = ->
  user = User.current()
  user and (user.admin() or user.moderator())

Template.nav.hasCount = (col) ->
  Counts.findOne(col)