class Item < ActiveRecord::Base
  extend Enumerize
  enumerize :kind, in: [:book], default: :book
end
