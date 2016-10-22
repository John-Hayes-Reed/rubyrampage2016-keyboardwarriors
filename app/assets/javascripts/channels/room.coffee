App.room = App.cable.subscriptions.create "RoomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    room = data['room']
    count = data['count']
    closed = data['closed']
    
    $('.rooms-table-body').append data['room'] if room? and not count?
    $('.room-member-count[data-id="'+room+'"]').html(count) if room? and count?
    $('.room-row[data-id="'+closed+'"]') if closed?
