class Item < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :category
 
  accepts_nested_attributes_for :category 
  validates_presence_of :name, :price, :category
  
  
  
  validates_numericality_of :price, :less_than => 10, :message => "must be less than £10. Did you add a decimal point?"
    
  
  
  
end
