class DogPolicy < ApplicationPolicy

  def create?
    return true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
