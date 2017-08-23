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
