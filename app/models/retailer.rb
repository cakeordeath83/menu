class Retailer < ActiveRecord::Base
  
  has_secure_password
  has_many :items
   
  has_attached_file :asset, :styles => { :medium => "100x100>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  
  
 def grouped_items
   items.group_by{|item| item.category}
 end
  
  
 # before_save {self.email = email.downcase}
  #validates :name, presence: true, length: {maximum: 50}
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: {maximum: 255},
    #        format: {with: VALID_EMAIL_REGEX},
   #         uniqueness: {case_sensitive: false}
  
  #validates :password, presence: true, length: {minimum: 6}
end
