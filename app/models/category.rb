class Category < ActiveRecord::Base
  
  validates_presence_of :category
  validates_presence_of :order_number
  validates_uniqueness_of :category
  has_many :items
  
  after_save :increase_number
  
  #CODEBAR!
  # Running this seems to increase the numbers in a weird way
  def increase_number 
    Category.where("order_number >= ? and id != ?", self.order_number, self.id).update_all("order_number = order_number + 1")
    
    
    #@categories.each{|c| 
    #  if c.order_number == self.order_number
    #    c.increment!(:order_number)
    #  end}
    
 end
  
end
