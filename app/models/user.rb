class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :added_items, class_name: 'Item', foreign_key: 'added_by_id', dependent: :nullify, inverse_of: false
  has_one :member, dependent: :nullify
  has_many :reservations, through: :member

  # TODO: add role to users
  def admin?
    true
  end

  def to_s
    email
  end
end
