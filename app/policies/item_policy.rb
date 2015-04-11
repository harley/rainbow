class ItemPolicy < ApplicationPolicy
  def new?
    user
  end

  def edit?
    user.admin? || record.added_by_id == user.id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
