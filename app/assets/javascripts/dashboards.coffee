# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$().ready ->
  $('.edit-widget').on 'click', () ->
    url = $(this).closest('.widget-container').data().editUrl
    $.get(url)
      .done (response) ->
        $('#myModal').modal('show')
        $('.modal-body').html(response)
        $('.modal-title').text('header')

  dragMoveListener = (event) ->
    target = event.target
    x = (parseFloat(target.getAttribute('data-x')) or 0) + event.dx
    y = (parseFloat(target.getAttribute('data-y')) or 0) + event.dy
    # translate the element
    target.style.webkitTransform = target.style.transform = 'translate(' + x + 'px, ' + y + 'px)'
    # update the posiion attributes
    target.setAttribute 'data-x', x
    target.setAttribute 'data-y', y
    return

  interact('.draggable', allowFrom: '.icon-move').draggable
    autoScroll: true
    onmove: dragMoveListener
    restrict:
      restriction: 'parent'
  .on 'dragend', (event) ->
    id = event.target.id
    x = event.dx
    y = event.dy
    $.ajax
      method: 'patch'
      url: location.href + '/widgets/' + id
      async: true
      data:
        widget:
          pos_x: x
          pos_y: y
  $('.draggable').resizable
    handles: 's, e'
  .on 'resizestop', (event, ui) ->
    id = event.target.id
    width = parseInt($(event.target).css('width'))
    height = parseInt($(event.target).css('height'))
    $.ajax
      method: 'patch'
      url: location.href + '/widgets/' + id
      async: true
      data:
        widget:
          width: width
          height: height

  # this is used later in the resizing and gesture demos
  window.dragMoveListener = dragMoveListener
