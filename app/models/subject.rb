class Subject < ActiveRecord::Base
  strip_attributes collapse_spaces: true

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
