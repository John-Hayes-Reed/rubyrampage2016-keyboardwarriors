makeGameChannel = (game_id, user_id) ->
  App.game = App.cable.subscriptions.create {channel: "GameChannel", game_id: game_id},
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      score = data['score']
      updated_user_id = data['user_id']
      word = data['word']
      complete = data['complete']
      victor = data['victor']

      $('.userScore[data-user-id="'+updated_user_id+'"]').html(score) if score? and updated_user_id?
      $('.wordDisplay').data('word', word).html(word) if word? and updated_user_id == user_id

      $('.wordDisplay').remove() if victor?
      $('[data-behaviour~=battle_input]').remove() if victor?
      $('.modalOpener[data-open="victorModal"]').trigger('click') if victor? and updated_user_id == user_id
      $('.modalOpener[data-open="fallenModal"]').trigger('click') if victor? and updated_user_id != user_id

    sendInput: (original_word, input) ->
      @perform 'input', user_id: user_id, game_id: game_id, original_word: original_word, input: input

  $(document).on 'keypress', '[data-behaviour~=battle_input]', (event) ->
    if event.keyCode is 13
      originalWord = $('.wordDisplay').data('word')
      App.game.sendInput originalWord, event.target.value
      event.target.value = ''
      event.preventDefault()

$ ->
  gameId = $('#game-content').data('gameId')
  userId = $('#game-content').data('userId')
  makeGameChannel(gameId, userId) if gameId?
