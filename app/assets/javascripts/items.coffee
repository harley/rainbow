window.ItemsJs =
  setupItems: ->
    $container = $('#items-container').masonry();
    # layout Masonry again after all images have loaded
    $container.imagesLoaded ->
      $container.masonry();
