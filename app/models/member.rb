class Member < ActiveRecord::Base
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

  def self.sort(column, direction)
    column    ||= 'updated_at'
    direction ||= 'DESC'
    raise "Invalid direction #{direction}" unless %w(ASC DESC).include?(direction.to_s.upcase)
    if column_names.include?(column)
      order("#{column} #{direction}")
    else
      case column
      when 'user_email'
        joins("LEFT JOIN users ON users.id = members.user_id").order("users.email #{direction}")
      else
        raise "Not yet implemented"
      end
    end
  end
end
