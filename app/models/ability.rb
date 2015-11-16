class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

  can :manage, Idea do |i|
     user == i.user
  end

  can :manage, Comment do |c|
     user == c.user
  end

  end
end
