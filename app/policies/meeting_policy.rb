class MeetingPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.where(user: user).or(dog_owner: user)
    end
  end
end
