class ReservationPolicy < ApplicationPolicy
  def edit?
    user.try(:admin?)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
