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

  setupScrolling: ->
    @didScroll = false
    lastScrollTop = 0
    delta = 5
    navbarHeight = $('.navbar').outerHeight();

    $(window).scroll (event) =>
      @didScroll = true

    @hasScrolled = (e) =>
      st = $(e).scrollTop()
      # console.log 'st = ', st, lastScrollTop, delta, navbarHeight
      if Math.abs(lastScrollTop - st) <= delta
        return
      if (st > lastScrollTop && st > navbarHeight)
        # scroll down
        $('.navbar').removeClass('nav-down').addClass('nav-up')
      else
        # scroll up
        if (st + $(window).height() < $(document).height())
          $('.navbar').removeClass('nav-up').addClass('nav-down');
      lastScrollTop = st

    that = @
    setInterval(->
      if that.didScroll
        that.hasScrolled(this)
        that.didScroll = false
    , 250)

$(document).on "ready page:load", ->
  # console.log "ready page:load"
  HomeJs.domReadyStuff()
  HomeJs.setupScrolling()
