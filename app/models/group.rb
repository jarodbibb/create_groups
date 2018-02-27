class Group < ActiveRecord::Base
 has_many :members
  has_many :users, through: :members, source: :user

  validates :name, length: {minimum: 6 }
  validates :description, length: {minimum: 11 }
end
