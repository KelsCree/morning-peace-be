class User < ApplicationRecord
  has_secure_password
  has_many :entries
  has_many :sessions
  validates :username, presence: true, uniqueness: { case_sensistive: false, message: "This username has already been taken." }
end
