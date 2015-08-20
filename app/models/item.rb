class Item < ActiveRecord::Base
  belongs_to :retailer
  
  def grouped_items
    items.group_by {|item| item.category}
  end
  
end
