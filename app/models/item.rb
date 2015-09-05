class Item < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :category
 
  accepts_nested_attributes_for :category 
  validates_presence_of :name, :price, :category
  
end
