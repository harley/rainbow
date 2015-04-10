class Item < ActiveRecord::Base
  extend Enumerize
  enumerize :kind, in: [:book], default: :book

  searchable do
    text :title
    text :kind
    text :author
    text :summary
    integer :number_of_pages
    text :code
    text :publisher
  end
end
