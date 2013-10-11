Template.disqus.rendered = ->
  ###
  # We don't want to load Disqus until the first time the template is
  # rendered, since it requires the #disqus_thread div
  # Triggers Deps.autorun (below)
  ###
  Session.set("loadDisqus", true)

  ###
  # Whenever the template is rendered, trigger a Disqus reset.
  # This will find the correct thread for the current page URL.
  # See http://help.disqus.com/customer/portal/articles/472107-using-disqus-on-ajax-sites
  ###
  DISQUS?.reset(
     reload: true
     config: ->
  )


Deps.autorun(->
  # Load the Disqus embed.js the first time the `disqus` template is rendered
  # but never more than once
  if Session.get("loadDisqus") && !window.DISQUS
    # Below is the Disqus Universal Code
    # (in Coffeescript, backticks escape Javascript code)
    disqus_shortname = 'summit2014'

    (->
     dsq = document.createElement('script')
     dsq.type = 'text/javascript'
     dsq.async = true
     dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js'
     (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq)
    )()
)