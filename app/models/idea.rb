class Idea < ActiveRecord::Base
  belongs_to :user

  has_many :comments, dependent: :nullify

  has_many :likes, dependent: :nullify
	has_many :liking_users, through: :likes, source: :user

  has_many :joins, dependent: :nullify
	has_many :joining_users, through: :joins, source: :user

  def like_for(user)
    		likes.find_by_user_id(user.id)
  	end

	def liked_by?(user)
		like_for(user).present?
	end

  def join_for(user)
    		joins.find_by_user_id(user.id)
  end

	def joined_by?(user)
		join_for(user).present?
	end

  def joining_arara
    return "nada"
  end
  def joining_array(idea)
    array = []
		idea.joining_users.each do |u|
      array = u.first_name
    end
    return array
	end

end
