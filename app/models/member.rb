class Member < ActiveRecord::Base
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :sid, uniqueness: {allow_blank: true}

  def to_s
    "#{full_name} (#{english_name})"
  end

  def borrowed
    reservations.borrowed
  end

  def returned
    reservations.returned
  end

  def reserved
    reservations.reserved
  end
end
