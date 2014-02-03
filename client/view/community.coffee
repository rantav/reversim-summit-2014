Template.community.rendered = ->
  bz = document.createElement('script')
  bz.type = 'text/javascript'
  bz.async = true
  bz.src = 'https://www.bizzabo.com/widgets/webcommunity/webcommunity.js'
  s = document.getElementsByTagName('script')[0]
  s.parentNode.insertBefore(bz,s)

