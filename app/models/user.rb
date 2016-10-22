class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  with_options presence: true do |v|
    v.validates :email, uniqueness: true
    v.validates :encrypted_password
  end

end
