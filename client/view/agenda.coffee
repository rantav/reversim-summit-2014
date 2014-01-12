Template.agenda.items = -> @items

Template.agenda.canSee = ->
  u = User.current()
  u and (u.admin() or u.moderator())

Template.agenda.canEdit = ->
  u = User.current()
  u and u.admin()

Template.agenda.events
  'submit #add-form': (event, context) ->
    event.preventDefault()
    console.log(context.find('#time').value)