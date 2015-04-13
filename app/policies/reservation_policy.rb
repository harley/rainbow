class ReservationPolicy < ApplicationPolicy
  def edit?
    user.try(:admin?)
  end

  def new?
    user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
