makeRoomChannel = (roomId) ->
  App.cable.subscriptions.create {channel: "RoomChannel", room_id: roomId},
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log(data)
      closed = data['closed']
      message = data['message']
      console.log(closed)
      console.log(message)
      alert('This warriors gathering has been closed, please vacate and find another') if closed?

$ ->
  roomId = $('#room-content').data('roomId')
  makeRoomChannel(roomId) if roomId?
