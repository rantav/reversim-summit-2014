root = exports ? this

root.Cdn = {}

CDN_ROOT = 'd2m67og26u1b6a.cloudfront.net'

isLocalhost = Meteor.absoluteUrl().indexOf('http://localhost') == 0

Cdn.cdnify = (url) ->
  if not url then return ''
  if isLocalhost and url.indexOf('/') == 0 then return url
  l = getLocation(url)
  l.hostname = CDN_ROOT
  l.port = if l.protocol == 'https:' then 443 else 80
  l.toString()

getLocation = (href) ->
  l = document.createElement('a')
  l.href = href
  l
