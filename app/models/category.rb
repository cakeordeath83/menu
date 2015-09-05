class Category < ActiveRecord::Base
  
  validates_presence_of :category
  validates_presence_of :order_number
  
  has_many :items
end
