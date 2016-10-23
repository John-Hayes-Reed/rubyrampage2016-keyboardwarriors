class GamesController < ApplicationController
  before_action :set_game, only: [:show]
  before_action :set_word, only: [:show]
  before_action :set_room, only: [:create]

  def create
  end

  def show
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_word
    @word = Word.order("RANDOM()").where(difficulty: @game.difficulty).first
  end

  def set_room
    @room = current_user.owned_rooms.find(params[:room_id])
  end

end
