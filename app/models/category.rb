class Category < ActiveRecord::Base
  
  validates_presence_of :category
  validates_presence_of :order_number
  validates_uniqueness_of :category
  has_many :items
  
  #before_save :increase_number
  after_save :increase_number
  

  def increase_number 
    Category.where("order_number >= ? and id != ?", self.order_number, self.id).update_all("order_number = order_number + 1")
    
    #CODEBAR!
    #Broken code that causes multiple SQL queries. Output is in word doc file - SQL weirdness. When replicating, use before save not after save
    #@categories = Category.all
    
   # @categories.each do|c| 
     # logger.debug c.inspect
     # if c.order_number >= self.order_number
      #c.increment!(:order_number)
     # end
   # end
    
 end
  
end
