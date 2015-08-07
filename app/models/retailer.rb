class Retailer < ActiveRecord::Base
  
  has_many :items
  
  validates :name, presence: true
  
end
