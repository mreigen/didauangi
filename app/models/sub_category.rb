class SubCategory < ActiveRecord::Base
  has_many :place_category_rel
  has_many :main_categories, :through => :place_category_rel
  has_many :places, :through => :place_category_rel
end