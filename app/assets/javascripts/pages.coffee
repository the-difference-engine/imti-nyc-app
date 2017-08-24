# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$('#sign-out-link').click (event) ->
  alert 'You will be sign out so you can make anonymous donation!, click on anonymous donation again'
  window.location.href = '/donations/new'
  event.preventDefault()
  return

  $('#sign-in-link').click (event) ->
  alert 'Please sign in or register for account!, then click on donate again'
  window.location.href = '/donations/new'
  event.preventDefault()
  return