window.HomeJs =
  hidePreloader: ->
    $(".preloader").fadeOut("slow")
  isScreenSize: (size) ->
    $('.device-' + size).is(':visible')
  domReadyStuff: ->
    # insert dom ready stuff here
    $('.hide-sidebar-drawer').click ->
      $('.sidebar-md-show').removeClass('sidebar-md-show')
      $('.main-body').removeClass('col-md-9 col-md-offset-3')
      $('button.hidden-md').removeClass('hidden-md hidden-lg')
      $(this).removeClass('visible-md visible-lg').hide()

$(document).on "ready page:load", ->
  # console.log "ready page:load"
  window.HomeJs.domReadyStuff()
