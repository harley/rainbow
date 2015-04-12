class AdminPolicy < ApplicationPolicy
  def base?
    user && user.admin?
  end
end
