class Word < ApplicationRecord
  extend Enumerize
  enumerize :difficulty, in: %i[easy normal hard rampage]

  with_options presence: true do |v|
    v.validates :difficulty
    v.validates :text
  end

  self.difficulty.values.each{|diff|
    scope diff.to_sym, ->{ where(difficulty: diff) }
  }

end
