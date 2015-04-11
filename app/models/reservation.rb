class Reservation < ActiveRecord::Base
  belongs_to :item
  belongs_to :reserver, class_name: 'Member', foreign_key: 'reserver_id'
  belongs_to :checked_out_by, class_name: 'User'
  belongs_to :checked_in_by, class_name: 'User'

  validates :reserver, presence: true
  scope :not_checked_out, -> {where('checked_out_at IS NULL')}
  scope :checked_out, -> {where('checked_out_at IS NOT NULL')}
  scope :not_checked_in, -> {where('checked_in_at IS NULL')}
  scope :active, -> {checked_out.not_checked_in}

  def checked_out?
    !!checked_out_at
  end

  def checked_in?
    !!checked_in_at
  end

  def active?
    checked_out? && checked_in_at.nil?
  end

  def check_out_by!(user)
    self.checked_out_at = Time.now
    item.save if save # compute available_count
  end
end
