class Room < ApplicationRecord
  extend Enumerize

  enumerize :difficulty, in: %i[easy normal hard rampage]
  enumerize :status, in: %i[pending active complete]

  belongs_to :user
  belongs_to :victor, class_name: 'User', optional: true

  with_options presence: true do |v|
    v.validates :difficulty
    v.validates :status
    v.validates :member_count, inclusion: {in: 2..4}
  end

  after_create_commit do
    AddRoomJob.perform_later self
  end

end
