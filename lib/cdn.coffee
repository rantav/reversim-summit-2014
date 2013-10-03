root = exports ? this

root.Cdn = {}

CDN_ROOT = 'todo....cloudfront.net'

Cdn.cdnify = (url) ->
  # TODO

  # if not url then return ''
  # l = getLocation(url)
  # l.hostname = CDN_ROOT
  # l.port = if l.protocol == 'https:' then 443 else 80
  # l.toString()
  url


getLocation = (href) ->
  l = document.createElement('a')
  l.href = href
  l
