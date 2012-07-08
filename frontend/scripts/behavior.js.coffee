redisViewer = {}

redisViewer.init = 
  enqueueTitle: () ->
    $('.keys').on 'click', 'a', (e) ->
      unless $(@).hasClass('selected')
        $('.keys a').removeClass('selected')
        $(@).addClass('selected')
      
        $.get($(@).attr('href'), (data) ->
          $('.data').html(data)
        )
      e.preventDefault()
  loadFirst: () ->
    $('.keys ul li:first-child a').click()
  resize: () ->
    $('.keys').resizable({ handles: "e" })

$(document).ready () ->
  $.each(redisViewer.init, (i, item)->
    item()
  )