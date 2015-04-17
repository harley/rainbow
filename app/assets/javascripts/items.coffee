window.ItemsJs =
  setupItems: ->
    container = $('#items-container')
    msnry = new Masonry container,
      itemSelector: '.item',
      columnWidth: 200
