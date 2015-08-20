class Retailer < ActiveRecord::Base
  
  has_many :items
   
  #def sorted_items
   # items.order(:category)
  #end
  
 def grouped_items
   items.group_by{|item| item.category}
 end
  
  
 # before_save {self.email = email.downcase}
  #validates :name, presence: true, length: {maximum: 50}
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: {maximum: 255},
    #        format: {with: VALID_EMAIL_REGEX},
   #         uniqueness: {case_sensitive: false}
  #has_secure_password
  #validates :password, presence: true, length: {minimum: 6}
end
