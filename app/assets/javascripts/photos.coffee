$(document).on "turbolinks:load", ->

  currentRating = $('#photo-rating').data('current-rating')

  $('#photo-rating').barrating 'show',
    theme: 'bootstrap-stars'
    initialRating: currentRating
    onSelect: (value, text, event) ->
      if typeof event != 'undefined'
        $.post '/ratings',
          photo_id: text
          stars: value
      else
        console.log "Error"
      return



