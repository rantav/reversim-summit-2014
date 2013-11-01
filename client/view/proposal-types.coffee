Template.proposalTypes.selectedStr = (key, type) ->
  if type == key then 'active' else ''

Template.proposalTypes.rendered = ->
  $('div[data-toggle=buttons]').button()