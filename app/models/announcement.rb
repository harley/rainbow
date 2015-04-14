class Announcement < ActiveRecord::Base
  def self.primary
    where(primary: true).order('created_at DESC').first
  end
end
