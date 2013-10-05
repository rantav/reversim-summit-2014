root = exports ? this

root.Cdn = {}

CDN_ROOT = 'd2m67og26u1b6a.cloudfront.net'

Cdn.cdnify = (url) ->
  if not url then return ''
  l = getLocation(url)
  l.hostname = CDN_ROOT
  l.port = if l.protocol == 'https:' then 443 else 80
  l.toString()

getLocation = (href) ->
  l = document.createElement('a')
  l.href = href
  l
