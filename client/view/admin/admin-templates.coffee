Template.checkbox.ifChecked = (fieldKey) ->
  if getValue(@data, fieldKey) then 'checked' else ''

Template.checkbox.events
  'click': (e, t) ->
    id = @data._id
    # console.log(id)
    # console.log(t.find('input[type=checkbox]').checked)
    query = {}
    query[@field.key] = t.find('input[type=checkbox]').checked
    Vector.collections[@collectionName].update {_id:id},{$set:query}

getValue = (data, key) ->
  if key and data
    dataRecursive(data, key)

dataRecursive = (data, key) ->
  for keyElement in key.split('.')
    data = data[keyElement] if data
  data
