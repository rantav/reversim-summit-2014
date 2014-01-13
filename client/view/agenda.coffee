mid = new Date('02/25/14 00:00:00')
Template.agenda.day1 = ->
  @items.filter((i) -> i.time < mid).sort((a, b) -> a.time > b.time)

Template.agenda.day2 = ->
  @items.filter((i) -> i.time > mid).sort((a, b) -> a.time > b.time)

Template.agenda.canSee = ->
  u = User.current()
  u and (u.admin() or u.moderator())

Template.agenda.canEdit = ->
  u = User.current()
  u and u.admin()

Template.agenda.events
  'submit #add-form': (event, context) ->
    event.preventDefault()
    time = context.find('#time').value
    class1 = context.find('#class1').value
    icon1 = context.find('#icon1').value
    class2 = context.find('#class2').value
    icon2 = context.find('#icon2').value
    class3 = context.find('#class3').value
    icon3 = context.find('#icon3').value
    if not time then return
    time = new Date(time)
    if not time
      console.error('bad time string')
      return
    AgendaItem.create
      time: time
      class1: class1
      class2: class2
      class3: class3
      icon1: icon1
      icon2: icon2
      icon3: icon3

  'click #edit': ->
    Session.set('editingAgenda', not Session.get('editingAgenda'))