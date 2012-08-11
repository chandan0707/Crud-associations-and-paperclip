class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings, :through => :taggings

end
