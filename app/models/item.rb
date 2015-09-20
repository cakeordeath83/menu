class Item < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :category
 
  accepts_nested_attributes_for :category 
  validates_presence_of :name, :price, :category
  
  # codebar! If the validation doesn't pass, it won't display the dropdown with the categories in it
  validates_uniqueness_of :name
  #validates_numericality_of :price, :less_than => 10, :message => "must be less than £10. Did you add a decimal point?"
    
  
  
  
end
