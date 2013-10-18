# some markdown utils
@Markdown = {}
@Markdown.removeHeadings = (markdown) ->
  if markdown then markdown.replace(/#/g, '')