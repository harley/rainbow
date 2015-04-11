class Reservation < ActiveRecord::Base
  belongs_to :item
  belongs_to :reserver, class_name: 'Member', foreign_key: 'reserver_id'

  validates :reserver, presence: true
  scope :checked_out, -> {where('checked_out_at IS NOT NULL')}
  scope :not_checked_in, -> {where('checked_in_at IS NULL')}
  scope :active, -> {checked_out.not_checked_in}
end
