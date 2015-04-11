class Member < ActiveRecord::Base
  def to_s
    "#{full_name} (#{english_name})"
  end
end
