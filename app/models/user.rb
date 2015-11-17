class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas, dependent: :nullify

  has_many :comments, dependent: :nullify

  has_many :likes, dependent: :nullify
	has_many :liked_ideas, through: :likes, source: :idea

  has_many :joins, dependent: :nullify
	has_many :joined_ideas, through: :likes, source: :idea

  validates :email, presence: true, uniqueness: true
end
