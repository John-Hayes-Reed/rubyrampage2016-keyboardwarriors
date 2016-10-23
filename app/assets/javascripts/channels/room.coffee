makeRoomChannel = (userId, roomId) ->
  App.room = App.cable.subscriptions.create {channel: "RoomChannel", room_id: roomId},
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log(data)
      closed = data['closed']
      message = data['message']
      updated_members = data['updated_members']

      $('#messages').append(message) if message?
      $('ul.user-list').html(updated_members) if updated_members?
      $('#modalOpener').trigger('click') if closed?

    chat: (message) ->
      console.log('entered chat function')
      @perform 'chat', user_id: userId, room_id: roomId, message: message

  $(document).on 'keypress', '[data-behaviour~=chat_speaker]', (event) ->
    console.log('inputing chat')
    if event.keyCode is 13
      App.room.chat event.target.value
      event.target.value = ''
      event.preventDefault()
$ ->
  roomId = $('#room-content').data('roomId')
  userId = $('#room-content').data('userId')
  makeRoomChannel(userId, roomId) if roomId?
