Template.nav.activeClass = (name) ->
  if @page == name then 'active' else ''

Template.nav.wishes = ->
  Wishes.find().count()