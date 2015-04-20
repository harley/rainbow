class Member < ActiveRecord::Base
  strip_attributes collapse_spaces: true

  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :sid, uniqueness: {allow_blank: true}

  searchable do
    text :full_name
    text :english_name
    text :sid
    text :user_email

    # need string fields for sorting
    string :full_name
    string :first_name
    string :english_name
    string :sid
    string :user_email

    integer :reservation_count
    integer :reserved_count
    integer :borrowed_count
    integer :returned_count
    time :updated_at
  end

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

  def user_email
    user.try(:email)
  end

  def reservation_count; reservations.count; end
  def reserved_count; reserved.count; end
  def borrowed_count; borrowed.count; end
  def returned_count; returned.count; end

  def first_name
    full_name && full_name.split(' ').last
  end

  def short_name
    english_name.presence || first_name
  end
end
