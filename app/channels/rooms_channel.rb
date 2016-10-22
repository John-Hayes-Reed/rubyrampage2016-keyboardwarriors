# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rooms_channel'
  end

  def unsubscribed

  end
end
