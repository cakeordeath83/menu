class Item < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :category
  
  def grouped_items
    items.group_by {|item| item.category}
  end
  
end
