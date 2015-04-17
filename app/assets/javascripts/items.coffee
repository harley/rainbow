window.ItemsJs =
  setupItems: ->
    $container = $('#items-container').masonry(
      gutter: 1
    );
    # layout Masonry again after all images have loaded
    $container.imagesLoaded ->
      $container.masonry();
