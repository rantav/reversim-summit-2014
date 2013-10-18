Template.proposalTypes.selectedStr = (key) ->
  if @type == key then 'active' else ''

Template.proposalTypes.rendered = ->
  $('div[data-toggle=buttons]').button()