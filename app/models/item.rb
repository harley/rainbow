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
  end

  validates :title, :quantity, presence: true
  # validates :code, uniqueness: {allow_blank: false}, presence: true

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
end
