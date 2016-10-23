class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :owned_rooms, class_name: 'Room', foreign_key: :owner_id
  has_and_belongs_to_many :rooms
  has_many :victorious_games, class_name: 'Game', foreign_key: :victor_id

  with_options presence: true do |v|
    v.validates :email, uniqueness: true
    v.validates :encrypted_password
  end

  before_create :set_initial_name

  private

  def set_initial_name
    write_attribute :name, "Warrior#{read_attribute(:id)}"
  end

end
