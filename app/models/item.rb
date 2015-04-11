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

  validates :title, presence: true
  # validates :code, uniqueness: {allow_blank: false}, presence: true

  belongs_to :added_by, class_name: 'User', inverse_of: :added_items
end
