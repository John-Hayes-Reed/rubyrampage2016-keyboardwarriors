class Game < ApplicationRecord
  extend Enumerize
  enumerize :difficulty, in: %i[easy normal hard rampage]

  has_many :scores
  belongs_to :victor, class_name: 'User', optional: true

end
