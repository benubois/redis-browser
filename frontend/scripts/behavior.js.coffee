redisViewer = {}

redisViewer.init = 
  enqueueTitle: () ->
    $('.keys').on 'click', 'a:not(.selected)', (e) ->
      $('.keys a').removeClass('selected')
      $(@).addClass('selected')
      
      $.get($(@).attr('href'), (data) ->
        $('.data').html(data)
      )
      e.preventDefault()

$(document).ready () ->
  $.each(redisViewer.init, (i, item)->
    item()
  )