window.HomeJs =
  hidePreloader: ->
    $(".preloader").fadeOut("slow")
  isScreenSize: (size) ->
    $('.device-' + size).is(':visible')
  domReadyStuff: ->
    # insert dom ready stuff here

$(document).on "ready page:load", ->
  # console.log "ready page:load"
  window.HomeJs.domReadyStuff
