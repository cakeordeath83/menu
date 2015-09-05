class Retailer < ActiveRecord::Base
  
  before_save {self.email = email.downcase}
  has_secure_password
  has_many :items
   
  # FOR PAPERCLIP
  has_attached_file :asset, :styles => { :medium => "200x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :name, :description, :address, :city, :postcode
  
  #FOR GEOCODER
  geocoded_by :postcode
  after_validation :geocode, :if => :postcode_changed?
  
  # VALIDATIONS
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  
  # METHODS
   def grouped_items
     items.group_by{|item| item.category}
   end
  
  def specials
    items.find_all{|i| i.special == true}
  end
  
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
  # May need to change LIKE to ILIKE in production as it is what PostgreSQL uses
  
  
end
