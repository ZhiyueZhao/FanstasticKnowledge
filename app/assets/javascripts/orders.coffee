# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener("turbolinks:load", ->
  if $('#orders_wrapper').length == 0
    $('#orders').dataTable()

  if $('#order_wrapper').length == 0
    $('#order').dataTable())
# jQuery ->
#   $('#orders').dataTable()
#   $('#order').dataTable()
