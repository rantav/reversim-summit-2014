Template.proposalTags.events
  'submit form': (e, n) ->
    e.preventDefault()
    @setTags(t.trim() for t in n.find('input').value.split(','))

Template.proposalTagsDisplay.filterByTagUrl = ->
  'TODO'