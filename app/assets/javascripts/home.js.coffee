window.setTimeout (->
  $('.alert').fadeTo(500, 0).slideUp 500, ->
    $(this).remove()
    return
  return
), 4000

$('#menu-toggle').click (e) ->
  e.preventDefault()
  $('#wrapper').toggleClass 'toggled'
  return
