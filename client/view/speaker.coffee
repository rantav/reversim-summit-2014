
uploadedImage = null
uploadedImageDep = new Deps.Dependency()
Template.speaker.events
  'click .edit': ->
    @speaker.toggleEdit()

  'click .save': (event, context) ->
    name = context.find("#name").value
    bio = context.find("#bio").value
    trackRecord = context.find("#trackRecord").value
    updates =
      'profile.editing': false
      'profile.name': name
      'profile.bio': bio
      'profile.trackRecord': trackRecord
    if uploadedImage then updates['profile.uploadedImage'] = uploadedImage
    uploadedImage = null
    @speaker.update(updates)

  'click #upload-image': ->
    filepicker.setKey('AdBaAI7evS5yvsIsRlKPRz')
    filepicker.pick
      mimetype: 'image/*'
      service: 'COMPUTER'
      ,(inkBlob) ->
        uploadedImage = inkBlob.url
        uploadedImageDep.changed()

  'click #remove-image': ->
    uploadedImage = null
    uploadedImageDep.changed()
    @speaker.update('profile.uploadedImage': null)

Template.speaker.speaker = -> @speaker

Template.speaker.uploadedImage = ->
  uploadedImageDep.depend()
  img = if uploadedImage then uploadedImage else @speaker.uploadedImage()
  if img
    "#{img}/convert?h=120&w=120"


Template.speaker.photo = ->
  @speaker.photoUrl(120)

Template.speaker.photoFromService = ->
  @speaker.photoUrlFromService(120)

Template.speaker.editMode = ->
  @speaker.me() and ((not @speaker.hasBio()) or @speaker.editing())

Template.speaker.twitterShareNotMeUrl = ->
    url = Router.fullPath('speaker', id: @speaker.id)
    shareText = "#{@speaker.name()} will be speaking at reversim conf!"
    "https://twitter.com/share?url=#{encodeURIComponent(url)}&text=#{encodeURIComponent(shareText)}&via=reversim"

Template.speaker.twitterShareMeUrl = ->
    url = Router.fullPath('speaker', id: @speaker.id)
    shareText = "I'll be speaking at reversim conf!"
    "https://twitter.com/share?url=#{encodeURIComponent(url)}&text=#{encodeURIComponent(shareText)}&via=reversim"

Template.speaker.canSeeTrackRecord = ->
  cur = User.current()
  @speaker.me() or (cur and (cur.moderator() or cur.admin()))

Template.speaker.hasProposals = -> @speaker.proposals().length > 0

Template.speaker.proposals = -> @speaker.proposals()

Template.speaker.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.speaker.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')
