Template.agendaItem.formatTime = (t) ->
  moment(t).tz('Asia/Jerusalem').format('HH:mm')

Template.agendaItem.editing = ->
  Session.get('editingAgenda')

Template.agendaItem.class1Colspan = ->
  if @class2 or @class3 then 1 else 3


Template.agendaItem.events
  'keyup input': (event, context) ->
    if event.keyCode == 13
      time = context.find('input.time')
      class1 = context.find('input.class1')
      icon1 = context.find('input.icon1')
      class2 = context.find('input.class2')
      icon2 = context.find('input.icon2')
      class3 = context.find('input.class3')
      icon3 = context.find('input.icon3')
      time = new Date(time.value)
      @update
        time: time,
        class1: class1.value,
        icon1: icon1.value,
        class2: class2 and class2.value,
        icon2: icon2 and icon2.value,
        class3: class3 and class3.value
        icon3: icon3 and icon3.value

  'click button.del': ->
    @destroy()
