# == Schema Information
#
# Table name: products
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  variety    :string(255)
#  price      :float
#  desc       :string(255)
#  image      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Product < ActiveRecord::Base
  attr_accessible :desc, :image, :name, :price, :variety
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true
  validates :image, presence: true, exclusion: {in: %w(Select),
    message: "must be valid"}
end
