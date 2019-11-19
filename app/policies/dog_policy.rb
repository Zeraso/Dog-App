class DogPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
