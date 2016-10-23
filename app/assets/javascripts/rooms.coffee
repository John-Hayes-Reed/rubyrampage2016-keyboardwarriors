# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.cable.subscriptions.create "RoomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    room = data['room']
    roomId = data['room_id']
    count = data['count']
    closed = data['closed']

    console.log('room')
    console.log(room)
    console.log('room_id')
    console.log(roomId)
    console.log('count')
    console.log(count)
    console.log('closed')
    console.log(closed)

    $('#rooms-table-body').append room if room?
    $('.room-row[data-id="'+roomId+'"] .room-member-count span.users-count').html(count) if roomId? and count?
    $('.room-row[data-id="'+closed+'"]').remove() if closed?
