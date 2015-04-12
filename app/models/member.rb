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

  def self.search(query)
    # TODO Member#search
    # case query
    # when condition
    #   
    # end
    all
  end

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
