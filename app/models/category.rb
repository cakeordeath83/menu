class Category < ActiveRecord::Base
  
  validates_presence_of :category
  validates_presence_of :order_number
  
  has_many :items
  
 before_save :increase_number
  
  #CODEBAR!
  # Running this seems to increase the numbers in a weird way
  def increase_number 
    @categories = Category.all 
    
    @categories.each{|c| 
      
      if c.order_number >= self.order_number
        c.increment!(:order_number)
                
      end}
    
  end
  
end
