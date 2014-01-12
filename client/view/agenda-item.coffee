Template.agendaItem.formatTime = (t) ->
  moment(t).format('HH:mm')

Template.agendaItem.editing = ->
  Session.get('editingAgenda')

Template.agendaItem.classes = ->
  [@class1, @class2, @class3]

Template.agendaItem.events
  'keyup input': (event, context) ->
    if event.keyCode == 13
      [time, class1, class2, class3] = context.findAll('input')
      time = new Date(time.value)
      @update({time: time, class1: class1.value, class2: class2.value, class3: class3.value})

  'click button.del': ->
    @destroy()
