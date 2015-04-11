class Item < ActiveRecord::Base
  extend Enumerize
  enumerize :kind, in: [:book], default: :book

  searchable do
    text :title, boost: 5
    text :kind
    text :author
    text :summary
    integer :number_of_pages
    text :code
    text :publisher
    time :created_at
  end

  validates :title, :quantity, presence: true
  # validates :code, uniqueness: {allow_blank: false}, presence: true

  has_many :reservations, dependent: :destroy

  before_save :check_available_count

  def added_by
    User.find_by_id(added_by_id)
  end

  # rails_admin_import
  def before_import_save(row, map)
    # Your custom special sauce
  end

  def after_import_save(row, map)
    # Your custom special sauce
  end

  def check_available_count
    self.available_count = compute_remaining
  end

  def compute_remaining
    quantity - reservations.active.count
  end
end
