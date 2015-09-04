class Item < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :category
 
  
end
