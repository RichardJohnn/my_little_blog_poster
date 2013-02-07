$(() ->
  console.log "hey dawg"

  nav = $('#PostButton') 
  nav.click( () ->
    $this = $(this)
    alert 'whoa'
  )
)