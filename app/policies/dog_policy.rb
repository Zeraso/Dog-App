class DogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def new?
    true
  end

  def show?
    true
  end

  def destroy?
    record.user == user
  end

  def my_dogs?
    true
  end

end
