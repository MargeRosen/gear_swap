class Listing < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  attr_accessible :contact, :description, :location, :price, :title, :images_attributes
  validates :title, :presence => true
  validates :description, :presence => true
  has_many :images, :as => :attachable
  accepts_nested_attributes_for :images
end
