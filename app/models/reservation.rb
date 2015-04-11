class Reservation < ActiveRecord::Base
  belongs_to :item
  belongs_to :reserver, class_name: 'Member', foreign_key: 'reserver_id'
end
