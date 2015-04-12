class Reservation < ActiveRecord::Base
  belongs_to :item
  belongs_to :member
  belongs_to :checked_out_by, class_name: 'User'
  belongs_to :checked_in_by, class_name: 'User'

  validates :member, presence: true
  scope :checked_out, -> {where('checked_out_at IS NOT NULL')}
  scope :checked_in, -> {where('checked_in_at IS NOT NULL')}
  scope :not_checked_out, -> {where('checked_out_at IS NULL')}
  scope :not_checked_in, -> {where('checked_in_at IS NULL')}

  scope :reserved, -> {not_checked_out}
  scope :borrowed, -> {checked_out.not_checked_in}
  scope :returned, -> {checked_in}

  def checked_out?
    !!checked_out_at
  end

  def checked_in?
    !!checked_in_at
  end

  def reserved?
    checked_out? && checked_in_at.nil?
  end

  def check_out_by!(user)
    self.checked_out_at = Time.now
    self.checked_out_by = user
    item.save if save # recompute available_count
  end

  def check_in_by!(user)
    self.checked_in_at = Time.now
    self.checked_in_by = user
    item.save if save # recompute available_count
  end

  def status
    if checked_out_at.nil?
      'reserved'
    # already checked out
    elsif checked_in_at.nil?
      'borrowed'
    # already checked in
    else
      'returned'
    end
  end

  def self.search(query)
    # scope
    case query
    when 'reserved', 'borrowed', 'returned'
      send(query)
    else
      # not yet supported. return all
      all
    end
  end

  def self.sort(column, direction)
    column ||= 'updated_at'
    direction ||= 'DESC'
    case column
    when 'item_title'
      joins(:item).order("items.title #{direction}")
    when 'member_name'
      joins(:member).order("members.full_name #{direction}")
    when 'member_english_name'
      joins(:member).order("members.english_name #{direction}")
    when 'checked_out_by'
      joins("LEFT JOIN users ON users.id = reservations.checked_out_by_id").order("users.email #{direction}")
    when 'checked_in_by'
      joins("LEFT JOIN users ON users.id = reservations.checked_in_by_id").order("users.email #{direction}")
    else
      if column_names.include?(column)
        order("#{column} #{direction}")
      else
        all
      end
    end
  end
end
