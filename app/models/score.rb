class Score < ApplicationRecord

  belongs_to :game
  belongs_to :user

  before_create :set_score

  def set_score
    write_attribute :score, 0
  end
end
