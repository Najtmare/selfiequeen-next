$(document).on "turbolinks:load", ->

  photoId = $('#photo-info').data('photo-id')
  currentRating = $('#photo-rating-' + photoId).data('current-rating')

  $('#photo-rating-' + photoId).barrating 'show',
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



