# == Schema Information
#
# Table name: products
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  type       :string(255)
#  price      :float
#  desc       :string(255)
#  image      :string(255)
#  thumbnail  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Product < ActiveRecord::Base
  attr_accessible :desc, :image, :name, :price, :thumbnail, :type
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
