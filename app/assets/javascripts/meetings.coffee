# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.attended-checkbox').on 'change', ->
  	data = $(this).data()
  	$.post "/meetings/#{data.meetingId}", ->
  	  data: { brother_id: data.brotherId, attending: this.checked }
  	  (data) -> console.log data