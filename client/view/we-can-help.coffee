Template.weCanHelp.events
  'click #we-can-help-send': (e, c)->
    name = c.find('#wch-name').value
    email = c.find('#wch-email').value
    mind = c.find('#wch-mind').value
    if name and email and mind
      Meteor.call('weCanHelpEmail', name, email, mind)
      alertify.success("Thank you #{name}, we will get back to you!")
      $('#we-can-help').modal('hide')

Template.weCanHelp.speaker = ->
  u = User.current()
  return if u then u else name: ''

Template.weCanHelp.rendered = ->
  $('.tooltiped').tooltip()

Template.weCanHelp.destroyed = ->
  $('.tooltiped').tooltip('destroy')

