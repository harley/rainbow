class Member < ActiveRecord::Base
  belongs_to :user
  has_many :reservations, dependent: :destroy, foreign_key: 'reserver_id', inverse_of: :reserver

  validates :sid, uniqueness: {allow_blank: true}

  def to_s
    "#{full_name} (#{english_name})"
  end

  def borrowed_items
    reservations.active
  end

  def returned_items
    reservations.checked_in
  end

  def reserved_items
    reservations.not_checked_out
  end
end
