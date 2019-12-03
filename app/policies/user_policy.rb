class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end

  def search?
    true
  end

  def update?
    true
  end

  def autocomplete?
    true
  end
end
