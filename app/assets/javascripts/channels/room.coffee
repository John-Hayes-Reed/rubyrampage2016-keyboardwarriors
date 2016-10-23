makeRoomChannel = (userId, roomId) ->
  App.room = App.cable.subscriptions.create {channel: "RoomChannel", room_id: roomId},
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      closed = data['closed']
      message = data['message']
      updated_members = data['updated_members']
      full = data['full']
      trigger = data['trigger']

      $('#messages').append(message) if message?
      $('ul.user-list').html(updated_members) if updated_members?
      $('#gameStarter').attr('disabled', true) if full? and not full
      $('#gameStarter').removeAttr('disabled') if full? and full
      $('#modalOpener').trigger('click') if closed?
      window.location.href = $(trigger).prop('href') if trigger?

    chat: (message) ->
      @perform 'chat', user_id: userId, room_id: roomId, message: message

    trigger: () ->
      @perform 'trigger_game', room_id: roomId

  $(document).on 'keypress', '[data-behaviour~=chat_speaker]', (event) ->
    if event.keyCode is 13
      App.room.chat event.target.value
      event.target.value = ''
      event.preventDefault()
  $('#gameStarter').on 'click', (event) ->
    App.room.trigger()
    event.preventDefault()

$ ->
  roomId = $('#room-content').data('roomId')
  userId = $('#room-content').data('userId')
  makeRoomChannel(userId, roomId) if roomId?
