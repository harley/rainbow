class Announcement < ActiveRecord::Base
  strip_attributes collapse_spaces: true

  def self.primary
    where(primary: true).order('created_at DESC').first
  end
end
