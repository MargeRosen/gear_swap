class Listing < ActiveRecord::Base
  belongs_to :category
  attr_accessible :contact, :description, :location, :pics, :price, :title
  validates :title, :presence => true
  validates :description, :presence => true
end
