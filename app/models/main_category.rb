class MainCategory < ActiveRecord::Base
  has_many :place_category_rel
  
  has_many :sub_categories, :through => :place_category_rel
  has_many :places, :through => :place_category_rel
end