redisViewer = {}

redisViewer.init = 
  enqueueTitle: () ->
    $('.keys').on 'click', 'a:not(.selected)', (e) ->
      $('.data').html('Loading&hellip;')
      $('.keys a').removeClass('selected')
      $(@).addClass('selected')
      
      $.get($(@).attr('href'), (data) ->
        $('.data').html(data)
      )
      e.preventDefault()
  loadFirst: () ->
    $('.keys ul li:first-child a').click()

$(document).ready () ->
  $.each(redisViewer.init, (i, item)->
    item()
  )