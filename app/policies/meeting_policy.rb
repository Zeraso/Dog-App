class MeetingPolicy < ApplicationPolicy

  def show?
    true
  end

  def new?
    true
  end

   def create?
    true
  end

  class Scope < Scope

    def resolve
      scope.where(user: user).or(dog_owner: user)
    end
  end
end
