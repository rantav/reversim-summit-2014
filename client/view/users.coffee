Template.users.events
  'click input[name=admin]': (event, context)->
    val = event.srcElement.checked
    @update('roles.admin': val)

  'click input[name=moderator]': ->
    val = event.srcElement.checked
    @update('roles.moderator': val)

  'click .delete':  ->
    @destroy()
    alertify.success('OK, Deleted')

Template.users.allowed = ->
  user = User.current()
  user and (user.admin() or user.moderator())

Template.users.users = ->
  User.all()

Template.users.photo = (user) ->
  user.photoUrl(40)

Template.users.disabledStr = ->
  user = User.current()
  if not (user and user.admin())
    'disabled'

Template.users.adminCheckedStr = (user) ->
  if user.admin() then 'checked' else ''

Template.users.moderatorCheckedStr = (user) ->
  if user.moderator() then 'checked' else ''
