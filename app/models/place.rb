class Place < ActiveRecord::Base
  has_many :place_category_rel
  
  has_many :main_categories, :through => :place_category_rel
  has_many :sub_categories, :through => :place_category_rel
  
  belongs_to :district
end