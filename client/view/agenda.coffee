mid = new Date('02/25/14 00:00:00')
Template.agenda.day1 = ->
  @items.filter((i) -> i.time < mid).sort((a, b) -> a.time >= b.time)

Template.agenda.day2 = ->
  @items.filter((i) -> i.time > mid).sort((a, b) -> a.time >= b.time)

Template.agenda.formatTime = (t) ->
  moment(t).format('HH:mm');

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
    class2 = context.find('#class2').value
    class3 = context.find('#class3').value
    if not time then return
    time = new Date(time)
    if not time
      console.error('bad time string')
      return
    AgendaItem.create({time: time, class1: class1, class2: class2, class3: class3})